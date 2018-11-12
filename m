From: zongbox@gmail.com (Zong Li)
Date: Mon, 12 Nov 2018 12:07:43 +0800
Subject: [PATCH 1/2] RISC-V: Request stat64 on RV32
In-Reply-To: <cover.1541995312.git.zongbox@gmail.com>
References: <cover.1541995312.git.zongbox@gmail.com>
Message-ID: <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The stat64 family that is used on 32-bit architectures to replace
newstat.

Since commit 67314ec7b0250290cc85eaa7a2f88a8ddb9e8547 ("RISC-V: Request
newstat syscalls"), the RV32 build fail with undeclared 'sys_fstatat64'

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/asm/unistd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index eff7aa9..a4aade9 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -18,5 +18,6 @@
 
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_STAT64
 #include <uapi/asm/unistd.h>
 #include <uapi/asm/syscalls.h>
-- 
2.7.4
