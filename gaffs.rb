require 'squib'


def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
end


Squib::Deck.new(width: 825, height: 1125, cards: 9) do
  background color: :white
  rect x: 38, y: 38, width: 750, height: 1050, radius: 38 # card border
#  rect x: 75, y: 75, width: 128, height: 128, radius: 25 # upper left hand rect


  data = csv file: "Gaffs.csv"

  text(str: data['Name'], x: 38, y: 50, width: 750,  font: 'Arial 34', align: 'center',wrap: :word_char, ellipsize: false) 

  text(str: "Gaff", x: 38, y: 150, width: 750,  font: 'Arial 34', align: 'center', color: :blue)
  text(str: "If you draw this card into your hand, you must play it immediately",
       x: 38, y: 185, width: 750,  font: 'Arial 34', align: 'center',wrap: :word_char, ellipsize: false)

  svg file: 'img/gaff.svg', x: ((825-256)/2),y: 350, width: 256, height: 256


  text(str: data['Effect'], x: 38, y: 650, width: 750,  font: 'Arial 34', align: 'center',wrap: :word_char, ellipsize: false) do |embed|
     embed.svg key: ':pd:', file: 'img/pd2.svg', width:60, height:60
     embed.svg key: ':buzz:', file: 'img/buzz.svg', width:60, height:60
     embed.svg key: ':strategy:', file: 'img/strategy.svg', width:60, height:60
  end

  text(str: data['Flavor'], x: 38, y: 800, width: 750,  font: 'Arial 22', align: 'center',wrap: :word_char, ellipsize: false) do |embed|
     embed.svg key: ':pd:', file: 'img/pd2.svg', width:60, height:60
     embed.svg key: ':buzz:', file: 'img/buzz.svg', width:60, height:60
     embed.svg key: ':strategy:', file: 'img/strategy.svg', width:60, height:60
  end

  save prefix: 'gaff_', format: :png

 
end
