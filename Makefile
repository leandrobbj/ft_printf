# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 16:04:42 by lbraga            #+#    #+#              #
#    Updated: 2025/09/27 08:49:11 by lbraga           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a
HEADER	=	ft_printf.h
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror -I.
LIBC	=	ar rcs
RM		=	rm -f

SRC		=	ft_printf.c ft_format.c

OBJ		=	$(SRC:.c=.o)
	
all: $(NAME)
$(NAME): $(OBJ)
	@echo "Linking $(NAME)"
	@$(LIBC) $(NAME) $(OBJ)
	@echo "Complete"

%.o: %.c $(HEADER)
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "Cleaning"
	@$(RM) $(OBJ)

fclean: clean
	@echo "Cleaning Headers"
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re