if os.getenv("NVIM") then
	require("toggle-pane"):entry("min-preview")
end

-- cross-instance yank
require("session"):setup {
	sync_yanked = true,
}
