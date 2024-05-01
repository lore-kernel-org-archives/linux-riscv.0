Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B38CC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJHcIU6OXlVwl4a1R7Dze6CM5oY+2agA/KoYETkQ4uU=; b=xPFpOdIh6Pk79g
	7gnoEetLHSqdwVo3LA2E9hcu99tWZryJE7ZASpLtNJii2RFOQH+6jSBxFRkY8sCHGGowfX+gT7cfR
	IJx5saTVoHIpsgWrsfK7KwUJz4Mg8H7b+D3pW0g+XBKk36psUgwOpzeqHREc38eLVWwTOXR8GjMK0
	oHi9Vjm1t8S0YDEqAJ5SR00CdgrimvAqFtdGCsJnenMCAXi7AqCN8vDlAYAAY4UKomw6a5vBL/fCV
	k0SSLaNu2QFYadbUjP2B84hpQhTijSx92elY5ScGglUVU+36v0BUsdHtnps+MexJS5jvfAT7X/J3x
	vMIHYxjjPkrUeqyF6Sog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29EI-00000009VPo-0xAm;
	Wed, 01 May 2024 12:38:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28w5-00000009NF1-3ix9
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e5c7d087e1so57737405ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565985; x=1715170785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCPPOR1ckSAJZ1Ubedg9t4QsI9vLkLXGoLfn+9ixWV8=;
        b=lN6oaiemZWf1oSYTGicCr4xcmEL2j4pF8BHd/kd7vCPcPGPLBbPtb5M9PBELYiBL2r
         e/ixKQmBKL7yC3JvjrRjPLs7YAwKP/VAaxhCa4yIPrelZtxmKqx1dIA3sslhdTkshl7+
         rUW9XqNHSUCaWmloCekhkoa9fCuDe6KmRhFH3Yzf5dLlV6oDB5GNf2PZ3kj4zDm0eJN4
         z4CuWNb3NXLPKP5yWLkeYQ+koyuU8nYEkIINDa+u5NASOM2Ygm4h1aZ0S/H+18Xs8ZVR
         9C7D07xj2GjnJmmbBfsoXX75U+2SRLx6cIGW+evnzDNw8lpMr+Y+oFwbtIfmC+iIGfrn
         dLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565985; x=1715170785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCPPOR1ckSAJZ1Ubedg9t4QsI9vLkLXGoLfn+9ixWV8=;
        b=umi+i5ZaoYWnpb1425aGUIwEkvNIvp/Tc1bWKM+sIZ41GROlh9x7p9dqfcY+Bdt/g7
         cGrxciXsh5PSLuSAwtWrQt1RJnwsiDDtmmBsBc1rVYMstNn7BMZadAjcmRj4k/h2E25m
         mowjr40YHpQ/VYddklT4G3Q9zTnIfCCf4xkLU8osQEpVEF7BpC1AIu2um1wMy9oKqKo5
         4UgF3Uoiu7+ywc8bVxDmbb5rQCMPR5Ddh7MR/WrSbr2DQTJqNoJaq6caUIaErYjeD1rD
         lX3PKqsLFEwQes/zBNeYmfJ0pMigmtdXzPPXNHALLwrFJB459XFcNfUWuXkh3cCPtUYU
         hNfA==
X-Forwarded-Encrypted: i=1; AJvYcCWNbepNBBSucBde/ISzhyf+S/WMCslfNbT3P8DEjuFSup9gfMXBcdsmNGyi0Nba4EAT8KkglDQOVegcMebLEUXuNne19AX8kp2USbrVI0K6
X-Gm-Message-State: AOJu0YwXNsYN4+SUREc3ivSx+eC3xZqQA1ucNJ072Rar/DDrGBiGpUE1
	9j1RRxaKzW94Pvlq4psoyeZ6YDrxbHjeAbBKU4/Y4fJQQ1sVq4ih/mNdnPYs36s=
X-Google-Smtp-Source: AGHT+IFGyfzN/5kExRpukpNj4St1rBgfudB/pj+gt5M5G+xrt6pZdmPm+vpc0dav1zcXRIM1c0Qiiw==
X-Received: by 2002:a17:902:e841:b0:1eb:66b6:930b with SMTP id t1-20020a170902e84100b001eb66b6930bmr2252492plg.55.1714565984846;
        Wed, 01 May 2024 05:19:44 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:44 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 13/17] irqchip/riscv-intc: Add ACPI support for AIA
Date: Wed,  1 May 2024 17:47:38 +0530
Message-Id: <20240501121742.1215792-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051946_038517_74C9F926 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RINTC subtype structure in MADT also has information about other
interrupt controllers. Save this information and provide interfaces to
retrieve them when required by corresponding drivers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     |  35 +++++++++++
 drivers/irqchip/irq-riscv-intc.c | 102 ++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 44a0b128c602..6bd578b1ffc9 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -25,9 +25,22 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
 };
 
+/*
+ * The ext_intc_id format is as follows:
+ * Bits [31:24] APLIC/PLIC ID
+ * Bits [15:0] APLIC IDC ID / PLIC S-Mode Context ID for this hart
+ */
+#define APLIC_PLIC_ID(x) ((x) >> 24)
+#define IDC_CONTEXT_ID(x) ((x) & 0x0000ffff)
+
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs);
 struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi);
+int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid);
+int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid);
+void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts);
+int acpi_get_plic_context(u8 id, u32 idx, int *context_id);
+int __init acpi_get_imsic_mmio_info(u32 index, struct resource *res);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -36,6 +49,28 @@ static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi
 	return 0;
 }
 
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
+
+static inline int acpi_get_plic_context(u8 id, u32 idx, int *context_id)
+{
+	return -EINVAL;
+}
+
+static inline int __init acpi_get_imsic_mmio_info(u32 index, struct resource *res)
+{
+	return 0;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 9e71c4428814..af7a2f78f0ee 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -249,14 +249,105 @@ IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
 IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
 
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
+static struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi)
+{
+	return riscv_acpi_get_gsi_domain_id(gsi);
+}
 
 static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 				       const unsigned long end)
 {
-	struct fwnode_handle *fn;
 	struct acpi_madt_rintc *rintc;
+	struct fwnode_handle *fn;
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
@@ -273,7 +364,14 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn, &riscv_intc_chip);
+	rc = riscv_intc_init_common(fn, &riscv_intc_chip);
+	if (rc) {
+		irq_domain_free_fwnode(fn);
+		return rc;
+	}
+
+	acpi_set_irq_model(ACPI_IRQ_MODEL_RINTC, ext_entc_get_gsi_domain_id);
+	return 0;
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
