namespace Pl.Edu.Mimuw
{
    public class Program
    {
        public static int Tribonacci(int n)
        {
            if (n == 0 || n == 1)
                return 0;

            if (n == 2)
                return 1;

            return Tribonacci(n - 1) + Tribonacci(n - 2) + Tribonacci(n - 3);
        }
    }
}