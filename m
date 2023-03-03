Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C5C7EE30
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uot9rLRJUdakOsgB0cHLOqTCB3SdbkAShROLIBH1rmk=; b=PD8Lqogch+736d
	CVKIpfZVcJzEFsUGEoWrVcay5lOcKJS14OUAFcjI39OZAtuD8yFWj+qrrsHO1yGMClU7bjySaDRhl
	s9fynNo8wM2FssLB3UP/05/o4i7QDheiO6aZm2ZDLnsYVvuj9A45E59u4MqxY9JRxtgDee7tx4xOA
	kTFKLLcS3DqxfEQeSlfNDk4Cm19ZUtvsck92OHTr2omh9VrkV6C2nDFSQElnTKhqIEsUfjArQ2knR
	6p396OFk65Pc6lls40mrPim20JtJ0Azvh16emsGuB9ZZQWi6Fu3Ck9nFakPtnVOA/yok57NQ/Vb6g
	08WnfzgVYGKL1qF/Vxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bF-006TBp-GZ; Fri, 03 Mar 2023 13:37:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bC-006T90-Mg
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so2258417pjg.4
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0/qtS4GxFzKHtxYMaq70AM3hWYMvwiY43suIuXOFxs=;
        b=hz6Fj36H0V4dUfs8c2SL/H0+zclRVP8wiIHsogrqH0njw+4SuqO+nArHHsgHuF2GQA
         wbBuRNZV3UPLSctvCyBWUyUndL1jVYTCP2J1LP0UGaRfYlWlvdIVtrg2LOIO4NEjTxe8
         H//Y77XN8KzbrrGYJK4nQOGFpg0oNAvgI8pmeL8vjNgQuOa0SFGJhqxLQNYiHWMQhoB5
         Zl4vOCj9jBxES1vhsN4u9uUWsNOU7c5MY1XapTYpO3yp7wtbgGiNpbE+zaOCbGe7hfIg
         zm89RM54au8afN/vYXaF2TNAzzSNo0ORXsz/Mu1t9/0ih2T46HWtUkqNcRm7qF08rqBA
         b3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0/qtS4GxFzKHtxYMaq70AM3hWYMvwiY43suIuXOFxs=;
        b=k9wU14tH5yTL04ZfWFUhpOaLOIovuEF7Qpfq1yh+UJGHDUCHT8MRj5IhT0P12FRdyv
         bCVah2QGWx1Rxci5w6CzjPg5/RPWz3rx8LvYX2Bj681jRZuTGaCcU68Omrj2LP8M1F2d
         6M8Lc/r3nlt3lB8KMKZxdEeNR/6r63Qxx+S5swK2KiC3k8DdFGw/tGXfQUYu3Eya55t6
         R+cA9Ix7+0PaOkkps8BLSMX3v4TAMdjPS4QeK8ZW+QIKtQIWhAf6mURxnXowMo194Pmy
         mMbiEKZcqGfd8um30l7qavQfXCz3fW9Ipx/IzUgdE31tM4EGo0y+FE53Rd1ZX3rhK1Dq
         vi6g==
X-Gm-Message-State: AO0yUKVXngMnEtP1dgd4W/tv2Zj96ndWOWgp2a+q8NGw51cvZzkIrWuW
	LAJ7Z/egBjdT+EWk2cwHiv5NmeCZ7PG9LGaG
X-Google-Smtp-Source: AK7set9M7hwbg3XNcfNX5mzHsqru73Fjk+ozLnZiVlh07hBrIxGcLrQJUmD/G4zidTDFqSLn70fCuQ==
X-Received: by 2002:a17:902:ecc2:b0:19c:ca14:59ef with SMTP id a2-20020a170902ecc200b0019cca1459efmr2243976plh.34.1677850644594;
        Fri, 03 Mar 2023 05:37:24 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 06/20] RISC-V: Add support to build the ACPI core
Date: Fri,  3 Mar 2023 19:06:33 +0530
Message-Id: <20230303133647.845095-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053726_791898_09511710 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
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
---
 arch/riscv/Kconfig             |  5 +++
 arch/riscv/include/asm/acenv.h | 11 +++++
 arch/riscv/include/asm/acpi.h  | 61 ++++++++++++++++++++++++++
 arch/riscv/include/asm/cpu.h   |  8 ++++
 arch/riscv/kernel/Makefile     |  2 +
 arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
 6 files changed, 167 insertions(+)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/kernel/acpi.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 71754eb32ee6..f3108c7e19d8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,8 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
@@ -617,6 +619,7 @@ config EFI
 	depends on OF && !XIP_KERNEL
 	depends on MMU
 	default y
+	select ARCH_SUPPORTS_ACPI if 64BIT
 	select EFI_GENERIC_STUB
 	select EFI_PARAMS_FROM_FDT
 	select EFI_RUNTIME_WRAPPERS
@@ -720,3 +723,5 @@ source "drivers/cpufreq/Kconfig"
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
+
+source "drivers/acpi/Kconfig"
diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acenv.h
new file mode 100644
index 000000000000..22123c5a4883
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
+/* It is required unconditionally by ACPI core */
+
+#endif /* _ASM_ACENV_H */
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
new file mode 100644
index 000000000000..0b52a190f71a
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
+#define acpi_strict 1   /* No out-of-spec workarounds on RISC-V */
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
+ * to find out this cpu was already mapped (mapping from CPU hardware
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
index 000000000000..ea1a88b3d5f2
--- /dev/null
+++ b/arch/riscv/include/asm/cpu.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_CPU_H
+#define _ASM_CPU_H
+
+/* It is required unconditionally by ACPI core */
+
+#endif /* _ASM_CPU_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 67f542be1bea..f979dc8cf47d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -90,3 +90,5 @@ obj-$(CONFIG_EFI)		+= efi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
+
+obj-$(CONFIG_ACPI)              += acpi.o
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
