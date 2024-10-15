function Image (img)
  if img.src:match '%.svg$' then
    local mime_type, contents = pandoc.mediabag.lookup(img.src)
    if mime_type == 'image/svg+xml' and contents then
      return pandoc.RawInline('html', contents:gsub('^.*(%<svg%f[%s])', '%1'))
    end
  end
end
