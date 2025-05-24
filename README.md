# FoodVote Application

This README documents the steps to get the **FoodVote** application up and running.

---

## Ruby and Rails Versions

* Ruby: 3.4.4
* Rails: 8.2.0

---

## Features

* FusionCharts integration for data visualization

---

## System Dependencies

* Ubuntu (or any Linux distro)
* Git

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/sudhan670/foodvote.git
cd foodvote
```

### 2. Install Dependencies

```bash
bundle install
```

### 3. Database Setup

```bash
rails db:create
rails db:migrate
```

### 4. Initialize Database (Optional)

*Add any seed data or initialization steps here if applicable.*

### 5. Running Tests

```bash
rails test
```

---

## Services

* Mailer: Csvmailer (generated via `rails generate mailer Csvmailer`)

---

## Deployment Instructions

*Add deployment steps here (e.g., how to start the server, environment variables, any hosting instructions).*

