vim.snippet.add(
    "fn",
[=[
function ${1:name}($2)
    ${3:-- content}
end
]=],
    {buffer = 0}
)
