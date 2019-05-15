@isTest
public class Test1{
    @isTest public static void someTest1(){
        Test.startTest();
        TestClass111 obj = new TestClass111();
        Test.stopTest();
    }
    @isTest public static void someTest2(){
        Test.startTest();
        TestClass111.getAccounts();
        Test.stopTest();
    }
    @isTest public static void someTest3(){
        Test.startTest();
        TestClass999 obj = new TestClass999();
        Test.stopTest();
    }
    @isTest public static void someTest4(){
        Test.startTest()
        TestClass999.getAccounts();
        Test.stopTest();
    }


}
