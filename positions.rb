require 'squib'


def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
end


Squib::Deck.new(width: 825, height: 1125, cards: 44) do
  background color: :white
  rect x: 38, y: 38, width: 750, height: 1050, radius: 38 # card border
#  rect x: 75, y: 75, width: 128, height: 128, radius: 25 # upper left hand rect


  data = csv file: "positions.csv"


  text(str: data['Name'], x: 38, y: 48, width: 750,  font: 'Arial 34', align: 'center',wrap: :word_char, ellipsize: false) do |embed|
#     embed.svg key: ':foo:', file: 'img/idea.svg', width:60, height:60
#     embed.png key: ':bar:', file: 'img/poll.png', width:60, height:60
#     embed.png key: ':baz:', file: 'img/speech.png', width:60, height:60
  end

 background color: :white
   text(str: data['Demographic1'], x: 38, y: 150, width: 200,  font: 'Arial 34', align: 'center') do |embed|
     #embed.svg key: ':Old:', file: 'img/idea.svg', width:192, height:192
     embed.svg key: ':Christian:', file: 'img/christian.svg', width:192, height:192
     embed.svg key: ':Old:', file: 'img/old.svg', width:192, height:192
     embed.svg key: ':Black:', file: 'img/african.svg', width:192, height:192
     embed.svg key: ':Young:', file: 'img/young.svg', width:192, height:192
     embed.svg key: ':Women:', file: 'img/women.svg', width:192, height:192
     embed.svg key: ':Hawk:', file: 'img/hawks.svg', width:192, height:192
     embed.svg key: ':Libertarian:', file: 'img/libertarian.svg', width:192, height:192
     embed.svg key: ':Hispanic:', file: 'img/hispanic.svg', width:192, height:192
  end

  text(str: data['Demographic2'], x: (825-200-38), y: 150, width: 200,  font: 'Arial 34', align: 'center') do |embed|
     #embed.svg key: ':Old:', file: 'img/idea.svg', width:192, height:192
     embed.svg key: ':Christian:', file: 'img/christian.svg', width:192, height:192
     embed.svg key: ':Old:', file: 'img/old.svg', width:192, height:192
     embed.svg key: ':Black:', file: 'img/african.svg', width:192, height:192
     embed.svg key: ':Young:', file: 'img/young.svg', width:192, height:192
     embed.svg key: ':Women:', file: 'img/women.svg', width:192, height:192
     embed.svg key: ':Hawk:', file: 'img/hawks.svg', width:192, height:192
     embed.svg key: ':Libertarian:', file: 'img/libertarian.svg', width:192, height:192
     embed.svg key: ':Hispanic:', file: 'img/hispanic.svg', width:192, height:192
  end

  text(str: data['Special Effect'], x: 38, y: 275, width: 750,  font: 'Arial 34', align: 'center') do |embed|
     embed.svg key: ':$:', file: 'img/money.svg', width:128, height:128
     embed.svg key: ':pd:', file: 'img/pd2.svg', width:60, height:60
     embed.svg key: ':buzz:', file: 'img/buzz.svg', width:60, height:60
     embed.svg key: ':strategy:', file: 'img/strategy.svg', width:60, height:60
  end
  
  text(str: data['Flavor'], x: 38, y: 350, width: 750,  font: 'Arial 34', align: 'center', wrap: :word_char, ellipsize: false)


  #GOP pd points for playing this card 
#  svg  file: 'img/gop.svg', x: (825-75-256),y: (1125-75-128-25-128), width: 256, height: 256
  svg  file: 'img/gop.svg', x: (825-75-256),y: (1125-75-128-25-128-50), width: 256, height: 256
  rect x: (825-75-128), y: (1125-75-128), width: 128, height: 128, radius: 25, fill_color: :red  #pd for gop's
  text str: data['RepPD'], x: (825-75-128), y: (1125-75-128), width: 128,
       font: 'Arial 72', align: :center, color: :white

  #Dem pd points for playing this card
#  svg  file: 'img/dem.svg', x: 75,y: (1125-75-128-25-128), width: 256, height: 256
  svg  file: 'img/dem.svg', x: 75,y: (1125-75-128-25-128-50), width: 256, height: 256
  rect x: 75          , y: (1125-75-128), width: 128, height: 128, radius: 25, fill_color: :blue #pd for dem's
  text str: data['DemPD'],  x: 75          , y: (1125-75-128), width: 128,
       font: 'Arial 72', align: :center, color: :white



#  png range: [0,2], file: 'img/spin.png', x: 620, y: 75, width: 128, height: 128 
#  svg range: 1..2, file: 'img/idea.svg', x: 620, y: 218, width: 128, height: 128

  save prefix: 'position_', format: :png
end