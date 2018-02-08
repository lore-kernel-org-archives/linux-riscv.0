From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Thu, 8 Feb 2018 23:54:46 +0100
Subject: [PATCH] riscv: kconfig: Remove RISCV_IRQ_INTC select
In-Reply-To: <mhng-300ca2ca-2316-487a-aaa8-9e61b5b67b30@palmer-si-x1c4>
References: <CAFkk2KSUeepo0mSKeV9r2uMO1=euVV2L6QpsMAO0Ew6znG+BRQ@mail.gmail.com>
 <mhng-300ca2ca-2316-487a-aaa8-9e61b5b67b30@palmer-si-x1c4>
Message-ID: <20180208225446.rj7ioyeikaqfm2jc@huvuddator>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The RISCV_IRQ_INTC configuration symbol is undefined, but RISCV selects
it. Quoting Palmer Dabbelt:

	It looks like this slipped through, the symbol has been renamed
	RISCV_INTC.

No RISCV_INTC configuration symbol has been merged either. Just remove
the RISCV_IRQ_INTC select for now.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b6722c246d9c..2be44b6651c5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,7 +34,6 @@ config RISCV
 	select HAVE_ARCH_TRACEHOOK
 	select MODULES_USE_ELF_RELA if MODULES
 	select THREAD_INFO_IN_TASK
-	select RISCV_IRQ_INTC
 	select RISCV_TIMER
 
 config MMU
-- 
2.14.1
