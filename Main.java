import java.util.HashMap;
import java.util.Map;

public class Main {

    private static final Map<Character, String[]> ASCII_MAP = new HashMap<>();

    static {
        ASCII_MAP.put('C', new String[]{
                " CCC ",
                "C   C",
                "C    ",
                "C   C",
                " CCC "
        });
        ASCII_MAP.put('S', new String[]{
                " SSS ",
                "S    ",
                " SSS ",
                "    S",
                " SSS "
        });
        ASCII_MAP.put('1', new String[]{
                "  1  ",
                " 11  ",
                "  1  ",
                "  1  ",
                "11111"
        });
        ASCII_MAP.put('5', new String[]{
                "55555",
                "5    ",
                "5555 ",
                "    5",
                "5555 "
        });
        ASCII_MAP.put('0', new String[]{
                " 000 ",
                "0   0",
                "0   0",
                "0   0",
                " 000 "
        });
    }

    public static void main(String[] args) {
        String input = "CS1500";

        for (int row = 0; row < 5; row++) { // Assuming 5 rows for each character
            StringBuilder line = new StringBuilder();
            for (char ch : input.toCharArray()) {
                if (ASCII_MAP.containsKey(ch)) {
                    line.append(ASCII_MAP.get(ch)[row]).append("  ");
                } else {
                    line.append("     "); // Space for unsupported characters
                }
            }
            System.out.println(line);
        }
    }
}