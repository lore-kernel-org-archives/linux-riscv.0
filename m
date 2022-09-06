Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E00C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFNVoNAy/N7MZBwEYNq+reOmDOk2pU/B8KSXqJ9tOUA=; b=THiXHs4cw+XaY+
	fye05pxyAxE6bOxwsGsUqNmhgfbx9O2R6otiVMyg2BFepRWoi41Ik50iS4q/s9tahWqF409IzfMBB
	uv+my1BXzkdG56vg7jKd81I2Fh/GPzoY+0jtzPJjy7zuZsstTttkSJj8grjt/oqfe6X+zCV1IuC3z
	ICh7sip5sPh5hZO7lBjcdDBElGGiEGkvYcrVcpsf7OMjeI8TfRgiYP6ub3q9g4RpJQD5hLcKepnUj
	yIrXaxUTjwcwY9rlXDJFemmgU0jDFYJ9LhYtnt2ULDAkCfOtqH1zViEqM7w2SgS6I+iPqhThyeYt/
	zptkCu+LHO423zUQjP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVip-00CNiE-4p; Tue, 06 Sep 2022 10:22:23 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVii-00CNai-Vi
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 10:22:19 +0000
X-IronPort-AV: E=Sophos;i="5.93,293,1654527600"; 
   d="scan'208";a="131840223"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Sep 2022 19:22:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B43B42174C1;
	Tue,  6 Sep 2022 19:22:09 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <Conor.Dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure the PMA regions
Date: Tue,  6 Sep 2022 11:21:53 +0100
Message-Id: <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_032217_165834_EE8681D4 
X-CRM114-Status: GOOD (  21.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest.

Below are the memory attributes supported:
* Device, Non-bufferable
* Device, bufferable
* Memory, Non-cacheable, Non-bufferable
* Memory, Non-cacheable, Bufferable
* Memory, Write-back, No-allocate
* Memory, Write-back, Read-allocate
* Memory, Write-back, Write-allocate
* Memory, Write-back, Read and Write-allocate

This patch adds support to configure the memory attributes of the
memory regions as passed from the core node. Currently the OpenSBI code
implements support for "Memory, Non-cacheable, Non-bufferable" option
with SBI_EXT_ANDES_SET_PMA.

More info about PMA (section 10.3):
http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note: the current implementation only supports "Memory, Non-cacheable,
Bufferable" option.
---
 arch/riscv/Kbuild                      |  2 +
 arch/riscv/include/asm/sbi.h           |  1 +
 arch/riscv/vendors/Makefile            |  3 +
 arch/riscv/vendors/andes/Makefile      |  3 +
 arch/riscv/vendors/andes/ax45mp.c      | 93 ++++++++++++++++++++++++++
 arch/riscv/vendors/andes/include/sbi.h | 27 ++++++++
 6 files changed, 129 insertions(+)
 create mode 100644 arch/riscv/vendors/Makefile
 create mode 100644 arch/riscv/vendors/andes/Makefile
 create mode 100644 arch/riscv/vendors/andes/ax45mp.c
 create mode 100644 arch/riscv/vendors/andes/include/sbi.h

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index afa83e307a2e..d6821f660fc3 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -5,6 +5,8 @@ obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
+obj-y += vendors/
+
 obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
 
 # for cleaning
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 2a0ef738695e..10a7c855d125 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -37,6 +37,7 @@ enum sbi_ext_id {
 
 	/* Vendor extensions must lie within this range */
 	SBI_EXT_VENDOR_START = 0x09000000,
+	SBI_EXT_ANDES = 0x0900031E,
 	SBI_EXT_VENDOR_END = 0x09FFFFFF,
 };
 
diff --git a/arch/riscv/vendors/Makefile b/arch/riscv/vendors/Makefile
new file mode 100644
index 000000000000..0a5a5541d2a3
--- /dev/null
+++ b/arch/riscv/vendors/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_ARCH_R9A07G043) += andes/
diff --git a/arch/riscv/vendors/andes/Makefile b/arch/riscv/vendors/andes/Makefile
new file mode 100644
index 000000000000..60fa8226c4a3
--- /dev/null
+++ b/arch/riscv/vendors/andes/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_ARCH_R9A07G043) += ax45mp.o
diff --git a/arch/riscv/vendors/andes/ax45mp.c b/arch/riscv/vendors/andes/ax45mp.c
new file mode 100644
index 000000000000..931cba754f41
--- /dev/null
+++ b/arch/riscv/vendors/andes/ax45mp.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AX45MP setup
+ * - PMA
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of.h>
+
+#include <asm/sbi.h>
+
+#include "include/sbi.h"
+
+#define ANDES_AX45MP_MAX_PMA_REGIONS	16
+
+struct pma_arg_t {
+	phys_addr_t offset;
+	unsigned long vaddr;
+	size_t size;
+	size_t entry_id;
+};
+
+static long sbi_set_pma(void *arg)
+{
+	phys_addr_t offset = ((struct pma_arg_t *)arg)->offset;
+	unsigned long vaddr = ((struct pma_arg_t *)arg)->vaddr;
+	size_t entry_id = ((struct pma_arg_t *)arg)->entry_id;
+	size_t size = ((struct pma_arg_t *)arg)->size;
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);
+
+	return ret.value;
+}
+
+static unsigned long cpu_nocache_area_set(unsigned long start,
+					  unsigned long size,
+					  unsigned long entry_id)
+{
+	struct pma_arg_t pma_arg;
+	unsigned long ret = 0;
+
+	pma_arg.offset = start;
+	pma_arg.size = size;
+	pma_arg.vaddr = start + size;
+	pma_arg.entry_id = entry_id;
+	ret = sbi_set_pma(&pma_arg);
+
+	return ret;
+}
+
+static void ax45mp_configure_pma_regions(struct device_node *np, int count)
+{
+	u64 start, size;
+	unsigned int i;
+
+	for (i = 0 ; i < count ; i++) {
+		of_property_read_u64_index(np, "pma-regions", (i << 1), &start);
+		of_property_read_u64_index(np, "pma-regions", (i << 1) + 1, &size);
+		cpu_nocache_area_set(start, size, i);
+	}
+}
+
+static const struct of_device_id ax45mp_ids[] = {
+	{ .compatible = "andestech,ax45mp" },
+	{ /* sentinel */ }
+};
+
+static int __init ax45mp_init(void)
+{
+	struct device_node *np;
+	int count;
+
+	np = of_find_matching_node(NULL, ax45mp_ids);
+	if (!np)
+		return -ENODEV;
+
+	count = of_property_count_elems_of_size(np, "pma-regions",
+						sizeof(u32) * 4);
+	if (count < 0)
+		return 0;
+
+	if (count > ANDES_AX45MP_MAX_PMA_REGIONS)
+		return -EINVAL;
+
+	ax45mp_configure_pma_regions(np, count);
+
+	return 0;
+}
+arch_initcall(ax45mp_init);
diff --git a/arch/riscv/vendors/andes/include/sbi.h b/arch/riscv/vendors/andes/include/sbi.h
new file mode 100644
index 000000000000..6dcd215bb5f8
--- /dev/null
+++ b/arch/riscv/vendors/andes/include/sbi.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __RISCV_ANDES_SBI_H
+#define __RISCV_ANDES_SBI_H
+
+enum sbi_ext_andes_fid {
+	SBI_EXT_ANDES_GET_MCACHE_CTL_STATUS = 0,
+	SBI_EXT_ANDES_GET_MMISC_CTL_STATUS,
+	SBI_EXT_ANDES_SET_MCACHE_CTL,
+	SBI_EXT_ANDES_SET_MMISC_CTL,
+	SBI_EXT_ANDES_ICACHE_OP,
+	SBI_EXT_ANDES_DCACHE_OP,
+	SBI_EXT_ANDES_L1CACHE_I_PREFETCH,
+	SBI_EXT_ANDES_L1CACHE_D_PREFETCH,
+	SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE,
+	SBI_EXT_ANDES_WRITE_AROUND,
+	SBI_EXT_ANDES_SET_PMA,
+	SBI_EXT_ANDES_FREE_PMA,
+	SBI_EXT_ANDES_PROBE_PMA,
+	SBI_EXT_ANDES_DCACHE_WBINVAL_ALL,
+	SBI_EXT_ANDES_GET_MICM_CTL_STATUS,
+	SBI_EXT_ANDES_GET_MDCM_CTL_STATUS,
+	SBI_EXT_ANDES_GET_MMSC_CTL_STATUS,
+	SBI_EXT_ANDES_GET_MISA_CTL_STATUS,
+};
+
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
