Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA3C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVDKmkY5+RYuS0y/hrmJAPfvtDmfsm8W4GAdIDG7XRY=; b=oI+nLZhetUajW+
	+VHTbeJGZ3Z8hH5FS4lNkru3XKB+NlSQ6N8Y+F9E+dxrIAokowy/0P56XHGYd6eEk8vpEL7951uLO
	en78z+szpY80x+VFribasT7s3UdLHM3QrsRLD0AsZCqarzr6wjSLhfs23R2Lzc6FQy8TcI56picK6
	ZXBaiqRf8dtaL0ofnq449dWE14YWSIHFhtvWf35n0zsRk1pOZmDA5EBVhEvL7IlZh3RCFVV1EyWEN
	b9yl2PWQxNpnqdLfD9/AZmWW9+0F3j4+ghtk50kgINqwcO0DSJSUgzN4zrnFwz4woKQLavp5p+Fth
	0vgXtYUyBt+eDO6PUk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6C-000zpZ-2r;
	Mon, 15 May 2023 05:50:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR69-000zgw-35
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ab05018381so113691725ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129817; x=1686721817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXB6eSvEhnIAtMiQWlMtfWUjRdd7V8Gch2IVA+HK6fk=;
        b=U0mcG8H5YY2Vyomll1SSloHQ7j3xZ3h0taUBYR9HWxuhftAJz77gPcK8JbDKaKITgc
         j/XGK89FFCOjZKqKnXRRnXlf1FTi6WldLXMBlX+0qTlFeB1RQ5Yh/6K3nYVBrI176wAg
         8174L5aIV2VzEbT6+A+MLUBA52h45mGb9FpefsrgT60nAmTu0RlQWeZ/WiqWNVaxwfyx
         YfPMDCmyeIlAYtiZ2Zo3TyCjvIcw7WpIgYhJViXvLG9JWri3dvXz/M5AQYnPdNChZh/j
         yPJJtDmSSMwcM1W4wITa3hmbBcTCmP6tSPnAvOTsfvBhoA3rIvOkljagi+GumGLJwkvp
         IGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129817; x=1686721817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXB6eSvEhnIAtMiQWlMtfWUjRdd7V8Gch2IVA+HK6fk=;
        b=CUEbHlZkKMTCsUqiyyfb/J+Qz9FwxJ4M6+DesUO3Mju5UZ7T8RZ7+PXflf6bn8GciN
         4TeOlD6cZPUgy1f+AwwNNSVg6aWSE/ZVwGUy++LjcSKSLNjvG+dOPXHT9ikvOv2Om3hp
         TchxSg6zXG8uSDGm1YLll8Z3NPgcxJfhKtZ1vXJ9LetPkb+X54W7Y6tm3DWi+68XNbYz
         NoQC16KIl1GSiRWRVGKjKgyxc4EKFpkm2VO/jDfzm0sJCAkd08L1qmgC8j4xqn3FOpEi
         Di8i2oGktzkslM4BQOJUtshQ7hbQ94lURI6eXDtB83yNqvH479yXrjLzEDUWp5ExHCwN
         3mGQ==
X-Gm-Message-State: AC+VfDxvv6ZUXFoLDeYUUk4c9x0rFoUcba2VyoGDkNzyUDTUwBUnaVnT
	iMKIYLVAGJsnDEKYPgcG182HcQ==
X-Google-Smtp-Source: ACHHUZ4EW47E3fQ5nCmWDv7ZvwL4eMSyxTN/4wQ9IhNnxPkYKwBjKIH2Cr0yPWq98kuwVgrzJefpEQ==
X-Received: by 2002:a17:902:d2c2:b0:1ac:5dfa:3545 with SMTP id n2-20020a170902d2c200b001ac5dfa3545mr35362104plc.68.1684129817560;
        Sun, 14 May 2023 22:50:17 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:17 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 06/21] RISC-V: Add support to build the ACPI core
Date: Mon, 15 May 2023 11:19:13 +0530
Message-Id: <20230515054928.2079268-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225017_996762_638BCA74 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable ACPI core for RISC-V after adding architecture-specific
interfaces and header files required to build the ACPI core.

1) Couple of header files are required unconditionally by the ACPI
core. Add empty acenv.h and cpu.h header files.

2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
be provided by the architecture. Define dummy interfaces for now
so that build succeeds. Actual implementation will be added when
PCI support is added for ACPI along with external interrupt
controller support.

3) A few globals and memory mapping related functions specific
to the architecture need to be provided.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig             |  5 +++
 arch/riscv/include/asm/acenv.h | 11 +++++
 arch/riscv/include/asm/acpi.h  | 61 ++++++++++++++++++++++++++
 arch/riscv/include/asm/cpu.h   |  8 ++++
 arch/riscv/kernel/Makefile     |  1 +
 arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
 6 files changed, 166 insertions(+)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/kernel/acpi.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..491ecd7d2336 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,8 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
@@ -707,6 +709,7 @@ config EFI
 	depends on OF && !XIP_KERNEL
 	depends on MMU
 	default y
+	select ARCH_SUPPORTS_ACPI if 64BIT
 	select EFI_GENERIC_STUB
 	select EFI_PARAMS_FROM_FDT
 	select EFI_RUNTIME_WRAPPERS
@@ -816,3 +819,5 @@ source "drivers/cpufreq/Kconfig"
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
+
+source "drivers/acpi/Kconfig"
diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acenv.h
new file mode 100644
index 000000000000..43ae2e32c779
--- /dev/null
+++ b/arch/riscv/include/asm/acenv.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RISC-V specific ACPICA environments and implementation
+ */
+
+#ifndef _ASM_ACENV_H
+#define _ASM_ACENV_H
+
+/* This header is required unconditionally by the ACPI core */
+
+#endif /* _ASM_ACENV_H */
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
new file mode 100644
index 000000000000..bcade255bd6e
--- /dev/null
+++ b/arch/riscv/include/asm/acpi.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  Copyright (C) 2013-2014, Linaro Ltd.
+ *	Author: Al Stone <al.stone@linaro.org>
+ *	Author: Graeme Gregory <graeme.gregory@linaro.org>
+ *	Author: Hanjun Guo <hanjun.guo@linaro.org>
+ *
+ *  Copyright (C) 2021-2023, Ventana Micro Systems Inc.
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ */
+
+#ifndef _ASM_ACPI_H
+#define _ASM_ACPI_H
+
+/* Basic configuration for ACPI */
+#ifdef CONFIG_ACPI
+
+/* ACPI table mapping after acpi_permanent_mmap is set */
+void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
+#define acpi_os_ioremap acpi_os_ioremap
+
+#define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
+extern int acpi_disabled;
+extern int acpi_noirq;
+extern int acpi_pci_disabled;
+
+static inline void disable_acpi(void)
+{
+	acpi_disabled = 1;
+	acpi_pci_disabled = 1;
+	acpi_noirq = 1;
+}
+
+static inline void enable_acpi(void)
+{
+	acpi_disabled = 0;
+	acpi_pci_disabled = 0;
+	acpi_noirq = 0;
+}
+
+/*
+ * The ACPI processor driver for ACPI core code needs this macro
+ * to find out whether this cpu was already mapped (mapping from CPU hardware
+ * ID to CPU logical ID) or not.
+ */
+#define cpu_physical_id(cpu) cpuid_to_hartid_map(cpu)
+
+/*
+ * Since MADT must provide at least one RINTC structure, the
+ * CPU will be always available in MADT on RISC-V.
+ */
+static inline bool acpi_has_cpu_in_madt(void)
+{
+	return true;
+}
+
+static inline void arch_fix_phys_package_id(int num, u32 slot) { }
+
+#endif /* CONFIG_ACPI */
+
+#endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
new file mode 100644
index 000000000000..28d45a6678ce
--- /dev/null
+++ b/arch/riscv/include/asm/cpu.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_CPU_H
+#define _ASM_CPU_H
+
+/* This header is required unconditionally by the ACPI core */
+
+#endif /* _ASM_CPU_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fbdccc21418a..ed5fcd90036e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -92,3 +92,4 @@ obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
 obj-$(CONFIG_64BIT)		+= pi/
+obj-$(CONFIG_ACPI)		+= acpi.o
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
new file mode 100644
index 000000000000..81d448c41714
--- /dev/null
+++ b/arch/riscv/kernel/acpi.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  RISC-V Specific Low-Level ACPI Boot Support
+ *
+ *  Copyright (C) 2013-2014, Linaro Ltd.
+ *	Author: Al Stone <al.stone@linaro.org>
+ *	Author: Graeme Gregory <graeme.gregory@linaro.org>
+ *	Author: Hanjun Guo <hanjun.guo@linaro.org>
+ *	Author: Tomasz Nowicki <tomasz.nowicki@linaro.org>
+ *	Author: Naresh Bhat <naresh.bhat@linaro.org>
+ *
+ *  Copyright (C) 2021-2023, Ventana Micro Systems Inc.
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/io.h>
+#include <linux/pci.h>
+
+int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
+int acpi_disabled = 1;
+EXPORT_SYMBOL(acpi_disabled);
+
+int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
+EXPORT_SYMBOL(acpi_pci_disabled);
+
+/*
+ * __acpi_map_table() will be called before paging_init(), so early_ioremap()
+ * or early_memremap() should be called here to for ACPI table mapping.
+ */
+void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+{
+	if (!size)
+		return NULL;
+
+	return early_memremap(phys, size);
+}
+
+void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
+{
+	if (!map || !size)
+		return;
+
+	early_memunmap(map, size);
+}
+
+void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+{
+	return memremap(phys, size, MEMREMAP_WB);
+}
+
+#ifdef CONFIG_PCI
+
+/*
+ * These interfaces are defined just to enable building ACPI core.
+ * TODO: Update it with actual implementation when external interrupt
+ * controller support is added in RISC-V ACPI.
+ */
+int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
+		 int reg, int len, u32 *val)
+{
+	return PCIBIOS_DEVICE_NOT_FOUND;
+}
+
+int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
+		  int reg, int len, u32 val)
+{
+	return PCIBIOS_DEVICE_NOT_FOUND;
+}
+
+int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
+{
+	return -1;
+}
+
+struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
+{
+	return NULL;
+}
+#endif	/* CONFIG_PCI */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
