require "rubygems"
require "watir"

class Mail163
#  @user=""
#  @pwd=""
#  @url=""
attr_writer:user
attr_writer:pwd
attr_writer:url    #writeable, getter&setter ,can assess with "mailxxx.url = xxx"
attr_reader:ro     #readonly,getter only.

  def show_data()
    puts "name:"+@user+",pwd:"+@pwd+",url:"+@url+"\n"
  end

  def initialize(name,pwd,url)
    @user = name
    @pwd = pwd
    @url = url
    @ro = name
  end

  def logon
    @ie = Watir::Browser.new();
    @ie.goto(@url)
    @ie.maximize

    input_user.set(@user)
    input_pwd.set(@pwd)

    btn_logon.click

  end

  def logout
    @ie.link(:id, "_js4_link_24_60").click
  end

  def input_user()
    @ie.text_field(:id,"idInput")
  end

  def input_pwd()
    @ie.text_field(:id,"pwdInput")
  end

  def btn_logon()
    @ie.button(:id,"loginBtn")
  end
end

