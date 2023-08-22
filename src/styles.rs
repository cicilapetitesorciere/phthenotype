use std::env;
use std::path::*;

pub fn find_styles_dir() {
    let xdg_data_home = env::var("XDG_DATA_HOME").unwrap_or(env::var("HOME").unwrap_or(panic!("Error: You don't seem do have a home directory set, which is frankly really weird ...you should probably get that checked out.")));
}

