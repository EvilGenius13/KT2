use std::sync::Mutex;
use std::collections::HashMap;
use crate::db;

pub struct Data {
    pub votes: Mutex<HashMap<String, u32>>,
    pub db: db::Database,
}