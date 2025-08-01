import itertools
import string
import time

def brute_force_crack(target, charset, max_length):
    start_time = time.time()
    attempts = 0
    found = False

    print("Searching for password...\n")

    for length in range(1, max_length + 1):
        for combo in itertools.product(charset, repeat=length):
            attempts += 1
            guess = ''.join(combo)

            if attempts % 100000 == 0:
                print(f"Tried {attempts} guesses so far...")

            if guess == target:
                duration = time.time() - start_time
                print(f"\nPassword found: {guess}")
                print(f"Attempts: {attempts}")
                print(f"Time taken: {duration:.2f} seconds")
                found = True
                break
        if found:
            break
    if not found:
        print("Password not found.")

target_password = input("🔐 Please enter the password to test: ").strip()

print("\nChoose character set:")
print("1 - Lowercase letters only (a-z)")
print("2 - Letters + digits (a-z, A-Z, 0-9)")
print("3 - All printable characters")

choice = input("Choice [1/2/3]: ").strip()

if choice == "1":
    characters = string.ascii_lowercase
elif choice == "2":
    characters = string.ascii_letters + string.digits
elif choice == "3":
    characters = string.printable.strip()
else:
    print("Invalid choice. Using default (letters + digits).")
    characters = string.ascii_letters + string.digits

max_len = len(target_password)

brute_force_crack(target_password, characters, max_len)

time.sleep(5)
