let b:ale_c_parse_makefile = 1

let b:ale_linters = [
      \'clang',
      \'clangtidy'
      \]

let b:ale_fixers = [
      \'clang_format',
      \'clangtidy'
      \'remove_trailing_lines',
      \'trim_whitespace',
      \]
