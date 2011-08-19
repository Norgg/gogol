# util = require 'util'

Pieces =
  ' ':
    passable: true

  '█':
    endsLevel: true

extender = (dx, dy, extenderChar) ->
  Pieces[extenderChar] =
    iterate: (x, y, oldBoard, newBoard) ->
      newBoard.put(x, y, '#')

      if Pieces[oldBoard.get(x+dx, y+dy)]?.passable
        newBoard.put(x+dx, y+dy, extenderChar)

extender(-1, 0, '<')
extender(+1, 0, '>')
extender(0, -1, '^')
extender(0, +1, 'v')

module.exports = Pieces
