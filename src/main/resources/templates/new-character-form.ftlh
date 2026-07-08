<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Character | Supernatural Character Gallery</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=UnifrakturCook:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <!-- Navigation Bar -->

    <nav>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="details.html">Details</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="new-character-form.html">Add a Character</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
     <main>
        <h1>Add a New Character</h1>

        <h3>
            Share your favorite <em>Supernatural</em> character.
        </h3>

        <form>
            <label>Character Name *</label> 
            <input type="text" placeholder="e.g., John Winchester" required> 
            
            <label>Species *</label> 
            <select>
                <option> ~~ Select a Species ~~</option>
                <option>Human</option>
                <option>Angel</option>
                <option>Demon</option>
                <option>Monster</option>
                <option>Ghost</option>
                <option>Prophet</option>
                <option>Horseman</option>
                <option>Other</option>
            </select> 

            <label>Occupation *</label> 
            <input type="text" placeholder="e.g., Hunter, Prophet, Hacker" required>
            

            <label>Image URL *</label> 
            <input type="url" placeholder="e.g., https://example.com/image.jpg" required>
            

            <label>Short Description *</label> 
            <textarea placeholder="Briefly describe the character..." required></textarea>
            

            <label>Abilities</label> 
            <textarea placeholder="List the character's abilities..."></textarea>
            

            <label>First Appearance</label> 
            <input type="text" placeholder="e.g., Season 1, Episode 1">
            

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