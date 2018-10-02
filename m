From: zongbox@gmail.com (Zong Li)
Date: Tue,  2 Oct 2018 16:52:30 +0800
Subject: [PATCH v3 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
Message-ID: <3f1967e8be0c25910bf04181e84b46a788a156d7.1538470103.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 32-bit, it need to use __umoddi3 by some drivers.

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
