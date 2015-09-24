require 'squib'


def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
end


Squib::Deck.new(width: 825, height: 1125, cards: 15) do
  background color: :black
  data = csv file: "politicians.csv"

  data["Party_color"] = data["Party"].map{|x|
    if x.to_s == "D".to_s 
      :blue
    else
      :red
    end
  }
  rect x: 38, y: 38, width: 750, height: 1050, radius: 38, fill_color: data["Party_color"] # card border


  text(str: data['Name'], x: 38, y: 48, width: 750,  font: 'Arial 54', align: 'center',wrap: :word_char, ellipsize: false, color: :white)

  svg  file: 'img/hand_white.svg', x: (825-75-128),y: (1125-75-128-25-128-50), width: 128, height: 128
  text(str: data["Hold"], x: (825-75-128-128),y: (1125-75-128-25-128-50),  font: 'Arial 90', align: 'center', color: :white)
  text(str: "Hand Limit", x: (825-75-128-128), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)


  svg  file: 'img/draw_white.svg', x: (75+128),y: (1125-75-128-25-128-50), width: 128, height: 128
  text(str: data["Draw"], x: (75),y: (1125-75-128-25-128-50),  font: 'Arial 90', align: 'center', color: :white)
  text(str: "Draw", x: (75), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)

  svg  file: 'img/strategy_white.svg', x: (825-75-128),y: (1125-75-128-25-128-50+192), width: 128, height: 128
  text(str: data["Strat"], x: (825-75-128-128),y: (1125-75-128-25-128-50+192),  font: 'Arial 90', align: 'center', color: :white)
  text(str: "Strategy", x: (825-75-128-128), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)


  svg  file: 'img/pd2_white.svg', x: (75+128),y: (1125-75-128-25-128-50+192), width: 128, height: 128
  text(str: data["PD"], x: (75),y: (1125-75-128-25-128-50+192),  font: 'Arial 90', align: 'center', color: :white)
  text(str: "Political Dicipline", x: (75), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)



data['Picture'].map! {|pname|  'pictures/' + pname.to_s + '.png' }
# text(str: data['Picture'], x: 38, y: 48, width: 750,  font: 'Arial 34', align: 'center',wrap: :word_char, ellipsize: false)

  png file: data['Picture'], x: 50, y: 230, width: 725, height:475, align: 'center' 

  save prefix: 'candidates', format: :png

end
