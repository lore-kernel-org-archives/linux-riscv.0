From: zong@andestech.com (Zong Li)
Date: Mon, 25 Jun 2018 16:49:38 +0800
Subject: [PATCH v2 2/4] RISC-V: Select GENERIC_UCMPDI2 on RV32I
In-Reply-To: <cover.1529915117.git.zong@andestech.com>
References: <cover.1529915117.git.zong@andestech.com>
Message-ID: <e83cbb33e4b72fdef56bfe396131474040a194b7.1529915117.git.zong@andestech.com>
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
