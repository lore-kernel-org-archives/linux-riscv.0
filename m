Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A3C25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BlXgetF1Fi3EM6/X9S4DsnXPU191VoSIlZhcX81fkU=; b=RAsbaLQRxQmepX
	NFLnRMRxoH7ru91eqF8G86fv9EhJPDDk4UOddEzQUzHRQr8/PBVVIPwtf5dzUjXtyBNl/7CL6m7Tn
	yRQ6pCEzjoZmGi6B/G7dkO7vILs9VfCxI5BMN2AScOPQ8gXigoMA0+V2y9V6Awv+avCj+Y0qz04+f
	HpMsNX4KuLxnYj2ZREjcxmHcCXGOIKkVu+5iOZaDNCoOzwmjbV74HIIpPvAy191aa1w9CeWHQlXWe
	LnW639fPgjHtZpZxtNpD1KRs8r4L/wR9EkKywLqz1WSR74oo4EeEj/bfdXKnQNhlIo3lnzrtna5RR
	18qHbyEw3wrY3elwl4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDRPe-0000000CwOB-2f88;
	Sat, 01 Jun 2024 16:16:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJ0-0000000CpgI-0kKT
	for linux-riscv@bombadil.infradead.org;
	Sat, 01 Jun 2024 15:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ix1ya63KBdI8Z0XgPmU9L/YxtTKVM9YoT3mmPmDGYrI=; b=dyjWoKFiNF7DHmgCR0Yo8O4wwb
	RFJ0cGENNmNNy6zIWNAsXsPwRkJ9Qs8+WXZUefH5vWbyFqLDwyiDAVWHMfCMZYCeGrzPQPAT0ZVpl
	hZA0nX/h29M+XyQDW1JcrUdc/xAEDnJXlcnXWYWGxOPcVhZWRFo5dpN0Yonfyy3dLPRJwTTGqPxVY
	qe5sl/VF6E/AUHMxRhKrhrvYYEDNojVnx8I7/gwrNMWf8WHDHjARJ2jNX1FDqW7LnX9Olc3lMQEb1
	oD4zFB8AfF0NngrTLUN2sqoa0tI/WPtBX5m0ZCCAgMkuTiAyEoJT9E/0a3U4+tCFE5skqjk8mvDCZ
	lvQuZ+qw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIu-0000000F3Y8-3P9I
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:06:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70255d5ddb8so447156b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254354; x=1717859154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix1ya63KBdI8Z0XgPmU9L/YxtTKVM9YoT3mmPmDGYrI=;
        b=YlpP2p6JVb5vcE95gsxtpAy/jDlR/K+z1ok655N5DdvohqQeqMdryORN4GlkhKR97w
         StdPm7L5wjU1VHhggrdF5nufMUbD3POvfWT/wlRLAyhYf8bgLRBjWPcWZyl9bJkyHuoo
         Anct1l0wE+7quSQaPkibqLKXVKnSRJro5H4bn86gmZciwoHXSgX5WtVYQqrzQCJAlASr
         x77Gpr3engv4xec20e66A0zYKPlXvic0kNQ4zdr7S9AKbAMUkW7DuOansc0vTFwcUmOf
         ysbBUcS5zwo29kXSd11kFKdKjZ5e/+SBuAKBIVBrj1dZyE2gGEIybjwuMTioIgVlkku0
         sprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254354; x=1717859154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix1ya63KBdI8Z0XgPmU9L/YxtTKVM9YoT3mmPmDGYrI=;
        b=PnlZYJ5MJZ0E0cJuvswoM1KRnsHIAs1ZfaiYsRW8VyfI8o5YrWTqf4JjZzHsDZvvMK
         jqctx7MArE6pcaS5XBDZXGFql1MOwadtoM6oe/80W8CjBRwI4ftCsFZNa24n/zl+5tFJ
         KKNOYhkz5IH2CLlcVWKxTjzriHGi5Utxn8INFdiibBs1CDqhNwHBYBPu4Qt3ZomRkn/8
         57pEHnKAVjCgurwS6IEnF4p89liigKS1RjkJLIau2XaGBMM2qZSLjzH89Q6vGPcKM92/
         vG9bLfPap3uiQACL8EUeBRXvNxkb4NOKsoUZh3c41zNPPiXrNLSFU36Jyx0+MHlayasv
         R3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbhOgSrmiN+qne9+fb7aQa6In+Ha5iRO++PxA0WbOc7PYOcKYqj16Y8++Kn2cpfgcncW2XMr4jeaC5hOfiPV7Qn4gGQ71BIRZ+AghkNsA
X-Gm-Message-State: AOJu0YxhBjZG5Xn125sd0DTdP5vu6Q5i0yA+8uYMIfmX6lDELZD8uiUw
	x3uK8LGjj1+/ZXN4u4xJJJaAPrEMHN/Je+huz64xGoeBQ5fihGX5i132Uif9Ra4=
X-Google-Smtp-Source: AGHT+IFPfDTfjt04oqk3q/MnI8wec/rdNH1fBWtlh1LZy3yCp1vhuEJfNDXv5tm5xoTuwiRZpnV72g==
X-Received: by 2002:a05:6a20:914e:b0:1af:4ea2:5424 with SMTP id adf61e73a8af0-1b26f20d7e3mr5216779637.33.1717254353608;
        Sat, 01 Jun 2024 08:05:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:52 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 13/17] irqchip/riscv-intc: Add ACPI support for AIA
Date: Sat,  1 Jun 2024 20:34:07 +0530
Message-Id: <20240601150411.1929783-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_160557_390645_0F1530C1 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RINTC subtype structure in MADT also has information about other
interrupt controllers. Save this information and provide interfaces to
retrieve them when required by corresponding drivers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     | 33 ++++++++++++
 drivers/irqchip/irq-riscv-intc.c | 90 ++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 44a0b128c602..51d86f0b80d2 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,6 +12,8 @@
 
 #include <asm-generic/irq.h>
 
+#define INVALID_CONTEXT UINT_MAX
+
 void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
@@ -28,6 +30,11 @@ enum riscv_irqchip_type {
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs);
 struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi);
+unsigned long acpi_get_intc_index_hartid(u32 index);
+unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id, unsigned int ctxt_idx);
+unsigned int acpi_get_plic_nr_contexts(unsigned int plic_id);
+unsigned int acpi_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx);
+int __init acpi_get_imsic_mmio_info(u32 index, struct resource *res);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -36,6 +43,32 @@ static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi
 	return 0;
 }
 
+static inline unsigned long acpi_get_intc_index_hartid(u32 index)
+{
+	return INVALID_HARTID;
+}
+
+static inline unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id,
+							    unsigned int ctxt_idx)
+{
+	return INVALID_HARTID;
+}
+
+static inline unsigned int acpi_get_plic_nr_contexts(unsigned int plic_id)
+{
+	return INVALID_CONTEXT;
+}
+
+static inline unsigned int acpi_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx)
+{
+	return INVALID_CONTEXT;
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
index 4f3a12383a1e..3c6494f1cb02 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -250,6 +250,85 @@ IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
 
 #ifdef CONFIG_ACPI
 
+struct rintc_data {
+	union {
+		u32		ext_intc_id;
+		struct {
+			u32	context_id	: 16,
+				reserved	:  8,
+				aplic_plic_id	:  8;
+		};
+	};
+	unsigned long		hart_id;
+	u64			imsic_addr;
+	u32			imsic_size;
+};
+
+static u32 nr_rintc;
+static struct rintc_data *rintc_acpi_data[NR_CPUS];
+
+#define for_each_matching_plic(_plic_id)				\
+	unsigned int _plic;						\
+									\
+	for (_plic = 0; _plic < nr_rintc; _plic++)			\
+		if (rintc_acpi_data[_plic]->aplic_plic_id != _plic_id)	\
+			continue;					\
+		else
+
+unsigned int acpi_get_plic_nr_contexts(unsigned int plic_id)
+{
+	unsigned int nctx = 0;
+
+	for_each_matching_plic(plic_id)
+		nctx++;
+
+	return nctx;
+}
+
+static struct rintc_data *get_plic_context(unsigned int plic_id, unsigned int ctxt_idx)
+{
+	unsigned int ctxt = 0;
+
+	for_each_matching_plic(plic_id) {
+		if (ctxt == ctxt_idx)
+			return rintc_acpi_data[_plic];
+
+		ctxt++;
+	}
+
+	return NULL;
+}
+
+unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id, unsigned int ctxt_idx)
+{
+	struct rintc_data *data = get_plic_context(plic_id, ctxt_idx);
+
+	return data ? data->hart_id : INVALID_HARTID;
+}
+
+unsigned int acpi_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx)
+{
+	struct rintc_data *data = get_plic_context(plic_id, ctxt_idx);
+
+	return data ? data->context_id : INVALID_CONTEXT;
+}
+
+unsigned long acpi_get_intc_index_hartid(u32 index)
+{
+	return index >= nr_rintc ? INVALID_HARTID : rintc_acpi_data[index]->hart_id;
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
@@ -258,6 +337,15 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	int rc;
 
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
@@ -277,6 +365,8 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	rc = riscv_intc_init_common(fn, &riscv_intc_chip);
 	if (rc)
 		irq_domain_free_fwnode(fn);
+	else
+		acpi_set_irq_model(ACPI_IRQ_MODEL_RINTC, riscv_acpi_get_gsi_domain_id);
 
 	return rc;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
