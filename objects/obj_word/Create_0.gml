/// @description Insert description here
// You can write your code in this editor
_key = ""
_keyboard_string = ""
_tester_var = 0

_backspace_timer = 0;
_backspace_delay = 7; // Adjust this value to control the deletion speed

_target_word = "its wedensday ma dudes"
_author = "jaerven"

// Read the text file into a variable
// Read the text file into a variable
_word_list_file_path = "quotes_txt.txt";

//if (file_exists(file_path)) {
//    show_debug_message("File exists at path: " + file_path);
//} else {
//    show_debug_message("File does not exist at path: " + file_path);
//}
//_fileId = file_text_open_read(_word_list_file_path);
//_wordlist = file_text_readln(_fileId)
//show_debug_message(_wordlist)
//show_debug_message("yes")

// Read the text file into a variable
_quotes_array = read_txt_file_to_arrary(_word_list_file_path)

_now = current_time * 1000
random_set_seed(_now)
_lucky_number = floor(random(array_length(_quotes_array)))
//show_debug_message(string(_lucky_number))
//show_debug_message(array_length(_quotes_array))
_target_word = _quotes_array[_lucky_number]
//_target_word = _quotes_array[129] //test for line split user input was shown correctly
//_target_word = _quotes_array[218] //had a issue line calulation said 5 lines but when we had a split word on two lines ,that was not taking into account
//_target_word = _quotes_array[301] //programmers dont show
//_target_word = _quotes_array[140] //slaves was incorrectly send to a new line
//_target_word = _quotes_array[67] //double line, empty line bwteen last two lines
//_target_word = _quotes_array[60] //misconception send to the next line were is shoudnt

//_target_word = _quotes_array[259]
//_target_word = _quotes_array[232]
//_target_word = _quotes_array[9]
//_target_word = _quotes_array[148]
//_target_word = _quotes_array[168]
//_target_word = _quotes_array[129]
//_target_word = _quotes_array[78]
//_target_word = _quotes_array[190]
//_target_word = _quotes_array[28]
//_target_word = _quotes_array[52]
//_target_word = _quotes_array[168]
//we want to take the author out of our target_word
//if you want to split a _current_line with a delimiter
var _parts = string_split(_target_word, ";");

if (array_length_1d(_parts) >= 2) {
	var quote = _parts[0];
	var author = _parts[1];
	_target_word = quote
	_author = author
	// Now you have quote and author
	//show_debug_message("Quote: " + quote);
	//show_debug_message("Author: " + author);
} else {
// Handle the case where the _current_line doesn't contain the expected format
	_target_word = "text missing"
	_author = "author missing"
}

//----------------------------------WORD DETAILS, ALSO COPIED TO STEP CODE WHEN get_next_word() is called
_text = _target_word;
_max_chars_per_line_baseline = 35 //how many chars will we allow on each line
_numb_of_lines = ceil(string_length(_text) / _max_chars_per_line_baseline) //total number of lines in our text¨
_maximum_lines_on_screen = floor((room_height / 11)) //max lines we can show on screen
_total_text_height = _numb_of_lines * 11 // Calculate total height of lines
_text_pos_y_start_calculated = (floor(_maximum_lines_on_screen/2)*11)-(floor(_numb_of_lines/2)*11) //(room_height - _total_text_height) / 2
_max_chars_per_line = _max_chars_per_line_baseline
_text_start_end_point_arrary = []
var _next_start = _max_chars_per_line
_text_len = string_length(_text)
//run this only for how many lines our text contins
for (var _i = 1; _i <= _numb_of_lines; _i++){
	if(_i == _numb_of_lines){
		var _stop = 0
	}
	//this value dont matter intially, its used for storing the _last_space closed to our line delimiter counter
	var _last_space = 99999999;
	//find the space closed to the split limit
	//start at the max start point, and work backwards until we find a space " " 
	for (var _ii = _next_start; _ii >= 1; _ii--) {
		//once we have found the space closed to our max char count per line
		//then we can set end point for that line with _last_space
	    if (string_char_at(_text, _ii) == " ") {
	        _last_space = _ii;
			_next_start = _ii + _max_chars_per_line
	        break;
	    }		
	}
	//if _i is the same a our number of lines, then we know we need to set the last char of our line to the length of our text
	//meaning we are defining our latest line
	if(_i == _numb_of_lines){
		//check if _last_space is different that the length of the _text, then we know we have an aditional
		//line do to a word i send to the next line since it exceeded the char limit per line.
		if(_last_space != _text_len){
			//only add if our string length is bigger than our next start. else we know it should stay on th same line
			if(string_length(_text) > _last_space and _text_len < _max_chars_per_line*_numb_of_lines){
				array_push(_text_start_end_point_arrary, _last_space)
			}
			array_push(_text_start_end_point_arrary, string_length(_text))
		}
		
	}
	//else we know we not are on the last line
	else{
		array_push(_text_start_end_point_arrary, _last_space)
	}
}
var j = 0
var _len_arrary = array_length(_text_start_end_point_arrary)
	var _max_chars_according_to_arrary = _numb_of_lines * _max_chars_per_line
	//something about
	//[30] need to be >
	//[285] needs to be <
	if( _max_chars_according_to_arrary > _text_start_end_point_arrary[_len_arrary-1]){
		array_pop(_text_start_end_point_arrary)
		_len_arrary = array_length(_text_start_end_point_arrary)
		_text_start_end_point_arrary[_len_arrary-1] = _text_len
		var stop = 0;
	}
//check last two pos in arrary
function tester_my(){
	show_debug_message("ma dudes")
	_tester_var ++
}
//----------------------------------also used in get_next_word()
//----------------------------------also used in get_next_word()
//----------------------------------also used in get_next_word()
