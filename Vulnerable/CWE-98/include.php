<?php
declare(strict_types=1);

// Simple page router: index.php?page=about loads about.php
ini_set('display_errors', '0');
header('Content-Type: text/html; charset=utf-8');
header('X-Content-Type-Options: nosniff');
header("Content-Security-Policy: default-src 'self'");

const SITE_TITLE = 'My Simple Site';
const ALLOWED_THEMES = ['light', 'dark'];

function e(string $text): string
{
    return htmlspecialchars($text, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

$theme = $_GET['theme'] ?? 'light';
if (!is_string($theme) || !in_array($theme, ALLOWED_THEMES, true)) {
    $theme = 'light';
}

$page = is_string($_GET['page'] ?? null) ? $_GET['page'] : 'home';
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
        <!-- CWE 98 Improper Control of Filename for Include/Require Statement in PHP Program-->
        <?php include $page . '.php'; ?>
    </main>
</body>
</html>