Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3823CC7EE33
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSTAh6S2Kw6J7yNDXOFP8aYvjhQkFCEY0sna9jtZMV0=; b=K6jUUczsDzcIiH
	LJIL8AMP14mjOz5FWnQMwEvSs6LYmKaLS/7VlK/NualDUA75+csYop7AmJIzofYpVVJvHWVoT3Lu1
	/BH64lAlf1mLPA49WQclpJtMz6A5FmTXYBHsww47lgFdG8Sy9435xI8yqaVS2vaSPCXekN5yF6Oik
	/ROZYn+JprJ0umKoA63pw1TKrAQAkUVqSvoyh+wKKXvdMWqmxOXTwQGlM6ajPh0J7Ghz+F4wnSr64
	53+If2EJPBOuXIvoAeUSCSKOBpkWv+MFovpBWBeGIWaPHRlWd5aFimGn7SkmHYgGfAiNTb4xVq87s
	EnzuQd2mve7xAhXU2Ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bP-006TJ2-2o; Fri, 03 Mar 2023 13:37:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bL-006TFi-K1
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ce8-20020a17090aff0800b0023a61cff2c6so2331910pjb.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opcZr20KXnvjkMyYCnmLSprA9lMTCGLgPDByb/r4X5s=;
        b=mtzaNcwoSWZ2THe7xcnYYt5QhCkxYSo4IxDPTx+lG0bTgHRFtucUZNL51ojDh9AWu9
         vEcId8l/V/zh4jvkNUvpbgqoOjOsPbfdKImES2Go/YeBLVrpG5oYeQ/lQCZkEF2uXK2c
         MjqPdiE0kPZTnU9tUxmo4telqISKQlR7XnnEeKiGwRqOWBMJg6uiaHJ/ENIpzDtIS6PO
         t6QqvyuBVKc86/DZJyUpqaVcojXTvgFIOToasxlqS3jo1j+tLlof5fBo2mr1FZh50u+x
         pX8+7mWVclwO/7i8jtSR3mRPGEuSIiwdFsFkKRiLwYpPYEp02IU2KZTwyzo4I+xf6hsr
         UKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opcZr20KXnvjkMyYCnmLSprA9lMTCGLgPDByb/r4X5s=;
        b=vcIlaxW/Vm9tB4P3/Wke0BLapq7DFzoPpLTYNX6PmglYX/oyI8HuxvyU3LbJDznGMn
         Tqa9qL4Srm9wIs4Z3Pn8aRIeMk5FY7l/5/Be4D78H7FxQdxioGINghDPkt2E3LuKgQt5
         qQf+dHF4x8Wjhy5iG6ZBU9uR9Mwn0idkFODDPOAtAllYQ6wdP3AxV9oPBODz1XpnWqEE
         sI3D813ZGZsCvBTSy9JX/6Tal720Dg5psGx7LF7srAaLhvf00O91qGLyvTa3Y/CMZbGT
         4TeHrCP+BUYmMKZgkkf31uCfhZnzf/+rx7MeyNLYhdSRCpU0C3PepefyTimnQImRc2Hy
         9Bpg==
X-Gm-Message-State: AO0yUKUIZeFa95N/OoDFtx1X2p7SobbS4R8pQstLREcbmzjM4syfHUfN
	YfOMZneLghRKQ5HcOUxphB/9jwoSAOo/jrZj
X-Google-Smtp-Source: AK7set+1HrloMyO8BRm2y/LxLgXwnKeSr9YjJYgH6JZlVLfiI+fDzQ/yDPXEdZKuYrmB6Wl8jmxtjw==
X-Received: by 2002:a17:903:492:b0:19e:700c:b6e0 with SMTP id jj18-20020a170903049200b0019e700cb6e0mr1771788plb.35.1677850654089;
        Fri, 03 Mar 2023 05:37:34 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:33 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 08/20] drivers/acpi: RISC-V: Add RHCT related code
Date: Fri,  3 Mar 2023 19:06:35 +0530
Message-Id: <20230303133647.845095-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053735_688475_025EF232 
X-CRM114-Status: GOOD (  20.90  )
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

RHCT is a new table defined for RISC-V to communicate the
features of the CPU to the OS. Create a new architecture folder
in drivers/acpi and add RHCT parsing code.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  9 ++++
 drivers/acpi/Makefile         |  2 +
 drivers/acpi/riscv/Makefile   |  2 +
 drivers/acpi/riscv/rhct.c     | 82 +++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 7671c401f4ec..111a8ed10af1 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -59,6 +59,15 @@ static inline bool acpi_has_cpu_in_madt(void)
 
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
index 000000000000..2e2aeb7cae49
--- /dev/null
+++ b/drivers/acpi/riscv/rhct.c
@@ -0,0 +1,82 @@
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
+		if (ACPI_FAILURE(status)) {
+			pr_warn_once("No RHCT table found\n");
+			return NULL;
+		}
+	}
+
+	return rhct;
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, NULL may be passed in order to use the cached table.
+ */
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int acpi_cpu_id, const char **isa)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_isa_string *isa_node;
+	struct acpi_table_rhct *rhct;
+	u32 *hart_info_node_offset;
+
+	BUG_ON(acpi_disabled);
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (acpi_cpu_id != hart_info->uid)
+				continue;
+
+			for (int i = 0; i < hart_info->num_offsets; i++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+							rhct, hart_info_node_offset[i]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+								ref_node, size_hdr);
+					*isa = isa_node->isa;
+					return 0;
+				}
+			}
+		}
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
