# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create some users
roger = User.create(username: 'roger', first_name: 'Roger', last_name: 'Chen')
raymond = User.create(username: 'raymond', first_name: 'Raymond', last_name: 'Zhong')
james = User.create(username: 'james', first_name: 'James', last_name: 'Chang')

# Create a sample group
doublesprout = ReadingGroup.create(name: 'Doublesprout', description: 'A place for people to come together and have intellectual discussions.')

# Add the users to the group
doublesprout.users << [roger, raymond, james]

# Add some books into the system
bos = Book.create(title: 'Blue Ocean Strategy', author: 'W. Chan Kim, Renée Mauborgne', isbn: '9781591396192')
ctc = Book.create(title: 'Crossing the Chasm', author: 'Geoffrey Moore', isbn: '9780060517120')
tls = Book.create(title: 'The Lean Startup', author: 'Eric Ries', isbn: '9780307887894')

# Create a recommendation for BOS
roger_bos_rec = Recommendation.create(book: bos, user: roger, reading_group: doublesprout, recommended: true, review: 'Altogether a pretty interesting book though it can get dry towards the end. I particularly enjoyed the case studies that they had.')

# Create another recommendation for BOS
raymond_bos_rec = Recommendation.create(book: bos, user: raymond, reading_group: doublesprout, recommended: false, review: 'I enjoy being a contrarian hipster.')

# Now try creating a discussion for BOS
raymond_bos_dis = Discussion.create(book: bos, user: raymond, reading_group: doublesprout, body: 'The authors make a very big deal out of finding where the blue waters are, as opposed to the red waters where everyone is competing. Where do you think a blue water might exist in the world today?')

# Now a child comment for BOS
roger_bos_com = Discussion.create(book: bos, user: roger, reading_group: doublesprout, body: 'Well this reading group software might be a good start!')
raymond_bos_dis.discussions << roger_bos_com

# This group is only for James
singlebamboo = ReadingGroup.create(name: 'Single Bamboo', description: 'A place for only James to intellectually discuss things with himself.')
singlebamboo.users << james