import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class Book {
  String id;
  String title;
  String imagePath;
  String author;
  String description;

  Book({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.author,
    required this.description,
  });
}

class BookService {
  static List<Book> _books = [
    Book(
      id: '1',
      title: 'Bulan',
      imagePath: 'assets/images/bulan.jpg',
      author: 'Tere Liye',
      description: 'Novel fantasi tentang petualangan di dunia paralel',
    ),
    Book(
      id: '2',
      title: 'Bumi',
      imagePath: 'assets/images/bumi.jpg',
      author: 'Tere Liye',
      description: 'Novel tentang klan bulan dan klan matahari',
    ),
    Book(
      id: '3',
      title: 'Dunia Sophie',
      imagePath: 'assets/images/duniasophie.jpg',
      author: 'Jostein Gaarder',
      description: 'Novel tentang sejarah filsafat',
    ),
    Book(
      id: '4',
      title: 'Harry Potter',
      imagePath: 'assets/images/harrypotter.jpg',
      author: 'J.K. Rowling',
      description: 'Novel fantasi tentang dunia sihir',
    ),
    Book(
      id: '5',
      title: 'Komet',
      imagePath: 'assets/images/komet.jpg',
      author: 'Tere Liye',
      description: 'Lanjutan dari series Bumi dan Bulan',
    ),
    Book(
      id: '6',
      title: 'Komet Minor',
      imagePath: 'assets/images/kometminor.jpg',
      author: 'Tere Liye',
      description: 'Spin-off dari series Komet',
    ),
    Book(
      id: '7',
      title: 'Matahari',
      imagePath: 'assets/images/matahari.jpg',
      author: 'Tere Liye',
      description: 'Kelanjutan petualangan di dunia paralel',
    ),
    Book(
      id: '8',
      title: 'Moon Castle',
      imagePath: 'assets/images/mooncastle.jpg',
      author: 'Enid Blyton',
      description: 'Petualangan anak-anak di kastil misterius',
    ),
  ];

  static List<Book> getAllBooks() => _books;

  static Book? getBookById(String id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }

  static void addBook(Book book) {
    _books.add(book);
  }

  static void updateBook(Book updatedBook) {
    final index = _books.indexWhere((book) => book.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
    }
  }

  static void deleteBook(String id) {
    _books.removeWhere((book) => book.id == id);
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GalleryPage()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF437057),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Library ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF5F5F5),
                ),
              ),
              TextSpan(
                text: ' Bocah Prik.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF437057),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Library',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF5F5F5),
                ),
              ),
              TextSpan(
                text: '  Bocah Prik.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryPage extends StatefulWidget {
  GalleryPage({super.key});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  void _loadBooks() {
    setState(() {
      books = BookService.getAllBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF437057),
        scaffoldBackgroundColor: Color(0xFF437057),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF437057),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoadingScreen()),
              );
            },
          ),
          title: Text('Library  Bocah Prik.'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEditBookPage()),
                ).then((_) => _loadBooks());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.8,
              children:
                  books.map((book) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(book: book),
                          ),
                        ).then((_) => _loadBooks());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF97B067),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF97B067).withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  book.imagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.book,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                book.title,
                                style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF437057),
      appBar: AppBar(
        backgroundColor: Color(0xFF437057),
        title: Text('Detail Buku'),
        titleTextStyle: TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditBookPage(book: book),
                ),
              ).then((_) => Navigator.pop(context));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF97B067).withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    book.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.book,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              book.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF5F5F5),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Penulis: ${book.author}',
              style: TextStyle(fontSize: 16, color: Color(0xFFB0B0B0)),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF5F5F5),
              ),
            ),
            SizedBox(height: 8),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFF5F5F5),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Buku'),
          content: Text(
            'Apakah Anda yakin ingin menghapus buku "${book.title}"?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                BookService.deleteBook(book.id);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}

class AddEditBookPage extends StatefulWidget {
  final Book? book;

  const AddEditBookPage({super.key, this.book});

  @override
  _AddEditBookPageState createState() => _AddEditBookPageState();
}

class _AddEditBookPageState extends State<AddEditBookPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _descriptionController;
  late TextEditingController _imagePathController;
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _authorController = TextEditingController(text: widget.book?.author ?? '');
    _descriptionController = TextEditingController(
      text: widget.book?.description ?? '',
    );
    _imagePathController = TextEditingController(
      text: widget.book?.imagePath ?? '',
    );
    _selectedImagePath = widget.book?.imagePath;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF437057),
      appBar: AppBar(
        backgroundColor: Color(0xFF437057),
        title: Text(widget.book == null ? 'Tambah Buku' : 'Edit Buku'),
        titleTextStyle: TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image Preview Section
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white70, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF97B067).withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        _selectedImagePath != null
                            ? Image.asset(
                              _selectedImagePath!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_photo_alternate,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Tap untuk\nubah foto',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                            : Container(
                              color: Colors.grey[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate,
                                    size: 50,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Tap untuk\ntambah foto',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _titleController,
                label: 'Judul Buku',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _authorController,
                label: 'Penulis',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Penulis tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _imagePathController,
                label: 'Path Gambar (Manual)',
                onChanged: (value) {
                  setState(() {
                    _selectedImagePath = value;
                  });
                },
                validator: (value) {
                  if (_selectedImagePath == null ||
                      _selectedImagePath!.isEmpty) {
                    return 'Path gambar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _descriptionController,
                label: 'Deskripsi',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveBook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF97B067),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  widget.book == null ? 'Tambah Buku' : 'Update Buku',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Sumber Gambar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Pilih dari Asset'),
                onTap: () {
                  Navigator.pop(context);
                  _showAssetPicker();
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Input Manual Path'),
                onTap: () {
                  Navigator.pop(context);
                  _showManualInputDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAssetPicker() {
    final List<String> predefinedImages = [
      'assets/images/bulan.jpg',
      'assets/images/bumi.jpg',
      'assets/images/duniasophie.jpg',
      'assets/images/harrypotter.jpg',
      'assets/images/komet.jpg',
      'assets/images/kometminor.jpg',
      'assets/images/matahari.jpg',
      'assets/images/mooncastle.jpg',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Gambar'),
          content: Container(
            width: double.maxFinite,
            height: 400,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: predefinedImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImagePath = predefinedImages[index];
                      _imagePathController.text = predefinedImages[index];
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            _selectedImagePath == predefinedImages[index]
                                ? Colors.blue
                                : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        predefinedImages[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showManualInputDialog() {
    TextEditingController tempController = TextEditingController(
      text: _selectedImagePath ?? '',
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Path Gambar'),
          content: TextField(
            controller: tempController,
            decoration: InputDecoration(
              labelText: 'Path Gambar',
              hintText: 'assets/images/contoh.jpg',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedImagePath = tempController.text;
                  _imagePathController.text = tempController.text;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _saveBook() {
    if (_formKey.currentState!.validate()) {
      String finalImagePath = _selectedImagePath ?? _imagePathController.text;

      if (widget.book == null) {
        // Tambah buku baru
        final newBook = Book(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _titleController.text,
          author: _authorController.text,
          description: _descriptionController.text,
          imagePath: finalImagePath,
        );
        BookService.addBook(newBook);
      } else {
        // Update buku yang sudah ada
        final updatedBook = Book(
          id: widget.book!.id,
          title: _titleController.text,
          author: _authorController.text,
          description: _descriptionController.text,
          imagePath: finalImagePath,
        );
        BookService.updateBook(updatedBook);
      }

      Navigator.pop(context);
    }
  }
}
