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


  text(str: data['Name'],layout: :title,  font: 'Arial 36', align: 'left',wrap: :word_char, ellipsize: false, color: :white)


  text(str: data["VP"], layout: :vp_effect, color: :white)do |embed|
     embed.svg key: ':Christian:', file: 'img/christian_white.svg', width:44, height:44
     embed.svg key: ':Old:', file: 'img/old_white.svg', width:44, height:44
     embed.svg key: ':African:', file: 'img/african_white.svg', width:44, height:44
     embed.svg key: ':Young:', file: 'img/young_white.svg', width:44, height:44
     embed.svg key: ':Women:', file: 'img/women_white.svg', width:44, height:44
     embed.svg key: ':Hawks:', file: 'img/hawks_white.svg', width:44, height:44
     embed.svg key: ':Libertarian:', file: 'img/libertarian_white.svg', width:44, height:44
     embed.svg key: ':Hispanic:', file: 'img/hispanic_white.svg', width:44, height:44
     embed.svg key: ':gs:', file: 'img/swing_white.svg', width:44, height:44

     embed.svg key: ':hand_limit:', file: 'img/hand_white.svg', width:44, height:44
     embed.svg key: ':draw:', file: 'img/draw_white.svg', width:44, height:44
     embed.svg key: ':strat:', file: 'img/strategy_white.svg', width:44, height:44
     embed.svg key: ':money:', file: 'img/Money_white.svg', width:44, height:44
     embed.svg key: ':buzz:', file: 'img/buzz2_white.svg', width:44, height:44
     embed.svg key: ':pd:', file: 'img/pd2_white.svg', width:44, height:44
  end


  text(str: data['Special'], layout: :special_effect,  font: 'Arial 36', align: 'left',wrap: :word_char, ellipsize: false, color: :white, width: 675) do |embed|
     embed.svg key: ':Christian:', file: 'img/christian_white.svg', width:44, height:44
     embed.svg key: ':Old:', file: 'img/old_white.svg', width:44, height:44
     embed.svg key: ':African:', file: 'img/african_white.svg', width:44, height:44
     embed.svg key: ':Young:', file: 'img/young_white.svg', width:44, height:44
     embed.svg key: ':Women:', file: 'img/women_white.svg', width:44, height:44
     embed.svg key: ':Hawks:', file: 'img/hawks_white.svg', width:44, height:44
     embed.svg key: ':Libertarian:', file: 'img/libertarian_white.svg', width:44, height:44
     embed.svg key: ':Hispanic:', file: 'img/hispanic_white.svg', width:44, height:44
     embed.svg key: ':gs:', file: 'img/swing_white.svg', width:44, height:44
  end


  text(str: data["Strat"], layout: :descR2C1special,  font: 'Arial 60', align: 'center', color: :white)
  svg  file: 'img/strategy_white.svg', layout: :descR2C2
#  text(str: "Strategy", x: (825-75-128-128), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)

  text(str: data["Draw"], layout: :descR2C4,  font: 'Arial 60', align: 'right', color: :white)
  svg  file: 'img/draw_white.svg', layout: :descR2C5
#  text(str: "Draw", x: (75), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)


  text str: data["Hold"], layout: :descR2C7, font: 'Arial 60', align: 'right', color: :white
  svg  file: 'img/hand_white.svg', layout: :descR2C8
#  text(str: "Hand Limit", x: (825-75-128-128), y: (1125-75-128-50-24),  font: 'Arial 24', align: 'center', color: :white)



  text(str: data["Money"], layout: :descR3C1special,  font: 'Arial 60', align: 'center', color: :white)
  svg  file: 'img/Money_white.svg', layout: :descR3C2

  text(str: data["PD"], layout: :descR3C4,  font: 'Arial 60', align: 'right', color: :white)
  svg  file: 'img/pd2_white.svg', layout: :descR3C5



#text str: "safe", layout: :safe, hint: :white

#  text(str: "Political Dicipline", x: (75), y: (1125-75-128-50-24+192),  font: 'Arial 24', align: 'center', color: :white)

  

data['Picture'].map! {|pname|  'pictures/' + pname.to_s + '.png' }

png file: data['Picture'], layout: :art

  save prefix: 'candidates', format: :png

end
