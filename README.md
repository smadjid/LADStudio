# LADStudio: A Tool for Dashboard Specification and Generation

LADStudio is a tool that assists in the specification and generation of dashboards. It is built using modern technologies and leverages Grafana for testing dashboard rendering. The tool employs a component-based approach for modeling the structure of dashboards (LADs).

## LAD Components

LADStudio provides a library of LAD components that encompasses various types such as indicators, visualizations, panels, and views. 

- Indicators describe high-level measures that are relevant for the dashboard goals.
- Visualizations are components with visual manifestations, such as charts, graphs, tables, etc.
- Panels are the building blocks of the dashboard, which can contain one or more visualizations or indicators.
- Views are collections of panels that support different levels of situation awareness. Views are classified as perception views, comprehension views, or projection views based on the desired level of awareness.

To facilitate component reuse, LADStudio allows users to define and store indicator templates, visualizations, panels, composite panels, and views. Users can extend the library by creating new components or modifying existing ones. Interactions associated with each component support the sensemaking process.

## LAD Specification Wizard

LADStudio includes a specification wizard that enables step-by-step dashboard specification. The wizard consists of five sequential screens, guiding users through the following steps:

- Target use and usage description: Users provide information about the intended use and users of the dashboard.
- Goal setting: Users define the main goals and subgoals of the dashboard.
- Monitoring and perception views: Users select and configure the components that provide an overview of the current situation and highlight important changes or anomalies.
- Analysis and comprehension views: Users select and configure the components that allow deeper analysis and understanding of the underlying causes and effects of the situation.
- Dashboard generation and export: Users review the generated dashboard and export it to Grafana for further customization and personalization.

This cyclical specification process allows for easy re-editing and testing, with components automatically saved for reuse within the LADStudio library.

## LAD Prototype Generation

LADStudio generates running prototypes based on the LAD specifications, which users can further customize and personalize according to their preferences. The resulting LAD can be rendered in an embedded Grafana instance or a remote installation.


## Installation

To run LADStudio locally, you need to have Docker and Docker Compose installed on your machine. Then, follow these steps:

1. Clone this repository
2. Navigate to the project directory: `cd ladstudio`
3. Create a `.env` file with the following variables:
MYSQL_ROOT_PASSWORD=<your_mysql_root_password>
MYSQL_DATABASE=ladb
MYSQL_USER=laduser
MYSQL_PASSWORD=<your_mysql_user_password>
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=<your_grafana_admin_password>
4. Run `docker-compose up -d` to start the containers
5. Open `http://localhost:3000` in your browser to access the LADStudio UI
6. Open `http://localhost:3030` in your browser to access the Grafana dashboard