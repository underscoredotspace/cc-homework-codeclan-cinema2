# Codeclan Cinema

## Database Setup
`init.sh` will create a new database called `codeclan_cinema` and creates table structure in `db/codeclan_cinema.sql`. 

n.b. - you may need to make the file executable with `chmod +x ./init.sh`. 

## Ruby API

### Gem Requirements
- Pry (debugger): `gem install pry`
- PG (PostgreSQL interface): `gem install pg`

Running `ruby ./db/console.rb` starts a Pry console where you have access to the following API: 

- TBC