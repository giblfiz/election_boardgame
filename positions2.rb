require('Squib')

Squib::Deck.new(layout: 'hand_custom.yml', cards: 46) do
  background color: :white
   
#  text str:"cut", layout: :cut, hint: :blue
#  text str:"safe", layout: :safe, hint: :red


  data = csv file: "positions.csv"


  text(str: data['Name'],layout: :title, wrap: :word_char, ellipsize: false , align: "right" ) 
  text(str: data['Subject'], layout: :type, wrap: :word_char, ellipsize: false, align: "right", color: "#aaaaaa")
  text(str: data['Flavor'], layout: :art, wrap: :word_char, ellipsize: false, align: "right", font: 'Arial italic 24')

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
  svg  file: 'img/gop_red.svg', layout: :b1_up_rt
  svg  file: 'img/pd2.svg', layout: :b1_dn_rt
  text str: data['RepPD'],layout: :bonus1,
       font: 'Arial 100', align: :left, color: :red

  #Dem pd points for playing this card
  svg  file: 'img/dem_blue.svg', layout: :b2_up_rt
  svg  file: 'img/pd2.svg', layout: :b2_dn_rt
  text str: data['DemPD'], layout: :bonus2,
       font: 'Arial 90', align: :left, color: :blue




  save prefix: 'positions2_', format: :png

end
