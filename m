Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F51D46BFE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjDDAsZYLMB7fTkf0i6WXduxwCYFdZjyRCuvpyncouo=; b=anc8CjEtUAVemQ
	gJUmakjo+DogwPuF42VdxisDRaPcsHPrlBog27UK9QQW2IBEuhS2ErQmlIsve/BF832OYLmI1DLP1
	mz406vNTcgldLD93vSptz9Eh8PPM6WV+I/qnEeHsY1sd71m9pTx+DF3qI2FN6qG8gWlnfuZ4GNgaD
	tiTvHDQwVANwfEX0/g21l7s82QdGwiZtBFDUceczMt+24ULpA1EVrcgaGFFVm3oZ3j3F90BKkjcJv
	pagEDAMEzr3Qb/Gp/GtiDdGaCJq03L5QuA8weH/b+ud/b6CPZHskbqn6uU575ht2eVPq5KGr3mk+N
	xjOz1jhlerCx8MeYRQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9P-0000000GkM9-1fz2;
	Wed, 28 Jan 2026 20:28:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC96-0000000Gk3G-2976
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62E1444538;
	Wed, 28 Jan 2026 20:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB782C16AAE;
	Wed, 28 Jan 2026 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632092;
	bh=/31EreH53ZbfLgFROUgaazBzJSVsVuqJTT5oOs7SCjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ucbNnildD1YQ95dVxpJ2kkQXeMWx+bA6Mc2FsARgFcVczjwggyqCOcgGWKsjXfec0
	 51D6f5QPatAMeAu9Vw6HX+6MRLWkyyK6yzpjQQlivsYVrTrYieeOmAAYjkYpC6njYK
	 K7NE0shSt3timYgnt9sBnvphGh2hQP16PqKuqTDkVV3H2wkYDF5c/dL9sHxeiHygKF
	 6QL+fgFZpGiBtC1RH0UUPAzxFv/9qe2Nje7LN9WU+3iv6g+cZCTL5ZvPakAArH+9Lp
	 9GlN8ysBJm1zNmO5ChhjFmzSnxiSs0gdkJhnT9j7aw0P+nGRKD/uKtDX9+BI2hS/q1
	 dAoFoM2VcjExQ==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:37 -0800
Subject: [PATCH RFC v2 16/17] acpi: riscv: Parse RISC-V Quality of Service
 Controller (RQSC) table
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-16-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
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
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5705; i=fustini@kernel.org;
 h=from:subject:message-id; bh=/31EreH53ZbfLgFROUgaazBzJSVsVuqJTT5oOs7SCjM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQZGmc3dXWH840Dfap/on9x8wdaVnnOLfHdbrlfoZ
 HF8f8W3o5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCRfdsZGf7cnRk68dAd/agJ
 ifslzvismBv8apVhxuS3PauDbFtSvs9mZOgQt1u7wGulryvHyoVrpmtsZF2jVzO1cZL8hI91bI+
 mqnABAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122812_614044_B4AC35CE 
X-CRM114-Status: GOOD (  21.62  )
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

Add driver to parse the ACPI RISC-V Quality of Service Controller (RQSC)
table which describes the capacity and bandwidth QoS controllers in a
system. The QoS controllers implement the RISC-V Capacity and Bandwidth
Controller QoS Register Interface (CBQRI) specification.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                   |   1 +
 arch/riscv/include/asm/acpi.h |  10 ++++
 drivers/acpi/riscv/Makefile   |   2 +-
 drivers/acpi/riscv/rqsc.c     | 112 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ead357a634..e96a83dc9a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22512,6 +22512,7 @@ S:	Supported
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos/
+F:	drivers/acpi/riscv/rqsc.c
 F:	include/linux/riscv_qos.h
 
 RISC-V RPMI AND MPXY DRIVERS
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..16c6e25eed1e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -71,6 +71,16 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size);
+
+#ifdef CONFIG_RISCV_ISA_SSQOSID
+int acpi_parse_rqsc(struct acpi_table_header *table);
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
index 1284a076fa88..cf0f38c93a9f 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o init.o irq.o
+obj-y					+= rhct.o rqsc.o init.o irq.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
 obj-$(CONFIG_ACPI_RIMT)			+= rimt.o
diff --git a/drivers/acpi/riscv/rqsc.c b/drivers/acpi/riscv/rqsc.c
new file mode 100644
index 000000000000..a86ddb39fae4
--- /dev/null
+++ b/drivers/acpi/riscv/rqsc.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Tenstorrent
+ *	Author: Drew Fustini <fustini@kernel.org>
+ *
+ */
+
+#define pr_fmt(fmt) "ACPI: RQSC: " fmt
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/riscv_qos.h>
+
+#ifdef CONFIG_RISCV_ISA_SSQOSID
+
+#define CBQRI_CTRL_SIZE 0x1000
+
+static struct acpi_table_rqsc *acpi_get_rqsc(void)
+{
+	static struct acpi_table_header *rqsc;
+	acpi_status status;
+
+	/*
+	 * RQSC will be used at runtime on every CPU, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!rqsc) {
+		status = acpi_get_table(ACPI_SIG_RQSC, 0, &rqsc);
+		if (ACPI_FAILURE(status)) {
+			pr_warn_once("No RQSC table found\n");
+			return NULL;
+		}
+	}
+
+	return (struct acpi_table_rqsc *)rqsc;
+}
+
+int acpi_parse_rqsc(struct acpi_table_header *table)
+{
+	struct acpi_table_rqsc *rqsc;
+	int err;
+
+	BUG_ON(acpi_disabled);
+	if (!table) {
+		rqsc = acpi_get_rqsc();
+		if (!rqsc)
+			return -ENOENT;
+	} else {
+		rqsc = (struct acpi_table_rqsc *)table;
+	}
+
+	for (int i = 0; i < rqsc->num; i++) {
+		struct cbqri_controller_info *ctrl_info;
+
+		ctrl_info = kzalloc(sizeof(*ctrl_info), GFP_KERNEL);
+		if (!ctrl_info)
+			return -ENOMEM;
+
+		ctrl_info->type = rqsc->f[i].type;
+		ctrl_info->addr = rqsc->f[i].reg[1];
+		ctrl_info->size = CBQRI_CTRL_SIZE;
+		ctrl_info->rcid_count = rqsc->f[i].rcid;
+		ctrl_info->mcid_count = rqsc->f[i].mcid;
+
+		pr_info("Found controller with type %u addr 0x%lx size  %lu rcid  %u mcid  %u",
+			ctrl_info->type, ctrl_info->addr, ctrl_info->size,
+			ctrl_info->rcid_count, ctrl_info->mcid_count);
+
+		if (ctrl_info->type == CBQRI_CONTROLLER_TYPE_CAPACITY) {
+			ctrl_info->cache.cache_id = rqsc->f[i].res.id1;
+			ctrl_info->cache.cache_level =
+				find_acpi_cache_level_from_id(ctrl_info->cache.cache_id);
+
+			struct acpi_pptt_cache *cache;
+
+			cache = find_acpi_cache_from_id(ctrl_info->cache.cache_id);
+			if (cache) {
+				ctrl_info->cache.cache_size = cache->size;
+			} else {
+				pr_warn("%s(): failed to determine size for cache id 0x%x",
+					__func__, ctrl_info->cache.cache_id);
+				ctrl_info->cache.cache_size = 0;
+			}
+
+			pr_info("Cache controller has ID 0x%x level %u size %u ",
+				ctrl_info->cache.cache_id, ctrl_info->cache.cache_level,
+				ctrl_info->cache.cache_size);
+
+			/*
+			 * For CBQRI, any cpu (technically a hart in RISC-V terms)
+			 * can access the memory-mapped registers of any CBQRI
+			 * controller in the system.
+			 */
+			err = cpumask_parse("FF", &ctrl_info->cache.cpu_mask);
+			if (err)
+				pr_err("Failed to convert cores mask string to cpumask (%d)", err);
+
+		} else if (ctrl_info->type == CBQRI_CONTROLLER_TYPE_BANDWIDTH) {
+			ctrl_info->mem.prox_dom = rqsc->f[i].res.id1;
+			pr_info("Memory controller with proximity domain %u",
+				ctrl_info->mem.prox_dom);
+		}
+
+		/* Fill the list shared with RISC-V QoS resctrl */
+		INIT_LIST_HEAD(&ctrl_info->list);
+		list_add_tail(&ctrl_info->list, &cbqri_controllers);
+	}
+
+	return 0;
+}
+
+#endif /* CONFIG_RISCV_ISA_SSQOSID */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
