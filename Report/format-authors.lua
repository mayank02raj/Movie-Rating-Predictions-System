-- Alternative to using author-info-blocks.lua which does not give the expected result

-- Mapper function to group together the author information along with names
local function group_author_info (institutes)
  return function (author)
    local name = setmetatable(author.name, {})
    local institute = institutes[tonumber(author.institute[1])]
    return pandoc.MetaInlines(
      pandoc.List(name)
        .. pandoc.List{pandoc.LineBreak()}
        .. pandoc.List(institute.name)
        .. pandoc.List{pandoc.LineBreak()}
        .. author.email
    )
  end
end

-- Maps author information obtained from scholarly-metadata.lua
function Meta (m)
  m.author = m.author:map(group_author_info(m.institute))
  return m
end