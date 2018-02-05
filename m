From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Mon,  5 Feb 2018 02:21:18 +0100
Subject: [PATCH 06/20] riscv: Remove ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE select
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Message-ID: <20180205012146.23981-7-ulfalizer@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE symbol was removed in
commit 51a021244b9d ("atomic64: no need for
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE").

Remove the ARCH_HAS_ATOMIC64_DEC_IS_POSITIVE select from RISCV.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b6722c246d9c..ff69c77b9e78 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -8,7 +8,6 @@ config RISCV
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
-	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 	select ARCH_WANT_FRAME_POINTERS
 	select CLONE_BACKWARDS
 	select COMMON_CLK
-- 
2.14.1
