require 'squib'


data = {'name' => ['Republican :foo:', 'Grifter :bar:', 'Mast:baz:ermind'],
        'level' => [1,2,3]}

Squib::Deck.new(width: 825, height: 1125, cards: 3) do

  foo= csv file: "Gaffs.csv"

  background color: :white
  rect x: 38, y: 38, width: 750, height: 1050, radius: 38
  rect x: 75, y: 75, width: 128, height: 128, radius: 25

  text(str: data['name'], x: 220, y: 78, font: 'Arial 40') do |embed|
     embed.svg key: ':foo:', file: 'img/idea.svg', width:60, height:60
     embed.png key: ':bar:', file: 'img/poll.png', width:60, height:60
     embed.png key: ':baz:', file: 'img/speech.png', width:60, height:60
  end

  text str: data['level'], x: 75, y: 85, width: 128,
       font: 'Arial 72', align: :center


  png range: [0,2], file: 'img/spin.png', x: 620, y: 75, width: 128, height: 128 
  svg range: 1..2, file: 'img/idea.svg', x: 620, y: 218, width: 128, height: 128

  save prefix: 'basic_', format: :png
end