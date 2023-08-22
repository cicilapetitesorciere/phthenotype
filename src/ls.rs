use std::fs::*;
use std::path::*;

pub fn ls() {
    for file in read_dir(Path::new(".")).unwrap() {
        let filename = file.unwrap().file_name().into_string().unwrap();
        println!("{}", filename)   
    }
}