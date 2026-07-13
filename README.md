# csc340-assignment3
CSC 340 Assignment 3 - RESTful CRUD API for character website from assignment 2

A comprehensive ~~RESTful API~~ MVC application for managing Character records, built with Spring Boot, Spring Data JPA, and PostgreSQL.

Live Link = https://csc340-assignment3.onrender.com

## Table of Contents
 
- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [API Endpoints](#api-endpoints)
- [Key Spring Boot Concepts](#key-spring-boot-concepts)
- [Database Schema](#database-schema)

---

# What is This Project?

This is a CRUD (Create, Read, Update, Delete) API that manages character records. It demonstrates:

- How to build a REST API with Spring Boot
- How to connect to a PostgreSQL database using JPA
- How to structure a Spring Boot application with layers (Controller, Service, Repository)
- How to handle HTTP requests and responses
- How to perform database operations

**CRUD:**

- **Create**: Add new character
- **Read**: Retrieve existing character
- **Read**: Retrieve existing character
- **Update**: Modify existing character
- **Delete**: Remove character

## Technology Stack

| Technology          | Version | Purpose                                |
| ------------------- | ------- | -------------------------------------- |
| **Java**            | 25      | Programming language                   |
| **Spring Boot**     | 4.1.0   | Framework for building the application |
| **Spring Data JPA** | Latest  | ORM layer for database access          |
| **FreeMarker**      | Latest  | Template engine for rendering views    |
| **Hibernate**       | Latest  | JPA implementation                     |
| **PostgreSQL**      | Latest  | Relational database                    |
| **Maven**           | Latest  | Build and dependency management        |
| **Lombok**          | Latest  | Reduces boilerplate code               |
| **docker**          | Latest  | Containerization                       |

### Java - [Spring ORM with JPA and Hibernate](https://medium.com/@burakkocakeu/jpa-hibernate-and-spring-data-jpa-efa71feb82ac)

- We are using ORM (Object-Relational Mapping) to deal with databases. This is a technique that allows us to interact with a relational database using object-oriented programming principles.
- JPA (Jakarta Persistence, formerly Java Persistence API) is a specification that defines ORM standards in Java. It provides an abstraction layer for ORM frameworks to make concrete implementations.
- Hibernate: Hibernate is a popular ORM framework that implements JPA. It simplifies database operations by mapping Java objects to database tables and handling queries efficiently.
- Spring ORM allows seamless integration of Hibernate and JPA, making database interactions more manageable and reducing boilerplate code.

### Key Dependencies

**spring-boot-starter-data-jpa**: Provides Spring Data JPA for simplified database access through repositories and automatic query generation.

**spring-boot-starter-webmvc**: Provides Spring Web MVC for building REST APIs with annotations like `@RestController`, `@GetMapping`, etc.

**postgresql**: JDBC driver to connect to PostgreSQL database.

**lombok**: Reduces boilerplate code by generating getters, setters, constructors, and other methods at compile time.

**freemarker**: Template engine for rendering dynamic HTML pages.

---

## Installation & Setup

### Prerequisites

Before you begin, ensure you have installed:

1. **Java 25 JDK**
   - Download from [Oracle Java](https://www.oracle.com/java/technologies/downloads/) or use a package manager
   - Verify installation: `java -version`

2. **Neon.tech PostgreSQL Database** (Cloud-based, Serverless)
   - This project uses [Neon.tech](https://neon.tech), a serverless PostgreSQL database in the cloud
   - You don't need to install PostgreSQL locally
   - Sign up for a free account at [Neon.tech](https://neon.tech)
   - You only need an internet connection to connect to the database

2. **GitHub** (for forking the project)
   - Sign up for a free account at [GitHub](https://github.com/)

3. **Render** (for deployment)
   - Sign up for a free account at [Render](https://render.com/)
   - Render is a cloud platform that allows you to deploy web applications easily

### Setup Instructions

1. **Clone or Download the Project**

   ```bash
   git clone https://github.com/ShinyFerret84/csc340-assignment3.git
   ```

   ```bash
   cd csc340-assignment3
   ```

2. **Database Configuration (Neon.tech Serverless PostgreSQL)**

   #### Step 1: Get Your Neon.tech Connection String
   1. Navigate to [Neon.tech](https://neon.tech)
   2. Sign in to your account
   3. In your project dashboard, find your connection string
   4. It will look like: `jdbc:postgresql://project-name.c-2.us-east-1.aws.neon.tech/neondb?user:5432/dbname?user==neondb_owner&password=your_password_here`

   #### Step 2: Stop Tracking `application.properties` Locally

   To prevent accidentally committing your database credentials to Git, use `git skip-worktree` to exclude your local copy:

   ```bash
   git update-index --skip-worktree src/main/resources/application.properties
   ```

   This tells Git to ignore any changes you make to this file locally. You can now safely edit the file without worrying about committing sensitive data.

   #### Step 3: Update Your Connection String

   Edit `src/main/resources/application.properties` and add your Neon.tech PostgreSQL connection string:

   ```properties
   spring.application.name=assignment3
   spring.datasource.url=YOUR NEON CONNECTION STRING
   spring.jpa.hibernate.ddl-auto=update

   #Log out sql queries
   logging.level.org.hibernate.SQL=DEBUG
   logging.level.org.hibernate.orm.jdbc.bind=TRACE
   ```

   Replace with your actual Neon.tech credentials (e.g., `some-cool-projectName-pooler.c-7.us-east-1.aws.neon.tech//neondb?user=neondb_owner&password=your_password_here&sslmode=require&channelBinding=require`).

   #### To Resume Tracking the File

   If you need to revert and track the file again:

   ```bash
   git update-index --no-skip-worktree src/main/resources/application.properties
   ```

   **Important Note**: This approach (using `git skip-worktree`) keeps credentials safe locally while the file can be tracked in Git. For deployment on Render, the database connection string should be stored as the SPRING_DATASOURCE_URL environment variable instead of being committed to the repository.

## Running the Application

### Using Maven Wrapper

**On Windows CMD**:

```cmd
mvnw.cmd spring-boot:run
```

**On Mac/Linux (bash, powershell, zsh**):

```bash
./mvnw spring-boot:run
```

The application will start on **http://localhost:8080**

You should see output like:

```
Started CrudApiApplication in 4.532 seconds
```

### Using VS Code GUI

1. **Open the Project**: Open the project folder in VS Code
2. **Install Extension**: Install the "Extension Pack for Java" (by Microsoft) if not already installed
3. **Run the Application**:
   - Go to the Explorer view (left sidebar)
   - Navigate to `src > main > java > com > example > assignment3 > Assignment3Application.java`
   - Right-click on `Assignment3Application.java`
   - Select **"Run Java"** or click the ▶️ **Run** button that appears above the class definition
4. **View Output**: The terminal will show the Spring Boot startup messages and confirm the application is running

### Using IntelliJ IDEA GUI

1. **Open the Project**: Open the project folder in IntelliJ IDEA (it will recognize it as a Maven project)
2. **Configure JDK**:
   - Go to **File → Project Structure → Project**
   - Set the Project SDK to Java 25
3. **Run the Application**:
   - Navigate to `src > main > java > com > com > example > assignment3 > Assignment3Application.java` in the Project Explorer
   - Right-click on `Assignment3Application.java`
   - Select **"Run 'Assignment3Application.main()'"** or click the ▶️ **Run** button next to the class name
4. **View Output**: The Run window at the bottom will show Spring Boot startup messages and confirm the application is running

### Stopping the Application

Press `Ctrl+C` in your terminal to stop the running application. If using IDE GUI, click the ⏹️ **Stop** button in the Run/Debug toolbar.

---

## Project Architecture

### Folder Structure

```
src/main/java/com/example/assignment3/
├── Assignment3Application.java          # Entry point of the application
├── charapi/
│   ├── Characters.java                  # Entity/model class representing a character
    ├── CharactersRepository.java        # Database access layer using Spring Data JPA
    ├── CharactersService.java           # Service layer for business logic
    ├── CharactersApiController.java     # REST controller handling HTTP requests
    ├── CharactersUiController.java      # Controller for rendering web pages with FreeMarker templates. 
    └── Assignment3Application.java      # Main controller for handling the root endpoint

src/main/resources/
└── application.properties           # Configuration file
```
### Architectural Pattern: **Layered Architecture**

This project follows a layered architecture pattern, separating concerns into distinct layers:

```
┌─────────────────────────────────────┐
│   HTTP Client (REST Client, Browser)│
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│ Controller Layer                    │
| (CharactersApiController.java   $   |
|   CharacterUiController.java)       │
│ - Handles HTTP requests/responses   │
│ - - API: Returns JSON responses     │
| - UI: Renders views using templates │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│ Service Layer                       │
| (CharactersService.java)            │
│ - Contains business logic           │
| - Processes data from repositories  │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│ Repository Layer                    │
| (CharactersRepository.java)         │
| - Interacts with the database(JPA)  |
| - Performs CRUD operations          │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│ Database                            │
│ (PostgreSQL)                        │
└─────────────────────────────────────┘

````
## API Endpoints

All endpoints use the base URL: `http://localhost:8080/api/characters`

### 1. Get All Characters

```http
GET /api/characters
````

**Response:**

```json
[
  {
    "id": 1,
    "name": "name",
    "description": "description",
    "species": "species"
    "occupation": "occupation"
    "firstAppearance": "Season x Episode x"
  },
]
```
### 2. Get Character by ID

```http
GET /api/characters/{id}
```

**Response:**

```json
{
  "id": 1,
  "name": "Sam Winchester",
  "description": "A skilled hunter who travels across America fighting supernatural creatures.",
  "species": "human.",
  "occupation": "hunter.",
  "firstAppearance": "Season 1 Episode 1."
}
```

### 3. Create a New Character

```http
POST /api/characters
request body:
{
    "name": "name",
    "description": "description",
    "species": "species"
    "occupation": "occupation"
    "firstAppearance": "Season x Episode x"
  },
```
**Response:**

```json
{
  "id": 12,
  "name": "Alan Corbett",
  "description": "Worked as an intern for Ghostfacers ghost hunting team until his untimely demise in a haunted house.",
  "species": "ghost",
  "occupation": "ghostfacer",
  "firstAppearance": "Season 3 Episode 13",
  "imageUrl": "/Images/alan-corbett.jpg",
  "thumbImg": "/thumbnails/alan-corbett.jpg"
}
```
### 4. Update an Existing Character

```http
PUT /api/characters/{id}
request body:
{
  "name": "updated name",
   "description": "updated description",
   "species": "updated species"
   "occupation": "updated occupation"
   "firstAppearance": "Season x Episode x."
}
```

**Response:**

```json
{
  "id": 2,
  "name": "updated name",
  "description": "updated description.",
  "species": "updated species.",
  "occupation": "updated occupation.",
  "firstAppearance": "Season 1 Episode 1."
}
```
### 5. Delete a Character

```http
DELETE /api/characters/{id}
```

**Response:** <Empty>

### 6. Search Character by name string

```http
GET /api/characters/search?query={sam}
```

**Response:**

```json
[
  {
  "id": 1,
  "name": "Sam Winchester",
  "description": "A skilled hunter who travels across America fighting supernatural creatures.",
  "species": "human.",
  "occupation": "hunter.",
  "firstAppearance": "Season 1 Episode 1."
  }
]
```

### 6. Search Character by species

```http
GET /api/characters/search?query={human}
```

**Response:**

```json
[
  {
  "id": 1,
  "name": "Sam Winchester",
  "description": "A skilled hunter who travels across America fighting supernatural creatures.",
  "species": "human.",
  "occupation": "hunter.",
  "firstAppearance": "Season 1 Episode 1."
  }

  {
  "id": 2,
  "name": "updated name",
  "description": "updated description.",
  "species": "updated species.",
  "occupation": "updated occupation.",
  "firstAppearance": "Season 1 Episode 1."
}
]
```
### 6. Search Character by occupation

```http
GET /api/characters/search?query={hunter}
```

**Response:**

```json
[
  {
  "id": 1,
  "name": "Sam Winchester",
  "description": "A skilled hunter who travels across America fighting supernatural creatures.",
  "species": "human.",
  "occupation": "hunter.",
  "firstAppearance": "Season 1 Episode 1."
  }

  {
  "id": 2,
  "name": "updated name",
  "description": "updated description.",
  "species": "updated species.",
  "occupation": "updated occupation.",
  "firstAppearance": "Season 1 Episode 1."
}
]
```
## Web UI Routes

- `GET /characters`: View all characters
- `GET /characters/{id}`: View a character's details
- `GET /create`: Display the Add Character form
- `POST /create`: Submit the Add Character form
- `GET /updateForm/{id}`: Display the Update Character form
- `POST /update/{id}`: Submit the Update Character form
- `POST /delete/{id}`: Delete a character
- `GET /about`: View the About page

## MVC (Model-View-Controller) Pattern

This application follows Spring Boot's MVC architecture.

- **Model**: The `Characters` entity represents the Supernatural character data stored in the PostgreSQL database.
- **View**: FreeMarker templates (`index.ftlh`, `details.ftlh`, `new-character-form.ftlh`, `character-update.ftlh`, and `about.ftlh`) generate the HTML pages displayed to users.
- **Controller**:
  - `CharactersUiController` handles web requests and returns FreeMarker views.
  - `CharactersApiController` handles REST API requests and returns JSON responses.

### Example MVC Controllers

```java
@Controller
@GetMapping("/characters")
public String getAllCharacters(Model model) {
    model.addAttribute("characterList",
            charactersService.getAllCharacters());
    return "index";
}

@RestController
@RequestMapping("/api/characters")
@GetMapping
public ResponseEntity<List<Characters>> getAllCharacters() {
    List<Characters> characters = charactersService.getAllCharacters();

    if (characters.isEmpty()) {
        return ResponseEntity.ok(Collections.emptyList());
    }

    return ResponseEntity.ok(characters);
}
```

## Key Spring Boot Concepts

### What is Spring Boot?

Spring Boot is a framework that simplifies building production-ready Spring applications. It provides:

- Auto-configuration of Spring application based on jar dependencies
- Embedded web server (Tomcat) - no need to deploy WAR files
- Convention over configuration - sensible defaults
- Easy integration with databases and other services

### @RestController and @RequestMapping

```java
@RestController
@RequestMapping("/api/characters")
public class CharactersApiController {
    // Controller methods here
}
```

- `@RestController`: Indicates that this class is a REST controller, capable of handling HTTP requests and returning JSON responses.
- `@RequestMapping("/api/characters")`: All endpoints in this class start with `/api/characters`.

### HTTP Mapping Annotations

- `@GetMapping`: Handles GET requests (retrieve data)
- `@PostMapping`: Handles POST requests (create data)
- `@PutMapping`: Handles PUT requests (update data)
- `@DeleteMapping`: Handles DELETE requests (delete data)
- `ResponseEntity`: Represents the entire HTTP response, including status code, headers, and body.
- `@RequestParam`: Binds query parameters from the URL to method parameters.
- `@RequestBody`: Binds the request body (JSON) to a Java object.

### @Service and Dependency Injection

```java
@Service
public class CharactersService {
    private final CharactersRepository charactersRepository;

    @Autowired
    public CharactersService(CharactersRepository charactersRepository) {
        this.charactersRepository = charactersRepository;
    }
}
```

- `@Service`: Indicates that this class contains business logic and is a service component.
- Dependency Injection: Spring automatically injects the `CharactersRepository` into the `CharactersService` constructor, allowing us to use it without manually instantiating it.

### Spring Data JPA Repository

```java
public interface CharactersRepository extends JpaRepository<Characters, Long> {
    List<Characters> findByNameContainingIgnoreCase(String name);
    
    List<Characters> findBySpeciesContainingIgnoreCase(String species);

    List<Characters> findByOccupationContainingIgnoreCase(String occupation);
}
```

- `JpaRepository<Characters, Long>`: Provides CRUD operations and query methods for the `Characters` entity.
- Spring automatically generates implementations for these methods based on their names.
- `findByNameContainingIgnoreCase`: Genarates a query like

```sql
SELECT * FROM characters WHERE UPPER(name) = UPPER(?)
```
### @Entity and JPA Annotations

```java
@Entity
public class Characters {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private String species;

    @Column(nullable = false)
    private String occupation;

    @Column(name = "first_appearance")
    private String firstAppearance;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "thumb_img")
    private String thumbImg;
}
```

- `@Entity`: Marks this class as a JPA entity, representing a table in the database.
- `@Id`: Specifies the primary key of the entity.
- `@GeneratedValue`: Configures how the primary key is generated (e.g., auto-increment).
- `@Column`: Specifies column properties, such as nullability and data type.

---

## Database Schema

The application uses a single table to store character data:

### Characters Table

| Column             | Type         | Constraints | Description                           |
| ------------------ | ------------ | ----------- | ------------------------------------- |
| `id`               | BIGINT       | PRIMARY KEY | Unique identifier for each character  |
| `name `            | VARCHAR(255) | NOT NULL    | name of character                     |
| `description`      | text         | NOT NULL    | description of character              |
| `species`          | VARCHAR(255) | NOT NULL    | species of character                  |
| `occupation`       | VARCHAR(255) | NOT NULL    | occupation of character               |
| `first_appearance` | VARCHAR(255) |             | first appearance of character         |
| `image_url`        | VARCHAR(255) |             | full size image of character          |
| `thumb_img`        | VARCHAR(255) |             | small, uniform size image of character|

**Note**: This schema is automatically created by Hibernate based on the entity class when `spring.jpa.hibernate.ddl-auto=update` is set in `application.properties`.

---

## Testing the API

### Using Postman/Echo API/Bruno (GUI)

1. Create a new request
2. Select HTTP method (GET, POST, PUT, DELETE)
3. Enter the URL (e.g., `http://localhost:8080/api/characters`)
4. If POST/PUT, go to "Body" tab → select "raw" and "JSON"
5. Enter JSON data and click "Send"

---

## Common Issues and Solutions

### Issue: Port 8080 is already in use

**Solution**: Change the port in `application.properties`:

```properties
server.port=8081
```

The access the API at `http://localhost:8081/api/characters`

### Issue: "Connection refused" when accessing database

**Solution**:

- Ensure you have **internet access** to connect to Neon.tech (the database is cloud-based and always running)
- Verify your connection string is correct in `application.properties`
- Check that your username and password from Neon.tech are correct
- Make sure the host/endpoint is reachable (not blocked by firewall)

### Issue: Getting 404 errors

**Solution**:

- Verify the endpoint URL is correct
- Make sure the application is running (use `mvnw.cmd spring-boot:run` on Windows or `./mvnw spring-boot:run` on Mac/Linux)
- Check the base path is `/api/characters` for all endpoints

### Issue: JSON parsing errors in POST/PUT requests

**Solution**:

- Ensure `Content-Type: application/json` header is set
- Verify JSON syntax is valid (use online JSON validator)
- Check all required fields are included (name and email are required)

### Issue: Whitelabel Error Page instead of a view

**Solution**: Check that the name of the view being returned is spelled correctly.

### Issue: Getting 404 errors

**Solution**:

- Verify the endpoint URL is correct
- Make sure the application is running (use `mvnw.cmd spring-boot:run` on Windows or `./mvnw spring-boot:run` on Mac/Linux)
- Check the base path is `/api/characters` for all endpoints

---

## Additional Resources

- [Spring Boot Official Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA Guide](https://spring.io/projects/spring-data-jpa)
- [REST API Best Practices](https://restfulapi.net/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)