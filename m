From: hch@lst.de (Christoph Hellwig)
Date: Sat,  4 Aug 2018 10:23:15 +0200
Subject: [PATCH 4/8] RISC-V: add a definition for the SIE SEIE bit
In-Reply-To: <20180804082319.5711-1-hch@lst.de>
References: <20180804082319.5711-1-hch@lst.de>
Message-ID: <20180804082319.5711-5-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This mirrors the SIE_SSIE and SETE bits that are used in a similar
fashion.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/csr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 421fa3585798..28a0d1cb374c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -54,6 +54,7 @@
 /* Interrupt Enable and Interrupt Pending flags */
 #define SIE_SSIE _AC(0x00000002, UL) /* Software Interrupt Enable */
 #define SIE_STIE _AC(0x00000020, UL) /* Timer Interrupt Enable */
+#define SIE_SEIE _AC(0x00000200, UL) /* External Interrupt Enable */
 
 #define EXC_INST_MISALIGNED     0
 #define EXC_INST_ACCESS         1
-- 
2.18.0
