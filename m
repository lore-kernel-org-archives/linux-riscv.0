From: linux@roeck-us.net (Guenter Roeck)
Date: Sat, 13 Oct 2018 17:02:05 -0700
Subject: [PATCH v8 3/5] Cleanup ISA string setting
In-Reply-To: <1539051514-3658-4-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
 <1539051514-3658-4-git-send-email-alankao@andestech.com>
Message-ID: <20181014000205.GA22333@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

On Tue, Oct 09, 2018 at 10:18:32AM +0800, Alan Kao wrote:
> This patch cleanup the MARCH string passing to both compiler and
> assembler.  Note that the CFLAGS should not contain "fd" before we
> have mechnisms like kernel_fpu_begin/end in other architectures.
> 
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Vincent Chen <vincentc@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> Cc: Nick Hu <nickhu@andestech.com>
> ---

With this patch in -next applied, I get the following error
when building riscv:defconfig.

cc1: error: -march=c: ISA string must begin with rv32 or rv64
cc1: error: ABI requires -march=rv64
Kbuild:21: recipe for target 'kernel/bounds.s' failed

This is seen with both gcc 7.3.0 and gcc 8.2.0. Bisect log is attached.

What am I missing ? Does RISC-V now require a new non-upstream compiler ?
Or a special version of make ? I am currently using GNU Make 4.1.

Thanks,
Guenter

---
# bad: [774ea0551a2966c8fc29a6f675c3e28c5c6fa586] Add linux-next specific files for 20181012
# good: [0238df646e6224016a45505d2c111a24669ebe21] Linux 4.19-rc7
git bisect start 'HEAD' 'v4.19-rc7'
# bad: [dfbf78faefa3c26d94208398e62bf25ea798e7f2] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect bad dfbf78faefa3c26d94208398e62bf25ea798e7f2
# bad: [530d65b38df62760ce7f778907cc3fce6f5519b7] Merge remote-tracking branch 'hid/for-next'
git bisect bad 530d65b38df62760ce7f778907cc3fce6f5519b7
# good: [4967343a2e8ae0ee767471053f8b55e529b7be7e] Merge remote-tracking branch 'arm-soc/for-next'
git bisect good 4967343a2e8ae0ee767471053f8b55e529b7be7e
# bad: [e8af1ded2dc3e3cb4e8c414809b2303f5b91abe0] Merge remote-tracking branch 'befs/for-next'
git bisect bad e8af1ded2dc3e3cb4e8c414809b2303f5b91abe0
# good: [1ccf1a61dd05b37ddc41fb874109915efb56c53d] Merge remote-tracking branch 'clk-samsung/for-next'
git bisect good 1ccf1a61dd05b37ddc41fb874109915efb56c53d
# good: [43693e88f9764f7ff292e18cbb0d36ed9b26411e] Merge remote-tracking branch 'powerpc/next'
git bisect good 43693e88f9764f7ff292e18cbb0d36ed9b26411e
# good: [52a34b34d4ff9a61bc6da9740541d8f08a40438c] s390/crypto: Enhance paes cipher to accept variable length key material
git bisect good 52a34b34d4ff9a61bc6da9740541d8f08a40438c
# bad: [cc932c65d7892091735a553b89fdd21cc20cb85d] Merge remote-tracking branch 's390/features'
git bisect bad cc932c65d7892091735a553b89fdd21cc20cb85d
# bad: [bb0133e085b524a49829fd02be21f1edd3beaac1] automerging branch "kernel.org-palmer-linux/next-nofpu" into "for-next"
git bisect bad bb0133e085b524a49829fd02be21f1edd3beaac1
# good: [c720a7ff190fc2015ae1449bcbf31216c4a9e973] automerging branch "kernel.org-palmer-linux/next-hch" into "for-next"
git bisect good c720a7ff190fc2015ae1449bcbf31216c4a9e973
# bad: [27625655dbfd83205ba489183f45a87717cb867c] RISC-V: Auto-detect whether a FPU exists
git bisect bad 27625655dbfd83205ba489183f45a87717cb867c
# good: [5453696cb3f1e5b316511234e27570d2f7698b70] RISC-V: Refactor FPU code in signal setup/return procedures
git bisect good 5453696cb3f1e5b316511234e27570d2f7698b70
# bad: [919ecff9aac4e7c8dae05d924385fb05c7c63854] RISC-V: Allow to disable FPU support
git bisect bad 919ecff9aac4e7c8dae05d924385fb05c7c63854
# bad: [0a5bee05fc67ce2044b8d91a18abbf14042da531] RISC-V: Cleanup ISA string setting
git bisect bad 0a5bee05fc67ce2044b8d91a18abbf14042da531
# first bad commit: [0a5bee05fc67ce2044b8d91a18abbf14042da531] RISC-V: Cleanup ISA string setting
