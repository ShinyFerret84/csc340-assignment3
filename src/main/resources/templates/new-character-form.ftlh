<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Character | Supernatural Character Gallery</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=UnifrakturCook:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
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
        <h1>Add a New Character</h1>

        <h3>
            Share your favorite <em>Supernatural</em> character.
        </h3>

        <form class="character-form" action="/create" method="post">
            <label>Character Name *</label> 
            <input type="text" name="name" placeholder="e.g., John Winchester" required> 
            
            <label>Species *</label> 
            <select name="species" required>
                <option value=""> ~~ Select a Species ~~</option>
                <option value="Human">Human</option>
                <option value="Angel">Angel</option>
                <option value="Demon">Demon</option>
                <option value="Monster">Monster</option>
                <option value="Ghost">Ghost</option>
                <option value="Prophet">Prophet</option>
                <option value="Horseman">Horseman</option>
                <option value="Other">Other</option>
            </select> 

            <label>Occupation *</label> 
            <input type="text" name="occupation" placeholder="e.g., Hunter, Prophet, Hacker" required>
                       

            <label>Short Description *</label> 
            <textarea name="description" placeholder="Briefly describe the character..." required></textarea>
            

            <label>First Appearance</label> 
            <input type="text" name="firstAppearance" placeholder="e.g., Season 1, Episode 1">
            
            <label>Image *</label> 
            <input type="text" name="imageUrl" placeholder="e.g., /Images/character-name.jpg" required>
 
            <label>Thumbnail *</label> 
            <input type="text" name="thumbImg" placeholder="e.g., /thumbnails/character-name.jpg" required>
 
            <button type="submit">Submit Character</button>

        </form>
        
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 Supernatural Character Gallery. Created as an educational project.</p>
        <p>Supernatural and all related characters are property of their respective owners.</p>
    </footer>

</body>
</html>