# Personal Command Center — deployment starter

This folder contains your dashboard homepage, a Vercel API health endpoint, and a Supabase schema for cloud financial records.

## What is ready
- Responsive personal finance and work dashboard (`index.html`)
- Income, expenses, work categories, project earnings/costs, summaries and CSV exports (browser-local in this starter)
- Vercel project structure and API health endpoint
- Supabase SQL schema with per-user Row Level Security

## What is not activated yet
- Public hosting
- Cloud-sync in the dashboard
- Telegram OpenID Connect sign-in

These require your own hosting/database accounts and Telegram application credentials. The Telegram sign-in integration is deliberately not faked: Telegram identity login requires registered app credentials, an exact HTTPS callback URL, server-side code exchange, token validation, and a secure session.

## Deploy the starter
1. Create a private GitHub repository and upload all files in this folder.
2. Import the repository into Vercel and deploy it.
3. In Supabase, create a project and run `supabase_schema.sql` in SQL Editor.
4. Add the Supabase URL and anon key to Vercel environment variables.
5. Register the public HTTPS website and callback URL with Telegram using the current official Telegram Login documentation.
6. Add Telegram client credentials and a strong random `SESSION_SECRET` as Vercel environment variables only. Never place secrets in `index.html` or GitHub.
7. Implement and test the server-side Telegram OIDC callback before enabling a login button.

## Important security note
The Telegram official Login integration verifies identity; it does not give a website unrestricted control of personal Telegram chats, contacts, or account settings. Never share your Telegram password, one-time login code, QR session, or personal-account session file.
