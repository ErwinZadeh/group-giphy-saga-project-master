CREATE DATABASE "giphy_search_favorites";


-- You'll need a table for storing each giphy image favorite
-- Each favorite image can be assigned 1 of the following categories as a Foreign Key

-- Category table
CREATE TABLE "category" (
    "id" SERIAL PRIMARY KEY,
    "category_name" VARCHAR (100) NOT NULL
);

INSERT INTO "category" ("category_name")
VALUES ('funny'), ('sports'), ('memes'), ('nsfw');

CREATE TABLE "gifs" (
    "id" SERIAL PRIMARY KEY,
    "description" VARCHAR (100) NOT NULL,
    "url" VARCHAR (250) NOT NULL,
    "category_id" integer REFERENCES "category"
);

INSERT INTO "gifs" ("description", "url", "category_id")
VALUES ('photographer stand GIF', 'https://media1.giphy.com/media/13EaEZ9UiY1CH6/giphy.gif', 1), ('time bath GIF', 'https://media3.giphy.com/media/F9CXkOZws5LTq/giphy.gif', 4);

-- join the tables
SELECT  "gifs"."id", "gifs"."description", "gifs"."url", "gifs"."category_id", "category"."category_name"
FROM "gifs"
JOIN "category" ON "gifs"."category_id" = "category"."id";

