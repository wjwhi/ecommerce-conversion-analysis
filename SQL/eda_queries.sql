# EDA Queries 


CREATE DATABASE ecommerce_portfolio;

------------

SELECT *
FROM generated_data
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM generated_data;

DESCRIBE generated_data;

------------

SELECT
    COUNT(*) AS total_sessions,
    SUM(converted) AS converted_sessions,
    ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM generated_data;

------------

SELECT
    converted,
    COUNT(*) AS sessions
FROM generated_data
GROUP BY converted;

------------

SELECT
    converted,
    ROUND(AVG(time_on_site_sec), 2) AS avg_time_on_site,
    ROUND(AVG(pages_viewed), 2) AS avg_pages_viewed,
    ROUND(AVG(product_views), 2) AS avg_product_views,
    ROUND(AVG(cart_additions), 2) AS avg_cart_additions,
    ROUND(AVG(cart_value), 2) AS avg_cart_value,
    ROUND(AVG(scroll_depth), 2) AS avg_scroll_depth,
    ROUND(AVG(discount_percent), 2) AS avg_discount_pct
FROM generated_data
GROUP BY converted;

------------

SELECT
    converted,
    ROUND(100.0 * AVG(bounce_flag), 2) AS bounce_rate_pct
FROM generated_data
GROUP BY converted;

------------

SELECT
    converted,
    ROUND(AVG(ad_impressions), 2) AS avg_ad_impressions,
    ROUND(AVG(ad_clicks), 2) AS avg_ad_clicks
FROM generated_data
GROUP BY converted;

------------

SELECT
    cart_additions,
    COUNT(*) AS sessions,
    ROUND(100 * AVG(converted), 2) AS conversion_rate_pct
FROM generated_data
GROUP BY cart_additions
ORDER BY cart_additions;

------------

SELECT
    CASE
        WHEN discount_percent < 10 THEN '0-9%'
        WHEN discount_percent < 20 THEN '10-19%'
        WHEN discount_percent < 30 THEN '20-29%'
        WHEN discount_percent < 40 THEN '30-39%'
        ELSE '40%+'
    END AS discount_bucket,
    COUNT(*) AS sessions,
    ROUND(100 * AVG(converted), 2) AS conversion_rate_pct
FROM generated_data
GROUP BY discount_bucket
ORDER BY discount_bucket;

------------

SELECT
    converted,
    time_on_site_sec,
    pages_viewed,
    product_views,
    cart_additions,
    cart_value,
    discount_percent
FROM generated_data;