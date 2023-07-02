Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E89EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rQelPd+74zYn/UN51gf7BwdJVDJTxICUL8qTMof8/ZU=; b=1kZVinWYPqPa6e
	Jwt1VLGobEWrF5wtTEdOGzBCapk2r0myE2LmgOuM78BlF9nPMu+TAT8Fy+2/S0ofpz3CgsuFTFNou
	JnudigCourg6tyqAiliy00flRgMbsJIqsZtgMehIVlRUzBM1EKv1TcZN7t6BxBnA0NX3RtRRUvNN6
	++xCUhTV3h1pZ8CPsX7Zb670X6EG20FO53uL8KW6f6FsObVILzZtffdMj72LWRvojs0cGtB+HLkK/
	e2Vm4EJGUnAkf9BwSqmC7GFB+cBlpOjdWh0bKFIXCq/bueNdK/rMnFq5VTag0YKSh9Y6EUOCX36yI
	ba1rchNxLcsyg0v+C0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtqM-007Wbv-1P;
	Sun, 02 Jul 2023 09:58:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtqI-007Wah-1Z
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 09:58:08 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55ac628e3cfso1781257a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688291875; x=1690883875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XF2+x8StAqIQZEEXXA77vQxRC4bKZrb2UmGw9jTVMxg=;
        b=C8mJIVmo9Gt8KrJx133l1TXUl96CjQQdawYTJqjV0B/dmrVnXbEotILm4dSXCEO+LE
         9Ej+UK5HJQrDCB7aDdtABsSPT1gpEHjUABBtbOKkrTOnXS+OtygyvUJnmMUti2fldsuk
         LYuM+dNsVpvyn4VRdWlnqWoLRubroBSgNcRzK3Loq3wizKTdyajAHSbzjtTG5BPh00Ys
         njN7jgXWvlJfMrw1ZFIIR4kvKAqQ5TCf94B/vkUVxpiDCWmI5J515CPvcj5cOBDrNX7x
         20EwZMgumErRPjsjQPjjzOdyrCNEI6qDtDdu0oda8rhwk1EFVuDeKFlL8tHtqbgJrxlX
         tV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688291875; x=1690883875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XF2+x8StAqIQZEEXXA77vQxRC4bKZrb2UmGw9jTVMxg=;
        b=bcdNDWGPDlWfUKSP8IvXkYge6l9a1XNnpqPol5HTI2NRnxCqVqDg548e9sm6jPZZiD
         udZ60ceMePCZfZw7AiULw5amXJFcRLmwP6dsiHPo/N8TMoo9XBnpeIUj8ahIm5DUSckK
         tMfubLmcgfKUFkHwfVzCJP+aJK5PBytJ6G1xEUieKJr/DfVztaW3EME35OPGiq3jXD1t
         KWGfPRQnBcT9f2p7y51KpyDNtpApXRGy7jWUazbAJZRNeBQ+aGQWltN1dfzEq4CCjCJ1
         NqZNj1bFlKPBeLNot75z0+sOlXGsK6sFAeXq0BWOL+1qVbIIyLrWnTGPXo1uAxKsWSyc
         po5w==
X-Gm-Message-State: ABy/qLaz/G0bvxE5a76Dtd2FHO4Jiwpl3Fht2RLQIEo7GlGPjlFDDrDU
	gnFv98WcunicSx7jpnLJAWCYmQ==
X-Google-Smtp-Source: APBJJlF4yLaj8jr7OTR8FcXH/r/O+yqMJrHgHcjvBx+h67R5YAj78AaIxs+XMdOOaBezarVJelvXvA==
X-Received: by 2002:a05:6a20:3257:b0:12c:1193:a563 with SMTP id hm23-20020a056a20325700b0012c1193a563mr5325675pzc.58.1688291875230;
        Sun, 02 Jul 2023 02:57:55 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006827d86ca0csm1605095pfh.55.2023.07.02.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 02:57:54 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ardb@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	rminnich@gmail.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	jdelvare@suse.com,
	yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	geshijian@bytedance.com,
	weidong.wd@bytedance.com,
	cuiyunhui@bytedance.com
Subject: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Date: Sun,  2 Jul 2023 17:57:32 +0800
Message-Id: <20230702095735.860-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_025806_677216_7127E56B 
X-CRM114-Status: GOOD (  18.98  )
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

1. We need to enable the ACPI function on RISC-V. When booting with
Coreboot, we encounter two problems:
a. Coreboot does not support EFI
b. On RISC-V, only the DTS channel can be used.

2. Based on this, we have added an interface for obtaining firmware
information transfer through FDT, named FFI.

3. We not only use FFI to pass ACPI RSDP, but also pass other
firmware information as an extension.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 MAINTAINERS                   |  6 ++++++
 arch/riscv/Kconfig            | 10 ++++++++++
 arch/riscv/include/asm/acpi.h |  9 +++++++++
 arch/riscv/include/asm/ffi.h  |  9 +++++++++
 arch/riscv/kernel/Makefile    |  1 +
 arch/riscv/kernel/ffi.c       | 37 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  2 ++
 7 files changed, 74 insertions(+)
 create mode 100644 arch/riscv/include/asm/ffi.h
 create mode 100644 arch/riscv/kernel/ffi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cd5388a33410..e592f489e757 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18363,6 +18363,12 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 
+RISC-V FDT FIRMWARE INTERFACE (FFI) SUPPORT
+M:	Yunhui Cui cuiyunhui@bytedance.com
+S:	Maintained
+F:	arch/riscv/include/asm/ffi.h
+F:	arch/riscv/kernel/ffi.c
+
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>
 R:	Anup Patel <anup@brainfault.org>
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49793cf34eb..2e1c40fb2300 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -785,6 +785,16 @@ config EFI
 	  allow the kernel to be booted as an EFI application. This
 	  is only useful on systems that have UEFI firmware.
 
+config FFI
+	bool "Fdt firmware interface"
+	depends on OF
+	default y
+	help
+	  Added an interface to obtain firmware information transfer
+	  through FDT, named FFI. Some bootloaders do not support EFI,
+	  such as coreboot.
+	  We can pass firmware information through FFI, such as ACPI.
+
 config CC_HAVE_STACKPROTECTOR_TLS
 	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
 
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f71ce21ff684..f9d1625dd159 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -15,6 +15,8 @@
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
 
+#include <asm/ffi.h>
+
 typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
 
@@ -66,6 +68,13 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
 
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+
+#define ACPI_HAVE_ARCH_GET_ROOT_POINTER
+static inline u64 acpi_arch_get_root_pointer(void)
+{
+	return acpi_rsdp;
+}
+
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
diff --git a/arch/riscv/include/asm/ffi.h b/arch/riscv/include/asm/ffi.h
new file mode 100644
index 000000000000..847af02abd87
--- /dev/null
+++ b/arch/riscv/include/asm/ffi.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_FFI_H
+#define _ASM_FFI_H
+
+extern u64 acpi_rsdp;
+extern void ffi_init(void);
+
+#endif /* _ASM_FFI_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 506cc4a9a45a..274e06f4da33 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_FFI)              += ffi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
diff --git a/arch/riscv/kernel/ffi.c b/arch/riscv/kernel/ffi.c
new file mode 100644
index 000000000000..c5ac2b5d9148
--- /dev/null
+++ b/arch/riscv/kernel/ffi.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ffi.c - FDT FIRMWARE INTERFACE
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+
+u64 acpi_rsdp;
+
+void __init ffi_acpi_root_pointer(void)
+{
+	int cfgtbl, len;
+	fdt64_t *prop;
+
+	cfgtbl = fdt_path_offset(initial_boot_params, "/cfgtables");
+	if (cfgtbl < 0) {
+		pr_info("firmware table not found.\n");
+		return;
+	}
+
+	prop = fdt_getprop_w(initial_boot_params, cfgtbl, "acpi_phy_ptr", &len);
+	if (!prop || len != sizeof(u64))
+		pr_info("acpi_rsdp not found.\n");
+	else
+		acpi_rsdp = fdt64_to_cpu(*prop);
+
+	pr_debug("acpi rsdp: %llx\n", acpi_rsdp);
+}
+
+void __init ffi_init(void)
+{
+	ffi_acpi_root_pointer();
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..5a933d6b6acb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -36,6 +36,7 @@
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
 #include <asm/efi.h>
+#include <asm/ffi.h>
 
 #include "head.h"
 
@@ -279,6 +280,7 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 
 	efi_init();
+	ffi_init();
 	paging_init();
 
 	/* Parse the ACPI tables for possible boot-time configuration */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
