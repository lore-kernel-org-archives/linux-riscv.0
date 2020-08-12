Return-Path: <SRS0=T9/Q=BW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CC4C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC132076B
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3OxYpglm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EmME8gqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC132076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aV/WF3t6f85XC3Rb5qifGd5bX14F9fPvDrArnwDrDd8=; b=3OxYpglmQt+ymWanpp97MfyK3
	UvTTUFf4Bud70bNrlmVsuWgArPlaxSExOypgRj7wUYlAulumRsy+LCufsyYLgr/BOrs/Dh+b1DIkD
	HnmHxg29YVwnmSv/IMDGQKB4sVEdrFKf0YiYxdCtmMmHivo+P4aNeK1Chcv61Sl+WMnlJiMiXGj7I
	5fR/kwhphGNp5GEEtiMuzHrvTWXvMwV5ila6Z0RHPTqVkU74gsx+sVqx3meZ0bvWKjB7kiAgt40fy
	oCHMCq4dhGDghTYNiKJrJ9Ng/7OA1SzZs9FAcjpKu7zJFpGQ7MzsG/Klg91TOKA848fkydHMRTfLK
	97o+kno/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k60U8-0007oE-JC; Wed, 12 Aug 2020 23:48:44 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k60U1-0007iq-R9
 for linux-riscv@lists.infradead.org; Wed, 12 Aug 2020 23:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597276118; x=1628812118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DN8eb58tapv6jSq61gaU6uLPKW6g++iMy5qh8VskPTY=;
 b=EmME8gqJXMevFidiIdCzVtEdQn6SffgzSn2+U3eQu9ZjdYH1n2X/GW/Y
 VOnkbMyevo/mO9ScMv2DIsLGGU9H/84eTIQvtdvqiytiJo5ytrl91nDeL
 B+udk193p2NHRUhYwv+XGFBPMiy/No3rWCF9h0A738GIWfNwVMbAX/jmu
 cqBszQY8blrTwExui5VF9zvTXje7zgnMqu/dcnT/TF3SudT4Y+ND5/15p
 3BRuaFLzna3yaDdVMqSx3nL3xsQzFBwUrNuEURrrSTfvGjcxvgxlN3WWT
 d2OwgA4joT9i6f1C8lX/K8gotb/W6La4YWzasp2Xt9ispL2fQ4rYv7ZPO A==;
IronPort-SDR: S7doM2AXB93r21uWJfnCBwd6On3ghBfzpdn5LIq8d3HB2F91zqMpNMpaCcscC79BxxtnrKLQgv
 g3iL6ULLU4rYBCKM7i3aFXFGfl+4UkfvIkPsgVJuhq1NpG2pcAKJw+5i7g95nL4dyc9IOAz26n
 wGyjPEVfaqfNN0apFTYuGhVo8YebQ4gyNIxyNm6gP2tLqFg7Utqlon95vhJxPS4QASJqyvP+2l
 sNM/aXpeuIF37pYhlOpSqA/wMi5aINU/G4s6Xr3mf0qpiiy+c0/cAFP/Xcb9CaNw9VvajBLHo4
 PpM=
X-IronPort-AV: E=Sophos;i="5.76,305,1592841600"; d="scan'208";a="144856849"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2020 07:48:36 +0800
IronPort-SDR: 8egZqZGyZNYItRDRD6zLhDBVk5XuVET8rO4Cwr9TRQsxVkI4mkgInl0oEGDdmC+5cqD41Kkhy5
 BWej3nPc/q/Q==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 16:35:44 -0700
IronPort-SDR: 4DGLA3VCs3HyMw1aH56mbFiPt8Za5v+dDW5xlGkgY5DquKMWJS2BnmMl7uJY4NQNsYnSDI2GQI
 DvINc41U5D/w==
WDCIronportException: Internal
Received: from usa002576.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.59])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Aug 2020 16:48:33 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/9] RISC-V: Add PE/COFF header for EFI stub
Date: Wed, 12 Aug 2020 16:47:54 -0700
Message-Id: <20200812234758.3563-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200812234758.3563-1-atish.patra@wdc.com>
References: <20200812234758.3563-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_194838_093383_9E2DAA9A 
X-CRM114-Status: GOOD (  25.98  )
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Daniel Schaefer <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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
index a5287ab9f7f2..eabec4dce50b 100644
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
index a2f0cb3ca0a6..f5583473f41c 100644
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
index f3586e31ed1e..6dcf790282dd 100644
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
