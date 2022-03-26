package fr.evaluator;

import java.io.FileReader;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws Exception {
        SimpleEvaluator lexer;
        if (args.length > 0)
            lexer = new SimpleEvaluator(new FileReader(args[0]));
        else
            lexer = new SimpleEvaluator(new InputStreamReader(System.in));
        @SuppressWarnings("deprecation")
        Evaluator p = new Evaluator(lexer);
        p.parse();
    }
}
