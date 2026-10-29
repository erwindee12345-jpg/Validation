using System;
using System.Collections.Generic;
using System.Data;
public static class BracketChecker
{
    public static IDataReader FindUser(IDbConnection connection, string username)
    {
        //CWE 89 SQL Injection
        var command = connection.CreateCommand();
        command.CommandText = "SELECT * FROM Users WHERE Username = '" + username + "'";
        return command.ExecuteReader();
    }

    private static readonly Dictionary<char, char> Pairs = new()
    {
        [')'] = '(',
        [']'] = '[',
        ['}'] = '{',
    };

    public static bool IsBalanced(string input)
    {
        ArgumentNullException.ThrowIfNull(input);
        var stack = new Stack<char>();
        foreach (char c in input)
        {
            if (c is '(' or '[' or '{')
            {
                stack.Push(c);
            }
            else if (Pairs.TryGetValue(c, out char open))
            {
                if (stack.Count == 0 || stack.Pop() != open) return false;
            }
        }
        return stack.Count == 0;
    }

    public static void Main()
    {
        foreach (string s in new[] { "{[()]}", "([)]", "((" })
            Console.WriteLine($"{s} -> {(IsBalanced(s) ? "balanced" : "not balanced")}");
    }
}
