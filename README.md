# FoodVote Application

This README documents the steps to get the **FoodVote** application up and running.

---
# Application Workflow 

* In this food vote application you can vote your desire food option only on Tuesday between 9.00AM to 1.00PM'
* You can search the food by Employee_id also it registered Bewteen 1 to 150 
* You send the report by send report and view in Download CSV foramt

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
### 4. Running Tests

```bash
bin/rails test
```

---

## Services

* Mailer: Csvmailer (generated via `rails generate mailer Csvmailer`)

---

## Outputs 


<img src="https://github.com/sudhan670/foodvote/blob/main/food.png" />

<img src="https://github.com/sudhan670/foodvote/blob/main/chart.png" />

<img src="https://github.com/sudhan670/foodvote/blob/main/new.png" />

<img src="https://github.com/sudhan670/foodvote/blob/main/poll.png" />
