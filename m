Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6A1CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aYxHSvjzWdcYGqllnhVwJTXgGG4tRUYs6bhfSc/KqM=; b=TCVbBWj32WUHUr
	ZbivN06GxqzV21QaLxWF3jI1QPjVuiwWCOjcBDc0yn9BA9Nz+f/G+6RTnjUBGGFTffjnpKFlnK9r6
	yRSPdWqGGwUIqHoZbXOY/Wm5Cyonslbgta7b9Di5ps/qQxEnfwqU+22gTzzP3lfkTbQDiGKb9MYSn
	43T0QG0VDEmZvxnI+28Uahj9NSNPknk8p1m73aO5YabELV2MYdrEbXMsnD/Q3YeywRFUj6Ubs+Ndz
	unjwHgL4sX3NUAuRPscRIkb0KW1VKfhWupYuGRJf5JBZHLl308A93wTeiYmq+rb5FbqTi/nLbJNS0
	5nCHTj6Wr5x9Sixnx+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qh-00Egat-2L;
	Wed, 18 Oct 2023 12:40:31 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qe-00EgZB-2c
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:40:30 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57bc2c2f13dso3830691eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697632826; x=1698237626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTW8kyBICRbc9yF0k81A432uuMoCKuaw9w1HIRoraUU=;
        b=DGKxykXG9SojzeZrLpGX07IfTPAWUtMiE9DyFxQKMR+Dtx5UPu6AQ02DeE7JUoy2FV
         0rwCmc3XmK84yYREoEsH42aehog+z/HYh5KMFYlxt3YqRi5KTKLOnr2QBZ7kxV+t6Eom
         2ke6wmUURRWw/ptYICNc9PN87I92ZHar1eWuNuJozerq3P37HaUATAmx6VDh4AhUfNWO
         JlD1xkCuxIsYoUGJedoqVLp3z8XyX6IdzJfCRSXP3+QpZoeH1pI8qoeqXaFtDmtOr6rS
         3CdyUdb1GpdfeuYK1L+sXiubNQau5wHTYsEcgt/4NMXIVitufFzOtOlR/P3kYsKjvLKg
         k/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632826; x=1698237626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTW8kyBICRbc9yF0k81A432uuMoCKuaw9w1HIRoraUU=;
        b=lMleTiFEKkiCtdmytlNdo08aPwkSdkq90fSVRpzvyAHLeMtsxhe0CsJ0TKuS6HGDQs
         acDKH7LnzlNyNGLlJ2M3cd21CBKlr0W96vWp0Yjysnf5FOql9djKlKgAua4eW5bIOccK
         k883U3xZkQP+1ovCjUPnnq1G1PqUiP+4Voi+a7f4zWulon1fysW21RurFpT91LcpwvTh
         jmUpTjNBzTGtBRZvBw2M0YrIvdhPMqI2KmGXf5NWQwLa8mWItdXCD0WjmZ5OdzVV6VXc
         f1cPPPGR+fcSBCaTvFd5o9ScjMiXTFfTHfqWApZXkmxI2bYksLG3kO0tWf7Uf2tadOR7
         GSKw==
X-Gm-Message-State: AOJu0YxbTDurnYyT5bqpkCEP4R+Y3XLfb61KtU/lQEshbfNTYIbmSeOK
	O4i3lO8Yip4buNywn/XPkXItURMr9LAuCacfdBU=
X-Google-Smtp-Source: AGHT+IE+m2EHBJN9d3qCsG5KnmCBnxr+6J1AHtmLSj7QaF3/j+hOqrsvoHsCY29ami4VGt/j4ba8eg==
X-Received: by 2002:a05:6358:c608:b0:143:96e0:5bef with SMTP id fd8-20020a056358c60800b0014396e05befmr4870648rwb.4.1697632825171;
        Wed, 18 Oct 2023 05:40:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id w190-20020a6382c7000000b005891f3af36asm1599267pgd.87.2023.10.18.05.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:40:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 -next 3/4] RISC-V: ACPI: RHCT: Add function to get CBO block sizes
Date: Wed, 18 Oct 2023 18:10:06 +0530
Message-Id: <20231018124007.1306159-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
References: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_054028_854601_04F8AC84 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
Add support to read the CMO node in RHCT to get this information.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  6 +++
 drivers/acpi/riscv/rhct.c     | 87 +++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

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
index 489b0e93b1e5..caa2c16e1697 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 
 static struct acpi_table_rhct *acpi_get_rhct(void)
 {
@@ -81,3 +82,89 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 
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
+				if (!*cbom_size)
+					*cbom_size = BIT(cmo_node->cbom_size);
+				else if (*cbom_size != BIT(cmo_node->cbom_size))
+					pr_warn("CBOM size is not the same across harts\n");
+			}
+
+			if (cboz_size && cmo_node->cboz_size <= 30) {
+				if (!*cboz_size)
+					*cboz_size = BIT(cmo_node->cboz_size);
+				else if (*cboz_size != BIT(cmo_node->cboz_size))
+					pr_warn("CBOZ size is not the same across harts\n");
+			}
+
+			if (cbop_size && cmo_node->cbop_size <= 30) {
+				if (!*cbop_size)
+					*cbop_size = BIT(cmo_node->cbop_size);
+				else if (*cbop_size != BIT(cmo_node->cbop_size))
+					pr_warn("CBOP size is not the same across harts\n");
+			}
+		}
+	}
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions (and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory.
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
+		rhct = acpi_get_rhct();
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
