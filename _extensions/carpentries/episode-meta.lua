function Pandoc(doc)
  local meta = doc.meta
  if meta.teaching or meta.exercises then
    local blocks = {}
    local teaching_val = tonumber(pandoc.utils.stringify(meta.teaching)) or 0
    local exercises_val = tonumber(pandoc.utils.stringify(meta.exercises)) or 0
    local total = teaching_val + exercises_val
    local text = ''
    if teaching_val > 0 then
      text = text .. 'Teaching: ' .. tostring(teaching_val) .. ' min'
    end
    if exercises_val > 0 then
      text = text .. '  |  Exercises: ' .. tostring(exercises_val) .. ' min'
    end
    table.insert(blocks, pandoc.Div({
      pandoc.Para({pandoc.Str(text)})
    }, {class = 'episode-meta'}))
    -- Prepend to document
    for i, block in ipairs(doc.blocks) do
      table.insert(blocks, block)
    end
    doc.blocks = blocks
  end
  return doc
end
