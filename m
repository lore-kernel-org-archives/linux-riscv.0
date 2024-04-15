Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C26FC00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9KzKdPF1Hl/pLjf2DqPckQmapDu5As6S1W1VSQ1z9g=; b=CA2TdfOKcEd9QA
	hbJpOT3UKOz+FPS9XHleGAXM5qrhdx2507F+7E6FE3suTOao79KUhUVl+8WOHeSbsgA9/1tdIG7gH
	sRH8JmB7G+Oiu9WJncTXRCkjZEsC1A8WXyOoZzI4wIc/SPNJ1V6ljQbKYGoJzl1QAsUV3mEgICFMK
	gum4Jzo6FQBj0NrliyzYtHQPMzPx4jRZmmeDGoEmC4FwuhHdFkLAsEB0jH4nI3KBVTAvX5oXFkV2z
	PAJ6cS4J1uEyIHZ8PyqSO6256Ww3KxAYE2xKTao0N9St8FZM4t3IWvISMXDy2SFrzNpAWkC1innb5
	aQlposUR+7lb0wQM67UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPkR-00000009Cyl-0sTq;
	Mon, 15 Apr 2024 17:04:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPj5-00000009BvV-3gB6
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qa8aPZaBb5SHnjDhwNe5AO6s82EyT//Q/0nqKZneQ7s=; b=YzAEF/2OIfULkXa8veXw9nKJN8
	rfeitZUcQVDna7dHbzlx4sqtwyynrNTCXu0L8ZkOJwGosobz5quRjRg2TBQPt9OMwHH/iNVC2YepH
	kJfMMUJuFEBdlsNcDL/QmwPFxizkN86QlcnlkCQq/WqUB5m1nwM9tA59xIofLH+jbhVzUW7JXaOz1
	OM4Tum6o/9dDPcmzPBKXyZ0rR1I8+weh98M0k9VxBki9H1jeQCNvQyH7md9NMTY5zBHstEH1e1xed
	hM9O9E09ht9zMa9KgCJBi2LGZkefkzAVZG66jdfaie72BXjc3zx3wc61YoSivYLxWBpNvXhFoV3y9
	Q3frZKQA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiy-0000000AfVr-0KWv
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ee12766586so2243921b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200551; x=1713805351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa8aPZaBb5SHnjDhwNe5AO6s82EyT//Q/0nqKZneQ7s=;
        b=B4CpJZdIqgAT1EweGtJUFNDeOLQlb1q3b8qX8GTq6KQ1//u1uQo1WldFZ1K1B9roL8
         0A3rMnmCreUcRet0abEWVb0rciS7NgEXlhV6cUMkIvbi3reJzDyKDLGpDnT+WE5JT/Dp
         i7q8ZPxgB2uaPkOd7l1CAilwIHAa6yN49PYaPChmY1chdhL0swRPvHFawSjIiWB/sSrj
         iqKEsSfMbcvzq1VjCjmnV7OmHsmwkUEcQLHARVfX/CuKl6DChEt4le50sod+BWP5CZ3n
         IiLONH/NaRtQGrNPZc4vcODHVnKepxRAV1QG2uDMRxyWQA7KYqIeci/4/7CygfeeHnEX
         kXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200551; x=1713805351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa8aPZaBb5SHnjDhwNe5AO6s82EyT//Q/0nqKZneQ7s=;
        b=wlAQQREi2bcyjf/NMJXfD74gTwZR97x0JDAlg1lZbVeg7XQa7d2eFB1WNNFPDmIiIs
         dNjK/Ltnq39LtCAUmCLZnewEMFlCLsATHmrT0LpXdf/1+UUmnGm9MgxLsD/5FGAQrpSC
         6f8al3u4QDUn6dasmZwAY4uMSRxb0U8cBHd4v1PMzi2kGhshllQ0krAWN3+GVQMa5i/t
         ISh3vifXudUgAlfweSBnIsptWrlO+IBzEEcFWFRWRme6wvn8fxXjYV1TbN1u25CbpeFB
         i+Awb+sn8C7JDbuHnjEjjGCZCkTFYMatyOPi/ERtSUTdCljp8IruQy7J5YIKbRy9mFZy
         lATQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcRfDgvxc4skiaaGl1z4t1Swu5DUXvgq6y7od2HbIENEtxhCEUEfvs8HqmimMAm3c4gePSy7khFE8LA2XilWAvuGpPUdLcqTEF2tgPaQys
X-Gm-Message-State: AOJu0YxyiDRS/HKWHgaWNpEiz8x2nyMzS4iROULKbo+EMRUXufac1HK1
	OLaugQME2O4+H7ZhWvQNOVNUWP/NfYq9LXJ6bSewp43PDVhpUvHoiIKaKW+03Mw=
X-Google-Smtp-Source: AGHT+IGeXHiOC0F13RXgbWt688j7t9WtlnZZWw2iOK4tJHmoNhJ03Rmp2MstRb1M8cWB8bLvffMYEA==
X-Received: by 2002:a05:6a00:c88:b0:6ec:e21b:24f with SMTP id a8-20020a056a000c8800b006ece21b024fmr288145pfv.10.1713200550215;
        Mon, 15 Apr 2024 10:02:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:29 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 10/20] RISC-V: ACPI: Initialize GSI mapping structures
Date: Mon, 15 Apr 2024 22:31:03 +0530
Message-Id: <20240415170113.662318-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180232_232177_A47C2AF5 
X-CRM114-Status: GOOD (  19.42  )
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

RISC-V has PLIC and APLIC in MADT as well as namespace devices.
Initialize the list of those structures using MADT and namespace devices
to create mapping between the ACPI handle and the GSI ranges. This is
will be used later to add dependencies.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  22 +++++
 drivers/acpi/riscv/init.c    |   2 +
 drivers/acpi/riscv/init.h    |   4 +
 drivers/acpi/riscv/irq.c     | 159 +++++++++++++++++++++++++++++++++++
 4 files changed, 187 insertions(+)
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
index b5807bbdb171..56780af6ceb3 100644
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
index 000000000000..2a488ec684b9
--- /dev/null
+++ b/drivers/acpi/riscv/init.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/init.h>
+
+int __init riscv_acpi_init_gsi_mapping(void);
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 36e0525b3235..de0f1ba92068 100644
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
@@ -30,3 +45,147 @@ void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
 		return;
 	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
 }
+
+static int riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+	struct list_head *i, *tmp;
+
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
+		if (gsi_base == ext_intc_element->gsi_base) {
+			ext_intc_element->handle = handle;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+	struct list_head *i, *tmp;
+
+	list_for_each_safe(i, tmp, &ext_intc_list) {
+		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
+		if (gsi >= ext_intc_element->gsi_base &&
+		    gsi < (ext_intc_element->gsi_base + ext_intc_element->nr_irqs))
+			return ext_intc_element->handle;
+	}
+
+	return NULL;
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
+		return -1;
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
+	if (!acpi_has_method(handle, "_GSB"))
+		return AE_OK;
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
+	riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources,
+				     aplic->num_idcs, aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
+	return 0;
+}
+
+static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header,
+					     const unsigned long end)
+{
+	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
+
+	riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
+				     plic->id, ACPI_RISCV_IRQCHIP_PLIC);
+	return 0;
+}
+
+int __init riscv_acpi_init_gsi_mapping(void)
+{
+	int count = 0;
+
+	count = acpi_table_parse_madt(ACPI_MADT_TYPE_PLIC, riscv_acpi_plic_parse_madt, 0);
+	if (count <= 0) {
+		acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0);
+		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+		return 0;
+	}
+
+	acpi_get_devices("RSCV0001", riscv_acpi_create_gsi_map, NULL, NULL);
+	return 0;
+}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
