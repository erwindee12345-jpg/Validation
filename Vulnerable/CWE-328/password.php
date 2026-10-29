<?php
function hashPassword(string $password): string {
    //CWE 328 Use of Weak Hash
    return md5($password);
}

function verifyPassword(string $password, string $storedHash): bool {
    return hashPassword($password) === $storedHash;
}

$stored = hashPassword("password123");
echo $stored . "\n";
var_dump(verifyPassword("password123", $stored));
