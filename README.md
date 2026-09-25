# State Checklist

A single-page web app for tracking which states you have.

- States are listed cheapest first; states with the same price are alphabetical.
- Check off the states you have; the app shows how many you have and don't have, with cost totals.
- Filter to **Have** / **Don't have**, search, and copy the list for whichever tab is open.
- **Cost calculator** tab: tick any states to see what they would cost together, without changing your checklist.
- **Settings**: reset your check marks and calculator picks. To share, send people the page link; each person gets their own blank checklist.

Check marks are saved in each person's own browser (localStorage). No server needed: open `index.html` directly, or host it anywhere static.

## Changing prices

Prices are in the `STATES` list at the top of the `<script>` in `index.html`. Edit a price there and republish; everyone sees the new price the next time they open the page, and their check marks are kept.
