DIR=src

SRC_UTILS_PRE += $(wildcard $(DIR)/os/*.c)
SRC_UTILS     += $(wildcard $(DIR)/*.c)
OBJ_UTILS     += $(SRC_UTILS:.c=.o)
OBJ_UTILS_PRE += $(SRC_UTILS_PRE:.c=.o)
LDFLAGS_UTILS = 
INCLUDE       = -I./include -I./src
CFLAGS        = -fPIC

build-src: src-pre
	echo $(SRC_UTILS_PRE)
	echo $(SRC_UTILS)

$(DIR)-pre: $(OBJ_UTILS_PRE) $(OBJ_UTILS)

$(DIR)/os/%.o: $(DIR)/os/%.c
	$(CC)  $(CFLAGS) $(INCLUDE) -c $< -o $(BUILD_DIR)$@

$(DIR)/%.o:  $(DIR)/%.c
	echo "B"
	$(CC) $(CFLAGS) $(INCLUDE)  -c $< -o $(BUILD_DIR)$@ $(LDFLAGS_UTILS) 