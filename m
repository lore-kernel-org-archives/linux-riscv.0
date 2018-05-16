From: hch@lst.de (Christoph Hellwig)
Date: Wed, 16 May 2018 16:43:01 +0200
Subject: [PATCH 2/3] riscv: only enable ZONE_DMA32 for 64-bit
In-Reply-To: <20180516144302.823-1-hch@lst.de>
References: <20180516144302.823-1-hch@lst.de>
Message-ID: <20180516144302.823-3-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Until we actually support > 32bit physical addresses for 32-bit using
highmem there is no point in enabling ZONE_DMA32.  And even if such
support is ever added it probably should be conditional to not burden
low end embedded devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7817bbe0cfac..c4488ce8c2fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -48,7 +48,7 @@ config MMU
 
 config ZONE_DMA32
 	bool
-	default y
+	default y if 64BIT
 
 config PAGE_OFFSET
 	hex
-- 
2.17.0
