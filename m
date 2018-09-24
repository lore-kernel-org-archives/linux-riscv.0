From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 24 Sep 2018 13:45:31 -0700 (PDT)
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
Message-ID: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 6bf4ca7fbc85d80446ac01c0d1d77db4d91a6d84:

  Linux 4.19-rc5 (2018-09-23 19:15:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc6

for you to fetch changes up to 57a489786de9ec37d6e25ef1305dc337047f0236:

  RISC-V: include linux/ftrace.h in asm-prototypes.h (2018-09-24 13:12:27 -0700)

----------------------------------------------------------------
A Single RISC-V Update for 4.19-rc6

The Debian guys have been pushing on our port and found some unversioned
symbols leaking into modules.  This PR contains a single fix for that
issue.

----------------------------------------------------------------
James Cowgill (1):
      RISC-V: include linux/ftrace.h in asm-prototypes.h

 arch/riscv/include/asm/asm-prototypes.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/riscv/include/asm/asm-prototypes.h
