# Crowdsourced Supermarket Deal & Pricing Platform 🛒📌

A full-stack, geospatial crowdsourced web application designed to help users locate, verify, and share real-time supermarket offers and discounts based on geographic proximity. Developed using modern web techniques with a dynamic JavaScript frontend and a RESTful PHP JSON API backend.

---

## 🚀 Key Features

### 👤 User Capabilities
- **Interactive Geospatial Map:** Dynamic Leaflet.js map displaying local supermarkets and active offers pinned to precise coordinates.
- **Proximity-Gated Deal Submission:** Strict GPS validation ensuring users are within **50 meters** of a store to post a deal or report stock availability.
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

- **Frontend:** HTML, CSS, JavaScript, Leaflet.js (Maps), Chart.js (Analytics), AJAX
- **Backend:** PHP
- **Database:** MySQL (Relational schema, Triggers, Stored Procedures, Scheduled Events)
- **Geospatial Data:** OpenStreetMap API 

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

## ⚡ Performance Optimization

- **Static Asset Caching:** Configured via `.htaccess` (`max-age=86400, public`) for images, scripts, and stylesheets.
- **Payload Minimization:** API endpoints respond exclusively with streamlined JSON payloads.
- **Geospatial Indexing:** Spatial indexing on store coordinates for fast radius calculations.

---

## 👥 Authors & Credits

Developed as part of the **Web Programming & Systems** course at the **Department of Computer Engineering and Informatics (CEID), University of Patras**.

* **Odysseus Zachos (Οδυσσέας Ζάχος)** 
* **Vlasios Panagiotis Panagiotou** 
* **Konstantinos Paraskevopoulos** 

---
