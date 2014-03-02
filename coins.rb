coins = [
  { name: :digibyte, tag: :dgb, type: :scrypt, github: "git@github.com:digibyte/DigiByteProject.git" },
]

for coin in coins
  `mkdir -p coins`
  `cd coins; git clone #{coin[:github]} #{coin[:name]}`
  puts "installing #{coin[:name}..."
  `cd coins/#{coin[:name]}/src; make -f makefile.unix `
  # cd coins/#{coin[:name}; qmake && make # for qt version
end
