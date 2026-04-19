# BrightTV-Case-Study-Project
An Analysis Project on the Bright TV dataset, drawing in the on user and usage trends, what influence the consumption, content recommendations on days that are not busy, and lastly what initiatives that can taken to increase the user of BrightTV.
This analysis
# BrightTV Viewership Analytics & CVM Strategy

End-to-end analytics engagement for BrightTV: from raw viewing logs to a CEO-ready growth and Customer Value Management (CVM) plan. This repository bundles the dataset analysis, the technical data pipeline, the strategic recommendations, and the delivery timeline.

---

---

## 🎯 Project Goal

Help BrightTV grow its subscriber base and deepen engagement by:

1. Profiling **who** is watching (age, gender, race, province).
2. Understanding **what, when and how long** they watch.
3. Identifying **factors influencing consumption**.
4. Recommending **content and CVM initiatives** to lift acquisition, engagement and retention.

---
## 📊 Dataset Overview

Two source tables joined on `user_id`:

- **User Profiles** — demographics (DOB, gender, race, province).
- **Viewer Transactions** — session-level logs (channel, start/stop, date).

After cleaning: **9,977 users**, **10,984 sessions**, covering Jan–Apr.

### Engineered features
- **Age** (from DOB) → buckets: Young, Adult, Senior
- **Time of Day** (Early-Morning, Morning, Afternoon, Evening, Late-Night) — converted UTC → SAST
- **Day Type** (Weekday / Weekend)
- **Session Duration** → buckets: Shortwatch, Bingewatch, Marathon

---

## 🔍 Headline Insights

| Insight | Evidence | So what |
|---|---|---|
| Massive male skew | Male 8,952 vs Female 1,025 (~89%) | Female acquisition is the #1 growth lever |
| Gauteng dominates | 3,749 users; NC/FS/NW <360 each | Geographic expansion via telco bundles |
| 99% Shortwatch sessions | 9,901 of 10,984 | Engagement depth is fragile → churn risk |
| Weekend mornings dead | Late-night weekday 1,255 vs weekend 98 | Programme weekend daytime |
| Top channels | Africa Magic, Cartoon Network, Boomerang, Supersport | Acquire lookalikes via proven content |
| Data quality gaps | 1,595 "None" race; April truncated | Fix ETL + profile completion before next cycle |

---

## 🚀 90-Day Growth Initiatives (priority stack)
1. **Female-acquisition campaign** + curated "Her Pick" rail → +15–25% female sign-ups
2. **Telco data bundles** in Northern Cape / Free State / North West → +20% users
3. **Weekend morning programming** refresh (kids, breakfast, sport) → +10% weekend sessions
4. **Box-set drops** for Adults to convert Shortwatch → Bingewatch → +30% session duration
5. **Referral programme** for Bingewatchers → lower CAC, organic growth

Full segment-to-action mapping lives in `BrightTV_CVM_Decision_Flowchart.pdf`.

---

## 🛠 Data Pipeline (summary)

```
Raw Profiles ─┐
              ├─► JOIN on user_id ─► Clean (UTC→SAST) ─► Validate ─► Feature Eng. ─► Aggregations ─► Dashboard
Raw Sessions ─┘                                            │
                                                           └─► Quarantine (bad rows)
```

Detailed in `BrightTV_Data_Pipeline_Flowchart.pdf`.

---

## 📅 Timeline

12 weeks across 6 phases: **Discovery → Data Engineering → Analysis → Insights → CVM Activation → Delivery**.
Key milestones: ETL ready (Wk3), Insights locked (Wk6), CVM campaigns live (Wk10), CEO readout (Wk12).
See `BrightTV_Gantt_Chart.pdf`.

---

## 👥 Roles

- **Project Manager** — timeline, stakeholders, RACI
- **Data Engineer** — ETL, data quality, pipeline
- **Analyst** — insights, dashboard, segmentation
- **CVM Lead** — campaign design, KPI tracking, activation

---

## 📈 Tracking KPIs (post-launch)

- New sign-ups by gender / province (weekly)
- Avg session duration & Bingewatch %
- Weekend vs weekday session mix
- Channel-level acquisition attribution
- 14-day re-engagement rate (win-back loop)
