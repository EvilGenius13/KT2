use std::fmt;
use crate::serenity::prelude::SerenityError;

#[derive(Debug)]
pub struct Error {
    pub message: String,
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl std::error::Error for Error {}

impl From<SerenityError> for Error {
    fn from(error: SerenityError) -> Self {
        Error {
            message: error.to_string(),
        }
    }
}
