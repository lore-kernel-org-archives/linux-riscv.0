From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 25 Jan 2018 08:23:15 -0800
Subject: [PATCH] Update the RISC-V MAINTAINERS file
Message-ID: <20180125162315.27614-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Now that we're upstream in Linux we've been able to make some
infrastructure changes so our port works a bit more like other ports.
Specifically:

* We now have a mailing list specific to the RISC-V Linux port, hosted
  at lists.infreadead.org.
* We now have a kernel.org git tree where work on our port is
  coordinated.

This patch changes the RISC-V maintainers entry to reflect these new
bits of infrastructure.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3581413420c..a3c25b18bd2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11651,8 +11651,8 @@ F:	drivers/mtd/nand/r852.h
 RISC-V ARCHITECTURE
 M:	Palmer Dabbelt <palmer@sifive.com>
 M:	Albert Ou <albert@sifive.com>
-L:	patches at groups.riscv.org
-T:	git https://github.com/riscv/riscv-linux
+L:	linux-riscv at lists.infradead.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 S:	Supported
 F:	arch/riscv/
 K:	riscv
-- 
2.13.6
