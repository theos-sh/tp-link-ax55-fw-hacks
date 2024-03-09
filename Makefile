CC = clang
CFLAGS = -Oz -flto=thin -Wall -Wextra -pedantic
LDFLAGS = -lcrypto -Oz -flto=thin

TARGET = bin/md5-fix
SRCS = src/md5-fix.c

all: firmware.zip $(TARGET)

$(TARGET): $(SRCS)
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET) $(LDFLAGS)

clean:
	rm -f $(TARGET)

firmware.zip:
	curl -L -o firmware.zip "https://static.tp-link.com/upload/firmware/2023/202312/20231201/Archer%20AX55(US)_V1_231130.zip"

