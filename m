Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6971CC43464
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0406F2087D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyOcFgIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Xa+uUh4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0406F2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cgljlQJxeNX8Ca1m4EIdKduG/ntgdh0G1txGqZw391A=; b=nyOcFgIhO+WyArsk2diYzvYjr
	xJm3Wia0XrtD3jUvU1Fw6K8Jo5Wtnf2JNM6z5P1XvOVgugf6Inl2xkq4b6uji7AD+hz+pPz7mpatt
	cwW13e/m0xIyx1GlHvtZzTSbqnOSeQNJsoqKV92SqNn0fIsheh1xv2HIyeVx/6kiFb7Ys02UUVtgF
	Eda58jRmUBVwXhdZ15Jl9QUKDfv2xciyhIEp48kl2+yEO43WY2WZpTUtH2ND8wtA7YXGQk5ydcxFa
	mij6mhvZJ8ngyWn3GQWlON1TdFaXlBsdidHm/XvrVAgZ2dunKrMe5Gbj1dWHgwxOdlRPNdvH3sQ3j
	Pt0WtpBUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ2XH-0005kn-Ph; Thu, 17 Sep 2020 22:37:51 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ2X9-0005gG-J1
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 22:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600382263; x=1631918263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zxXH2/7YI+PwGAWZtomJ4Dd84mp5VM0rgEr3PoVuYe8=;
 b=Xa+uUh4DZB9abxaVhBpzI8x4oLgeL/kZwAUYrrHLzflUaWiG7PtFjz6j
 NvbxNxz6DA0KcSTT5lrCuYeh8KIXB8BHwN6+tFsfZ5FmGiOHg9NXGc6pP
 Hj1dX8F1fhblUMxqR3yeJlc/SIXja696ah3djtRBsfeqyKSIp23jWvo8c
 i1Xh0dNBb4j4M5jIREgNAIIw6qwSa+FHrAYhqu5iyaaTnGUQrXEa0NBaE
 5EAwwPExtpCAIvNbcFs/uSXiRC8u6eqy9p6bv8wyf+iKKklVmX8VwFssQ
 gQxJBgq4ww3oipXGAyIhzCHiEm7/vH1+Q5VXLDHTDkVU9JKkX3mWfit/U Q==;
IronPort-SDR: r7Cp+GwJBrSOlYObmVZL1i5k9JfQnup3YmDwLxVudi9vWkduJKcHDdbhULpFIa1mZxN4o8ggfP
 /PkLuwf5ZrgiLn15AXl8if+vsC1FEdePxtV7VYloIVbdIGdYgU3J4jaJ6xmOPVG5qbKwJ2W9Q9
 HgC+QOP1hJ0lSGXJrdM8vNJBpMZf8N7Mb9y7BciO4gNa1WUtpR4cf8PTLuddOdPaRTBVJvboAK
 zm6onoqh78PoTIreC8utjM6Y1L7anNSBglh9icOi2NWiw/kwtNvSST715k1BfHwYQ6xt5wH9Xz
 Xk0=
X-IronPort-AV: E=Sophos;i="5.77,272,1596470400"; d="scan'208";a="257336259"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2020 06:37:41 +0800
IronPort-SDR: 4CwhpSzFKspyFlNGP67lX8V/sekBmeFkIqXpnM1rJ2i85to8w/P8nWoxaMdtldn/wstXmWIOxN
 M8EEcTqplf0g==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 15:23:55 -0700
IronPort-SDR: 3M5TTOgDa/WKmIQJOtZfHQzqKowTMYrkgXSd1JVb2yYsqCH6xvLdljR82hW9K0miW+L9HYoNvL
 r6txRRc4kZmg==
WDCIronportException: Internal
Received: from use204338.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.39])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Sep 2020 15:37:40 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/7] RISC-V: Add EFI stub support.
Date: Thu, 17 Sep 2020 15:37:14 -0700
Message-Id: <20200917223716.2300238-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917223716.2300238-1-atish.patra@wdc.com>
References: <20200917223716.2300238-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_183743_802984_D368CAAE 
X-CRM114-Status: GOOD (  33.81  )
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
Cc: linux-efi@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Ard Biesheuvel <ardb@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a RISC-V architecture specific stub code that actually copies the
actual kernel image to a valid address and jump to it after boot services
are terminated. Enable UEFI related kernel configs as well for RISC-V.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Link: https://lore.kernel.org/r/20200421033336.9663-4-atish.patra@wdc.com
[ardb: - move hartid fetch into check_platform_features()
       - use image_size not reserve_size
       - select ISA_C
       - do not use dram_base]
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig                        |  22 +++++
 arch/riscv/Makefile                       |   1 +
 arch/riscv/configs/defconfig              |   1 +
 arch/riscv/include/asm/efi.h              |  35 +++++++
 drivers/firmware/efi/Kconfig              |   3 +-
 drivers/firmware/efi/libstub/Makefile     |  10 ++
 drivers/firmware/efi/libstub/riscv-stub.c | 109 ++++++++++++++++++++++
 7 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/efi.h
 create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5e4ace64acbc..6ef2394be857 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -401,6 +401,26 @@ config CMDLINE_FORCE
 
 endchoice
 
+config EFI_STUB
+	bool
+
+config EFI
+	bool "UEFI runtime support"
+	depends on OF
+	select LIBFDT
+	select UCS2_STRING
+	select EFI_PARAMS_FROM_FDT
+	select EFI_STUB
+	select EFI_GENERIC_STUB
+	select RISCV_ISA_C
+	default y
+	help
+	  This option provides support for runtime services provided
+	  by UEFI firmware (such as non-volatile variables, realtime
+	  clock, and platform reset). A UEFI stub is also provided to
+	  allow the kernel to be booted as an EFI application. This
+	  is only useful on systems that have UEFI firmware.
+
 endmenu
 
 config BUILTIN_DTB
@@ -413,3 +433,5 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 endmenu
+
+source "drivers/firmware/Kconfig"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37db836d..10df59f28add 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -80,6 +80,7 @@ head-y := arch/riscv/kernel/head.o
 core-y += arch/riscv/
 
 libs-y += arch/riscv/lib/
+libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
 PHONY += vdso_install
 vdso_install:
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d58c93efb603..d222d353d86d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -130,3 +130,4 @@ CONFIG_DEBUG_BLOCK_EXT_DEVT=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_EFI=y
diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
new file mode 100644
index 000000000000..bf6a40e20a8e
--- /dev/null
+++ b/arch/riscv/include/asm/efi.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef _ASM_EFI_H
+#define _ASM_EFI_H
+
+#include <asm/io.h>
+#include <asm/mmu_context.h>
+#include <asm/ptrace.h>
+#include <asm/tlbflush.h>
+
+/* on RISC-V, the FDT may be located anywhere in system RAM */
+static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
+{
+	return ULONG_MAX;
+}
+
+/* Load initrd at enough distance from DRAM start */
+static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
+{
+	return image_addr + SZ_256M;
+}
+
+#define alloc_screen_info(x...)		(&screen_info)
+
+static inline void free_screen_info(struct screen_info *si)
+{
+}
+
+static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
+{
+}
+
+#endif /* _ASM_EFI_H */
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 3939699e62fe..a29fbd6e657e 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -111,7 +111,7 @@ config EFI_GENERIC_STUB
 
 config EFI_ARMSTUB_DTB_LOADER
 	bool "Enable the DTB loader"
-	depends on EFI_GENERIC_STUB
+	depends on EFI_GENERIC_STUB && !RISCV
 	default y
 	help
 	  Select this config option to add support for the dtb= command
@@ -128,6 +128,7 @@ config EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER
 	bool "Enable the command line initrd loader" if !X86
 	depends on EFI_STUB && (EFI_GENERIC_STUB || X86)
 	default y
+	depends on !RISCV
 	help
 	  Select this config option to add support for the initrd= command
 	  line parameter, allowing an initrd that resides on the same volume
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 296b18fbd7a2..e9fc2ddabd5f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -22,6 +22,8 @@ cflags-$(CONFIG_ARM64)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
+cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
+				   -fpic
 
 cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
 
@@ -63,6 +65,7 @@ lib-$(CONFIG_EFI_GENERIC_STUB)	+= efi-stub.o fdt.o string.o \
 lib-$(CONFIG_ARM)		+= arm32-stub.o
 lib-$(CONFIG_ARM64)		+= arm64-stub.o
 lib-$(CONFIG_X86)		+= x86-stub.o
+lib-$(CONFIG_RISCV)		+= riscv-stub.o
 CFLAGS_arm32-stub.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
 CFLAGS_arm64-stub.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
 
@@ -106,6 +109,13 @@ STUBCOPY_FLAGS-$(CONFIG_ARM64)	+= --prefix-alloc-sections=.init \
 				   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_ARM64)	:= R_AARCH64_ABS
 
+# For RISC-V, we don't need anything special other than arm64. Keep all the
+# symbols in .init section and make sure that no absolute symbols references
+# doesn't exist.
+STUBCOPY_FLAGS-$(CONFIG_RISCV)	+= --prefix-alloc-sections=.init \
+				   --prefix-symbols=__efistub_
+STUBCOPY_RELOC-$(CONFIG_RISCV)	:= R_RISCV_HI20
+
 $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,stubcopy)
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
new file mode 100644
index 000000000000..380e4e251399
--- /dev/null
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+
+#include <linux/efi.h>
+#include <linux/libfdt.h>
+
+#include <asm/efi.h>
+#include <asm/sections.h>
+
+#include "efistub.h"
+
+/*
+ * RISC-V requires the kernel image to placed 2 MB aligned base for 64 bit and
+ * 4MB for 32 bit.
+ */
+#ifdef CONFIG_64BIT
+#define MIN_KIMG_ALIGN		SZ_2M
+#else
+#define MIN_KIMG_ALIGN		SZ_4M
+#endif
+
+typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
+
+static u32 hartid;
+
+static u32 get_boot_hartid_from_fdt(void)
+{
+	const void *fdt;
+	int chosen_node, len;
+	const fdt32_t *prop;
+
+	fdt = get_efi_config_table(DEVICE_TREE_GUID);
+	if (!fdt)
+		return U32_MAX;
+
+	chosen_node = fdt_path_offset(fdt, "/chosen");
+	if (chosen_node < 0)
+		return U32_MAX;
+
+	prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
+	if (!prop || len != sizeof(u32))
+		return U32_MAX;
+
+	return fdt32_to_cpu(*prop);
+}
+
+efi_status_t check_platform_features(void)
+{
+	hartid = get_boot_hartid_from_fdt();
+	if (hartid == U32_MAX) {
+		efi_err("/chosen/boot-hartid missing or invalid!\n");
+		return EFI_UNSUPPORTED;
+	}
+	return EFI_SUCCESS;
+}
+
+void __noreturn efi_enter_kernel(unsigned long entrypoint, unsigned long fdt,
+				 unsigned long fdt_size)
+{
+	unsigned long stext_offset = _start_kernel - _start;
+	unsigned long kernel_entry = entrypoint + stext_offset;
+	jump_kernel_func jump_kernel = (jump_kernel_func)kernel_entry;
+
+	/*
+	 * Jump to real kernel here with following constraints.
+	 * 1. MMU should be disabled.
+	 * 2. a0 should contain hartid
+	 * 3. a1 should DT address
+	 */
+	csr_write(CSR_SATP, 0);
+	jump_kernel(hartid, fdt);
+}
+
+efi_status_t handle_kernel_image(unsigned long *image_addr,
+				 unsigned long *image_size,
+				 unsigned long *reserve_addr,
+				 unsigned long *reserve_size,
+				 efi_loaded_image_t *image)
+{
+	unsigned long kernel_size = 0;
+	unsigned long preferred_addr;
+	efi_status_t status;
+
+	kernel_size = _edata - _start;
+	*image_addr = (unsigned long)_start;
+	*image_size = kernel_size + (_end - _edata);
+
+	/*
+	 * RISC-V kernel maps PAGE_OFFSET virtual address to the same physical
+	 * address where kernel is booted. That's why kernel should boot from
+	 * as low as possible to avoid wastage of memory. Currently, dram_base
+	 * is occupied by the firmware. So the preferred address for kernel to
+	 * boot is next aligned address. If preferred address is not available,
+	 * relocate_kernel will fall back to efi_low_alloc_above to allocate
+	 * lowest possible memory region as long as the address and size meets
+	 * the alignment constraints.
+	 */
+	preferred_addr = MIN_KIMG_ALIGN;
+	status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
+				     preferred_addr, MIN_KIMG_ALIGN, 0x0);
+
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to relocate kernel\n");
+		*image_size = 0;
+	}
+	return status;
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
