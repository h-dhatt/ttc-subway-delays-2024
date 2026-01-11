{\rtf1\ansi\ansicpg1252\cocoartf2706
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Query 1: Delays by hour\
SELECT\
  Hour,\
  COUNT(*) AS records,\
  SUM([Min Delay]) AS total_delay_min,\
  ROUND(AVG([Min Delay]), 2) AS avg_delay_min\
FROM subway_delays\
GROUP BY Hour\
ORDER BY records DESC;\
\
-- Query 2: Top 10 stations by delay records\
SELECT\
  Station,\
  COUNT(*) AS records,\
  SUM([Min Delay]) AS total_delay_min,\
  ROUND(AVG([Min Delay]), 2) AS avg_delay_min\
FROM subway_delays\
GROUP BY Station\
ORDER BY records DESC\
LIMIT 10;\
\
-- Query 3: Top delay drivers by total delay minutes\
SELECT\
  Code,\
  COALESCE(CodeDesc, 'Unknown / Not in lookup') AS CodeDesc,\
  COUNT(*) AS records,\
  SUM([Min Delay]) AS total_delay_min,\
  ROUND(AVG([Min Delay]), 2) AS avg_delay_min\
FROM subway_delays\
GROUP BY Code, CodeDesc\
ORDER BY total_delay_min DESC\
LIMIT 15;\
}
