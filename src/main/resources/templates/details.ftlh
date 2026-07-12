<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sam Winchester | Supernatural Character Gallery</title>
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
        
        <section class="journal">
            
            <!--I want these to change depending on the character, but not building that in for HW4
            Left symbol will be species, will link to a search for that species
            Right symbol(s) will be specials (anti-posession, men of letters, etc) depending on character association
            <image src = "Images/anti-posession.png" alt = "Anti-possession symbol" class="journal-symbol left-symbol">
            <image src = "Images/men-of-letters.png" alt = "Men of Letters symbol" class="journal-symbol right-symbol">
            -->
            
            <h1>John Winchester's Journal</h1>

            <p class="journal-note">
                <strong>Case File:</strong> # 0${character.id} ${character.name} <br>
                 <br>
            </p>   

            <img src="${character.imageUrl}" alt="${character.name}" class="journal-image">

            <h2>${character.name}</h2>

            <hr>

            <h3>Species:</h3>
            <p>${character.species}</p>

            <h3>Occupation:</h3>
            <p>${character.occupation}</p>
            <!--<p>Hunter, Man of Letters, Former Stanford Law Student</p> -->

            <h3>First Appearance:</h3>
            <p>${character.firstAppearance}</p>

            <h3>Personality:</h3>
            <p>${character.description}</p>

            <!--Feature for later
            <h3> Abilities:</h3>
            <ul>
                <li>Expert hunter and investigator</li>
                <li>Extensive knowledge of lore and mythology</li>
                <li>Highly intelligent researcher</li>
                <li>Skilled with firearms, knives, and hand-to-hand combat</li>
                <li>Experienced in exorcisms and supernatural rituals</li>
            </ul>

            <h3>Backstory:</h3>
            <p>
                After witnessing the tragic death of this mother as an infant, Sam was raised by his father, John Winchester, to hunt monsters.
                Wanting a normal life, Sam initially resisted the hunting lifestyle, pursuing a law degree at Stanford University. 
                The disappearance of his father and subsequent murder of his girlfriend, Jessica, brought him back into hunting alongside his brother Dean.
                Together they travel across the country protecting people from demons, ghosts, monsters, vampires, angels, and countless other supernatural threats.
            </p>

            <h3>Weapons of Choice</h3>
            <ul>
                <li>Demon-killing knife</li>
                <li>Angel Blade</li>
                <li>Shotguns and pistols</li>
                <li>Iron, salt, holy water, and goofer dust</li>
            </ul>

            <h3>Status:</h3>
            <p>Living (won't stay dead)</p>
            -->
           

            <div class="action-buttons">

                <a href="/characters" class="button">Back to Gallery</a>

                <a href="/updateForm/${character.id?c}" class="button">Update Character</a>

                <form action="/delete/${character.id?c}" method="post" class="inline-form">
                    <button type="submit" class="button delete-button">
                        Delete Character
                    </button>
                </form>

            </div>

        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 Supernatural Character Gallery. Created as an educational project.</p>
        <p>Supernatural and all related characters are property of their respective owners.</p>
    </footer>

</body>
</html>