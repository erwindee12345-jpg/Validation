<?php
function hashPassword(string $password): string {
    //FIX: Use a more secure hash like php's built in function password_hash()
    return password_hash($password, PASSWORD_ARGON2ID); // or PASSWORD_BCRYPT
}

function verifyPassword(string $password, string $storedHash): bool {
    return password_verify($password, $storedHash);
}

$password = getenv('APP_PASSWORD'); // or read from a secure vault/prompt
if ($password === false || $password === '') {
    throw new RuntimeException('Password must be provided via environment variable APP_PASSWORD');
}

$stored = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
