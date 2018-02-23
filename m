From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:10 -0500
Subject: [PATCH 1/9] RISC-V: Build non position-independent modules.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-2-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The relocations we have to handle for no-PIC are much simpler, and we
can't take advantage of GOT/PLT sharing anyway.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 26892daefa05..e0b04a0b5b82 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -11,8 +11,8 @@
 LDFLAGS         :=
 OBJCOPYFLAGS    := -O binary
 LDFLAGS_vmlinux :=
-KBUILD_AFLAGS_MODULE += -fPIC
-KBUILD_CFLAGS_MODULE += -fPIC
+KBUILD_AFLAGS_MODULE += -fno-PIC -mcmodel=medany
+KBUILD_CFLAGS_MODULE += -fno-PIC -mcmodel=medany
 
 KBUILD_DEFCONFIG = defconfig
 
-- 
2.16.1
