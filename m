From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 21 Nov 2018 10:13:55 -0800 (PST)
Subject: [GIT PULL] RISC-V Patches for 4.20-rc4
Message-ID: <mhng-a497ffb9-2b54-47e0-8764-51bd22e470a6@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:

  Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc4

for you to fetch changes up to 5d8f81ba1da55210123b9595e87b913c79579d02:

  RISC-V: recognize S/U mode bits in print_isa (2018-11-20 05:19:28 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.20-rc4

This week is a bit bigger than I expected.  That's my fault, as I missed
a few patches while I was at Plumbers last week.  We have:

* A fix to a quite embarassing issue where raw_copy_to_user() was
  implemented with asm_copy_from_user() (and vice versa).
* Improvements to our makefile to allow flat binaries to be generated.
* A build fix that predeclares "struct module" at the top of
  <asm/module.h>, which triggers warnings later in that header.
* The addition of our own <uapi/asm/unistd> header, which is necessary
  to align our stat ABI on 32-bit systems.
* A fix to avoid printing a warning when the S or U bits are set in
  print_isa().

I already have one patch in the queue for next week.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Build flat and compressed kernel images

David Abdurachmanov (2):
      riscv: fix warning in arch/riscv/include/asm/module.h
      riscv: add asm/unistd.h UAPI header

Olof Johansson (1):
      RISC-V: Fix raw_copy_{to,from}_user()

Patrick St??hlin (1):
      RISC-V: recognize S/U mode bits in print_isa

 arch/riscv/Makefile                                | 15 +++++-
 arch/riscv/boot/.gitignore                         |  2 +
 arch/riscv/boot/Makefile                           | 33 ++++++++++++
 arch/riscv/boot/install.sh                         | 60 ++++++++++++++++++++++
 arch/riscv/include/asm/module.h                    |  1 +
 arch/riscv/include/asm/uaccess.h                   |  4 +-
 arch/riscv/include/asm/unistd.h                    |  5 +-
 .../include/uapi/asm/{syscalls.h => unistd.h}      | 26 +++++++---
 arch/riscv/kernel/cpu.c                            |  9 ++--
 arch/riscv/kernel/head.S                           | 10 ++++
 arch/riscv/kernel/vmlinux.lds.S                    |  2 +-
 11 files changed, 150 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/boot/.gitignore
 create mode 100644 arch/riscv/boot/Makefile
 create mode 100644 arch/riscv/boot/install.sh
 rename arch/riscv/include/uapi/asm/{syscalls.h => unistd.h} (53%)
