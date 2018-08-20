From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 11:53:43 -0700 (PDT)
Subject: [PULL RFC] RISC-V Updates for the 4.19 Merge Window, Part 2
Message-ID: <mhng-61ca6b4b-56bd-46de-bc46-2841a25bedc5@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

For the RISC-V people: I know there's more patches on linux-riscv, but I
haven't gotten time to get through all of them.  I'm sure some of them
are suitable for 4.19 RCs, but the others I'll defer until the next
merge window.  I'll open a more detailed thread soon, I'm going through all the
WIP branches now to see what's actually sane.




The following changes since commit 1009aa1205c2c5e9101437dcadfa195708d863bf:

  Merge tag 'riscv-for-linus-4.19-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux (2018-08-19 09:56:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-mw1

for you to fetch changes up to 7a3b1bf70b37b3797c8570b82a473fd5749fab8d:

  RISC-V: Fix sys_riscv_flush_icache (2018-08-20 11:32:10 -0700)

----------------------------------------------------------------
RISC-V Updates for the 4.19 Merge Window, Part 2

This tag contains a pair of fixes to the RISC-V port.  I've based this
on top of the merge of my previous PR, as I wanted to keep this as
linear as possible (so I didn't want to base on the last tag, which is
4.18 as I'm signing this PR) but didn't want to just grab master at some
arbitrary point.  Let me know if that's the wrong thing to do.

The fixes are:

* The removal of our compat.h, which didn't do anything.
* Fixes to sys_riscv_flush_icache to ensure it actually shows up.  We're
  going to just call this a bug in the ABI, as it was always supposed to
  be there.

I've given these a simple build+boot test, both individually and as the
actual tag.

----------------------------------------------------------------
Deepa Dinamani (1):
      riscv: Delete asm/compat.h

Palmer Dabbelt (3):
      RISC-V: Define sys_riscv_flush_icache when SMP=n
      RISC-V: Don't use a global include guard for uapi/asm/syscalls.h
      RISC-V: Fix sys_riscv_flush_icache

 arch/riscv/include/asm/Kbuild          |  1 +
 arch/riscv/include/asm/compat.h        | 29 -----------------------------
 arch/riscv/include/asm/unistd.h        |  5 +++++
 arch/riscv/include/asm/vdso.h          |  2 --
 arch/riscv/include/uapi/asm/syscalls.h | 13 ++++++++-----
 arch/riscv/kernel/sys_riscv.c          | 12 ++++++++++--
 6 files changed, 24 insertions(+), 38 deletions(-)
 delete mode 100644 arch/riscv/include/asm/compat.h
