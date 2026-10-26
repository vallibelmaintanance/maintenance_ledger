# Maintenance Ledger

A web app for building maintenance: PPM schedule, AMC contracts (with a details page), breakdowns, works and costs, expenses and payments, and downloadable monthly, quarterly and annual PDF reports.

- **Hosting:** GitHub Pages (free for public repositories).
- **Database:** Supabase Postgres (free plan), behind a login.
- **No server to run.** The page talks to Supabase directly.

## What is in this folder

| File | Purpose |
|---|---|
| `index.html` | The whole app |
| `config.js` | Your Supabase URL and key (you edit this) |
| `schema.sql` | Creates the database tables and security rules |
| `seed.sql` | Loads the 44-task 2026 PPM schedule and empty AMC entries |

## Try it first (2 minutes, no accounts)

Open `index.html` in a browser. With `config.js` left empty, the app runs in **local mode** and keeps data in that browser only. Use this to look around. Local data is not shared and is not backed up.

## Set up the shared database and website

### 1. Create the database (Supabase)

1. Go to <https://supabase.com>, sign up, and click **New project**. Choose a name, a database password (save it) and the region closest to you.
2. Wait until the project finishes setting up.
3. Open **SQL Editor > New query**, paste all of `schema.sql`, and click **Run**.
4. Open a new query, paste all of `seed.sql`, and click **Run**. Run it **once only**.

### 2. Create your login

1. Open **Authentication > Users > Add user > Create new user**. Enter an email and password, and tick **Auto Confirm User**.
2. Add one user for each person who will use the app.
3. Open **Authentication > Sign In / Providers** (the exact menu name can vary) and **turn off "Allow new users to sign up"**. This stops strangers creating accounts.

### 3. Connect the app

1. In Supabase open **Project Settings > API**.
2. Copy the **Project URL** and the **anon public** key.
3. Paste them into `config.js`:

```js
window.APP_CONFIG = {
  SUPABASE_URL: "https://yourproject.supabase.co",
  SUPABASE_ANON_KEY: "your-anon-public-key"
};
```

The anon key is designed to be public. Never paste the **service_role** key anywhere in this app.

### 4. Publish on GitHub Pages

1. On <https://github.com>, create a new **public** repository (for example `maintenance-ledger`).
2. Upload `index.html`, `config.js`, `schema.sql`, `seed.sql` and `README.md`. (On the repository page: **Add file > Upload files**.)
3. Open **Settings > Pages**. Under **Build and deployment**, set **Source** to **Deploy from a branch**, branch **main**, folder **/ (root)**, and save.
4. After a few minutes your site is live at `https://YOUR-USERNAME.github.io/maintenance-ledger/`.

Open the link, sign in with the user you created, then open **Settings** in the app to enter your company, building and currency.

## Using the app

| Page | What you do there |
|---|---|
| Overview | See cost, faults, PPM completion and items needing attention |
| PPM schedule | Click a planned month to record the task as done. Add, edit or copy tasks to next year |
| AMC contracts | Add each contract. Click one to open its **details page**: term, visits, invoices, payments and faults on that system |
| Breakdowns | Log each fault with times, cause, action and repair cost |
| Works & costs | Log PPM tasks, AMC visits, corrective works and projects with labour, materials and contractor cost |
| Expenses | Record supplier invoices, payment status and due dates. Overdue payments are flagged |
| Reports | Choose monthly, quarterly or annual, check the preview, then click **Download PDF report** |
| Settings | Company, building, currency, PPM tracking start date, backup download |

Set the **PPM tracking starts** date in Settings to the day you begin recording. Earlier planned months are not counted as overdue.

## Things to know

- **Free plan limits.** Supabase's free plan pauses a project after about a week of inactivity. If that happens, sign in to Supabase and click **Restore project**. Open the app at least weekly, or upgrade the plan. Check <https://supabase.com/pricing> for current limits.
- **Public repository.** GitHub Pages on a free GitHub account needs a public repository, so the app code is visible to anyone. Your **data** is not: it sits in Supabase and needs a login.
- **Backups.** Use **Settings > Download backup (JSON)** regularly and keep the file somewhere safe.
- **Changing the schedule.** Edit tasks in the app. To start a new year, open the PPM schedule for that year and use **Copy tasks**.
- **Costs and expenses are separate on purpose.** Work and breakdown costs show what the work cost. Expenses track what suppliers billed and what has been paid. Reports show both.
