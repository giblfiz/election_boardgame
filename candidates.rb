require 'squib'


def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
end


Squib::Deck.new(layout: 'fantasy_custom.yml', cards: 15) do
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


  text(str: data['Name'],layout: :title,  font: 'Arial 34', align: 'left',wrap: :word_char, ellipsize: false, color: :white, hint: :green)

  text str: data["Hold"], layout: :descR1C1, font: 'Arial 60', align: 'right', color: :white
  svg  file: 'img/hand_white.svg', layout: :descR1C2
#  text(str: "Hand Limit", x: (825-75-128-128), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)

  text(str: data["Draw"], layout: :descR1C4,  font: 'Arial 60', align: 'right', color: :white)
  svg  file: 'img/draw_white.svg', layout: :descR1C5
#  text(str: "Draw", x: (75), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)

  text(str: data["Strat"], layout: :descR1C7special,  font: 'Arial 60', align: 'center', color: :white)
  svg  file: 'img/strategy_white.svg', layout: :descR1C8
#  text(str: "Strategy", x: (825-75-128-128), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)


  text(str: data["PD"], layout: :descR2C1,  font: 'Arial 60', align: 'right', color: :white)
  svg  file: 'img/pd2_white.svg', layout: :descR2C2

  text(str: data["Money"], layout: :descR3C1,  font: 'Arial 60', align: 'right', color: :white)
  svg  file: 'img/Money_white.svg', layout: :descR3C2


#  text(str: "Political Dicipline", x: (75), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)

  

data['Picture'].map! {|pname|  'pictures/' + pname.to_s + '.png' }

png file: data['Picture'], layout: :art

  save prefix: 'candidates', format: :png

end
