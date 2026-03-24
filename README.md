# Task-Tracker Application

A robust and modern Task Management application built with Java, Jakarta EE, and Hibernate. This application allows users to create, read, update, and delete (CRUD) tasks, categorize them, and track their completion status.

## Features

*   **Task Management**:
    *   Create new tasks with a title, description, and optional category.
    *   View a list of all tasks.
    *   Edit existing tasks.
    *   Delete tasks.
    *   Toggle task completion status directly from the list view.
    *   Filter tasks by category.

*   **Category Management**:
    *   Create, edit, and delete task categories.
    *   Associate tasks with specific categories for better organization.
    *   View tasks grouped by category.

*   **User Interface**:
    *   Clean and responsive UI with a "Vintage Modern" aesthetic.
    *   Intuitive navigation for managing tasks and categories.
    *   Visual indicators for completed tasks.

## Technology Stack

*   **Backend**: Java, Jakarta EE (Servlets), Hibernate ORM
*   **Frontend**: JSP (JavaServer Pages), CSS (Custom "Vintage Modern" styling)
*   **Database**: MySQL
*   **Build Tool**: Maven
*   **Server**: Apache Tomcat (or any Jakarta EE compatible server)

## Prerequisites

Before running the application, ensure you have the following installed:

*   Java Development Kit (JDK) 17 or higher
*   Apache Maven
*   MySQL Server
*   A Java IDE (IntelliJ IDEA, Eclipse, etc.) with Tomcat support

## Setup Instructions

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/Task-Tracker.git
    cd Task-Tracker
    ```

2.  **Database Configuration**:
    *   Create a MySQL database named `work`.
    *   Update the `src/main/resources/hibernate.cfg.xml` file with your MySQL credentials:
        ```xml
        <property name="hibernate.connection.username">your_username</property>
        <property name="hibernate.connection.password">your_password</property>
        ```
    *   Ensure the `hibernate.hbm2ddl.auto` property is set to `update` to preserve data across restarts.

3.  **Build the Project**:
    ```bash
    mvn clean install
    ```

4.  **Run the Application**:
    *   Deploy the generated WAR file to your Tomcat server.
    *   Alternatively, run it directly from your IDE using a Tomcat run configuration.

5.  **Access the Application**:
    *   Open your web browser and navigate to `http://localhost:8080/Task-Tracker` (or the context path configured in your server).

## Project Structure

```
src/main/java
└── com.task.tracker
    ├── controller      # Servlets handling HTTP requests (TaskController, CategoryController)
    ├── DAO             # Data Access Objects for database interactions (TaskDAO, CategoryDAO)
    ├── model           # Entity classes representing database tables (Task, Category)
    └── util            # Utility classes (HibernateUtil)

src/main/webapp
├── WEB-INF             # Configuration files (web.xml)
├── css                 # Stylesheets (style.css)
└── *.jsp               # JSP views for the user interface
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
