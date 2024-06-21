//white
//draw_set_color(make_color_rgb(233, 236, 240));
//pink
//draw_set_color(make_color_rgb(244, 76, 127))
//grey
//
draw_set_font(fnt_m6x11);
//pink
draw_set_color(make_color_rgb(244, 76, 127)); // RGB values for #F44C7F

var _text = _target_word;
var _max_chars_per_line_baseline = 35 //how many chars will we allow on each line
var _numb_of_lines = ceil(string_length(_text) / _max_chars_per_line_baseline) //total number of lines in our text
var _maximum_lines_on_screen = floor((room_height / 11)) //max lines we can show on screen
var _total_text_height = _numb_of_lines * 11 // Calculate total height of lines
var _text_pos_y_start_calculated = (floor(_maximum_lines_on_screen/2)*11)-(floor(_numb_of_lines/2)*11) //(room_height - _total_text_height) / 2
var _text_pos_x_baseline = 45; //where we wanna start writing our text
var _text_pos_x = _text_pos_x_baseline; // set our starting point for our text @ x
var _text_pos_y = _text_pos_y_start_calculated // set our starting point for our text @ y
var _max_chars_per_line = _max_chars_per_line_baseline;
var _text_y_line_increment = 15

if( _text_len > 330 and _text_len < 400){
	_text_pos_y -= _text_y_line_increment
}
else if(_text_len > 400){
	_text_pos_y -= _text_y_line_increment * 2
}


var _lines = array_length(_text_start_end_point_arrary);
var _counter = 1;
for (var _i = 0; _i < _lines; _i++) {
    var _start = _counter; // Starting index for the current line
    var _end = _text_start_end_point_arrary[_i]; // End index for the current line
    var _line_text = string_copy(_text, _start, _end - _start + 1); // Extract text for the current line
    draw_text(_text_pos_x, _text_pos_y, _line_text);
    _text_pos_y += _text_y_line_increment;
    _counter = _end + 1; // Update the counter for the next line
}
//change text color so the user input will appear on top

//grey	
// set color for the user, so we can see what he writes
draw_set_color(make_color_rgb(233, 236, 240));
//reset text pos so we can write on top
_text_pos_x = _text_pos_x_baseline;
_text_pos_y = _text_pos_y_start_calculated

if( _text_len > 330 and _text_len < 400){
	_text_pos_y -= _text_y_line_increment
}
else if(_text_len > 400){
	_text_pos_y -= _text_y_line_increment * 2
}

// Draw _keyboard_string user input
//get the user input string
_text = _keyboard_string;
// do line split if the _target_word is longer than n, and then split it into separate lines
//--------------------------
//TODO:

_lines = array_length(_text_start_end_point_arrary);
_counter = 1;

for (var _i = 0; _i < _lines; _i++) {
    var _start = _counter; // Starting index for the current line
    var _end = _text_start_end_point_arrary[_i]; // End index for the current line
    var _line_text = string_copy(_text, _start, _end - _start + 1); // Extract text for the current line
    draw_text(_text_pos_x, _text_pos_y, _line_text);
    _text_pos_y += _text_y_line_increment;
    _counter = _end + 1; // Update the counter for the next line
}
if (string_length(_text) == _text_len){
	show_debug_message("text len readed")
	draw_set_color(make_color_rgb(244, 76, 127));
	draw_text(40,50, "- Press enter to start next round -")
}
