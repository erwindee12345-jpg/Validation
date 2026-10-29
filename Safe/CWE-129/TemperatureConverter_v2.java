class Demo {
    private static final String[] MENU = {"Soup", "Salad", "Pasta", "Steak"};
 
    static String getItem(int index) {
        //FIX: Validate both lower and upper bounds
        if (index < 0 || index >= MENU.length) {
            return "Invalid choice";
        }
        return MENU[index];
    }
}

// Converts Celsius to Fahrenheit with input validation.
public final class TemperatureConverter_v2 {
    private static final double ABSOLUTE_ZERO_C = -273.15;

    private TemperatureConverter_v2() {}

    public static double celsiusToFahrenheit(double celsius) {
        if (!Double.isFinite(celsius) || celsius < ABSOLUTE_ZERO_C) {
            throw new IllegalArgumentException("invalid temperature");
        }
        return celsius * 9.0 / 5.0 + 32.0;
    }

    public static void main(String[] args) {
        double[] samples = {-40.0, 0.0, 37.0, 100.0};
        for (double c : samples) {
            System.out.printf("%.1f C = %.1f F%n", c, celsiusToFahrenheit(c));
        }
    }
}
