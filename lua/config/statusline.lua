function StatusLine()
		local cmp = {} -- statusline components

		local hi_pattern = '%%#%s#%s%%*'

		function _G._statusline_component(name)
			return cmp[name]()
		end

		function cmp.diagnostic_status()
			local ok = ' 0W 0E '

			local ignore = {
				['c'] = true, -- command mode
				['t'] = true  -- terminal mode
			}

			local mode = vim.api.nvim_get_mode().mode

			if ignore[mode] then
				return ok
			end

			local levels = vim.diagnostic.severity
			local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
			local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})

			local errors_warnings = ' %dW %dE '
			if errors == 0 and warnings == 0 then
				return ok
			end

			return string.format(errors_warnings, warnings, errors)
		end

		function cmp.position()
			return hi_pattern:format('Search',' %3l:%-2c ')
		end

		function _statusline_mod()
				if vim.bo.mod then
						return " [+]"
				else
						return " [ ]"
				end
		end

		local statusline = {
			'%{%v:lua._statusline_component("diagnostic_status")%} ',
			'[%{mode()}]',
			' %t',
			'%r',
		  '%{%v:lua._statusline_mod()%}',
			'%=',
			'%{&filetype} ',
			' %2p%% ',
			'%{%v:lua._statusline_component("position")%}'
		}
		return statusline
end

vim.o.statusline = table.concat(StatusLine(), '')
