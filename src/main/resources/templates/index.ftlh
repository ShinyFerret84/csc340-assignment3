<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supernatural Character Gallery</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=UnifrakturCook:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <!-- Navigation Bar -->

    <nav>
        <ul>
            <li><a href="/characters">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/create">Add a Character</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
     <main>
        <h1>Supernatural Character Gallery</h1>

        <h3>
            Explore my favorite characters the from hit television show 
            <em>Supernatural</em>
        </h3>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" placeholder="Search by character or species...">

            <button>Search</button>
        </div>
        
        <!-- Character Cards -->
         <section class="gallery">

            <#list characterList as character>

                <div class="card">
                    <img src="${character.thumbImg}!  alt="${character.name}">
                    <h2>${character.name}</h2>
                    <p>${character.species} • ${character.occupation}</p>
                    <a href="/characters/${character.id?c}">View Details</a>
                </div>
            
            </#list>

        </section>

    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 Supernatural Character Gallery. Created as an educational project.</p>
        <p>Supernatural and all related characters are property of their respective owners.</p>
    </footer>

</body>
</html>