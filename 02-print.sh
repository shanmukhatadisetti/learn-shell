echo Hello world

# color Syntax
# echo -e "\e[COL MESSAGE \e[0m"
# echo -e -> Enable colors from echo command
# \e[COLm -> Enable a particular Color
# Color        Codes
# red          31
# green        32
# yellow       33
# blue         34
#magenta       35
#cyan          36




# \e[0m -> Zero code is going to reset the color, Meaning if we enable color for sure we need it, otherwise the color will continue on screen
# we can use double or single quotes, however double quotes are preferred.
echo -e "\e[31mhello in red color\e[0m"
echo hello world



#some times we need to print multiple lines
echo -e "line1\nline2\nline3"
# \e for color, same \n for new line