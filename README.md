- **Algorithmic Gamification & Token Economy:**
  - Earn points by submitting deals significantly lower than daily/weekly average prices.
  - Community upvoting/downvoting system affecting user scores.
  - Automatic monthly distribution of virtual tokens based on user score share.
- **Personal Dashboard:** Track submitted offers, voting history, monthly points, and earned tokens.

### 🛡️ Administrator Tools
- **Data Ingestion Pipeline:** Bulk upload product catalogs, categories, and historical price datasets (parsed from `e-katanalotis`).
- **POI Synchronization:** Import and update retail store coordinates directly via OpenStreetMap (Nominatim / Overpass API).
- **Visual Analytics:** Interactive charts powered by **Chart.js** displaying daily offer trends, discount percentages per category, and leaderboard rankings.

---

## 🏗️ Architecture & Tech Stack

The platform follows a decoupled client-server architecture. The PHP backend strictly serves as a **JSON REST API**, while the frontend handles DOM manipulation and UI states dynamically through asynchronous requests (AJAX).

- **Frontend:** HTML5, CSS3, JavaScript (ES6+), Leaflet.js (Maps), Chart.js (Analytics), AJAX/Fetch API
- **Backend:** PHP (RESTful JSON API Engine, PDO, Session Management)
- **Database:** MySQL 8.0 (Relational schema, Triggers, Stored Procedures, Scheduled Events)
- **Geospatial Data:** OpenStreetMap POI API (Overpass/Nominatim integration)

---

## 🗄️ Database Design

The database schema comprises **10 interconnected relational tables** ensuring high data integrity and efficient queries:

```
                +---------------+          +------------------+
                |     user      |          |   system_token   |
                +---------------+          +------------------+
                        | 1
                        |
                        | N
                +---------------+          +------------------+
                |   discount    |--------->|     product      |
                +---------------+          +------------------+
                   |         |                      |
                 N |       N |                      | N
                   v         v                      v
        +------------+     +------------+  +------------------+
        |   store    |     |  store_    |  |  price_history   |
        |            |---->|  geojson   |  +------------------+
        +------------+     +------------+  +------------------+
                                           |  price_in_store  |
                                           +------------------+
```

### Key Automated Logic (SQL Triggers & Events)
- **`discount_likes_gives_tokens` & `discount_dislikes_subtracts_tokens`:** Dynamically updates user scores upon receiving votes.
- **`update_product_price_after_discount_placement`:** Recalculates historical average prices and assigns point rewards.
- **Scheduled Cleanup Event:** Automatically deactivates expired offers after 7–14 days of inactivity.

---

## ⚙️ Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/OdysseusZachos/supermarket-deal-platform.git
   cd supermarket-deal-platform
   ```

2. **Database Configuration:**
   - Import the provided SQL schema dump into your MySQL server.
   - Configure your connection credentials in `config/db.php`:
     ```php
     define('DB_HOST', 'localhost');
     define('DB_USER', 'your_username');
     define('DB_PASS', 'your_password');
     define('DB_NAME', 'supermarket_db');
     ```

3. **Web Server Setup:**
   - Deploy the project on Apache or Nginx with PHP 8.x support.
   - Ensure `.htaccess` is enabled for URL rewrite and static asset caching rules.

4. **Access the Application:**
   - Navigate to `http://localhost/supermarket-deal-platform/` in your browser.

---

## ⚡ Performance Optimization

- **Static Asset Caching:** Configured via `.htaccess` (`max-age=86400, public`) for images, scripts, and stylesheets.
- **Payload Minimization:** API endpoints respond exclusively with streamlined JSON payloads.
- **Geospatial Indexing:** Spatial indexing on store coordinates for fast radius calculations.

---

## 👥 Authors & Credits

Developed as part of the **Web Programming & Systems** course at the **Department of Computer Engineering and Informatics (CEID), University of Patras**.

* **Odysseus Zachos (Οδυσσέας Ζάχος)** - *Database Architecture, SQL Triggers/Events, Geospatial Leaflet Engine, RESTful PHP API*
* **Vlasios Panagiotis Panagiotou** - *Frontend Layout & UX, Responsive UI Components, User Profile Engine*
* **Konstantinos Paraskevopoulos** - *Admin Dashboard Analytics, Chart.js Integration, Data Ingestion Pipeline*

---
