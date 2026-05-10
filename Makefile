# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbraga <lbraga@student.42lisboa.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 16:04:42 by lbraga            #+#    #+#              #
#    Updated: 2026/05/09 20:16:57 by lbraga           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a
HEADER	=	ft_printf.h
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror -I.
LIBC	=	ar rcs
RM		=	rm -rf
OBJ		=	$(SRC:%.c=obj/%.o)
SRC		=	ft_printf.c ft_pformat.c
RED			= \033[1;31m
GREEN		= \033[1;32m
CYAN		= \033[0;36m
RESET		= \033[0m

all: $(NAME)
$(NAME): $(OBJ)
	@$(LIBC) $(NAME) $(OBJ)
	@echo "$(GREEN)[$(NAME) created]"

obj/%.o: %.c $(HEADER)
	@mkdir -p obj
	@echo "$(CYAN)$<"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) obj
	@echo "$(RED)X library removed"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(RED)X $(NAME) removed"

re: fclean all

.PHONY: all clean fclean re