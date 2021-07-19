public class Test {
   public static void main(String... args) throws Exception {
      double a = 0;
      while(true) {
         Thread.sleep(1000);
         a += 1.0;
         a /= 2.0;
         System.out.println(a);
      }
   }
}
