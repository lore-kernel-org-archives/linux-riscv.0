From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 21 Feb 2018 08:37:37 -0800 (PST)
Subject: [GIT PULL] RISC-V: Cleanups for 4.16-rc3
Message-ID: <mhng-120c4a2d-e09b-4d5d-9fc2-3141275ca58b@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.16-rc3-riscv_cleanups

for you to fetch changes up to 8b08f50152ff85a4780e5c385d2b65889406e842:

  Rename sbi_save to parse_dtb to improve code readability (2018-02-20 10:56:26 -0800)

----------------------------------------------------------------
RISC-V: Cleanups for 4.16-rc3

This pull request contains a handful of small cleanups.  The only
functional change is that IRQs are now enabled during exception
handling, which was found when some warnings triggered with
`CONFIG_DEBUG_ATOMIC_SLEEP=y`.  The remaining fixes should have no
functional change: `sbi_save()` has been renamed to `parse_dtb()`
reflect what it actually does, and a handful of unused Kconfig entries
have been removed.

This is based on rc1 as a break to my usual flow, as it appears I missed
rc2 over the holiday.  I've merged master as of Wednesday morning,
af3e79d29555 ("Merge tag 'leds_for-4.16-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds")
without any conflicts and I've given it a simple build test.  If this
isn't OK then feel free to drop the patch set and I'll send another
against rc3 for rc4.

----------------------------------------------------------------
Michael Clark (1):
      Rename sbi_save to parse_dtb to improve code readability

Palmer Dabbelt (1):
      RISC-V: kconfig cleanups

Ulf Magnusson (3):
      riscv: Remove ARCH_WANT_OPTIONAL_GPIOLIB select
      riscv: kconfig: Remove RISCV_IRQ_INTC select
      riscv: Remove ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE select

zongbox at gmail.com (1):
      RISC-V: Enable IRQ during exception handling

 arch/riscv/Kconfig        | 3 ---
 arch/riscv/kernel/entry.S | 5 +++--
 arch/riscv/kernel/head.S  | 2 +-
 arch/riscv/kernel/setup.c | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)
