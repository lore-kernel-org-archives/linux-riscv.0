Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEAC55184
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 01:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V/sNFXE9V9CYr5/HJnP+Vle/p5hyJgModHUj9x5ixzA=; b=j2Qu6ys3Lp7xBV
	0V2maVZ9wVCQ+hyvzqJ5Fo7h9urrmcmNzhDYT1XMSTyUDKJ+FQ5ikk4K/6/QWRQ7B6RVNbfpQ6UCH
	3m4rzdO4UFD0060YhyR9tzOPfKsByXK5W8TpOro0GDfRuTbOynie+QHvVCvoA6jQzEZ4EEGZ98nxU
	esNBgXZSTkGSH3Kbq73u7Sja6RlzmQHL4XtmXrosn6Es69ScdxMJyVNBmc50eAcPvfuvGEcmuX9IB
	DzbCD/FfC2RVOlTRtKB/h86Fia+5rGk5JzyfWn1I3RjlxO96PHXU/S9IIP2Df2OWH78cfIhgkX4oq
	ztYfzcKTPiX4YVabiNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJ1-000000032zn-3zCu;
	Wed, 05 Aug 2026 01:20:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJ0-000000032zZ-0Iuh
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 01:20:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A570600AA;
	Wed,  5 Aug 2026 01:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696B41F000E9;
	Wed,  5 Aug 2026 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892824;
	bh=8DJoyM9NIvkIctJ7O6ewJL238CNBlDP8MIbfk2FrjSg=;
	h=From:To:Cc:Subject:Date;
	b=CrcrPlNegZ0zvAShRCcYfYa5o/bINcT9sNgj7au3bRLkcv0hPj7zzpNNlOqFkEvnk
	 2lMRyxtZgldJ7zQFCVYMsM7mspX5GwbXBfdG6eZWTxx9Tdr08sf73mXlvjbQaBL0V3
	 WJdzPWj30w5Nh6PDhiUtCdWwhFBpFhOoXWIFKaa2TPixleTm+nSQC1GL7ibd5p4+cM
	 DDdUPC1GBJfm5eekWJyHKklDEjz0k5JOm8iflC5RMoTGpFIGNgYDGfHDU+uSk+pmlC
	 QBm8om7rhcSPn4BY36RQyG21UWjMpCqbBF94iFjVhCb5KIMSf61y0Zih2ozDEFGnsF
	 Io62GALdN1BvA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: further remove XIP
Date: Wed,  5 Aug 2026 09:00:49 +0800
Message-ID: <20260805010049.13918-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

After commit 9b3a2be84803 ("riscv: Remove support for XIP kernel"),
something relatd with XIP are still there. Remove them to clean up the
code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Makefile                 |   4 +-
 arch/riscv/boot/.gitignore          |   1 -
 arch/riscv/boot/Makefile            |   3 +-
 arch/riscv/kernel/vmlinux-xip.lds.S | 143 ----------------------------
 4 files changed, 3 insertions(+), 148 deletions(-)
 delete mode 100644 arch/riscv/kernel/vmlinux-xip.lds.S

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ce0cc737f870..5ea0f7bccaef 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -172,12 +172,12 @@ vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_RISCV_USER_CFI)	+= arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
 
-BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader loader.bin xipImage vmlinuz.efi
+BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader loader.bin vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
 
 loader.bin: loader
-Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader xipImage vmlinuz.efi: Image
+Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader vmlinuz.efi: Image
 
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
index e1bc507e8cb2..5d123ceaa012 100644
--- a/arch/riscv/boot/.gitignore
+++ b/arch/riscv/boot/.gitignore
@@ -5,4 +5,3 @@ loader
 loader.lds
 loader.bin
 vmlinuz*
-xipImage
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index fcfbe3f814d6..4a2d75b7e42d 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -16,9 +16,8 @@
 
 OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 OBJCOPYFLAGS_loader.bin :=-O binary
-OBJCOPYFLAGS_xipImage :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image Image.* loader loader.o loader.lds loader.bin xipImage
+targets := Image Image.* loader loader.o loader.lds loader.bin
 
 $(obj)/Image: vmlinux FORCE
 	$(call if_changed,objcopy)
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
deleted file mode 100644
index a7611789bad5..000000000000
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ /dev/null
@@ -1,143 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 Regents of the University of California
- * Copyright (C) 2017 SiFive
- * Copyright (C) 2020 Vitaly Wool, Konsulko AB
- */
-
-#include <asm/pgtable.h>
-#define LOAD_OFFSET KERNEL_LINK_ADDR
-/* No __ro_after_init data in the .rodata section - which will always be ro */
-#define RO_AFTER_INIT_DATA
-
-#include <asm/vmlinux.lds.h>
-#include <asm/page.h>
-#include <asm/cache.h>
-#include <asm/thread_info.h>
-#include <asm/set_memory.h>
-
-OUTPUT_ARCH(riscv)
-ENTRY(_start)
-
-jiffies = jiffies_64;
-
-SECTIONS
-{
-	/* Beginning of code and text segment */
-	. = LOAD_OFFSET;
-	_xiprom = .;
-	_start = .;
-	HEAD_TEXT_SECTION
-	INIT_TEXT_SECTION(PAGE_SIZE)
-	/* we have to discard exit text and such at runtime, not link time */
-	__exittext_begin = .;
-	.exit.text :
-	{
-		EXIT_TEXT
-	}
-	__exittext_end = .;
-
-	.text : {
-		_text = .;
-		_stext = .;
-		TEXT_TEXT
-		SCHED_TEXT
-		LOCK_TEXT
-		KPROBES_TEXT
-		ENTRY_TEXT
-		IRQENTRY_TEXT
-		SOFTIRQENTRY_TEXT
-		_etext = .;
-	}
-	RO_DATA(L1_CACHE_BYTES)
-	.srodata : {
-		*(.srodata*)
-	}
-	.init.rodata : {
-		INIT_SETUP(16)
-		INIT_CALLS
-		CON_INITCALL
-		INIT_RAM_FS
-	}
-	_exiprom = .;			/* End of XIP ROM area */
-
-
-/*
- * From this point, stuff is considered writable and will be copied to RAM
- */
-	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
-	. = ALIGN(SECTION_ALIGN);		/* location in memory */
-
-#undef LOAD_OFFSET
-#define LOAD_OFFSET (KERNEL_LINK_ADDR + _sdata - __data_loc)
-
-	_sdata = .;			/* Start of data section */
-	_data = .;
-	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
-	_edata = .;
-	__start_ro_after_init = .;
-	.data.ro_after_init : AT(ADDR(.data.ro_after_init) - LOAD_OFFSET) {
-		*(.data..ro_after_init)
-	}
-	__end_ro_after_init = .;
-
-	. = ALIGN(PAGE_SIZE);
-	__init_begin = .;
-	.init.data : {
-		INIT_DATA
-	}
-	.exit.data : {
-		EXIT_DATA
-	}
-	. = ALIGN(8);
-	__soc_early_init_table : {
-		__soc_early_init_table_start = .;
-		KEEP(*(__soc_early_init_table))
-		__soc_early_init_table_end = .;
-	}
-	__soc_builtin_dtb_table : {
-		__soc_builtin_dtb_table_start = .;
-		KEEP(*(__soc_builtin_dtb_table))
-		__soc_builtin_dtb_table_end = .;
-	}
-
-	__init_end = .;
-
-	. = ALIGN(16);
-	.xip.traps : {
-		__xip_traps_start = .;
-		*(.xip.traps)
-		__xip_traps_end = .;
-	}
-
-	. = ALIGN(PAGE_SIZE);
-	.sdata : {
-		__global_pointer$ = . + 0x800;
-		*(.sdata*)
-		*(.sbss*)
-	}
-
-	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
-
-	PERCPU_SECTION(L1_CACHE_BYTES)
-
-	.rel.dyn : AT(ADDR(.rel.dyn) - LOAD_OFFSET) {
-		*(.rel.dyn*)
-	}
-
-	/*
-	 * End of copied data. We need a dummy section to get its LMA.
-	 * Also located before final ALIGN() as trailing padding is not stored
-	 * in the resulting binary file and useless to copy.
-	 */
-	.data.endmark : AT(ADDR(.data.endmark) - LOAD_OFFSET) { }
-	_edata_loc = LOADADDR(.data.endmark);
-
-	. = ALIGN(PAGE_SIZE);
-	_end = .;
-
-	STABS_DEBUG
-	DWARF_DEBUG
-
-	DISCARDS
-}
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
