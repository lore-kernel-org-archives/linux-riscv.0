Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC36C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM0ChmbZN1wH63ytYjoDEapJt2JIWZOYHByrG0nmauQ=; b=wcnqB7PGVQyqdw
	oHwYELqmxLrO3ZgQWVWRzblG2B8ezcOhsz69Fe/T0sFtWwWAOGnqXs5uNRTa55KnzbOZ5L5UMD/Bh
	pp54Xs+C0T03kxcAUiac0X2Oi8tO15hPellbthuWgSeKDpQ+pJ3tturvPs4uHTPRFY6fbCOfaAn3V
	KcqbJcQQqC1ZX4u4ngbzWSb/AU/MFgvaimJxDyhTX6hqUmhaAHahLEKXk/yeBHJ+O5rTwVCbzCPNR
	0BQructlBJQ0Bets2l/fEyml9PdVRn1KWx1BYx/tdZzS/K70bWjZkpbMUvAQqoBgpjWj+tu8dr8Jm
	jEDNzN5TAh9eyhZfrQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPlG-00000009Dhu-2Itk;
	Mon, 15 Apr 2024 17:04:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjW-00000009CHK-1fc0
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tESHp1nipL9G+lPho1WiqoKvdd8aCfbVHrPrMY3qcLM=; b=dyXka9/c7X6mfJV2/7jdY9gR3g
	lrQ5RbgHc3HB6ZvTyCcb2bhDnfHjlfPofZGpQtBNzMCOXTJDZ7cChFvHCzrDqCWNNnrB6QDNiYDEY
	DhFCljG6vbLZRpjpGvHxsdxdqelBnNBdeJNamyKnvoVAY5+f3FDLEcSQ8NJvb7EykAAHoCSAlY8tk
	TzognwIKzzRX/81yZ4WYoJAv1ruXcbCRY2OHdMFspUoi8AKS6VMwyLjYgQYlwEXGAK9qA1WogP+kG
	Vso64AyNTlIybgwzI/aG0QYkBBtrnMaA8I52oQIKUOoK9x6p/c4mUMnMGlBA3W7U+cwcv6Rtb7841
	01kW6KdA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjQ-0000000AfY7-12dt
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:03:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2273439b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200577; x=1713805377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tESHp1nipL9G+lPho1WiqoKvdd8aCfbVHrPrMY3qcLM=;
        b=gS/GQ1+i6WuWWNYneimHlx9Y8do+AkuKAvtLpoK82JEhDdnBv82pMqypvX0peyKQai
         HYFJKGYUZWpsMNYUBTod2kA9rVRsb6Uu/QquHCpMvE6fntwOgp2jftXfYdZcqvYKvH/x
         LfT08Ts24IEV5/9LK6gPPOHb4VaMkA7+VfcslL5cxjtx8zTSHZq9rCpFZq6kBj5UmjMz
         ocHNgZ4JuRA/Go8HDrGpOlPrdekcvNtDOPLtmAfr28scSUs4PI3QEZ78GNDLwlTdgwks
         SifaCQaFrQJmF3EsMhvERC4MSz+6VGloBAIckHgfY+v6RPwfPQxbm2dYQ0IsrLuTS5Nk
         kETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200577; x=1713805377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tESHp1nipL9G+lPho1WiqoKvdd8aCfbVHrPrMY3qcLM=;
        b=YFI0W0ONdeI/p4iLVXB9DxZjaLxOffIxcqO37pfy1odLXfl4hPaNRCMU+LBTk2Lu38
         rFPZUHn0Cy8r9u7U9aSad7iode0JophuqyK4Jt2UwJgzyn6iRdzek2WUxu09Zhdp+8jP
         QDN4hcUTpO/qiBqmg69WG6yxeMwQUVlAMZh7Sl/BCwLV/xpHfjWT2UyRbbslrkPsJfWs
         bUrhqBj7svZNyX7iWIBR0WTMS1ny7JY8hiBSPT3+6P/yzJZTUeuT0oRs8wTwp7ceDsJZ
         c+YhVmMR8eTv3Tcysj5OdVt85GKR4w11r4qYv9Ck3HZh4zuxzuH7Vi//hguIwSE3O3KW
         7XlA==
X-Forwarded-Encrypted: i=1; AJvYcCVgPPcO7SfH/sIrlsG5A4PA5pYm7mUL9e6S0aKrUf0KzDhCI069LJVxaPSpm0OJvZ9iEox27CqFWGR2Srt1KpFEL4NpGMgALQGUs6MGzJGv
X-Gm-Message-State: AOJu0Yx1qQTPqWn54ATzFCxc2+Q8HAGLeQ26MqykbJkmaJhINaS1/SeX
	H9XNo0Dx7WU7iFVEEpzDfuGQ4S1jxKM4UfQ6T4wuf7xX8ku3igaVJG9lxgsp/5s=
X-Google-Smtp-Source: AGHT+IGv/kllMgrVV78cn82AbUpzbO7/wD1E9hz7AVE67lzYg6zXQKt3/FnejYjVAq0dkP07wI6buA==
X-Received: by 2002:a05:6a00:4611:b0:6ea:f3fb:26fe with SMTP id ko17-20020a056a00461100b006eaf3fb26femr305695pfb.12.1713200577636;
        Mon, 15 Apr 2024 10:02:57 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 14/20] irqchip: riscv-intc: Add ACPI support for AIA
Date: Mon, 15 Apr 2024 22:31:07 +0530
Message-Id: <20240415170113.662318-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180300_445911_32E7C41E 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RINTC subtype structure in MADT also has information about other
interrupt controllers. Save this information and provide interfaces to
retrieve them when required by corresponding drivers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     | 35 ++++++++++++
 drivers/irqchip/irq-riscv-intc.c | 97 +++++++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

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
index 9e71c4428814..b20272151aed 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -249,14 +249,101 @@ IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
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
@@ -273,7 +360,13 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn, &riscv_intc_chip);
+	rc = riscv_intc_init_common(fn, &riscv_intc_chip);
+	if (rc) {
+		irq_domain_free_fwnode(fn);
+		return rc;
+	}
+
+	return 0;
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
