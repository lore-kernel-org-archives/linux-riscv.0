From: zongbox@gmail.com (Zong Li)
Date: Wed,  3 Oct 2018 11:10:01 +0800
Subject: [PATCH v4 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
Message-ID: <b87900141b3ee65e639bb8a0278a2acd7fced103.1538535528.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On RV32, it will use the __umoddi3. Select GENERIC_LIB_UMODDI3 to avoid
undefined reference.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..dc262fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -108,6 +108,7 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.7.4
