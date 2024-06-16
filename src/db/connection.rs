use std::path::Path;
use sqlx::{migrate::Migrator, Pool, Postgres};

pub struct Database {
    pub pool: Pool<Postgres>,
}

impl Database {
  pub async fn new(database_url: &str) -> Result<Self, sqlx::Error> {
    let pool = Pool::connect(database_url).await?;
    let migrator = Migrator::new(Path::new("./migrations")).await?;
    migrator.run(&pool).await?;
    println!("Migrations run successfully & connected to database!");
    Ok(Self { pool })
  }
}