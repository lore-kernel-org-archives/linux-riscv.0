From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 23:47:07 -0700
Subject: [PATCH 1/3] RISC-V: lib: Fix build error for 64-bit
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
References: <20181031064709.30981-1-olof@lixom.net>
Message-ID: <20181031064709.30981-2-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fixes the following build error from tinyconfig:

riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
fair.c:(.text+0x70): undefined reference to `__lshrti3'
riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Fixes: 7f47c73b355f ("RISC-V: Build tishift only on 64-bit")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 5739bd05d289..4e2e600f7d53 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,6 @@ lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
 
-lib-(CONFIG_64BIT) += tishift.o
+lib-$(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.11.0
