require 'spec_helper'

describe Content do
  let(:content){FactoryGirl.create(:content)}

  it { should belong_to(:user)}
  it { should validate_presence_of(:url) }
  #it { should validate_presence_of(:imagepath) }
  context "url" do
    
    it"should pass if url is in format" do      
      expect(content).to be_valid
    end

    it"validation fails if url has 2 consecutive '.' " do
      con = Content.new(url: 'http://www..try.org')
      expect(con).to_not be_valid    
    end

    it"validation fails if url scheme is wrong" do
      con = Content.new(url: 'hjkl.google.co.in')
      expect(con).to_not be_valid    
    end

    it"validation fails if url has no '.'" do
      con = Content.new(url: 'qwertasdfg')
      expect(con).to_not be_valid    
    end

    it"should pass if host has numbers " do
      con = Content.new(url: 'http://33sigs.org/')
      expect(con).to be_valid    
    end

    it"should pass if url has port number" do
      con = Content.new(url: 'http://myportal.com:10040/wps/softwarenews/')
      expect(con).to be_valid
    end
  end  

end