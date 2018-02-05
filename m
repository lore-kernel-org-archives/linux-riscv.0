From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Mon,  5 Feb 2018 02:21:19 +0100
Subject: [PATCH 07/20] riscv: Remove ARCH_WANT_OPTIONAL_GPIOLIB select
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Message-ID: <20180205012146.23981-8-ulfalizer@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The ARCH_WANT_OPTIONAL_GPIOLIB symbol was removed in commit 65053e1a7743
("gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB"). GPIOLIB should
just be selected explicitly if needed.

Remove the ARCH_WANT_OPTIONAL_GPIOLIB select from RISCV.

See commit 0145071b3314 ("x86: Do away with
ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") and commit da9a1c6767 ("arm64: do
away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") as well.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ff69c77b9e78..716e90e60e5c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -19,7 +19,6 @@ config RISCV
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
-	select ARCH_WANT_OPTIONAL_GPIOLIB
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_API_DEBUG
-- 
2.14.1
