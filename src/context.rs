use std::sync::Mutex;
use std::collections::HashMap;

pub struct Data {
    pub votes: Mutex<HashMap<String, u32>>,
}