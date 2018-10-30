From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Tue, 30 Oct 2018 11:01:06 +0100
Subject: [PATCH 1/2] riscv: add ARCH_HAS_SG_CHAIN
In-Reply-To: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
References: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
Message-ID: <20181030100107.4590-2-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This seems to be needed for virtio-gpu.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Reported-by: Michael Forney <mforney@mforney.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..b54f2ade769b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SG_CHAIN
 
 config MMU
 	def_bool y
-- 
2.17.2
