# Phase 3 Mock Code Challenge: Pet Adoption Center

For this assignment, we'll be working with a Pet Adoption Center domain.

We have three models: `Shelter`, `Adopter`, and `Adoption`.

For our purposes, a `Shelter` has many `Adoption`s, an `Adopter` has many
`Adoption`s, and an `Adoption` belongs to a `Shelter` and to an `Adopter`.

`Shelter` - `Adopter` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_ Remember to identify a single source of truth for your data.

## Topics

- Classes and Instances
- Class and Instance Methods
- Variable Scope
- Object Relationships
- Arrays and Array Methods

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work.

## What You Already Have

The starter code has migrations and models for the initial `Shelter` and `Adopter` models, and seed data for some `Shelter`s and `Adopter`s. The schema currently looks like this:

#### `shelters` Table

| Column       | Type    |
| ------------ | ------- |
| name         | String  |
| founded_year | Integer |

#### `adopters` Table

| Column | Type   |
| ------ | ------ |
| name   | String |

You will need to create the migration for the `adoptions` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class methods.

Remember: ActiveRecord give your classes access to a lot of methods already! Keep in mind what methods ActiveRecord gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `adoptions` table.

- An `Adoption` belongs to a `Shelter`, and an `Adoption` also belongs to an `Adopter`. In your migration, create any columns your `adoptions` table will need to establish these relationships.
- The `adoptions` table should also have:
  - A `pet_name` column that stores a string.
  - An `adoption_fee` column that stores an integer.

After creating your migration, use `rake db:migrate` to apply the migration.

### Object Relationship Methods

Use ActiveRecord association macros and ActiveRecord query methods where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### `Adoption`

- `Adoption#shelter`
  - should return the `Shelter` instance for this adoption
- `Adoption#adopter`
  - should return the `Adopter` instance for this adoption

#### `Shelter`

- `Shelter#adoptions`
  - returns a collection of all the adoptions for the shelter
- `Shelter#adopters`
  - returns a collection of all the adopters who have made adoptions at the shelter

#### `Adopter`

- `Adopter#adoptions`
  - should return a collection of all the adoptions that the adopter has made
- `Adopter#shelters`
  - should return a collection of all the shelters from which the adopter has adopted pets

### Aggregate and Association Methods

#### `Adoption`

- `Adoption#print_details`
  - should return a string formatted as follows:
    `{adopter name} adopted {pet name} from {shelter name}`

#### `Shelter`

- `Shelter#process_adoption(adopter, pet_name, adoption_fee)`
  - takes an `adopter` (an instance of the `Adopter` class), a `pet_name` (string), and an `adoption_fee` (integer) as arguments, and creates a new `adoption` associated with this shelter and the adopter
- `Shelter.oldest_shelter`
  - returns the `Shelter` instance with the earliest founded year

#### `Adopter`

- `Adopter#adopted_pet?(pet_name)`
  - takes a `pet_name` (string) and returns `true` if the adopter has adopted a pet with that name, `false` otherwise
- `Adopter#transfer_adoption(adopter, adoption)`
  - takes another `adopter` (an instance of the `Adopter` class) and an `adoption` (an instance of the `Adoption` class) as arguments
  - transfers the adoption from the current adopter to the new adopter
  - NOTE: this should update the existing adoption; it should NOT create a new adoption
