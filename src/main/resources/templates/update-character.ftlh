<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update a Character | Supernatural Character Gallery</title>
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
        <h1>Update Character</h1>

        <h3>
            Edit information for <em>${character.name}</em>.
        </h3>

        <form class="character-form" action="/update/${character.id?c}" method="post">
            <label>Character Name *</label> 
            <input type="text" name="name" value="${character.name}" required> 
            
            <label>Species *</label> 
            <select name="species" required>
                <option value="Human">
                    <#if character.species == "Human">selected</#if>>Human</option>
                <option value="Angel"><#if character.species == "Angel">selected</#if>>Angel</option>
                <option value="Demon"><#if character.species == "Demon">selected</#if>>Demon</option>
                <option value="Monster"><#if character.species == "Monster">selected</#if>>Monster</option>
                <option value="Ghost"><#if character.species == "Ghost">selected</#if>>Ghost</option>
                <option value="Prophet"><#if character.species == "Prophet">selected</#if>>Prophet</option>
                <option value="Horseman"><#if character.species == "Horseman">selected</#if>>Horseman</option>
                <option value="Other"><#if character.species == "Other">selected</#if>>Other</option>
            </select> 

            <label>Occupation *</label> 
            <input type="text" name="occupation" value="${character.occupation}" required>
                       

            <label>Short Description *</label> 
            <textarea name="description" value=""${character.description} required></textarea>
            

            <label>First Appearance</label> 
            <input type="text" name="firstAppearance" value="${character.firstAppearance!''}">
            
            <label>Image *</label> 
            <input type="text" name="imageUrl" value="${character.imageUrl}" required>
 
            <label>Thumbnail *</label> 
            <input type="text" name="thumbImg" value="${character.thumbImg}" required>
 
            <div class="action-buttons">
                <button type="submit">Update Character</button>

                <a href="/characters/${character.id?c}"class="button cancel-button">Cancel Update</a>
            </div>

        </form>
        
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 Supernatural Character Gallery. Created as an educational project.</p>
        <p>Supernatural and all related characters are property of their respective owners.</p>
    </footer>

</body>
</html>