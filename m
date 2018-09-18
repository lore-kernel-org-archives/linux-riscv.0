From: zongbox@gmail.com (Zong Li)
Date: Tue, 18 Sep 2018 17:19:13 +0800
Subject: [PATCH 1/5] RISC-V: Build tishift only on 64-bit
In-Reply-To: <cover.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
Message-ID: <40c77db9ee2d23479ff90f2658539d29d7a30896.1537260207.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Only RV64 supports 128 integer size.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/lib/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 445ec84..5739bd0 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -2,6 +2,7 @@ lib-y	+= delay.o
 lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
-lib-y	+= tishift.o
+
+lib-(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.7.4
