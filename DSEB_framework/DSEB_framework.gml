function set_fa_middle() {
	draw_set_halign(fa_middle);	
	draw_set_valign(fa_middle);
}
function set_fa_standard() {
	draw_set_halign(fa_left);	
	draw_set_valign(fa_top);
}

function buttonMaker() constructor{
	font = -1;
	static Init = function() {
		buttonList = ds_list_create();
	}
	static Create = function (_x, _y, _width, _height, _name, _scr, _info = noone) {
		ds_list_add(buttonList, new button(_x, _y, _width, _height, _name, _scr, _info));
	}
	static Clear = function() {
		ds_list_clear(buttonList)	
	}
	static Draw = function() {
		for (var i = 0; i < ds_list_size(buttonList); ++i) {
			var b = buttonList[| i];
			with (b) {
				
				var vx = camera_get_view_x(view_camera[0]);
				var vy = camera_get_view_y(view_camera[0]);
				var inside = ((mouse_x-vx)*2 > x and (mouse_x-vx)*2 < (x+width) and (mouse_y-vy)*2 > y and (mouse_y-vy)*2 < (y+height));
				var col = (inside) ? c_black : c_grey;
				
				draw_rectangle_colour(x, y, x + width, y + height, col , col, col, col, false);
				set_fa_middle();
				if (!is_string(name) and asset_get_type(sprite_get_name(name)) == asset_sprite) {
					draw_sprite(name, -1, x + width/2, y + height/2);
				} else {
					var savedFont = draw_get_font();
					if (font_exists(other.font)) draw_set_font(other.font);
					draw_text_colour(x + width/2, y + height/2, string(name), c_orange, c_orange, c_orange, c_orange, 1);
					draw_set_font(savedFont)
				}
				
				set_fa_standard();

				if(inside) {
					draw_rectangle_colour(x, y, x + width, y + height, c_white , c_white, c_white, c_white, true);
				}
			}
		}		
	}
	
	
	static Run = function () {
		if (mouse_check_button_pressed(mb_left)) {
			var vx = camera_get_view_x(view_camera[0]);
			var vy = camera_get_view_y(view_camera[0]);
			
			for (var i = 0; i < ds_list_size(buttonList); ++i) {
				var b = buttonList[| i];
				with (b) {	
					if((mouse_x-vx)*2 > x and (mouse_x-vx)*2 < (x+width) and (mouse_y-vy)*2 > y and (mouse_y-vy)*2 < (y+height)) {
						if (info != noone) {
							try {
								scr(info);
							} catch(_fail) {
								show_debug_message(_fail.message);	
								show_debug_message("Button : " + string(name) + "failed.");		
							}
						} else {
							try {
								scr();
							} catch(_fail) {
								show_debug_message(_fail.message);	
								show_debug_message("Button : " + string(name) + "failed.");		
							}
						}
					}
				}
			}
		}
	}
}

function button(_x, _y, _width, _height, _name, _scr, _info) constructor {
	x	= _x;
	y	= _y;
	width	= _width;
	height	= _height;
	name	= _name;
	scr	= _scr;
	info	= _info
}
	
