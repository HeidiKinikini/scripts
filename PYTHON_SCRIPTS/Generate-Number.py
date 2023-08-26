import random

# Generate a random number between 1 and 10
random_number = random.randint(1, 10)

# Initialize the number of attempts
attempts = 0

while True:
    # Ask the user to guess the number
    guess = int(input("Guess the number between 1 and 10: "))
    attempts += 1

    # Check if the guess is correct
    if guess == random_number:
        print(f"Congratulations! You guessed the number {random_number} correctly in {attempts} attempts.")
        break
    elif guess < random_number:
        print("Try a higher number.")
    else:
        print("Try a lower number.")
