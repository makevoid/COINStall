


coins = [
  { name: :digibyte, tag: :dgb, type: :scrypt, github: "git@github.com:digibyte/DigiByteProject.git", dependencies_gui: ["libqrencode-dev"] },
]

for coin in coins
  `mkdir -p coins`
  puts "downloading #{coin[:name]}..."
  puts`cd coins; git clone #{coin[:github]} #{coin[:name]}`
  puts "installing dependencies"
  for dependency in coin[:dependencies_gui]
    puts "installing dependency: #{dependency}"
    puts `sudo apt-get install #{dependency} -y`
  end
  puts "installing #{coin[:name]} daemon..."
  puts`cd coins/#{coin[:name]}/src; make -f makefile.unix`
  puts "installing #{coin[:name]} qt gui..."
  puts`cd coins/#{coin[:name]}; qmake && make`
end
