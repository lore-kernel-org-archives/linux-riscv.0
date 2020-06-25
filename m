Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418F8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BA8206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvamgKT5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MS9e6WyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BA8206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CwOFoA8/p2xzcZprODVFJUTVyT26sQwXRVXZu9BI/0s=; b=VvamgKT51HSLGvvoQhpv+1NLM
	HRMgOfQsmZsHxAQ8M8thKAroFrR++TEXH/uUZQoj1mbWvHqnlRUoLXMbnjA43tsYu67t7lbCUdCGN
	eeRP8B74OwI48mQNDlKn3Q/G45uSszL9xjMrFPo744xMG2Z4IDBscXtBGLM2KQTDJlVrIEutb2htX
	agwkLqjZ3wEimh184QQ8EX11FBZkSLp2xs/i1dB82+S65VGlYjLXIH3/nCSgAE0HaYRYQszdgtxIf
	6oL8K3/bSFWfRJYqv0GVEEfJFbekPRwHefRP+K7sfrKrhM7aujnijueFr0ipRsOCTVxFM/3RwyrD6
	EPTCpp5yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolyK-0006XN-CQ; Fri, 26 Jun 2020 10:52:40 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojnf-0002Se-Vv; Fri, 26 Jun 2020 08:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160440; x=1624696440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spvJLOrCMG2kB0qB9a2UXS0zgvYoQmwLv54vbaGUmPA=;
 b=MS9e6WyZM5sy+4WjUCBUjS4frNK3N2uCEKOy0CLRR91umb8HJxIYq1QV
 43Jgk4qKcgaDFcBcicsUP0SfIaHVY4A9rGQfX+tycUnGbEnacCpekz6ne
 BEWO7wgyyr0W+NETwD2Lb4oYgGCKoZZx/ycnYl04UXXcR7lBXXv/nYRKx
 5AoiO8FGxz5WU/kMCzZbyQ+CrdMzkNLzY8imnL4aLKBnHAT7kbdGFl04p
 /OLL9fWb9npUxZc7iXkvnhF9j3ZEFleo9WjDBCvKnZ7DqbxdxEYnbZREL
 lOocbj3rFjwLkWKVDjuklCmspA1Ayb3/TpU5jWqh+2zYJxRXomK+lewbL w==;
IronPort-SDR: RX4Exujo0YnIOcNMicJSv796BJhcVUwtNXWdxRFf67WB3XhctC5a9GYGKPqVMClqYQjXlNGC5J
 D0e3E8nM375iF5QVDj1ou3wDOoxoM1Ok4ttwNT9GyF40EBQMxPzMemRk0jtxh7WpK8b72MvlkY
 elLqCxoT+UbdEBJIb8LnNyTTSsGJVyQxrGxymo8spzXr6oy92PGUx9xbddc7hpWk55Z+8Azt+d
 SQDiHzbM2/xrTfS6czYXAJ8tEBxyzlUeSQ/a1OuZHVBomcSnQ1ctBS/1GkoZk5csEKUKwxgetV
 JCw=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966125"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:46:00 +0800
IronPort-SDR: zPie1YbSltBRPdDdFZtWL+lgw4JRXbyMMap9MPDk8NycX43dXnykfOPLzmtLdmew9aCQds6/8z
 ElfpChSGxUUbB+GwKCdSyEGIlKbH6fQ4U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:27 -0700
IronPort-SDR: jHOcJWfPsMX2afFQixABxURxkhz6t+mOGwqtz4yIaLHY9h7fLrTX3jmfm1uO3kV2J2/eUa8V52
 Qtn0dEAh6AIQ==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:27 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 08/11] RISC-V: Add PE/COFF header for EFI stub
Date: Thu, 25 Jun 2020 16:45:13 -0700
Message-Id: <20200625234516.31406-9-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Linux kernel Image can appear as an EFI application With appropriate
PE/COFF header fields in the beginning of the Image header. An EFI
application loader can directly load a Linux kernel Image and an EFI
stub residing in kernel can boot Linux kernel directly.

Add the necessary PE/COFF header.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Link: https://lore.kernel.org/r/20200421033336.9663-3-atish.patra@wdc.com
[ardb: - use C prefix for c.li to ensure the expected opcode is emitted
       - align all image sections according to PE/COFF section alignment ]
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/include/asm/sections.h |  13 ++++
 arch/riscv/kernel/Makefile        |   4 ++
 arch/riscv/kernel/efi-header.S    | 104 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/head.S          |  16 +++++
 arch/riscv/kernel/image-vars.h    |  51 +++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S   |  22 ++++++-
 6 files changed, 208 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/sections.h
 create mode 100644 arch/riscv/kernel/efi-header.S
 create mode 100644 arch/riscv/kernel/image-vars.h

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
new file mode 100644
index 000000000000..3a9971b1210f
--- /dev/null
+++ b/arch/riscv/include/asm/sections.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef __ASM_SECTIONS_H
+#define __ASM_SECTIONS_H
+
+#include <asm-generic/sections.h>
+
+extern char _start[];
+extern char _start_kernel[];
+
+#endif /* __ASM_SECTIONS_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index b355cf485671..6f7a3b3771fd 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -32,6 +32,10 @@ obj-y	+= patch.o
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= clint.o traps_misaligned.o
+OBJCOPYFLAGS := --prefix-symbols=__efistub_
+$(obj)/%.stub.o: $(obj)/%.o FORCE
+	$(call if_changed,objcopy)
+
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
new file mode 100644
index 000000000000..822b4c9ff2bb
--- /dev/null
+++ b/arch/riscv/kernel/efi-header.S
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ * Adapted from arch/arm64/kernel/efi-header.S
+ */
+
+#include <linux/pe.h>
+#include <linux/sizes.h>
+
+	.macro	__EFI_PE_HEADER
+	.long	PE_MAGIC
+coff_header:
+#ifdef CONFIG_64BIT
+	.short	IMAGE_FILE_MACHINE_RISCV64		// Machine
+#else
+	.short	IMAGE_FILE_MACHINE_RISCV32		// Machine
+#endif
+	.short	section_count				// NumberOfSections
+	.long	0 					// TimeDateStamp
+	.long	0					// PointerToSymbolTable
+	.long	0					// NumberOfSymbols
+	.short	section_table - optional_header		// SizeOfOptionalHeader
+	.short	IMAGE_FILE_DEBUG_STRIPPED | \
+		IMAGE_FILE_EXECUTABLE_IMAGE | \
+		IMAGE_FILE_LINE_NUMS_STRIPPED		// Characteristics
+
+optional_header:
+	.short	PE_OPT_MAGIC_PE32PLUS			// PE32+ format
+	.byte	0x02					// MajorLinkerVersion
+	.byte	0x14					// MinorLinkerVersion
+	.long	__pecoff_text_end - efi_header_end	// SizeOfCode
+	.long	__pecoff_data_virt_size			// SizeOfInitializedData
+	.long	0					// SizeOfUninitializedData
+	.long	__efistub_efi_pe_entry - _start		// AddressOfEntryPoint
+	.long	efi_header_end - _start			// BaseOfCode
+
+extra_header_fields:
+	.quad	0					// ImageBase
+	.long	PECOFF_SECTION_ALIGNMENT		// SectionAlignment
+	.long	PECOFF_FILE_ALIGNMENT			// FileAlignment
+	.short	0					// MajorOperatingSystemVersion
+	.short	0					// MinorOperatingSystemVersion
+	.short	LINUX_EFISTUB_MAJOR_VERSION		// MajorImageVersion
+	.short	LINUX_EFISTUB_MINOR_VERSION		// MinorImageVersion
+	.short	0					// MajorSubsystemVersion
+	.short	0					// MinorSubsystemVersion
+	.long	0					// Win32VersionValue
+
+	.long	_end - _start				// SizeOfImage
+
+	// Everything before the kernel image is considered part of the header
+	.long	efi_header_end - _start			// SizeOfHeaders
+	.long	0					// CheckSum
+	.short	IMAGE_SUBSYSTEM_EFI_APPLICATION		// Subsystem
+	.short	0					// DllCharacteristics
+	.quad	0					// SizeOfStackReserve
+	.quad	0					// SizeOfStackCommit
+	.quad	0					// SizeOfHeapReserve
+	.quad	0					// SizeOfHeapCommit
+	.long	0					// LoaderFlags
+	.long	(section_table - .) / 8			// NumberOfRvaAndSizes
+
+	.quad	0					// ExportTable
+	.quad	0					// ImportTable
+	.quad	0					// ResourceTable
+	.quad	0					// ExceptionTable
+	.quad	0					// CertificationTable
+	.quad	0					// BaseRelocationTable
+
+	// Section table
+section_table:
+	.ascii	".text\0\0\0"
+	.long	__pecoff_text_end - efi_header_end	// VirtualSize
+	.long	efi_header_end - _start			// VirtualAddress
+	.long	__pecoff_text_end - efi_header_end	// SizeOfRawData
+	.long	efi_header_end - _start			// PointerToRawData
+
+	.long	0					// PointerToRelocations
+	.long	0					// PointerToLineNumbers
+	.short	0					// NumberOfRelocations
+	.short	0					// NumberOfLineNumbers
+	.long	IMAGE_SCN_CNT_CODE | \
+		IMAGE_SCN_MEM_READ | \
+		IMAGE_SCN_MEM_EXECUTE			// Characteristics
+
+	.ascii	".data\0\0\0"
+	.long	__pecoff_data_virt_size			// VirtualSize
+	.long	__pecoff_text_end - _start		// VirtualAddress
+	.long	__pecoff_data_raw_size			// SizeOfRawData
+	.long	__pecoff_text_end - _start		// PointerToRawData
+
+	.long	0					// PointerToRelocations
+	.long	0					// PointerToLineNumbers
+	.short	0					// NumberOfRelocations
+	.short	0					// NumberOfLineNumbers
+	.long	IMAGE_SCN_CNT_INITIALIZED_DATA | \
+		IMAGE_SCN_MEM_READ | \
+		IMAGE_SCN_MEM_WRITE			// Characteristics
+
+	.set	section_count, (. - section_table) / 40
+
+	.balign	0x1000
+efi_header_end:
+	.endm
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index eb123eda3663..3a05a9222b82 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -13,6 +13,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/image.h>
+#include "efi-header.S"
 
 __HEAD
 ENTRY(_start)
@@ -22,10 +23,18 @@ ENTRY(_start)
 	 * Do not modify it without modifying the structure and all bootloaders
 	 * that expects this header format!!
 	 */
+#ifdef CONFIG_EFI
+	/*
+	 * This instruction decodes to "MZ" ASCII required by UEFI.
+	 */
+	c.li s4,-13
+	j _start_kernel
+#else
 	/* jump to start kernel */
 	j _start_kernel
 	/* reserved */
 	.word 0
+#endif
 	.balign 8
 #if __riscv_xlen == 64
 	/* Image load offset(2MB) from start of RAM */
@@ -43,7 +52,14 @@ ENTRY(_start)
 	.ascii RISCV_IMAGE_MAGIC
 	.balign 4
 	.ascii RISCV_IMAGE_MAGIC2
+#ifdef CONFIG_EFI
+	.word pe_head_start - _start
+pe_head_start:
+
+	__EFI_PE_HEADER
+#else
 	.word 0
+#endif
 
 .align 2
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
new file mode 100644
index 000000000000..8c212efb37a6
--- /dev/null
+++ b/arch/riscv/kernel/image-vars.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ * Linker script variables to be set after section resolution, as
+ * ld.lld does not like variables assigned before SECTIONS is processed.
+ * Based on arch/arm64/kerne/image-vars.h
+ */
+#ifndef __RISCV_KERNEL_IMAGE_VARS_H
+#define __RISCV_KERNEL_IMAGE_VARS_H
+
+#ifndef LINKER_SCRIPT
+#error This file should only be included in vmlinux.lds.S
+#endif
+
+#ifdef CONFIG_EFI
+
+/*
+ * The EFI stub has its own symbol namespace prefixed by __efistub_, to
+ * isolate it from the kernel proper. The following symbols are legally
+ * accessed by the stub, so provide some aliases to make them accessible.
+ * Only include data symbols here, or text symbols of functions that are
+ * guaranteed to be safe when executed at another offset than they were
+ * linked at. The routines below are all implemented in assembler in a
+ * position independent manner
+ */
+__efistub_memcmp		= memcmp;
+__efistub_memchr		= memchr;
+__efistub_memcpy		= memcpy;
+__efistub_memmove		= memmove;
+__efistub_memset		= memset;
+__efistub_strlen		= strlen;
+__efistub_strnlen		= strnlen;
+__efistub_strcmp		= strcmp;
+__efistub_strncmp		= strncmp;
+__efistub_strrchr		= strrchr;
+
+#ifdef CONFIG_KASAN
+__efistub___memcpy		= memcpy;
+__efistub___memmove		= memmove;
+__efistub___memset		= memset;
+#endif
+
+__efistub__start		= _start;
+__efistub__start_kernel		= _start_kernel;
+__efistub__end			= _end;
+__efistub__edata		= _edata;
+__efistub_screen_info		= screen_info;
+
+#endif
+
+#endif /* __RISCV_KERNEL_IMAGE_VARS_H */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e6f8016b366a..2616230da1e7 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -10,6 +10,7 @@
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 #include <asm/set_memory.h>
+#include "image-vars.h"
 
 #include <linux/sizes.h>
 OUTPUT_ARCH(riscv)
@@ -17,6 +18,9 @@ ENTRY(_start)
 
 jiffies = jiffies_64;
 
+PECOFF_SECTION_ALIGNMENT = 0x1000;
+PECOFF_FILE_ALIGNMENT = 0x200;
+
 SECTIONS
 {
 	/* Beginning of code and text segment */
@@ -76,6 +80,10 @@ SECTIONS
 
 	EXCEPTION_TABLE(0x10)
 
+#ifdef CONFIG_EFI
+	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
+	__pecoff_text_end = .;
+#endif
 	. = ALIGN(SECTION_ALIGN);
 	_data = .;
 
@@ -83,16 +91,26 @@ SECTIONS
 	.sdata : {
 		__global_pointer$ = . + 0x800;
 		*(.sdata*)
-		/* End of data section */
-		_edata = .;
 	}
 
+#ifdef CONFIG_EFI
+	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
+	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
+#endif
+
+	/* End of data section */
+	_edata = .;
+
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
 	.rel.dyn : {
 		*(.rel.dyn*)
 	}
 
+#ifdef CONFIG_EFI
+	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
+	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
+#endif
 	_end = .;
 
 	STABS_DEBUG
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
