From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 04 Oct 2018 08:40:18 -0700 (PDT)
Subject: [GIT PULL] A Single RISC-V Fix for 4.19-rc7
Message-ID: <mhng-cfdf26dd-f145-40fa-b698-efb9b65de276@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 17b57b1883c1285f3d0dc2266e8f79286a7bef38:

  Linux 4.19-rc6 (2018-09-30 07:15:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc7

for you to fetch changes up to ef1f2258748b675422ca0107e5bfb9ceeac675de:

  RISCV: Fix end PFN for low memory (2018-10-02 12:50:01 -0700)

----------------------------------------------------------------
A Single RISC-V Fix for 4.19-rc7

This tag contains a single patch that managed to get lost in the
shuffle, which explains why it's so late.  This single line has been
floating around in various patch sets for months, and fixes our DMA32
region.

----------------------------------------------------------------
Atish Patra (1):
      RISCV: Fix end PFN for low memory

 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
