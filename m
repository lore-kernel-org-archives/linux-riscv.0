Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C5BCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mwa1haSWJx5gLPELUmABuBDoNSW4NHHmnbQsTMQzAHM=; b=kScuvq4wsT2Adl
	I1H34HxzUuAL2O/H7exQYBP++MkTNbaUJdKEiid54eqgqZozeIrSX0rV0hEnUebwfEQyPmjhz0+gM
	RgkOPl3QDxr42nuZVDr1sJEkAQbrFWJKt+0f856oyQ4DmaB53KFB7q/7VQB8o2AJpIntvwWuIEja3
	VXlkqA3BAyWy4BM2ajw2eYkpAAXHe7YNgIw0nlZKNse4VWGiyvnLpzWx9VXeD67GuM7RQt0VLBY7r
	8EIGEmR+jW97CY3eyqfKUe3vjlw2uiEMvW90jNrgFdCqqzFWa3w7foWTBWO6T9wcLkf196OT336El
	bwEbrS5/GPQMs8VOmPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnM-00AB0R-2y;
	Mon, 16 Oct 2023 16:50:20 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnJ-00AAz0-2f
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 16:50:19 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-57e40f0189aso2509482eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697475015; x=1698079815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=771urCD3ivMrGFxRwO6FF0bHhNMWlumN7WHUnj5mC2E=;
        b=C06tfosOTLoFMJAcdCQiqScQ9hL85IbKYlP2apQz6sIWSDR+c4BlIyMfDU2JW3VDil
         USGpJZHof/MEsKcbckjwjBAhbeSeyWxOgz/z5h++PbErYN8qe29K64vjuPP1No0Xb9BX
         HO3uhaeSiKkf0zVPwzpQ1BuaU2HQUEkci0hmP6nAIhoq9Lxx/lK2pR/frUJkEgghPjIo
         9BTulDPBQsOoC7DyOE6pT/d42h9B+s3VGuebQmpHMqq8vvSaUie12lmzJzjOpzByj99e
         VftjzmaJiuWnT/9M5LUpzhCtpaAoh5aKmNVFQ+ChubmyYO2QRCzL+RfZVZ2+qe9V3egw
         WnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475015; x=1698079815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=771urCD3ivMrGFxRwO6FF0bHhNMWlumN7WHUnj5mC2E=;
        b=bJOzbMjjew9b6A/V217VErafGqWhtFJMaw697+cSWHM9Hm6jq1LVFcmjR/EZPSD3xz
         R1/yPIePt3EChyfMm9INxLbdBrwOctvIk+BUZegWnZwepA2zZj0Ws9OLmlv3VsJLJHLa
         dee/Z0ZHTSycTEAjp6VsQSvtznb7YvlJRpxLkPqzHZulfiRlH3ZD7ebuHWAt0EEjqsQK
         w4oNxpZh389/LRwBQPvWYBgw9mdBGRWgU+8Plwhiu62yVv/gbiqAm0nPOyAki6Vr6pwj
         7oAZ0ST4SUDjb6vr98/gq3I3dUAJMFjn6ejvWujG/rQdT2hbXDAjzoEX+/c1V7Gv0DNl
         xz1Q==
X-Gm-Message-State: AOJu0YyfP+d90MWkGl5FqFfJxiqHzrSDHveuU5r2vuz+KE97B6sCgaHS
	LL/t+0LrrOumtevvajyswT7nlUGROaLcKOi4U4M=
X-Google-Smtp-Source: AGHT+IHj6pvcAY/EU6tBAGFPTeSDrRqJvly9AhUO9Z+1tZDpjcbVdOpa7xjrqxaz1DWdPrnVU3y4vw==
X-Received: by 2002:a05:6358:18:b0:164:a5c0:46ac with SMTP id 24-20020a056358001800b00164a5c046acmr18820773rww.21.1697475015175;
        Mon, 16 Oct 2023 09:50:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id t21-20020a056a0021d500b006b1e8f17b85sm111252pfj.201.2023.10.16.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:50:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 2/3] RISC-V: ACPI: RHCT: Add function to get CBO block sizes
Date: Mon, 16 Oct 2023 22:19:57 +0530
Message-Id: <20231016164958.1191529-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_095017_864391_EADFE206 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
Add support to read the CMO node in RHCT to get this information.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  6 +++
 drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index d5604d2073bc..7dad0cf9d701 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
 
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
+			     u32 *cboz_size, u32 *cbop_size);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
@@ -79,6 +81,10 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 	return -EINVAL;
 }
 
+static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
+					   u32 *cbom_size, u32 *cboz_size,
+					   u32 *cbop_size) { }
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index b280b3e9c7d9..105f1aaa3fac 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 
 static struct acpi_table_header *acpi_get_rhct(void)
 {
@@ -81,3 +82,95 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 
 	return -1;
 }
+
+static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
+					  struct acpi_rhct_hart_info *hart_info,
+					  u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
+{
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	struct acpi_rhct_node_header *ref_node;
+	struct acpi_rhct_cmo_node *cmo_node;
+	u32 *hart_info_node_offset;
+
+	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+	for (int i = 0; i < hart_info->num_offsets; i++) {
+		ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+					rhct, hart_info_node_offset[i]);
+		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
+			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
+						ref_node, size_hdr);
+			if (cbom_size && cmo_node->cbom_size <= 30) {
+				if (!*cbom_size) {
+					*cbom_size = BIT(cmo_node->cbom_size);
+				} else if (*cbom_size !=
+						BIT(cmo_node->cbom_size)) {
+					pr_warn("CBOM size is not the same across harts\n");
+				}
+			}
+
+			if (cboz_size && cmo_node->cboz_size <= 30) {
+				if (!*cboz_size) {
+					*cboz_size = BIT(cmo_node->cboz_size);
+				} else if (*cboz_size !=
+						BIT(cmo_node->cboz_size)) {
+					pr_warn("CBOZ size is not the same across harts\n");
+				}
+			}
+
+			if (cbop_size && cmo_node->cbop_size <= 30) {
+				if (!*cbop_size) {
+					*cbop_size = BIT(cmo_node->cbop_size);
+				} else if (*cbop_size !=
+						BIT(cmo_node->cbop_size)) {
+					pr_warn("CBOP size is not the same across harts\n");
+				}
+			}
+		}
+	}
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
+			     u32 *cboz_size, u32 *cbop_size)
+{
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	struct acpi_rhct_node_header *node, *end;
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_table_rhct *rhct;
+
+	if (acpi_disabled)
+		return;
+
+	if (table) {
+		rhct = (struct acpi_table_rhct *)table;
+	} else {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return;
+	}
+
+	if (cbom_size)
+		*cbom_size = 0;
+
+	if (cboz_size)
+		*cboz_size = 0;
+
+	if (cbop_size)
+		*cbop_size = 0;
+
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			acpi_parse_hart_info_cmo_node(rhct, hart_info, cbom_size,
+						      cboz_size, cbop_size);
+		}
+	}
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
