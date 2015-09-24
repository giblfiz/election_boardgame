require('Squib')

Squib::Deck.new(layout: 'hand_custom.yml', cards: 46) do
  background color: :white
   
#  text str:"cut", layout: :cut, hint: :blue
 # text str:"safe", layout: :safe, hint: :red


  data = csv file: "positions.csv"


  text(str: data['Name'],layout: :title, wrap: :word_char, ellipsize: false , align: "right" , hint: :red) 
  text(str: data['Subject'], layout: :type, wrap: :word_char, ellipsize: false, align: "right", color: "#aaaaaa", hint: :blue)
  text(str: data['Flavor'], layout: :art, wrap: :word_char, ellipsize: false, align: "right", font: 'Arial italic 24', hint: :red)

  text(str: data['Special Effect'], layout: :description, align: "right") do |embed|
     embed.svg key: ':$:', file: 'img/money.svg', width:128, height:128
     embed.svg key: ':pd:', file: 'img/pd2.svg', width:60, height:60
     embed.svg key: ':buzz:', file: 'img/buzz.svg', width:60, height:60
     embed.svg key: ':strategy:', file: 'img/strategy.svg', width:60, height:60
  end
  



   text(str: data['Demographic1'], layout: :bonus3) do |embed|
     embed.svg key: ':Christian:', file: 'img/christian.svg', width:192, height:192
     embed.svg key: ':Old:', file: 'img/old.svg', width:192, height:192
     embed.svg key: ':Black:', file: 'img/african.svg', width:192, height:192
     embed.svg key: ':Young:', file: 'img/young.svg', width:192, height:192
     embed.svg key: ':Women:', file: 'img/women.svg', width:192, height:192
     embed.svg key: ':Hawk:', file: 'img/hawks.svg', width:192, height:192
     embed.svg key: ':Libertarian:', file: 'img/libertarian.svg', width:192, height:192
     embed.svg key: ':Hispanic:', file: 'img/hispanic.svg', width:192, height:192
  end

  text(str: data['Demographic2'], layout: :bonus4) do |embed|
     embed.svg key: ':Christian:', file: 'img/christian.svg', width:192, height:192
     embed.svg key: ':Old:', file: 'img/old.svg', width:192, height:192
     embed.svg key: ':Black:', file: 'img/african.svg', width:192, height:192
     embed.svg key: ':Young:', file: 'img/young.svg', width:192, height:192
     embed.svg key: ':Women:', file: 'img/women.svg', width:192, height:192
     embed.svg key: ':Hawk:', file: 'img/hawks.svg', width:192, height:192
     embed.svg key: ':Libertarian:', file: 'img/libertarian.svg', width:192, height:192
     embed.svg key: ':Hispanic:', file: 'img/hispanic.svg', width:192, height:192
  end



  #GOP pd points for playing this card 
  circle layout: :b1outer, fill_color: '#ff6666', stroke_color: '#0000'
  svg  file: 'img/gop.svg', layout: :b1gopsvg
  circle layout: :b1inner, fill_color: '#ff0000', stroke_color: '#0000'
  circle layout: :b1pdcirc, fill_color: '#ff0000', stroke_color: '#0000'

#  rect layout: :bonus1, radius: 25, fill_color: :red  #pd for gop's
#  svg  file: 'img/gop_red.svg', layout: :bonus1, hint: :red
  text str: data['RepPD'],layout: :b1num,
       font: 'Arial 46', align: :center, color: :white
  svg  file: 'img/pd2_white.svg', layout: :b1pdsvg

  #Dem pd points for playing this card
  circle layout: :b2outer, fill_color: '#6666ff', stroke_color: '#0000'
  svg  file: 'img/dem.svg', layout: :bonus2
  circle layout: :b2inner, fill_color: '#0000ff', stroke_color: '#0000'
  text str: data['DemPD'], layout: :b2num ,
       font: 'Arial 46', align: :center, color: :white




  save prefix: 'positions2_', format: :png

end
