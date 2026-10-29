using System;
using System.Collections.Generic;
using System.Data;
public static class BracketChecker
{
    public static IDataReader FindUser(IDbConnection connection, string username)
    {
        ArgumentNullException.ThrowIfNull(connection);
        ArgumentNullException.ThrowIfNull(username);
        //FIX: Use parametized query
        var command = connection.CreateCommand();
        command.CommandText = "SELECT * FROM Users WHERE Username = @username";
 
        var parameter = command.CreateParameter();
        parameter.ParameterName = "@username";
        parameter.Value = username;
        command.Parameters.Add(parameter);
 
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
