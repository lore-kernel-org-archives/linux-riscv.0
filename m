From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 01 Nov 2018 19:19:09 -0700 (PDT)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 3
Message-ID: <mhng-cb2ea62c-8d08-467b-bea5-657b42a5acbf@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit baa888d25ea64d0c59344d474284ca99cfdd449a:

  Merge branch 'next-keys2' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security (2018-11-01 15:23:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw3

for you to fetch changes up to ba1f0d95576902c10930d3467e638bac38f942f1:

  RISC-V: refresh defconfig (2018-11-01 17:04:07 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 3

Sorry for the last minute patches, but it was suggested we try to push
this in before rc1 to make it easier for people to keep their branch
rebases sane.  Since this is just a single defconfig update that is
intended to have no functional change I thought it would be worth
breaking my own PR rules.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: refresh defconfig

 arch/riscv/configs/defconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
