require('Squib')

Squib::Deck.new(layout: 'hand_custom.yml', cards: 1) do
  background color: :white

  text str:"title", layout: :title, hint: :blue
  text str:"art", layout: :art, hint: :blue
  text str:"description", layout: :description, hint: :blue
  text str:"type", layout: :type, hint: :blue
  text str:"bonus1", layout: :bonus1, hint: :blue
  text str:"bonus2", layout: :bonus2, hint: :blue
  text str:"bonus3", layout: :bonus3, hint: :blue
  text str:"bonus4", layout: :bonus4, hint: :blue
  text str:"bonus5", layout: :bonus5, hint: :blue
  text str:"cut", layout: :cut, hint: :blue
  text str:"safe", layout: :safe, hint: :blue

  save prefix: 'hand_layout_', format: :png
end
