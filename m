Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C66ED7B97
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6txPozmkn7Dmiv9yJzhu+bxoImBpcrgC/WcxNqtMdI=; b=0QY2m5KpUPOB+7
	3WTQO4MDBC7bFMAVmKVmi1kejE/zfJ83xRiZelTqTjY/ClykDz7+oZbvhaKKoYNxrz6YvfVNCDswf
	upVXhL1hfOGW/pU09I5LTupgupr8HOjqhcmk62oDQQDQmIGWGFmfR5p5nfOrteIADaogH0PeOQzrZ
	SHYFIL2853XRo86Z01Pn0350ZjypbRStI1kzKRvdoJJT23LsIlxSa2mGPdQGoUWlOD3TvwDHw72Gh
	GjSvn0qH1ak0sTkS0uls+Tc7dOt8IKNaSFdWrU1YDT3EnmCROjdkABecpXT20cvmLcHecNIwvcHzk
	rJ8bKssVKlgKkDaJ6SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpV3-00000000RtC-3MHg;
	Wed, 15 Apr 2026 01:57:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUw-00000000Rma-3gP5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 01:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2D9044708;
	Wed, 15 Apr 2026 01:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E59AC2BCB5;
	Wed, 15 Apr 2026 01:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218218;
	bh=1kH1GVpiVdCP7JW4QCcx2t8NfCAlNAc+Qj0IksSz4Vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s5SwiuliF9oLykkmOqDjQh9plpUT9hBCf+TTB6spjBEmJojSRVxhTERR23+nsDF+C
	 EjnPqysoALlwR32tNLQjecaSyZTB2CQ1mWvQQ4Cg2B4sQcCzX6ZbJ7UyUUPgsdqA4y
	 eXPdD0S1J6AuGulMqhazLGPLDB1vEaz5ejVJxWb/PmpNdR5JexOoEHYTFn5qDJ60bN
	 yazF1wpBUEUuszm1DDut2q+nqKSkKbd1L6CP5FpCDGDj2g7MIfZ1OFis7WSnP4qIoD
	 I+m1ZqsuV0KE6wej8SYGa4y/ffyGB4ZUqHx9Us42tkKIBmgKuQAulTyrG2RWSzVGAz
	 wqKxPKdL3h0vA==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Apr 2026 18:54:04 -0700
Subject: [PATCH RFC v3 10/11] ACPI: RISC-V: Parse RISC-V Quality of Service
 Controller (RQSC) table
MIME-Version: 1.0
Message-Id: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-10-b3b2e7e9847a@kernel.org>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7087; i=fustini@kernel.org;
 h=from:subject:message-id; bh=1kH1GVpiVdCP7JW4QCcx2t8NfCAlNAc+Qj0IksSz4Vo=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTe+5DM52nC5XPYb3ZaSw67n9JlUWGfWuNzkh8thW92/
 ksWsOnrKGVhEONikBVTZNn0Ie/CEq/Qrwvmv9gGM4eVCWQIAxenAExEhI/hfwrXxkb5qrCkAn5L
 m9u37xrGJP9yf850T9/9Vsfa+11f1jP8U7+48KXHgccnQpNM7/Qxf9h5ffupW+taWFVicm0XfS2
 ZyQEA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185658_962976_60CD3564 
X-CRM114-Status: GOOD (  19.70  )
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

Add parser for the ACPI RQSC table which describes the capacity and
bandwidth QoS controllers in a system. For each table entry, allocate a
cbqri_controller struct and populate it with the controller type, MMIO
base address, RCID/MCID counts, and resource identifiers (cache ID for
capacity controllers, proximity domain for bandwidth controllers).

Cache controller cpumasks are resolved via
acpi_pptt_get_cpumask_from_cache_id(). Bandwidth controller cpumasks
are derived from the proximity domain's NUMA node. Controllers with
invalid addresses or failed cpumask lookups are skipped with a warning.

The populated controller list is consumed by qos_resctrl_setup() in
arch/riscv/kernel/qos/ to probe the hardware and register resctrl
domains.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                   |   1 +
 arch/riscv/include/asm/acpi.h |  10 ++++
 drivers/acpi/riscv/Makefile   |   1 +
 drivers/acpi/riscv/rqsc.c     | 136 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index af9698a16439..d5ec7d29bf11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22786,6 +22786,7 @@ S:	Supported
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos/
+F:	drivers/acpi/riscv/rqsc.c
 F:	include/linux/riscv_qos.h
 
 RISC-V RPMI AND MPXY DRIVERS
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..62296a2a519b 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -71,6 +71,16 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size);
+
+#ifdef CONFIG_RISCV_ISA_SSQOSID
+int __init acpi_parse_rqsc(struct acpi_table_header *table);
+#else
+static inline int acpi_parse_rqsc(struct acpi_table_header *table)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_RISCV_ISA_SSQOSID */
+
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 1284a076fa88..d7ae8729987a 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y					+= rhct.o init.o irq.o
+obj-$(CONFIG_RISCV_ISA_SSQOSID)		+= rqsc.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
 obj-$(CONFIG_ACPI_RIMT)			+= rimt.o
diff --git a/drivers/acpi/riscv/rqsc.c b/drivers/acpi/riscv/rqsc.c
new file mode 100644
index 000000000000..f647051be0bf
--- /dev/null
+++ b/drivers/acpi/riscv/rqsc.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Tenstorrent
+ *	Author: Drew Fustini <fustini@kernel.org>
+ */
+
+#define pr_fmt(fmt) "ACPI: RQSC: " fmt
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/riscv_qos.h>
+
+#define CBQRI_CTRL_SIZE 0x1000
+
+int __init acpi_parse_rqsc(struct acpi_table_header *table)
+{
+	struct acpi_table_rqsc *rqsc;
+	struct acpi_table_rqsc_fields *end;
+	struct acpi_table_rqsc_fields *node;
+	int err;
+	int num_controllers = 0;
+
+	rqsc = (struct acpi_table_rqsc *)table;
+
+	end = ACPI_ADD_PTR(struct acpi_table_rqsc_fields, rqsc, rqsc->header.length);
+
+	for (node = ACPI_ADD_PTR(struct acpi_table_rqsc_fields, rqsc,
+				 sizeof(struct acpi_table_rqsc));
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_table_rqsc_fields, node, node->length)
+	) {
+		struct cbqri_controller *ctrl;
+
+		if (node->length < sizeof(*node)) {
+			pr_err("malformed RQSC entry: length %u < %zu, aborting\n",
+			       node->length, sizeof(*node));
+			err = -EINVAL;
+			goto err_free_controllers;
+		}
+
+		ctrl = kzalloc_obj(*ctrl, GFP_KERNEL);
+		if (!ctrl) {
+			err = -ENOMEM;
+			goto err_free_controllers;
+		}
+
+		ctrl->type = node->type;
+		/* reg[1] is the MMIO base address per the RQSC table layout */
+		ctrl->addr = node->reg[1];
+		ctrl->size = CBQRI_CTRL_SIZE;
+		ctrl->rcid_count = node->rcid;
+		ctrl->mcid_count = node->mcid;
+
+		if (!ctrl->addr) {
+			pr_warn("skipping controller with invalid addr=0x0\n");
+			kfree(ctrl);
+			continue;
+		}
+
+		if (node->nres == 0) {
+			pr_warn("controller at %pa has no resource descriptors, skipping\n",
+				&ctrl->addr);
+			kfree(ctrl);
+			continue;
+		}
+
+		if (node->length < sizeof(*node) + sizeof(node->res[0])) {
+			pr_warn("controller at %pa: node too short for resource descriptor, skipping\n",
+				&ctrl->addr);
+			kfree(ctrl);
+			continue;
+		}
+
+		if (node->nres > 1)
+			pr_warn("controller at %pa has %u resource descriptors, using first\n",
+				&ctrl->addr, node->nres);
+
+		pr_debug("Found controller with type %u addr %pa size %pa rcid %u mcid %u\n",
+			 ctrl->type, &ctrl->addr, &ctrl->size,
+			 ctrl->rcid_count, ctrl->mcid_count);
+		if (ctrl->type == CBQRI_CONTROLLER_TYPE_CAPACITY) {
+			ctrl->cache.cache_id = (u32)node->res[0].id1;
+			ctrl->cache.cache_level =
+				find_acpi_cache_level_from_id(ctrl->cache.cache_id);
+
+			if (acpi_pptt_get_cache_size_from_id(ctrl->cache.cache_id,
+							     &ctrl->cache.cache_size)) {
+				pr_warn("failed to determine size for cache id 0x%x\n",
+					ctrl->cache.cache_id);
+				ctrl->cache.cache_size = 0;
+			}
+
+			pr_debug("Cache controller has ID 0x%x level %u size %u\n",
+				 ctrl->cache.cache_id, ctrl->cache.cache_level,
+				 ctrl->cache.cache_size);
+
+			/*
+			 * For CBQRI, any cpu (technically a hart in RISC-V terms)
+			 * can access the memory-mapped registers of any CBQRI
+			 * controller in the system.
+			 */
+			err = acpi_pptt_get_cpumask_from_cache_id(ctrl->cache.cache_id,
+								  &ctrl->cache.cpu_mask);
+			if (err) {
+				pr_warn("Failed to get cpumask for cache id 0x%x (%d), skipping\n",
+					ctrl->cache.cache_id, err);
+				kfree(ctrl);
+				continue;
+			}
+
+		} else if (ctrl->type == CBQRI_CONTROLLER_TYPE_BANDWIDTH) {
+			ctrl->mem.prox_dom = (u32)node->res[0].id1;
+			cpumask_copy(&ctrl->mem.cpu_mask,
+				     cpumask_of_node(pxm_to_node(ctrl->mem.prox_dom)));
+			pr_debug("Memory controller with proximity domain %u\n",
+				 ctrl->mem.prox_dom);
+		}
+
+		/* List shared with RISC-V QoS resctrl implementation */
+		list_add_tail(&ctrl->list, &cbqri_controllers);
+		num_controllers++;
+	}
+
+	pr_info("found %d CBQRI controllers\n", num_controllers);
+	return 0;
+
+err_free_controllers:
+	while (!list_empty(&cbqri_controllers)) {
+		struct cbqri_controller *ctrl;
+
+		ctrl = list_first_entry(&cbqri_controllers, struct cbqri_controller, list);
+		list_del(&ctrl->list);
+		kfree(ctrl);
+	}
+	return err;
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
