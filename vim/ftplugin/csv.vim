autocmd VimEnter *.csv %CSVArrangeColumn!
autocmd VimLeave *.csv :%s/ //g | w 
