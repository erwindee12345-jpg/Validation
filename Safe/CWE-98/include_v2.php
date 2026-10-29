<?php
declare(strict_types=1);

// Simple page router: index.php?page=about loads pages/about.php
ini_set('display_errors', '0');
header('Content-Type: text/html; charset=utf-8');
header('X-Content-Type-Options: nosniff');
header("Content-Security-Policy: default-src 'self'");

const SITE_TITLE = 'My Simple Site';
const ALLOWED_THEMES = ['light', 'dark'];
//FIX: Validate and Sanitize file inputs and restrict paths
const PAGES = [
    'home'  => __DIR__ . '/pages/home.php',
    'about' => __DIR__ . '/pages/about.php',
];

function e(string $text): string
{
    return htmlspecialchars($text, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

$theme = $_GET['theme'] ?? 'light';
if (!is_string($theme) || !in_array($theme, ALLOWED_THEMES, true)) {
    $theme = 'light';
}

$requested = is_string($_GET['page'] ?? null) ? $_GET['page'] : 'home';
if (!array_key_exists($requested, PAGES)) {
    http_response_code(404);
    exit('Page not found');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"><title><?= e(SITE_TITLE) ?></title>
</head>
<body class="<?= e($theme) ?>">
    <h1><?= e(SITE_TITLE) ?></h1>
    <nav><a href="?page=home">Home</a> | <a href="?page=about">About</a></nav>
    <main>
        <?php include PAGES[$requested]; ?>
    </main>
</body>
</html>