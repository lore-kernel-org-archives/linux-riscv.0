Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E1FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4LZNi44gvy9s9zqj5r1Gcup/k9xayS/M2fGac7SmXo=; b=X3Ga3K8h6V+fOA
	n3Dg70h7+Kx8CfnBySfDYpJzGoaB5bt895Bf2RPV0y0OVf7ZA/VHG4MrvyzYVh9Ae0dPZAhq5EFLs
	KCc9gWmpG0l0GVVMBaZVTXoYI8QER6v7f2zbnU0YKKiQO41R25fPgcQk7lqiR5WubcfLTi/cBWh+B
	+Vuj/8lXi9yCd8OyF43VjjeVQ8t/HQ+oNbmnBdWbjrtj2J3nXTaj1lWakRIPLReSFgnrqvJA0cLMu
	D+Thm1k30DyXZbCC657tVBjEXRQ3k9zmbFDDIRm9yCR/m/nEW6yk5cf6dVkhy2fGRkw/1BtEoOcIS
	GqSnoZbr0fAvBznkb7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7w-007aO4-AZ; Tue, 21 Dec 2021 16:36:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7s-007aJG-Er
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06231B817AF;
 Tue, 21 Dec 2021 16:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A946CC36AEB;
 Tue, 21 Dec 2021 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104589;
 bh=7zpS4YdMAnGvm0LNck619/OiY8SMrdJJ8nj63fHkDDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BqlH4BjaJ5116XfsDW1oguZOKMpj/8+p/2RBfcyHdEEITN0YOYhr6eDabviT3FGB4
 FZWm4tgfUVlfZW9qB33z+mTrOurowhmtI0cXmnLu0T1nLpqZsmE2jxOgKaeJIwTPzD
 odZVkqcHwFGKQnCvp+h6dFsmcttrh67U2mFhIkIn04Ncd7rw/1KIuvSYOvwRiHov8H
 oU9smMUy3KCVoUIcr5NnUJJI8Uj89TT7cnFZAiFziPOd5Jv+SP7mKU6RCyc9EGcR0s
 WWOgxtyGexHu5tTSggqQml7oJ20gVn8u3HAncAO4BLIaJm7bxbFWdiu+tbUbsggRGR
 L+ino+b6hzUdw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 10/13] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
Date: Wed, 22 Dec 2021 00:35:29 +0800
Message-Id: <20211221163532.2636028-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083632_839557_872D39C8 
X-CRM114-Status: GOOD (  19.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

There is no vgettimeofday supported in rv32 that makes simple to
generate rv32 vdso code which only needs riscv64 compiler. Other
architectures need change compiler or -m (machine parameter) to
support vdso32 compiling. If rv32 support vgettimeofday (which
cause C compile) in future, we would add CROSS_COMPILE to support
that makes more requirement on compiler enviornment.

linux-rv64/arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:
file format elf64-littleriscv

Disassembly of section .text:

0000000000000800 <__vdso_rt_sigreturn>:
 800:   08b00893                li      a7,139
 804:   00000073                ecall
 808:   0000                    unimp
        ...

000000000000080c <__vdso_getcpu>:
 80c:   0a800893                li      a7,168
 810:   00000073                ecall
 814:   8082                    ret
        ...

0000000000000818 <__vdso_flush_icache>:
 818:   10300893                li      a7,259
 81c:   00000073                ecall
 820:   8082                    ret

linux-rv32/arch/riscv/kernel/vdso/vdso.so.dbg:
file format elf32-littleriscv

Disassembly of section .text:

00000800 <__vdso_rt_sigreturn>:
 800:   08b00893                li      a7,139
 804:   00000073                ecall
 808:   0000                    unimp
        ...

0000080c <__vdso_getcpu>:
 80c:   0a800893                li      a7,168
 810:   00000073                ecall
 814:   8082                    ret
        ...

00000818 <__vdso_flush_icache>:
 818:   10300893                li      a7,259
 81c:   00000073                ecall
 820:   8082                    ret

Finally, reuse all *.S from vdso in compat_vdso that makes
implementation clear and readable.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Makefile                           |  5 ++
 arch/riscv/include/asm/vdso.h                 |  9 +++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/compat_vdso/.gitignore      |  2 +
 arch/riscv/kernel/compat_vdso/Makefile        | 68 +++++++++++++++++++
 arch/riscv/kernel/compat_vdso/compat_vdso.S   |  8 +++
 .../kernel/compat_vdso/compat_vdso.lds.S      |  3 +
 arch/riscv/kernel/compat_vdso/flush_icache.S  |  3 +
 .../compat_vdso/gen_compat_vdso_offsets.sh    |  5 ++
 arch/riscv/kernel/compat_vdso/getcpu.S        |  3 +
 arch/riscv/kernel/compat_vdso/note.S          |  3 +
 arch/riscv/kernel/compat_vdso/rt_sigreturn.S  |  3 +
 arch/riscv/kernel/vdso/vdso.S                 |  6 +-
 13 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/compat_vdso/.gitignore
 create mode 100644 arch/riscv/kernel/compat_vdso/Makefile
 create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.S
 create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
 create mode 100644 arch/riscv/kernel/compat_vdso/flush_icache.S
 create mode 100755 arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
 create mode 100644 arch/riscv/kernel/compat_vdso/getcpu.S
 create mode 100644 arch/riscv/kernel/compat_vdso/note.S
 create mode 100644 arch/riscv/kernel/compat_vdso/rt_sigreturn.S

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 8a107ed18b0d..fb984b8721ef 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -106,12 +106,17 @@ libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
+	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
+		$(build)=arch/riscv/kernel/compat_vdso $@)
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
+	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
+		$(build)=arch/riscv/kernel/compat_vdso include/generated/compat_vdso-offsets.h)
+
 endif
 endif
 
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index bc6f75f3a199..af981426fe0f 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -21,6 +21,15 @@
 
 #define VDSO_SYMBOL(base, name)							\
 	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
+
+#ifdef CONFIG_COMPAT
+#include <generated/compat_vdso-offsets.h>
+
+#define COMPAT_VDSO_SYMBOL(base, name)						\
+	(void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
+
+#endif /* CONFIG_COMPAT */
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f83e22affd5f..ef47f7d5843f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -67,3 +67,4 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 obj-$(CONFIG_EFI)		+= efi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
+obj-$(CONFIG_COMPAT)		+= compat_vdso/
diff --git a/arch/riscv/kernel/compat_vdso/.gitignore b/arch/riscv/kernel/compat_vdso/.gitignore
new file mode 100644
index 000000000000..19d83d846c1e
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+compat_vdso.lds
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
new file mode 100644
index 000000000000..7bbbbf94307f
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
+# the inclusion of generic Makefile.
+ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
+include $(srctree)/lib/vdso/Makefile
+# Symbols present in the compat_vdso
+compat_vdso-syms  = rt_sigreturn
+compat_vdso-syms += getcpu
+compat_vdso-syms += flush_icache
+
+# Files to link into the compat_vdso
+obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o
+
+ccflags-y := -fno-stack-protector
+
+# Build rules
+targets := $(obj-compat_vdso) compat_vdso.so compat_vdso.so.dbg compat_vdso.lds
+obj-compat_vdso := $(addprefix $(obj)/, $(obj-compat_vdso))
+
+obj-y += compat_vdso.o
+CPPFLAGS_compat_vdso.lds += -P -C -U$(ARCH)
+
+# Disable profiling and instrumentation for VDSO code
+GCOV_PROFILE := n
+KCOV_INSTRUMENT := n
+KASAN_SANITIZE := n
+UBSAN_SANITIZE := n
+
+# Force dependency
+$(obj)/compat_vdso.o: $(obj)/compat_vdso.so
+
+# link rule for the .so file, .lds has to be first
+$(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj-compat_vdso) FORCE
+	$(call if_changed,compat_vdsold)
+LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
+	--build-id=sha1 --hash-style=both --eh-frame-hdr
+
+# strip rule for the .so file
+$(obj)/%.so: OBJCOPYFLAGS := -S
+$(obj)/%.so: $(obj)/%.so.dbg FORCE
+	$(call if_changed,objcopy)
+
+# Generate VDSO offsets using helper script
+gen-compat_vdsosym := $(srctree)/$(src)/gen_compat_vdso_offsets.sh
+quiet_cmd_compat_vdsosym = VDSOSYM $@
+	cmd_compat_vdsosym = $(NM) $< | $(gen-compat_vdsosym) | LC_ALL=C sort > $@
+
+include/generated/compat_vdso-offsets.h: $(obj)/compat_vdso.so.dbg FORCE
+	$(call if_changed,compat_vdsosym)
+
+# actual build commands
+# The DSO images are built using a special linker script
+# Make sure only to export the intended __compat_vdso_xxx symbol offsets.
+quiet_cmd_compat_vdsold = VDSOLD  $@
+      cmd_compat_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
+                   $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat_vdso-syms)) $@.tmp $@ && \
+                   rm $@.tmp
+
+# install commands for the unstripped file
+quiet_cmd_compat_vdso_install = INSTALL $@
+      cmd_compat_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/compat_vdso/$@
+
+compat_vdso.so: $(obj)/compat_vdso.so.dbg
+	@mkdir -p $(MODLIB)/compat_vdso
+	$(call cmd,compat_vdso_install)
+
+compat_vdso_install: compat_vdso.so
diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.S b/arch/riscv/kernel/compat_vdso/compat_vdso.S
new file mode 100644
index 000000000000..fea4a8b0c45d
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/compat_vdso.S
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#define	vdso_start	compat_vdso_start
+#define	vdso_end	compat_vdso_end
+
+#define	__VDSO_PATH	"arch/riscv/kernel/compat_vdso/compat_vdso.so"
+
+#include <../vdso/vdso.S>
diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S b/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
new file mode 100644
index 000000000000..02a9ec5dc7f6
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <../vdso/vdso.lds.S>
diff --git a/arch/riscv/kernel/compat_vdso/flush_icache.S b/arch/riscv/kernel/compat_vdso/flush_icache.S
new file mode 100644
index 000000000000..88e21a84a974
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/flush_icache.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <../vdso/flush_icache.S>
diff --git a/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh b/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
new file mode 100755
index 000000000000..8ac070c783b3
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+LC_ALL=C
+sed -n -e 's/^[0]\+\(0[0-9a-fA-F]*\) . \(__vdso_[a-zA-Z0-9_]*\)$/\#define compat\2_offset\t0x\1/p'
diff --git a/arch/riscv/kernel/compat_vdso/getcpu.S b/arch/riscv/kernel/compat_vdso/getcpu.S
new file mode 100644
index 000000000000..946449a15a94
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/getcpu.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <../vdso/getcpu.S>
diff --git a/arch/riscv/kernel/compat_vdso/note.S b/arch/riscv/kernel/compat_vdso/note.S
new file mode 100644
index 000000000000..67c50898b8e5
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/note.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <../vdso/note.S>
diff --git a/arch/riscv/kernel/compat_vdso/rt_sigreturn.S b/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
new file mode 100644
index 000000000000..f4c98f18c053
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <../vdso/rt_sigreturn.S>
diff --git a/arch/riscv/kernel/vdso/vdso.S b/arch/riscv/kernel/vdso/vdso.S
index df222245be05..83f1c899e8d8 100644
--- a/arch/riscv/kernel/vdso/vdso.S
+++ b/arch/riscv/kernel/vdso/vdso.S
@@ -7,12 +7,16 @@
 #include <linux/linkage.h>
 #include <asm/page.h>
 
+#ifndef __VDSO_PATH
+#define __VDSO_PATH "arch/riscv/kernel/vdso/vdso.so"
+#endif
+
 	__PAGE_ALIGNED_DATA
 
 	.globl vdso_start, vdso_end
 	.balign PAGE_SIZE
 vdso_start:
-	.incbin "arch/riscv/kernel/vdso/vdso.so"
+	.incbin __VDSO_PATH
 	.balign PAGE_SIZE
 vdso_end:
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
