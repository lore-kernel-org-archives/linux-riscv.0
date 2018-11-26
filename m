From: anup@brainfault.org (Anup Patel)
Date: Mon, 26 Nov 2018 11:38:02 +0530
Subject: [PATCH] RISC-V: Make BSS section as the last section in vmlinux.lds.S
Message-ID: <20181126060802.19314-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The objcopy only emits loadable sections when creating flat kernel
Image. To have minimal possible size of flat kernel Image, we should
have all non-loadable sections after loadable sections.

Currently, execption table section (loadable section) is after BSS
section (non-loadable section) in the RISC-V vmlinux.lds.S. This
is not optimal for having minimal flat kernel Image size hence this
patch makes BSS section as the last section in RISC-V vmlinux.lds.S.

In addition, we make BSS section aligned to 16byte instead of PAGE
aligned which further reduces flat kernel Image size by few KBs.

The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
7991740 bytes with this patch applied using GCC 8.2.0. In summary,
this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 65df1dfdc303..cc99eed44931 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -74,8 +74,6 @@ SECTIONS
 		*(.sbss*)
 	}
 
-	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
-
 	EXCEPTION_TABLE(0x10)
 	NOTES
 
@@ -83,6 +81,8 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
+	BSS_SECTION(0x10, 0x10, 0x10)
+
 	_end = .;
 
 	STABS_DEBUG
-- 
2.17.1
