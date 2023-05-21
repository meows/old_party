# Requirements

- PostgreSQL 15
- Create an `env.json` file in project root and populate with the properties:
   - `db_user`
   - `db_name`

# Installation

1. Clone the repo.

   ```
   git clone git@github.com:meows/party.git && cd party
   ```

2. Install the npm dependencies.

   ```
   npm i
   ```

3. Initialize your database
   
   ```
   TODO: create DB reset script
   ```

4. Start the dev server.

   ```
   npm run dev
   ```

# Git Workflow

- Everyone works on their own branch and does a pull request to merge to `main`.
- Prefer squash commits unless your commits are very clean and atomic.
- A branch should be free of conflicts from `main` before merging.