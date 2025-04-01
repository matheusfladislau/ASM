ASM = nasm
ASMFLAGS = -f elf64
LD = ld
LDFLAGS = 
OUTPUT = $(PROGRAM_NAME)

all: $(OUTPUT)

$(OUTPUT): $(OUTPUT).o
	$(LD) $(OUTPUT).o -o $(OUTPUT)

$(OUTPUT).o: $(OUTPUT).asm
	$(ASM) $(ASMFLAGS) -o $(OUTPUT).o $(OUTPUT).asm

clean:
	rm -f $(OUTPUT).o $(OUTPUT)

help:
	@echo "Usage: make PROGRAM_NAME=your_program_name"
