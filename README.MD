# KT2
A highly performant discord bot written in Rust using the serenity library.

## Working in Development
1. Clone the repository
2. Create an .env file in the root of the project
3. Add the following to the .env file
```
DISCORD_TOKEN=your_discord_token
DATABASE_URL=your_database_url (i.e. postgres://user:password@localhost:5432/dbname)
```
4. If you want to run the app locally using the containerized database, run `docker-compose -f docker-compose-local.yml up` in `/dev`
5. Run the bot using `cargo run`
Alternatively, if you want to run the app and database in containers, run `docker-compose -f docker-compose-staging.yml up` in `/dev`

