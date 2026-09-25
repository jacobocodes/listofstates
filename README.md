# State Checklist

A single-page web app for tracking which states you have.

- States are listed cheapest first; states with the same price are alphabetical.
- Check off the states you have; the app shows how many you have and don't have, with cost totals.
- Filter to **Have** / **Don't have**, search, and copy the list for whichever tab is open.
- **Cost calculator** tab: tick any states to see what they would cost together, without changing your checklist.
- **Accounts (optional)**: sign in with email and password to sync check marks and calculator picks across devices. Includes password reset by email.
- **Settings**: reset your check marks and calculator picks. To share, send people the page link; each person gets their own blank checklist.

Without an account, check marks are saved in that browser only. Signed-in progress is stored in Supabase.

## Changing prices

Prices are in the `STATES` list at the top of the `<script>` in `index.html`. Edit a price there and republish; everyone sees the new price the next time they open the page, and their check marks are kept.

## Setting up accounts (one time)

1. **Create the database.** Sign up at [supabase.com](https://supabase.com) (free) and create a new project.
2. **Create the table.** In the project, open **SQL Editor → New query**, paste everything from [`supabase/schema.sql`](supabase/schema.sql), and click **Run**. This makes one row per account and locks it so each person can only see their own progress.
3. **Connect the app.** In **Project Settings → API**, copy the **Project URL** and the **anon public** key into `SUPABASE_URL` and `SUPABASE_ANON_KEY` near the top of the `<script>` in `index.html`. The anon key is meant to be public; the table's security rules are what protect the data.
4. **Put the site online.** In this GitHub repo, go to **Settings → Pages**, set **Source** to *Deploy from a branch*, and pick the branch with this code and the `/ (root)` folder. The site appears at `https://<your-username>.github.io/listofstates/`.
5. **Tell Supabase the site address.** In Supabase, **Authentication → URL Configuration**: set **Site URL** to the GitHub Pages address, and add it under **Redirect URLs** too. The confirmation and password-reset emails link back there.

By default Supabase asks new users to confirm their email before signing in. To skip that, turn off **Confirm email** under **Authentication → Sign In / Providers → Email**.
