# ft_printf &nbsp;![language](https://img.shields.io/badge/language-444444?logo=c&labelColor=555555) ![makefile](https://img.shields.io/badge/make-444444?logo=monster&logoColor=goldenrod&labelColor=555555) ![42](https://img.shields.io/badge/school-444444?logo=42&logoColor=black&labelColor=777777&link=https%3A%2F%2Fwww.42lisboa.com%2Fpt%2F)

*This project has been created as part of the 42 curriculum by lbraga.*

**Ft_printf** is a custom implementation of the standard C `printf` family, delivered as the static library `libftprintf.a`. The goal of the project is to parse a format string, handle a limited set of conversion specifiers, and print the corresponding values using variadic arguments.

1. [Supported Conversions](#Supported-Conversions)
2. [Algorithm](#Algorithm)
3. [Data Structure](#Data-Structure)
4. [Instructions](#Instructions)
5. [Resources](#Resources)
6. [AI Disclosure](#AI-Disclosure)
7. [Final Notes](#Final-Notes)

## Supported Conversions

| Format | Description |
| :---: | :--- |
| `%c` | Prints a character. |
| `%s` | Prints a string. |
| `%p` | Prints a pointer in hexadecimal. |
| `%d` | Prints a signed decimal number. |
| `%i` | Prints a signed decimal number. |
| `%u` | Prints an unsigned decimal number. |
| `%x` | Prints a number in lowercase hexadecimal. |
| `%X` | Prints a number in uppercase hexadecimal. |
| `%%` | Prints a percent sign. |

## Algorithm

The function `ft_printf()` receives a format string and a variable number of arguments. It initializes a `va_list` with `va_start()`, walks through the string, and whenever it finds a `%`, it forwards the specifier to an internal dispatcher named `ft_sort()`.

The dispatcher uses `va_arg()` to retrieve the next argument with the expected type and sends it to the correct formatter. Ordinary characters are written directly with `write()`, which keeps the implementation simple and close to the behavior required by the project.

Numeric conversions are handled recursively. The function prints the quotient first and then the remainder, which avoids temporary buffers and keeps the implementation lightweight. Pointer values are treated as hexadecimal addresses, and `NULL` pointers are rendered as `(nil)` or `(null)` depending on the specifier.

### Helper Functions

The code is organized around a small set of formatting functions:

* `f_chr()` prints a single character.
* `f_str()` prints a string or `null` when the pointer is `NULL`.
* `f_ptr()` prints pointers in hexadecimal form, or `nil` when the pointer is `NULL`.
* `f_int()` prints signed decimal values.
* `f_uint()` prints unsigned decimal and hexadecimal values.

*Each helper returns the number of characters written.*

### Data Structure

To comply with the project’s focus on variadic functions and memory efficiency, the primary data structure used is the `va_list`.

This structure is essential for accessing a variable number of arguments of different types. By using `va_list` alongside recursion avoids complex dynamic memory allocations, resulting in a lightweight library that respects the constraints of the C standard library's printf.

## Instructions

To build the library, you need `cc` and `make` installed.

1. Clone the repository:
	```bash
	git clone https://github.com/leandrobbj/ft_printf.git && cd ft_printf
	```

2. Build the library:
	```bash
	make
	```

3. Include the header in your C file:
	```c
	#include "ft_printf.h"
	```

4. Compile your program with the library:
	```bash
	cc -Wall -Wextra -Werror your_main.c libftprintf.a -o program_name
	```

5. Run it:
	```bash
	./program_name
	```

<p align="right"> <i>*your_main and program_name are only reference names for your own files</i>

## Make Targets

* `make` builds `libftprintf.a`.
* `make clean` removes object files.
* `make fclean` removes object files and `libftprintf.a`.
* `make re` runs `fclean` followed by `make`.

## Resources

* [Variadic Functions in C - GeeksforGeeks](https://www.geeksforgeeks.org/variadic-functions-in-c) - A practical introduction to variadic arguments.
* [printf(3) - Linux manual page](https://man7.org/linux/man-pages/man3/printf.3.html) - Reference for standard `printf` behavior.
* [stdarg(3) - Linux manual page](https://man7.org/linux/man-pages/man3/stdarg.3.html) - Reference for `va_start`, `va_arg`, and `va_end`.
* [Norminette Documentation](https://github.com/42School/norminette) - Useful for checking 42 coding style rules.

##  AI Disclosure

In compliance with the 42 curriculum requirements, I used AI tools, including the **CS50.ai Duck**, during the development of this project to support my learning. These tools were used to research variadic functions, assisted in analyzing the logic for recursive numeric base conversions and identifying edge cases for %s and %p specifiers

The AI also helped with test development to identify potential logic bugs and edge cases during the implementation of complex functions, and supported the organization and formatting of project configuration files.

## Final Notes

Developing ft_printf was a lesson in precision and patience but allow me to undestand how data is formatted and processed in C with the use of variadic functions. 

A significant challenging part was implementing a `f_uint` for numeric base conversions, which reinforced the importance of writing memory-efficient code. More than just a library, this project represents the resilience and adaptability needed to tackle the increasingly complex challenges of the 42 curriculum.
