Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6CBC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFq5xDfBlg/DEI1vIOXpnF3QP5uJe/4ImKurILL8koI=; b=0EFc8Tu2nZ1pQZ
	1IJY/AIve5aWfChDL9Wne2atq3uGIpWQPGXn8iTpPs95EG58LMAF3iMeehsksjpTYtZBgMJB+jNIg
	ScU9Zzbizwa0XgWg5xCRynTkP255EmZIBwjgcBBPHguU7pAVL5NFkh7tQCKbL6K3TeoqA36Vka8gT
	6PdTzS/cNewcWeqM0IQDV4iitVeQxKE4D1UioPiN9jhYAaFJ0U74LM8sAbZVdz35vX0MwAOPjTx77
	pbryH7DhRF4JhSRwMPblGmsfBxpw6/UcliYfGpcjbZkCimC714fH+xn8PmuMPm3eahjtF75AnzrC1
	sjF5u3xW42C5vpS65x7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Dy-00000009V96-47ll;
	Wed, 01 May 2024 12:38:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28vq-00000009N64-2WxS
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ec4b2400b6so14639555ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565969; x=1715170769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz2b5NSEn3co4GBYyIFhq4o1B5yNhLUdwhxGlUjO5R4=;
        b=U9HksR+9+sN+J0AXIlYW5e38tM728CswrCka8gPlVvAqFiIL5cPb2b4znKaWkoae4H
         3iQFWbkk9qMh/Qwnr/MTJZHGaDUkEqkRlfTzgmCvC8WVh4RHeb0cNI2DRKD/Yc0w7vlo
         z8yxCTGF28J1dVslLTu70bSb5QF2CzMc4XUkp3wHGrWGnDrMPYBQLHkWfWX0A/20U+of
         IZW3HC7PSLWzi9OkR2VDqfPMbkv0VMeDaYIkb3iYX/JlRyk4P5gBILX/aclFT2yG0BkU
         Bo1sD6ckUDXZMCAAOKoMaP8Z5puCAcRJ5n3z7wyNHNlKbNGXhGjE8xEdElp3YnrlCcPm
         D27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565969; x=1715170769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dz2b5NSEn3co4GBYyIFhq4o1B5yNhLUdwhxGlUjO5R4=;
        b=AV/rpkAQSgntSWGLAjB5wVP6G7e/i4Nf2QSOTDUhHuDW0GJgq/zSLJ/v0fS+S2vohH
         Skp1qOxgZ2v5xHdUszaP4wmwvAfSw9L6WF8YjL5zyqnqXMUQZtVkREBBRwKaC4f1dJpX
         GYkBMZpNwiLIf405ukQ3uYWlQ+gvyQG1BSQnYVaF7X/KlkX035u1x3X3yw6NUG971IfD
         VK+tGTj7/QpcK/fm9KtL08cDlvPpssq3nWHW3cwRjN5ZJyTfgGqL+kN9IQ6spliE5seo
         h1E6Usqt8fEemEs96lVqm/4kDFtEbJ6682kTntrHzfSH3FW6T1gmiMPqDYnURxq4fdLP
         eWjw==
X-Forwarded-Encrypted: i=1; AJvYcCXTqRXXAg58EspTJOl/OF85MPM+9JBLAhabTZa6+pQxRAuzPh5WQ6s94bpY9L6ilJeLuCZZZXXDuubTbxgX+AFukIavczqTtldNc/d1uv/X
X-Gm-Message-State: AOJu0Yz4tRQFzcUqGRCUGX+KwrzHUlLM9h2ZyxPk7Yrdpuo+EVuS+0nU
	i8TP4/M0UoH9R8Tfy1E3MUrrlF9PK97ZhYuvazqH3LNITZyDsu4llu0GWu7i0g8=
X-Google-Smtp-Source: AGHT+IGuRwan9lf3M8PVSXZJfG+1Q3Prn5rtC3kcGZRvNV0TM+LqWfnB21N8buGjJXUbpyfls7vG+g==
X-Received: by 2002:a17:902:6506:b0:1e4:471f:2fa1 with SMTP id b6-20020a170902650600b001e4471f2fa1mr2381346plk.24.1714565969394;
        Wed, 01 May 2024 05:19:29 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 11/17] ACPI: RISC-V: Initialize GSI mapping structures
Date: Wed,  1 May 2024 17:47:36 +0530
Message-Id: <20240501121742.1215792-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051930_831422_5CC650CC 
X-CRM114-Status: GOOD (  20.47  )
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

RISC-V has PLIC and APLIC in MADT as well as namespace devices.
Initialize the list of those structures using MADT and namespace devices
to create mapping between the ACPI handle and the GSI ranges. This will
be used later to add dependencies.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  22 ++++++
 drivers/acpi/riscv/init.c    |   2 +
 drivers/acpi/riscv/init.h    |   4 +
 drivers/acpi/riscv/irq.c     | 142 +++++++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 drivers/acpi/riscv/init.h

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 8e10a94430a2..44a0b128c602 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -16,4 +16,26 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
 
+#ifdef CONFIG_ACPI
+
+enum riscv_irqchip_type {
+	ACPI_RISCV_IRQCHIP_INTC		= 0x00,
+	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
+	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
+	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+};
+
+int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
+			    u32 *id, u32 *nr_irqs, u32 *nr_idcs);
+struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi);
+
+#else
+static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
+					  u32 *id, u32 *nr_irqs, u32 *nr_idcs)
+{
+	return 0;
+}
+
+#endif /* CONFIG_ACPI */
+
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index 5f7571143245..22db97f7a772 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/acpi.h>
+#include "init.h"
 
 void __init acpi_riscv_init(void)
 {
+	riscv_acpi_init_gsi_mapping();
 }
diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
new file mode 100644
index 000000000000..0b9a07e4031f
--- /dev/null
+++ b/drivers/acpi/riscv/init.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/init.h>
+
+void __init riscv_acpi_init_gsi_mapping(void);
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index f56e103a501f..0473428e8d1e 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -7,6 +7,21 @@
 
 #include <linux/acpi.h>
 #include <linux/sort.h>
+#include <linux/irq.h>
+
+#include "init.h"
+
+struct riscv_ext_intc_list {
+	acpi_handle handle;
+	u32 gsi_base;
+	u32 nr_irqs;
+	u32 nr_idcs;
+	u32 id;
+	u32 type;
+	struct list_head list;
+};
+
+LIST_HEAD(ext_intc_list);
 
 static int irqchip_cmp_func(const void *in0, const void *in1)
 {
@@ -30,3 +45,130 @@ void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
 		return;
 	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
 }
+
+static void riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+	struct list_head *i, *tmp;
+
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
+		if (gsi_base == ext_intc_element->gsi_base) {
+			ext_intc_element->handle = handle;
+			return;
+		}
+	}
+
+	acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
+}
+
+int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
+			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+	struct list_head *i, *tmp;
+
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
+		if (ext_intc_element->handle == ACPI_HANDLE_FWNODE(fwnode)) {
+			*gsi_base = ext_intc_element->gsi_base;
+			*id = ext_intc_element->id;
+			*nr_irqs = ext_intc_element->nr_irqs;
+			if (nr_idcs)
+				*nr_idcs = ext_intc_element->nr_idcs;
+
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
+struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+	struct acpi_device *adev;
+	struct list_head *i, *tmp;
+
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
+		if (gsi >= ext_intc_element->gsi_base &&
+		    gsi < (ext_intc_element->gsi_base + ext_intc_element->nr_irqs)) {
+			adev = acpi_fetch_acpi_dev(ext_intc_element->handle);
+			if (!adev)
+				return NULL;
+
+			return acpi_fwnode_handle(adev);
+		}
+	}
+
+	return NULL;
+}
+
+static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
+					       u32 id, u32 type)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+
+	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
+	if (!ext_intc_element)
+		return -ENOMEM;
+
+	ext_intc_element->gsi_base = gsi_base;
+	ext_intc_element->nr_irqs = nr_irqs;
+	ext_intc_element->nr_idcs = nr_idcs;
+	ext_intc_element->id = id;
+	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	return 0;
+}
+
+static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
+						    void *context, void **return_value)
+{
+	acpi_status status;
+	u64 gbase;
+
+	if (!acpi_has_method(handle, "_GSB")) {
+		acpi_handle_err(handle, "_GSB method not found\n");
+		return AE_OK;
+	}
+
+	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
+		return AE_OK;
+	}
+
+	riscv_acpi_update_gsi_handle((u32)gbase, handle);
+	return AE_OK;
+}
+
+static int __init riscv_acpi_aplic_parse_madt(union acpi_subtable_headers *header,
+					      const unsigned long end)
+{
+	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
+
+	return riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources, aplic->num_idcs,
+					    aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
+}
+
+static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header,
+					     const unsigned long end)
+{
+	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
+
+	return riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
+					    plic->id, ACPI_RISCV_IRQCHIP_PLIC);
+}
+
+void __init riscv_acpi_init_gsi_mapping(void)
+{
+	/* There can be either PLIC or APLIC */
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_PLIC, riscv_acpi_plic_parse_madt, 0) > 0) {
+		acpi_get_devices("RSCV0001", riscv_acpi_create_gsi_map, NULL, NULL);
+		return;
+	}
+
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
+		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
