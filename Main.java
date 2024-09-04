import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Library library = new Library();

        library.addBook(new Book("The Great Gatsby", "F. Scott Fitzgerald", "1234567890"));
        library.addBook(new Book("1984", "George Orwell", "0987654321"));
        library.addBook(new Book("To Kill a Mockingbird", "Harper Lee", "1122334455"));

        library.addMember(new Member("Alice", "M001"));
        library.addMember(new Member("Bob", "M002"));

        library.displayAvailableBooks();

        Member member = library.findMemberById("M001");
        Book book = library.findBookByIsbn("1234567890");
        if (member != null && book != null) {
            member.borrowBook(book);
        }

        library.displayAvailableBooks();

        if (member != null && book != null) {
            member.returnBook(book);
        }

        library.displayAvailableBooks();

        library.displayMembers();
    }
}
