# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cart.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

u1 = User.create :email => 'gotham@gmail.com',   :name => 'goutham',:password_digest => '123t'
u2 = User.create :email => 'admin@ga.com',   :name => 'John ',:password_digest => '123a' , :admin => true
u3 = User.create :email => 'my@space.com',   :name => 'king',:password_digest => '123u1'

puts "#{ User.count } users created."

i1 = Item.create({:name=>"Bali, Indonesia", :price => 2.00 , :description => "Bali is a living postcard, an Indonesian paradise that feels like a
    fantasy. Soak up the sun on a stretch of fine white sand, or commune with the tropical creatures as you dive along coral ridges or the
    colorful wreck of a WWII war ship. On shore, the lush jungle shelters stone temples and mischievous monkeys. The “artistic capital” of
    Ubud is the perfect place to see a cultural dance performance, take a batik or silver-smithing workshop, or invigorate your mind and
    body in a yoga class." , :image => "https://i.imgur.com/pwpQnii.jpg" })

i2 = Item.create({:name=>"Rome, Italy", :price => 3, :description => "Rome wasn't built in a day--and you'll need much more than a day to take in
    this timeless city. The city is a real-life collage of piazzas, open-air markets, and astonishing historic sites. Toss a coin into the
    Trevi Fountain, contemplate the Colosseum and the Pantheon, and sample a perfect espresso or gelato before spending an afternoon shopping
    at the Campo de’Fiori or Via Veneto. Enjoy some of the most memorable meals of your life here, too, from fresh pasta to succulent fried
    artichokes or a tender oxtail stew.", :image => "https://i.imgur.com/h7HUdgR.jpg"})

i3 = Item.create({:name=>"Barcelona, Spain", :price => 5.50, :description => "Barcelona feels a bit surreal – appropriate, since Salvador Dali spent
    time here and Spanish Catalan architect Antoni Gaudí designed several of the city’s buildings. Stepping into Gaudí’s Church of the Sacred
    Family is a bit like falling through the looking glass - a journey that you can continue with a visit to Park Güell. Sip sangria at a
    sidewalk café in Las Ramblas while watching flamboyant street performers, then create your own moveable feast by floating from tapas bar
    to tapas bar.", :image => "https://i.imgur.com/Rc08BZv.jpg"})

i4 = Item.create({:name=>"Phuket, Thailand", :price => 10, :description => "Thailand’s largest island is an international magnet for beach lovers and
    serious divers, who enthusiastically submerge themselves in the Andaman Sea. Blue lagoons and salmon sunsets make for a dream-like atmosphere,
    and indeed, a vacation here can feel a bit surreal. Watersports are the most popular activities, though once you’ve had enough sun there’s
    still plenty to explore at the island’s aquariums, gardens, and Buddhist temples.", :image => "https://i.imgur.com/IaRsyzt.jpg"})


i5 = Item.create({:name=>"Prague, Czech Republic", :price => 3.20, :description => "The bohemian allure and fairytale features of Prague make it a perfect
    destination for beach-weary vacationers who want to immerse themselves in culture. You could devote an entire day to exploring Prazsky
    hrad (Prague Castle), then refueling over a hearty dinner at a classic Czech tavern. Spend some time wandering the Old Town Square before
    heading over to gape at The Old Town Hall and Astronomical Clock. Prague’s best bars are found in cellars, where historic pubs set the
    scene for a night of traditional tippling.", :image => "https://i.imgur.com/skeSppM.jpg"})

i6 = Item.create({:name=>"London, United Kingdom", :price => 8.20, :description => "The crown jewels, Buckingham Palace, Camden Market…in London,
    history collides with art, fashion, food, and good British ale. A perfect day is different for everyone: culture aficionados shouldn't
    miss the Tate Modern and the Royal Opera House. If you love fashion, Oxford Street has shopping galore. For foodies, cream tea at
    Harrod’s or crispy fish from a proper chippy offers classic London flavor. Music and book buffs will love seeing Abbey Road and the
    Sherlock Holmes Museum.", :image => "https://i.imgur.com/SApO7Jn.jpg"})


    i7 = Item.create({:name=>"Paris, France", :price => 5.20, :description => "Lingering over pain au chocolat in a sidewalk café, relaxing after a day
    of strolling along the Seine and marveling at icons like the Eiffel Tower and the Arc de Triomphe… the perfect Paris experience combines
    leisure and liveliness with enough time to savor both an exquisite meal and exhibits at the Louvre. Awaken your spirit at Notre Dame,
    bargain hunt at the Marché aux Puces de Montreuil or for goodies at the Marché Biologique Raspail, then cap it all off with a risqué
    show at the Moulin Rouge.", :image => "https://i.imgur.com/LMswM2C.jpg"})

        i8 = Item.create({:name=>"Crete, Greece", :price => 3.20, :description => "The birthplace of both the king of the Olympian gods and of modern European
    civilization, Crete is a Mediterranean jewel. It’s rich with archaeological and mythological history that’s reflected in its ancient
    ruins and cultural attractions. Soak up the charming atmosphere of Chania Town’s Old Venetian Harbor or the fortresses and monasteries
    of Rethymonon. The awesome Minoan ruins of Malia date to 1900 BC, and majestic Mt. Ida is said to be home to the cave where Zeus was
    born.", :image => "https://i.imgur.com/1e5jgcz.jpg"})

            i9 = Item.create({:name=>"Siem Reap, Cambodia", :price => 11.20, :description => "When the morning light washes over the overgrown temples and ruins of
    Angkor Wat, a simple Siem Reap sunrise becomes a profound event. The ancient structures are contained within one of the largest religious
    complexes in the world. The complex and the 12th century Angkor Thom royal city are considered the main reasons to visit Siem Reap. Get a
    lesson in national history at the Cambodian Cultural Village, and a lesson in bargaining at the Angkor Night Market, a bonanza of shopping
    stalls, food vendors, and bars.", :image => "https://i.imgur.com/8L8u2GJ.jpg"})



puts "#{ Item.count } items created."


## associations

puts 'users and items'
u1.items << i1 << i2
