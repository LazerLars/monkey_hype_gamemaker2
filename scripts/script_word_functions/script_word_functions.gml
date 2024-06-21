// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//function to figure out if the user input the exact same char as the current he/she is trying to replicate.
function compare_char_on_pos_in_two_words(_word_a, _word_b, _compare_pos){
	_len_word_a = string_length(_word_a)
	_len_word_b = string_length(_word_b)
	
	_a_char = string_char_at(_word_a, _compare_pos);
	_b_char = string_char_at(_word_b, _compare_pos);
	show_debug_message(_a_char)
	show_debug_message(_b_char)
	
	if _a_char == _b_char{
		return true
	}
	else{
		return false
	}
}

//read text file into a arrary
//adds a new element per line
//the txt files is placed in project folder under "datafiles"
//if you place the a file in the root of datafiles then you only have to specify the filename.txt
//else you have to subfolder/filename.txt
function read_txt_file_to_arrary(_file_name){
	//check if the file exist
	if (file_exists(_file_name)) {
		show_debug_message("File exists: " + _file_name);
	} 
	else {
	    show_debug_message("File does not exist at path: " + _file_name);
	}
	_file = file_text_open_read(_file_name);
	// Create an array to store the _current_lines of text
	var _quotes_array = [];
	if (_file != -1) {
	    // Read each _current_line of the _file and add it to the array
	    while (!file_text_eof(_file)) {
			var _current_line = file_text_readln(_file);
			//if you want to split a _current_line with a delimiter
			//var parts = string_split(_current_line, ";");

			//if (array_length_1d(parts) >= 2) {
			//    var quote = parts[0];
			//    var author = parts[1];
    
			//    // Now you have quote and author
			//    show_debug_message("Quote: " + quote);
			//    show_debug_message("Author: " + author);
			//} else {
			//    // Handle the case where the _current_line doesn't contain the expected format
			//    show_debug_message("Invalid _current_line format: " + _current_line);
			//}
			
			
			//show_debug_message(_current_line)
	        if (_current_line != "") {
	            array_push(_quotes_array, _current_line);
	        }
	    }

	    // Close the _file
	    file_text_close(_file);

	    // Show debug message with the length of the array
	    //show_debug_message("Number of _current_lines in the _file: " + string(array_length_1d(_quotes_array)));

	    // Now you can use _quotes_array for further processing
	} else {
	    show_debug_message("Failed to open the _file.");
	}
	return _quotes_array

}