# URL-Shortly

A custom URL shortener service.

* Ruby version: 2.5.1

* Rails version: 5.2.1

* Database: PostgreSQL

---

## API

### POST

Send a post request to the [Heroku](https://url-shortly.herokuapp.com/urls) endpoint passing in your long url as `?url=LONG-URL-HERE`.

Example with Postman:
![Postman Example](https://i.imgur.com/pdY2se6.png)

The return value then looks like:

```json
{
    "id": 1,
    "original": "https://guides.rubyonrails.org/getting_started.html",
    "shortened": "I1dWHY",
    "title": "Getting Started with Rails — Ruby on Rails Guides",
    "clicks": 0,
    "created_at": "2018-12-03T03:20:23.938-05:00",
    "updated_at": "2018-12-03T03:20:23.938-05:00"
}
```

The response holds the database ID number, the original url, the shortened url hash, the title of the url document, the number of clicks or number of times the shortened form has been used, and finally the timestamps.

---

### GET
