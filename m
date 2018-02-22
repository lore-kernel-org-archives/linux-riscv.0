From: hch@lst.de (Christoph Hellwig)
Date: Thu, 22 Feb 2018 07:57:14 -0800
Subject: [PATCH v2] riscv: enable STRICT_DEVMEM by default
Message-ID: <20180222155714.21946-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

No need to enable /dev/mem access on a new port.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6088408ef26c..b09caac31578 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1968,7 +1968,7 @@ config STRICT_DEVMEM
 	bool "Filter access to /dev/mem"
 	depends on MMU && DEVMEM
 	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
-	default y if TILE || PPC || X86 || ARM64
+	default y if TILE || PPC || X86 || ARM64 || RISCV
 	---help---
 	  If this option is disabled, you allow userspace (root) access to all
 	  of memory, including kernel and userspace memory. Accidental
-- 
2.14.2
