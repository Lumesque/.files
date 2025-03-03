function cat --wraps=bat --description 'alias cat=bat'
	if which bat >/dev/null 2>&1 ;
		bat $argv
	else
		command cat $argv
	end
end
