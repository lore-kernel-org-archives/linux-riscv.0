From: hch@lst.de (Christoph Hellwig)
Date: Mon, 16 Apr 2018 08:57:52 +0200
Subject: [PATCH] riscv: there is no <asm/handle_irq.h>
Message-ID: <20180416065752.5176-1-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

So don't list it as generic-y.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 1e5fd280fb4d..4286a5f83876 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -15,7 +15,6 @@ generic-y += fcntl.h
 generic-y += futex.h
 generic-y += hardirq.h
 generic-y += hash.h
-generic-y += handle_irq.h
 generic-y += hw_irq.h
 generic-y += ioctl.h
 generic-y += ioctls.h
-- 
2.17.0
