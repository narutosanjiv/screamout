if typeof jQuery == 'undefined'
  headElement = document.getElementsByTagName("head")[0]
  linkElement = document.createElement("script")
  linkElement.src = "//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
  headElement.appendChild(linkElement)

screamout = ->
  if document.getElementById('screamout') == null
    window.scrollTo(0, 0)
   
    jQ('<link>',  {
      href: "http://localhost:8080/assets/screamout/iframe.css",
      rel: "stylesheet",
      type: "text/css"
    }).appendTo('body')

    jQ('*','body').not("#screamout").css("opacity","0.9")
    jQ('*','body').not("#screamout").css("pointer-events","none")

    addIframe()
  else
    closeIframe()
    addIframe()
 

  $("body").not('#screamout').click ->
    closeIframe()

addIframe = ->
      jQ('<iframe>', {
        id:  'screamout',
        name: "newpage",
        frameborder: 0,
        scrolling: "no",
        src: "http://localhost:8080/screamout/iframe_contents/new/",
        allowTransparency: true
      }).appendTo('body')

closeIframe = ->
    jQ('#screamout').remove()
    document.getElementById('screamoutjs').remove()
    jQ('*','body').not("#screamout").css("opacity","1")
    jQ('*','body').not("#screamout").css("pointer-events","none")

test = ->
  if @jQuery
    @jQ = jQuery    
    screamout()
    clearInterval(@testInterval)

receiveMessage = (event) ->
  if event.data is "removetheiframe"
    closeIframe()

  if event.data is "fetch"
    url = document.URL
    title = document.title
    frame = document.getElementById("screamout")
    frame.contentWindow.postMessage(title + ',' + url, "*")
  return

window.addEventListener "message", receiveMessage, false

@testInterval = setInterval(->
  (test())
, 1000)
