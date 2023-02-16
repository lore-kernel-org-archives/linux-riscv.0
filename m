Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8600C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mWEHSR8FYpN1WhVDIpFs1HIPTgHJ12uTNvSdVRkszk=; b=KmExBALrjzdUxD
	ZeY8PAsAFhapke7oc5qd0tF8TaijjGuBCifs/Cn+r0GBvIRqRN9FNVyqG0W9s8tt1yUqZi9lfjH1f
	HS/Z3QhCG8Tc/pRpeXZ7vHZG4OEP71Qo0La+DJ1sU7okwus56zbZIkqt9xFU+gzj6gAqpQwo0LANk
	X8G/VkKHqnnDGIVpV79WfLymfzWmQnKmozxU51Qrn2riYUELxP0kEpIZHYtpNkSAHBSuTRVNxTPUo
	kzx6QzqLy4SFb8ZZFDc/CpGmBLYpjeaM1YH540DbSDXsYFRzBZv+xaFRp1LQsFOLnAbHel8mvBVOC
	t0JHZNQfPewd7PEV2A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisy-00BTkO-Io; Thu, 16 Feb 2023 18:21:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisw-00BTgY-74
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id w20-20020a17090a8a1400b00233d7314c1cso6702992pjn.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbqUdM0Np7Pk7D6Eh4B7c+w7Zw8p8e1vDp1GKV/olkQ=;
        b=Cxq4zjw6jiDo0nQwfwBieSzkX5YKjnoBEYHQiqtfjZyMdT4h+ntnTqUCdo5Wqdqta0
         ioZNZDx7RU8k2x6nUSYhWooOIkqR54fOtPJeGxRsVBAa2ZZhRP7TZhrr9owiZz2GGBHB
         WAJQzXBVDEFvJeqrn3TzwwT/s+EK3ralTgIMJ0mUMgjQLJLLfRkOGru9dJWPcJltXLjk
         LEOXzMqeDhuBiJAagG3w6+jB/nEB0QtgvXnzpPFKnRGFFfuF3aUeByZJIwKRfL+S7u02
         /+D1ANFIH2qVAGIRGe1SiPpvpVsX95nacHF8qpOzjqVvk+TuwDzE2mPhUyhw7eSnGm6q
         UGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbqUdM0Np7Pk7D6Eh4B7c+w7Zw8p8e1vDp1GKV/olkQ=;
        b=gKiJ//xKNiy/w8XmMX+Y8v9f0j2LP/gu4/Se2odTDgIdVQg7AXseFGvv/PnV3GVz5J
         1EsDglF89h5TFVdVsAhcmQW41R+OMMh87Yz1gzIfSaye9oynNfHaMHMa62ui8RXI9Die
         aL8FdilVjazLg/JoPYDM8Lsaq9apEOTbpju+2s8hkUQK5gY743deL+4yKObdltlB9lh9
         ByKt0JnDkhomcx9md3D/jJdkohuIqiZmi3679+9sx2KBYBTreCQcXukJAofi6xXElm/F
         eKtbOy35HtC+AaI5GRMHDZtA/3UHcvFXD0sNAXED6+pdHzA+KhvkBwSkkQB5J60KePkq
         UW8Q==
X-Gm-Message-State: AO0yUKWEzc5/3TWVkkuc+LFEokP5czHyReyVFf6cGR4I4noyfn819Dgh
	QrVLWc49B1Tn8Gje0YQEjBZPAg==
X-Google-Smtp-Source: AK7set92zVfUHWrg1/Q0sW3fQ8AVEVUXiUYMgvdI1LbFQ5T6RfJCH71VvejNUnOObpioR2uotsiGjw==
X-Received: by 2002:a05:6a20:4287:b0:c6:d742:681d with SMTP id o7-20020a056a20428700b000c6d742681dmr3527284pzj.12.1676571691092;
        Thu, 16 Feb 2023 10:21:31 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:30 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 08/21] drivers/acpi: RISC-V: Add RHCT related code
Date: Thu, 16 Feb 2023 23:50:30 +0530
Message-Id: <20230216182043.1946553-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102134_276050_C4741838 
X-CRM114-Status: GOOD (  21.99  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHCT is a new table defined for RISC-V to communicate the
features of the CPU to the OS. Create a new architecture folder
in drivers/acpi and add RHCT parsing code.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  9 ++++
 drivers/acpi/Makefile         |  2 +
 drivers/acpi/riscv/Makefile   |  2 +
 drivers/acpi/riscv/rhct.c     | 92 +++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 4a3622b38159..7bc49f65c86b 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -58,6 +58,15 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
+int acpi_get_riscv_isa(struct acpi_table_header *table,
+		       unsigned int cpu, const char **isa);
+#else
+static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
+				     unsigned int cpu, const char **isa)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..3fc5a0d54f6e 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_RISCV)		+= riscv/
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
new file mode 100644
index 000000000000..8b3b126e0b94
--- /dev/null
+++ b/drivers/acpi/riscv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y 	+= rhct.o
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
new file mode 100644
index 000000000000..5bafc236d627
--- /dev/null
+++ b/drivers/acpi/riscv/rhct.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022-2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#define pr_fmt(fmt)	"ACPI: RHCT: " fmt
+
+#include <linux/acpi.h>
+
+static void acpi_rhct_warn_missing(void)
+{
+	pr_warn_once("No RHCT table found\n");
+}
+
+static struct acpi_table_header *acpi_get_rhct(void)
+{
+	static struct acpi_table_header *rhct;
+	acpi_status status;
+
+	/*
+	 * RHCT will be used at runtime on every CPU, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!rhct) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			acpi_rhct_warn_missing();
+	}
+
+	return rhct;
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int acpi_cpu_id, const char **isa)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	struct acpi_table_rhct *rhct;
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_isa_string *isa_node;
+	u32 *hart_info_node_offset;
+	int i, j;
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+
+	if (acpi_disabled) {
+		pr_debug("%s: acpi is disabled\n", __func__);
+		return -1;
+	}
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (i = 0; i < rhct->node_count; i++) {
+		if (node >= end)
+			break;
+		switch (node->type) {
+		case ACPI_RHCT_NODE_TYPE_HART_INFO:
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (acpi_cpu_id != hart_info->uid)
+				break;
+			for (j = 0; j < hart_info->num_offsets; j++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+							rhct, hart_info_node_offset[j]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+								ref_node, size_hdr);
+					*isa = isa_node->isa;
+					return 0;
+				}
+			}
+			break;
+		}
+		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length);
+	}
+
+	return -1;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
