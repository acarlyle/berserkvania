///scr_strBinToDec


///string_to_binary(string)
var str = argument0;
var output = 0;
for(var i = 0; i < string_length(str); i++){
    if(string_char_at(str, i + 1) != "0")
        output += power(2,string_length(str) - i - 1);
}
return output;
