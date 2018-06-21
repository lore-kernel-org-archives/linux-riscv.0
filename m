From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:43 +0800
Subject: [PATCH 2/5] RISC-V: Select GENERIC_UCMPDI2 on RV32I
In-Reply-To: <cover.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
Message-ID: <29a09c174447db35ce7b25543dd9b5a82fdb7cff.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 32-bit, it need to use __ucmpdi2, otherwise, it can't find the __ucmpdi2
symbol.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6debcc4afc72..3e683be9b7a8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -122,6 +122,7 @@ config ARCH_RV32I
 	select GENERIC_ASHLDI3
 	select GENERIC_ASHRDI3
 	select GENERIC_LSHRDI3
+	select GENERIC_UCMPDI2
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.16.1
