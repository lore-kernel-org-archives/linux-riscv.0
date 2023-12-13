Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A5CC10DCE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 07:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyNb7S/3nPtQpnBxoEFz6aRB4GAA9fVTed2ij8WZEyY=; b=W7YMgbvNE0UT87
	S620JyrUJ/WM2ddCBvJhdIqxEzeUyETYVEkVGpKc1XsECBTkFYcNiMGWWCuEN9VAY/v6bCFtXoeth
	d7O83joIrURaHxeTHvMd1PksfbrzsizD2UEnNjW5V9e/nr8RR7Eljzs59dCOrVVHDDUilzgURIwf7
	8cPuBT6H8o3KfeOOJPM+/Rv5Rj6gNRYGOPzgsyHIrPAnySnpsDHI7xEv0pvVTv1IL/4e3SsGWxBch
	uqtkiblFKbrKgH/ZIVBNkHDBhfKGk5gI7nq+ut9ClR1aUyx0ih1XaJm+44w8GzzsTboffXQQI9Lcy
	ya/1yNzjWZsg/hC+AdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJIM-00DrUV-08;
	Wed, 13 Dec 2023 07:04:38 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJI6-00DrHS-2q;
	Wed, 13 Dec 2023 07:04:26 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BD73MKo032193;
	Wed, 13 Dec 2023 15:03:22 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 13 Dec 2023
 15:03:18 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <dminus@andestech.com>,
        <evan@rivosinc.com>, <geert+renesas@glider.be>, <guoren@kernel.org>,
        <heiko@sntech.de>, <irogers@google.com>, <jernej.skrabec@gmail.com>,
        <jolsa@kernel.org>, <jszhang@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>
Subject: [PATCH v5 03/16] irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
Date: Wed, 13 Dec 2023 15:02:48 +0800
Message-ID: <20231213070301.1684751-4-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213070301.1684751-1-peterlin@andestech.com>
References: <20231213070301.1684751-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BD73MKo032193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_230423_409764_290F73C6 
X-CRM114-Status: GOOD (  21.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for the Andes hart-level interrupt controller. This
controller provides interrupt mask/unmask functions to access the
custom register (SLIE) where the non-standard S-mode local interrupt
enable bits are located.

To share the riscv_intc_domain_map() with the generic RISC-V INTC and
ACPI, add a chip parameter to riscv_intc_init_common(), so it can be
passed to the irq_domain_set_info() as private data.

Andes hart-level interrupt controller requires the "andestech,cpu-intc"
compatible string to be present in interrupt-controller of cpu node.
e.g.,

  cpu0: cpu@0 {
      compatible = "andestech,ax45mp", "riscv";
      ...
      cpu0-intc: interrupt-controller {
          #interrupt-cells = <0x01>;
          compatible = "andestech,cpu-intc", "riscv,cpu-intc";
          interrupt-controller;
      };
  };

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
Changes v1 -> v2:
  - New patch
Changes v2 -> v3:
  - Return -ENXIO if no valid compatible INTC found
  - Allow falling back to generic RISC-V INTC
Changes v3 -> v4: (Suggested by Thomas [1])
  - Add comment to andes irq chip function
  - Refine code flow to share with generic RISC-V INTC and ACPI
  - Move Andes specific definitions to include/linux/soc/andes/irq.h
Changes v4 -> v5: (Suggested by Thomas)
  - Fix commit message
  - Subtract ANDES_SLI_CAUSE_BASE from d->hwirq to calculate the value of mask
  - Do not set chip_data to the chip itself with irq_domain_set_info()
  - Follow reverse fir tree order variable declarations

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20231019135723.3657156-1-peterlin@andestech.com/
---
 drivers/irqchip/irq-riscv-intc.c | 53 ++++++++++++++++++++++++++++----
 include/linux/soc/andes/irq.h    | 17 ++++++++++
 2 files changed, 64 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/soc/andes/irq.h

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 2fdd40f2a791..0b6bf3fb1dba 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <linux/soc/andes/irq.h>
 
 static struct irq_domain *intc_domain;
 
@@ -46,6 +47,31 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void andes_intc_irq_mask(struct irq_data *d)
+{
+	/*
+	 * Andes specific S-mode local interrupt causes (hwirq)
+	 * are defined as (256 + n) and controlled by n-th bit
+	 * of SLIE.
+	 */
+	unsigned int mask = BIT(d->hwirq - ANDES_SLI_CAUSE_BASE);
+
+	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
+		csr_clear(CSR_IE, mask);
+	else
+		csr_clear(ANDES_CSR_SLIE, mask);
+}
+
+static void andes_intc_irq_unmask(struct irq_data *d)
+{
+	unsigned int mask = BIT(d->hwirq - ANDES_SLI_CAUSE_BASE);
+
+	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
+		csr_set(CSR_IE, mask);
+	else
+		csr_set(ANDES_CSR_SLIE, mask);
+}
+
 static void riscv_intc_irq_eoi(struct irq_data *d)
 {
 	/*
@@ -69,11 +95,20 @@ static struct irq_chip riscv_intc_chip = {
 	.irq_eoi = riscv_intc_irq_eoi,
 };
 
+static struct irq_chip andes_intc_chip = {
+	.name       = "RISC-V INTC",
+	.irq_mask   = andes_intc_irq_mask,
+	.irq_unmask = andes_intc_irq_unmask,
+	.irq_eoi    = riscv_intc_irq_eoi,
+};
+
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
 				 irq_hw_number_t hwirq)
 {
+	struct irq_chip *chip = d->host_data;
+
 	irq_set_percpu_devid(irq);
-	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
+	irq_domain_set_info(d, irq, hwirq, chip, NULL,
 			    handle_percpu_devid_irq, NULL, NULL);
 
 	return 0;
@@ -112,11 +147,12 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 	return intc_domain->fwnode;
 }
 
-static int __init riscv_intc_init_common(struct fwnode_handle *fn)
+static int __init riscv_intc_init_common(struct fwnode_handle *fn,
+					 struct irq_chip *chip)
 {
 	int rc;
 
-	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, NULL);
+	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, chip);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
@@ -136,8 +172,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int rc;
+	struct irq_chip *chip = &riscv_intc_chip;
 	unsigned long hartid;
+	int rc;
 
 	rc = riscv_of_parent_hartid(node, &hartid);
 	if (rc < 0) {
@@ -162,10 +199,14 @@ static int __init riscv_intc_init(struct device_node *node,
 		return 0;
 	}
 
-	return riscv_intc_init_common(of_node_to_fwnode(node));
+	if (of_device_is_compatible(node, "andestech,cpu-intc"))
+		chip = &andes_intc_chip;
+
+	return riscv_intc_init_common(of_node_to_fwnode(node), chip);
 }
 
 IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
 
 #ifdef CONFIG_ACPI
 
@@ -192,7 +233,7 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return -ENOMEM;
 	}
 
-	return riscv_intc_init_common(fn);
+	return riscv_intc_init_common(fn, &riscv_intc_chip);
 }
 
 IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
diff --git a/include/linux/soc/andes/irq.h b/include/linux/soc/andes/irq.h
new file mode 100644
index 000000000000..f03e68fea261
--- /dev/null
+++ b/include/linux/soc/andes/irq.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Andes Technology Corporation
+ */
+#ifndef __ANDES_IRQ_H
+#define __ANDES_IRQ_H
+
+/* Andes PMU irq number */
+#define ANDES_RV_IRQ_PMU		18
+#define ANDES_SLI_CAUSE_BASE		256
+
+/* Andes PMU related registers */
+#define ANDES_CSR_SLIE			0x9c4
+#define ANDES_CSR_SLIP			0x9c5
+#define ANDES_CSR_SCOUNTEROF		0x9d4
+
+#endif /* __ANDES_IRQ_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
