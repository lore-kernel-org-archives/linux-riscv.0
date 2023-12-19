Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C8C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxWPl1ae9wNJVsWKKKY0NxlJCO5WsnJDaXB19J7r8RY=; b=TWMhuUplyTXuT8
	CXRCwvbOXpbFtM/oMecpLkcOPTU0BZzwh4K5b6Ha3V3H0r9ngZyeg7xredP84XPPNSDyaRiPR9cDp
	CDIpZ8yRhcsZGKxZgc0iUJWY1Si9DwenjHyNSvTbX4Y00glnur2OjRXlF0m+fBtNGdsk/MsHVe7BL
	hZMHsqyJTRojjEA9qEoxjMS6EoeI7UxMI+NgmlS3ydjVrGviTOzjcRyolGnBkhD3yHI1DGMTzBzyM
	a/wcyOURPKRyv2fzuyY9lERZhqZjDoohYDErwnDHptmyQHk0QVz/0oZDw+PafdhX2PjsYPLuvmIOE
	Y4qnM0qRnaqxvGH9VsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAt-00F15N-1d;
	Tue, 19 Dec 2023 17:46:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAk-00F0wW-0c
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3eae5c1d7so1010605ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007985; x=1703612785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M2Ttr5IEog4zhXC7a0v2EI78vgaHJj9cNeT2PJ69Bo=;
        b=Y3RSIfrBC3iKdfocYvvYb/ODXsg8I1tmuwfi/APmUtG0jaO2dk3rczC5VPgJKZBGTi
         1jOgjk5YWS2EfC3VuviyEjd7Ja2SLkK77fyHPAphSNDzNjCCwZpWAzmxTn+iXUfyjXzT
         IM+HqBngbKHAQ3VR/ySPkOTBxOaP8OL98+7l086bU2aYP5h8eP05ikupd2UF6YNfCVw9
         bW7r/3KrQiGCVwZm9SbCGsl5BpHxMrG0nzHQsbHC5IHr4ZBgbenHrkBELn3w3cBUHrdC
         37Bc9LZC7pQi8Zvtd6ZIIkryG08GexXQJftFo18lsPpcSsDl4UEdoyIydq3D/kvfjDD5
         GFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007985; x=1703612785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M2Ttr5IEog4zhXC7a0v2EI78vgaHJj9cNeT2PJ69Bo=;
        b=B+McY/yPHIvaqCRNsP3QtB5cH4Cn4yLWf8nWK/vKq2++aelGQC2zhef70jOnNUwpHC
         U1aLZNpZpigvB4pFcowVRo24nfRdUaUQYAIk7ZPlqNvvlkt35v0IANp3heJJ/R5ylcY8
         V9sNXLamz++5FPLYm3p8GPe7gLj4CL840rEYQEWn1I8SCFD+9lyaQ4tSkC21YZOhBURP
         Na4rUVsPTmmkRi3zRri31J6xwfEOFYZj7QD1MP/KqGnEoriTfc/nLYH/HPGVq3H8rgMi
         lgIgz5y2dOh3MbrgARH4QLiXXTXqFRuIkaj0ds6kMBHWg+dtHvdubPU8cOSnd0+OnlKR
         i2jg==
X-Gm-Message-State: AOJu0YxA5YdnzQZRSSsf7oNWIkwoM2dxqfrNOUoM7rtAVtMf/lL+iuIk
	2jOTZND8YiGHzT2j9aNHHe6F5A==
X-Google-Smtp-Source: AGHT+IEAjjn9pf8/hId5Sa4wpo1o7XJP2RBbztVfkHUMJTgjzPp06dL2QyNaPuDgFCe0l/XzTMzF2g==
X-Received: by 2002:a17:903:98c:b0:1d3:e786:ab05 with SMTP id mb12-20020a170903098c00b001d3e786ab05mr648299plb.39.1703007985615;
        Tue, 19 Dec 2023 09:46:25 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:25 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 09/17] irqchip: riscv-intc: Add ACPI support for AIA
Date: Tue, 19 Dec 2023 23:15:18 +0530
Message-Id: <20231219174526.2235150-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094626_241107_3E2EB4D1 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RINTC subtype structure in MADT also has information about other
interrupt controllers. Save this information and provide interfaces to
retrieve them when required by corresponding drivers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     | 45 +++++++++++++++
 drivers/irqchip/irq-riscv-intc.c | 95 +++++++++++++++++++++++++++++++-
 2 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 8e10a94430a2..232314e5f007 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,8 +12,53 @@
 
 #include <asm-generic/irq.h>
 
+#ifdef CONFIG_ACPI
+
+/*
+ * The ext_intc_id format is as follows:
+ * Bits [31:24] APLIC/PLIC ID
+ * Bits [15:0] APLIC IDC ID / PLIC S-Mode Context ID for this hart
+ */
+#define APLIC_PLIC_ID(x) ((x) >> 24)
+#define IDC_CONTEXT_ID(x) ((x) & 0x0000ffff)
+
+int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid);
+int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid);
+void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts);
+int acpi_get_plic_context(u8 id, u32 idx, int *context_id);
+int __init acpi_get_imsic_mmio_info(u32 index, struct resource *res);
+
+#else
+static inline struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi)
+{
+	return NULL;
+}
+
+static inline int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid)
+{
+	return -EINVAL;
+}
+
+static inline int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid)
+{
+	return -EINVAL;
+}
+
+static inline void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts) { }
+static inline int acpi_get_plic_context(u8 id, u32 idx, int *context_id)
+{
+	return -EINVAL;
+}
+
+static inline int __init acpi_get_imsic_mmio_info(u32 index, struct resource *res)
+{
+	return -EINVAL;
+}
+#endif
+
 void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
+int acpi_imsic_probe(struct fwnode_handle *parent);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index bab536bbaf2c..24bbc5bfc30f 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -195,13 +195,100 @@ IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
 
 #ifdef CONFIG_ACPI
 
+struct rintc_data {
+	u32 ext_intc_id;
+	unsigned long hart_id;
+	u64 imsic_addr;
+	u32 imsic_size;
+};
+
+static u32 nr_rintc;
+static struct rintc_data *rintc_acpi_data[NR_CPUS];
+
+int acpi_get_intc_index_hartid(u32 index, unsigned long *hartid)
+{
+	if (index >= nr_rintc)
+		return -1;
+
+	*hartid = rintc_acpi_data[index]->hart_id;
+	return 0;
+}
+
+int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid)
+{
+	int i, j = 0;
+
+	for (i = 0; i < nr_rintc; i++) {
+		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id) {
+			if (idx == j) {
+				*hartid = rintc_acpi_data[i]->hart_id;
+				return 0;
+			}
+			j++;
+		}
+	}
+
+	return -1;
+}
+
+void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts)
+{
+	int i, j = 0;
+
+	for (i = 0; i < nr_rintc; i++) {
+		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id)
+			j++;
+	}
+
+	*nr_contexts = j;
+}
+
+int acpi_get_plic_context(u8 id, u32 idx, int *context_id)
+{
+	int i, j = 0;
+
+	for (i = 0; i < nr_rintc; i++) {
+		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id) {
+			if (idx == j) {
+				*context_id = IDC_CONTEXT_ID(rintc_acpi_data[i]->ext_intc_id);
+				return 0;
+			}
+
+			j++;
+		}
+	}
+
+	return -1;
+}
+
+int acpi_get_imsic_mmio_info(u32 index, struct resource *res)
+{
+	if (index >= nr_rintc)
+		return -1;
+
+	res->start = rintc_acpi_data[index]->imsic_addr;
+	res->end = res->start + rintc_acpi_data[index]->imsic_size - 1;
+	res->flags = IORESOURCE_MEM;
+	return 0;
+}
+
 static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 				       const unsigned long end)
 {
 	struct fwnode_handle *fn;
 	struct acpi_madt_rintc *rintc;
+	int rc;
 
 	rintc = (struct acpi_madt_rintc *)header;
+	rintc_acpi_data[nr_rintc] = kzalloc(sizeof(*rintc_acpi_data[0]), GFP_KERNEL);
+	if (!rintc_acpi_data[nr_rintc])
+		return -ENOMEM;
+
+	rintc_acpi_data[nr_rintc]->ext_intc_id = rintc->ext_intc_id;
+	rintc_acpi_data[nr_rintc]->hart_id = rintc->hart_id;
+	rintc_acpi_data[nr_rintc]->imsic_addr = rintc->imsic_addr;
+	rintc_acpi_data[nr_rintc]->imsic_size = rintc->imsic_size;
+	nr_rintc++;
 
 	/*
 	 * The ACPI MADT will have one INTC for each CPU (or HART)
@@ -218,7 +305,13 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn);
+	rc = riscv_intc_init_common(fn);
+	if (rc) {
+		irq_domain_free_fwnode(fn);
+		return rc;
+	}
+
+	return 0;
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
