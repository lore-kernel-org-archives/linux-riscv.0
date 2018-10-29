From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 29 Oct 2018 12:26:33 -0700
Subject: [PATCH 1/2] Revert "RISC-V: Select GENERIC_LIB_UMODDI3 on RV32"
In-Reply-To: <20181029192634.30078-1-palmer@sifive.com>
References: <20181029192634.30078-1-palmer@sifive.com>
Message-ID: <20181029192634.30078-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I'm removing the generic 64-bit divide support, which means this will no
longer work.

This reverts commit 757331db921428295948fed5e7377a436e66d34e.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fe451348ae57..4198759f6798 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -109,7 +109,6 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
-	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.18.1
