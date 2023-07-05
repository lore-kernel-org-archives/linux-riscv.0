Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE3DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KX21ESMP7KOQ/QqyPwnYZsG0N9wqR7prvlVr0sXEB4=; b=ROsFvWITlVF/gE
	TLxX+hZuu4XbERWgVmERWIxWpFdag0/hnf4oqz8LxFZ2S1f419ijKceP2IOIUGdbPieKO66xCEnVB
	h8ynQD5brW7Phb0gaIrJ1QGZgXckUy9EhtgwTMGxVVrWCT7lnTf+qTG03N47zjD9VyWLVx/3MTvQI
	jfXo+UIpp+GtdhlvindMGt++Vk1VgfaFSP5QLy6mvX5zvPeueMuwU+oKMeFe9wc9/WzqpatbfSqjC
	O+xFRwff9mcm+j9P3+UPT9afDo6BGaP29RSp9kWWPMFbRiFp0ya5zwhHB9prYFGk11emqtPFdPT8I
	5vvPb713hoEwkDEMHLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wD-00FkzH-2Y;
	Wed, 05 Jul 2023 11:44:49 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wA-00Fkya-2G
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:44:48 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5661eb57452so2114929eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688557485; x=1691149485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2wHvvnZ9EXs4kZ7PH7ZQmrp8wDzjYqwhR8Lb7Z2dm0=;
        b=jVG4zai1xG7MtgnncuyhuPAqUUpjFnE9G3irewRE18y6iFyE/sSIGF23/BN9GqjedI
         zyE5d5WvPIsC2FoCMXz6YBxr+JP9d4N15NZq5ymkBEZQ9f5R/eqSfpU/6bJ9wyhWX0GY
         CZn7coRHhPZm1IRexWWv9LxGNpN/kk927lkfVslnarGWO0nM7CTFWJ6ITIo3KHTUnDnf
         FykR8jIUlH6tBDEJwoMXPppRQhPKve5atGYBKA4SFBp23WeY7rXeoIGbL2Lfb9ToKbu8
         gEhKKIYhaaWc9JldVwFllp+Ar8BmfPkSiuuXdmcH5Dd5lugkgvKVkJ8u7MiK/YyWjCVd
         zxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557485; x=1691149485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2wHvvnZ9EXs4kZ7PH7ZQmrp8wDzjYqwhR8Lb7Z2dm0=;
        b=dDcyF6MpWWkFKPkr6HTCpqRkKYSFASX9phIObO3u2anJ0d5q4hw92slcHZZ7y/Zq9E
         dt1/r2p2DOLgmwHUhXwWhVbTejFn03+pqmraog6xbPcWqhdJzLIcMXsSqqMS9+nyOgPK
         RrAbbxgED9LYhW1VocaAhrEaiAV0RQMIezHWEQ+0riHcymRveYMfKiGycCyVdoRflXgo
         P3vecrNdLzKSdEnq1Sm8dSNhKVaH2QX9yvL+YJ+bPuNDFyIQMCkBZD3VWlfnWlIINeIH
         FDgGXJ7oWRYSHTvC/PfovTqX91BaxuMFetwaNgUpp1NpN6lryEZVniqttgAnI66t3Mxf
         vOjw==
X-Gm-Message-State: AC+VfDwF+3w8quGPd1lQS4sO3miMFlfL4XJr5zEU9MlM5Ct5/QV1b5ka
	D9nUmTRlO8dWCQjUOrmOyQ5SQw==
X-Google-Smtp-Source: ACHHUZ4ap87VDxLx6PJqpSNbm9olTnoBIzaTi9rOfKW8IJ4lqYlS+3MO2AfgOPiU74NZ5qWJSAcOSw==
X-Received: by 2002:a05:6808:197:b0:39e:ffc5:c450 with SMTP id w23-20020a056808019700b0039effc5c450mr15121527oic.47.1688557485518;
        Wed, 05 Jul 2023 04:44:45 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a194300b00263f6687690sm1177900pjh.18.2023.07.05.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:44:45 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	sunilvl@ventanamicro.com,
	ardb@kernel.org,
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
Subject: [PATCH v3 1/4] riscv: obtain ACPI RSDP from devicetree
Date: Wed,  5 Jul 2023 19:42:48 +0800
Message-Id: <20230705114251.661-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20230705114251.661-1-cuiyunhui@bytedance.com>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044446_737485_BA74406C 
X-CRM114-Status: GOOD (  17.92  )
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

On RISC-V, Coreboot does not support booting using EFI, only devicetree
nor does RISC-V have a reserved address segment.
To allow using Coreboot on platforms that require ACPI, the ACPI RSDP
needs to be passed to supervisor mode software using devicetree.

Add support for parsing the "ffitbl" devicetree node to find the
ACPI entry point and use wire up acpi_arch_get_root_pointer().
This feature is known as FDT Firmware Interface (FFI).

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 MAINTAINERS                   |  6 ++++++
 arch/riscv/include/asm/acpi.h |  9 +++++++++
 arch/riscv/include/asm/ffi.h  | 14 +++++++++++++
 arch/riscv/kernel/Makefile    |  1 +
 arch/riscv/kernel/ffi.c       | 38 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  2 ++
 6 files changed, 70 insertions(+)
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
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f71ce21ff684..5574f9a152f5 100644
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
+	return riscv_acpi_rsdp();
+}
+
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
diff --git a/arch/riscv/include/asm/ffi.h b/arch/riscv/include/asm/ffi.h
new file mode 100644
index 000000000000..d5e8309cc06f
--- /dev/null
+++ b/arch/riscv/include/asm/ffi.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_FFI_H
+#define _ASM_FFI_H
+
+#ifdef CONFIG_FDT_FW_INTERFACE
+extern void ffi_init(void);
+extern u64 riscv_acpi_rsdp(void);
+#else
+#define ffi_init()
+static inline u64 riscv_acpi_rsdp(void) { return 0; }
+#endif
+
+#endif /* _ASM_FFI_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 506cc4a9a45a..71831cf7f934 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_FDT_FW_INTERFACE)	+= ffi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
diff --git a/arch/riscv/kernel/ffi.c b/arch/riscv/kernel/ffi.c
new file mode 100644
index 000000000000..147d06a5acff
--- /dev/null
+++ b/arch/riscv/kernel/ffi.c
@@ -0,0 +1,38 @@
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
+static u64 acpi_rsdp;
+
+void __init ffi_acpi_root_pointer(void)
+{
+	u32 ffitbl, acpi, len;
+	fdt64_t *prop;
+
+	ffitbl = fdt_subnode_offset(initial_boot_params, 0, "ffitbl");
+	acpi = fdt_subnode_offset(initial_boot_params, ffitbl, "acpi");
+	prop = fdt_getprop_w(initial_boot_params, acpi, "entry", &len);
+	if (!prop || len != sizeof(u64)) {
+		pr_debug("acpi rsdp not found.\n");
+		return;
+	}
+	acpi_rsdp = fdt64_to_cpu(*prop);
+	pr_debug("acpi rsdp: %llx\n", acpi_rsdp);
+}
+
+u64 __init riscv_acpi_rsdp(void)
+{
+	return acpi_rsdp;
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
