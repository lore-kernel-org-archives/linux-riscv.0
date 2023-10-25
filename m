Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829D3C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvBGNVkII4/WoSlSEwmBJypiFidxf6xMvFRU53j8Xv8=; b=i0jAzv7M27QWye
	ciKQEEeOgV6/arSReH0cszw4z61zCsPI5j0bdB8UBN+nWFh2ssenvAioH2DCz0I+RLIC6GbcB4HOJ
	emkSh/pfonCpPNgxsxonc+VX8awHGjDw3ACNNqs1RnJeFiC7vKGtft/BUlSxOnzkN/uAWGPTlpBDs
	ktImtkXI9Dh21lAabWqfHsGYKxmNb2x+8v8LI4Nuc5vV2433mUewMTkIVHk6BZQVjOgX1TztfuqFI
	2+RNI6oOXT/0EnsCvrUOVpPxE1bLH+o45IIQBdrFQyl+veOWlMTlBp6btXkgm18CIPayIvfYiK4Va
	mzuqt1V1pSEQDm7PHALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRz-00D3ji-2t;
	Wed, 25 Oct 2023 20:25:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRR-00D3Ed-0q
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6b709048d8eso119766b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265524; x=1698870324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxxAoj3PrwWmIOe2p0tfNOdKkVyofyMHFnQehndBZcc=;
        b=ZvjV6u5qYBzO54sfnJSAcCeGV6JVHhc3qafmNrqC0As9eN910x3F5XziJrmJ3oGM11
         FocIw8FxcIUsou1D2SHVkoLDSS3Tt+gwrBenUEoGObw1qubkkkCa1Pg61Smg98uBiBg5
         q17P+HARgAzlks+88rQknWbUiP+/ZrdMok1u3006nlo+5TsA3RBMuP0KzPJqGguOfMyh
         DVQndDeZLAT4jtYxcTBKRJdNod78plMyiVW94RXwjJketIaKFOJolPWv0SojKEoDY5Ms
         CqyK+/Y41oev6nGmWL2LqxP+km8DoTMFiE9whNWoMkknNy7uZMloG/ejrp4YqBHKP8sd
         aIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265524; x=1698870324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxxAoj3PrwWmIOe2p0tfNOdKkVyofyMHFnQehndBZcc=;
        b=rXMM/kxoHP2JmWGkRdfCHqC5P9fxJWPw8jIjKO09lIpwqya21BIOirnwuc33VGBQpp
         3G7nS9IPb6rd/S92+zh1H6f8yLSu1fYO8mU5m/jx4v5y4ugpLx2D9BsZ+6n3u1Mlcpp1
         /0VzztfCbe3Z7JxEoGT5bpXPpBdFjb7tRBVmky+bU9JuKYNBXcDPqIgIdro7AIZC0if9
         Glon3T/bfJJ4fV/eSqcprcmgO5zEbpb76XsTdOIrxEZGhzopAIqDe0voHzF5K0x9u3Hp
         s9G7capOpenAJUhKfcB0NPUCTSYFUusdffA/AVXCZELAWhkOSLywUXpN2yL4W7GLAeCA
         xSSQ==
X-Gm-Message-State: AOJu0Yy12HNV56fRrez+7tjrsvaSKAUcMrzW9y0bKDvwgLn+Nm/yIMB0
	0J9EeKmRJ8rn8NwaQ18KABoVhA==
X-Google-Smtp-Source: AGHT+IFPlOatmRNqoaJdN/uiIc4rgGDuO2Pill7cAMn3lrtLqGzsWF+Wh7Mt4TtUqA866AzT4RiQHQ==
X-Received: by 2002:a05:6a00:2d9d:b0:6be:3fbc:763f with SMTP id fb29-20020a056a002d9d00b006be3fbc763fmr15860929pfb.13.1698265524617;
        Wed, 25 Oct 2023 13:25:24 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 13/21] irqchip: riscv-intc: Add ACPI support for AIA
Date: Thu, 26 Oct 2023 01:53:36 +0530
Message-Id: <20231025202344.581132-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132525_312689_D2D43068 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RINTC subtype structure in MADT also has information about other
interrupt controllers like MMIO. So, save those information and provide
interfaces to retrieve them when required by corresponding drivers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     |  19 ++++++
 drivers/irqchip/irq-riscv-intc.c | 102 ++++++++++++++++++++++++++++++-
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 8e10a94430a2..ef102b6fa86e 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,8 +12,27 @@
 
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
+#endif
+
 void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 
 struct fwnode_handle *riscv_get_intc_hwnode(void);
+int acpi_imsic_probe(struct fwnode_handle *parent);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index bab536bbaf2c..f3aaecde12dd 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/smp.h>
 #include <asm/hwcap.h>
+#include "../pci/pci.h"
 
 static struct irq_domain *intc_domain;
 
@@ -195,13 +196,100 @@ IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
 
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
@@ -218,7 +306,19 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn);
+	rc = riscv_intc_init_common(fn);
+	if (rc) {
+		irq_domain_free_fwnode(fn);
+		return rc;
+	}
+
+	/*
+	 * MSI controller (IMSIC) in RISC-V is optional. So, unless
+	 * IMSIC is discovered, set system wide MSI support as
+	 * unsupported. Once IMSIC is probed, MSI support will be set.
+	 */
+	pci_no_msi();
+	return 0;
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
