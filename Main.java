import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Library library = new Library();

        // Adding some books to the library
        library.addBook(new Book("The Great Gatsby", "F. Scott Fitzgerald", "1234567890"));
        library.addBook(new Book("1984", "George Orwell", "0987654321"));
        library.addBook(new Book("To Kill a Mockingbird", "Harper Lee", "1122334455"));

        // Adding some members to the library
        library.addMember(new Member("Alice", "M001"));
        library.addMember(new Member("Bob", "M002"));

        // Displaying available books
        library.displayAvailableBooks();

        // Borrowing a book
        Member member = library.findMemberById("M001");
        Book book = library.findBookByIsbn("1234567890");
        if (member != null && book != null) {
            member.borrowBook(book);
        }

        // Displaying available books after borrowing
        library.displayAvailableBooks();

        // Returning a book
        if (member != null && book != null) {
            member.returnBook(book);
        }

        // Displaying available books after returning
        library.displayAvailableBooks();

        // Displaying members
        library.displayMembers();
    }
}
