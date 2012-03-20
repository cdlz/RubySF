require "mail163"
 
user = "actworld@163.com"
pwd = "sinfor"
url = "mail.163.com"

#$global_vars="sss"
#@property="s"
#local_vars="bbb"
#@@class_vars,static vars
# def classname.static_method end


puts user.sub(/\w*@*/,'')


o = Mail163.new(user,pwd,url)  if user.length >0
#o.logon();
o.show_data();
o.user = "ac"
sleep 1
o.show_data();
#o.logout

o.freeze

begin
  o.user = "acccs"
rescue TypeError
  $stderr.print "ERROR: Can't modify a freeze object.\n"
  #  raise #再次抛出异常
ensure
  puts "Here must be executed."
end


#block tests
def showinfo(mail163)
  if block_given?
    puts "begin block"
    mail163.show_data()
    puts "end block"
    block_argv = ""
    if block_argv.empty?
      block_argv = "yield asign."
    end
    yield block_argv
    return "aaa"
  end

  puts "No Block,show info:"
  mail163.show_data
  return nil
end

#block test
#{ |arg_ret| puts "arg_ret:#{arg_ret}" } ，只有在调用yield时，才会执行一次{}中的内容。
#yield 加上参数，传给||之间的值，如此例中，使用 yield block_argv;相当于把block_argv的值作为参数传给arg_ret变量。
#然后执行了语句：  puts "arg_ret:#{arg_ret}" ，即输出变量的值。
#在{}引用的变量，如果不是||中规定的，则直接使用外部值。


def test_block(argv)
  puts "in block."
  yield argv,"argv2"
end

test_block("blockargv"){|i,j| puts "hi:#{i},j:#{j}",j+i }


$global_user = "zc"
tmp_user = "sinfor"

ret = showinfo(o){ |arg_ret| puts "arg_ret:#{arg_ret},$global_user:#{$global_user},tmp_user:#{tmp_user}" }
puts "ret:"+ret


def fib_up_to(max)
  i1,i2 = 1,1
  while i1 <= max
     yield i1
    i1,i2 = i2 , i1+i2  #block最后一个表达式的值为返回值。
  end
end


puts "nums:"
num = 600
6.times do
  puts "#{num.class}:#{num}"
  num *=num
end

bin = 0b11101111100000000001111111
puts "0b11101111100000000001111111:#{bin}"

10.step(80,5){|i| print i," "}

#charsNums = "100"
#num = Interger(charsNums)+ Interger(charsNums)
#puts num

#string test
string = <<TEST_A
 This is an article.
 haha.
TEST_A

puts string

song_info = "/test/明天更好.mp3  | 3:23 | Pop | 牛奶，咖啡 "
song_h = {:path=>"",:length=>"",:type=>"",:artist=>""}

#regex pattern must be //,with not ""
song_h[:path],song_h[:length],song_h[:type],song_h[:artist] = song_info.split(/\s*\|\s*/)

puts song_h.to_s
#puts song_h[:path]

#regex test

def show_regexp(a,re)
  if a =~ re
    "#{$`}<<#{$&}<<#{$'}"
  else
    "no match"
  end
end


regx = Regexp.new('^[a-z]*@\d+\.com')
puts "#{user} match " if user.downcase =~ regx
puts show_regexp(user,/@/)


argv = "http://192.168.12.104:85/"
url1,url2,url3,url4 = argv.split(".")
total_url =  url1 + '\\.' +  url2 + '\\.' +  url3 + '\\.' +  url4
puts total_url
 

re = Regexp.new(total_url)
full_url = "http://192.168.12.104:85/src/index.htm"
if  full_url =~ re
   puts "ok."
else
  puts "failed."
end

user = "c@qq.com"
puts "#{user} match " if user.downcase =~ /^[a-z]*@\d+\.com/
puts show_regexp(user,regx)



input = "asbdebug"

case input
when "debug" then  puts "debug mode"
when /^[a-z][a-b]/
  puts "^[a-z][a-b] match,#{input}"
else
  puts "case no method."
end


10.downto(7) { |x|
  puts "10.downto(7):#{x}"
}

["array1","array2","array3"].each { |val|  print val,","}



puts "File grep method,to traverse the file,and grep the line which is satisfied the condition:"
File.open("input.txt").grep(/d$/) { |line|
  puts line
}


puts "File each method,to traverse the file:"
File.open("input.txt").each { |line|
  puts line
}


times = 2
loop do
  puts "a:#{times}"
  times -=1
  next if times > 1
  puts "not print times > 2" 
  break if times < 0
end
