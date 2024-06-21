/// @description Insert description here
// You can write your code in this editor
//get last pressed key
_key = keyboard_lastchar;
var _next_char_pos = string_length(_keyboard_string) + 1
var _current_target_letter = string_char_at(_target_word, _next_char_pos)

if keyboard_check_pressed(vk_anykey) and !keyboard_check_pressed(vk_backspace) {
	//check if the user pressed the right button compared to the target string
	if _current_target_letter == _key{
		audio_play_sound(snd_bubble, 10, false);
		_keyboard_string += _key;
	}
	//else play sound effect
	else {
		audio_play_sound(snd_bloop, 10, false);
	}
	
}

//backspace with speed
if keyboard_check_direct(vk_backspace) {
    if _backspace_timer <= 0 {
        if string_length(_keyboard_string) > 0 {
            _keyboard_string = string_delete(_keyboard_string, string_length(_keyboard_string), 1);
			audio_play_sound(snd_bubble, 10, false);
        }
        _backspace_timer = _backspace_delay;
    } else {
        _backspace_timer--;
    }
} else {
    _backspace_timer = 0; // Reset the timer when backspace key is not held down
}

//delete everything on enter
if keyboard_check_pressed(vk_return){
	_keyboard_string = ""
	get_next_word()
}



function get_next_word(){
	_now = current_time * 1000
	random_set_seed(_now)
	_lucky_number = floor(random(array_length(_quotes_array)))
	_target_word = _quotes_array[_lucky_number]
	//_target_word = _quotes_array[30]
	//_target_word = _quotes_array[285]
	//_target_word = _quotes_array[226]
	_author = ""
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
	//check arrary
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
	//34
	//51
	//54
	//if len arrary * _numb of lines > arrary[len]
	//delete last pos of arrary
	//set last pos of arrary to = _text_len
	//----------------------
	//----------------------
	//----------------------
	//----------------------
}
