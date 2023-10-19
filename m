Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E53DCDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vib13b1Sz6SB23v7RXOcB07wRG3UHIe12LxHlO9ytZ4=; b=23CB0UjPMIYrlZ
	j+nPg8kZOQkJp/ySLung3S/6n8bXsIOsA96FuAmlgayYFUKkEdNPILxAC+54nSgQFMgnJC4d/sB7X
	8Um8JbV3wT44fvtyPRiJi5pp3SloR1IyeGa8IUqC2LG9lJGQYgJHlVY8PcoMciXXzKGXqFGTVC8c2
	SRHMiQC8QB3KPvfjXN/HtLyOCDNgVEczH2Vhgq11UjNvpt9j6D7KmKf1jIPQALn9OWJRXyeRkJXvo
	ropzbTCBJE16r8aOyAxBq8aoToKRw6l3wgeyIQJEpCjunCjP80t1QExnfRlHyERe19LWoabChny5Q
	+yS2mWbq8j+e3Xb1YZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTZs-00HaeO-1U;
	Thu, 19 Oct 2023 14:00:44 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTZp-00HabF-1W
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:00:43 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JE0RGM027779;
	Thu, 19 Oct 2023 22:00:27 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 22:00:23 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <tglx@linutronix.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <peterlin@andestech.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>
Subject: [PATCH v2 03/10] irqchip/riscv-intc: Introduce Andes IRQ chip
Date: Thu, 19 Oct 2023 21:57:23 +0800
Message-ID: <20231019135723.3657156-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JE0RGM027779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070041_947223_3E1A8611 
X-CRM114-Status: GOOD (  18.75  )
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

This commit adds support for the Andes IRQ chip, which provides
IRQ mask/unmask functions to access the custom CSR (SLIE)
where the non-standard S-mode local interrupt enable bits are
located.

The Andes INTC requires the "andestech,cpu-intc" compatible string
to be present in interrupt-controller of each cpu node. e.g.,

  cpu0: cpu@0 {
      compatible = "andestech,ax45mp", "riscv";
      ...
      cpu0-intc: interrupt-controller {
          #interrupt-cells = <0x01>;
          compatible = "andestech,cpu-intc";
          interrupt-controller;
      };
  };

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
Changes v1 -> v2:
  - New patch
---
 drivers/irqchip/irq-riscv-intc.c       | 49 ++++++++++++++++++++++++--
 include/linux/irqchip/irq-riscv-intc.h | 12 +++++++
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/irqchip/irq-riscv-intc.h

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 79d049105384..fcd06b58bdac 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/irqchip/irq-riscv-intc.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -45,6 +46,26 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void andes_intc_irq_mask(struct irq_data *d)
+{
+	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
+
+	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
+		csr_clear(CSR_IE, mask);
+	else
+		csr_clear(ANDES_CSR_SLIE, mask);
+}
+
+static void andes_intc_irq_unmask(struct irq_data *d)
+{
+	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
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
@@ -68,12 +89,35 @@ static struct irq_chip riscv_intc_chip = {
 	.irq_eoi = riscv_intc_irq_eoi,
 };
 
+static struct irq_chip andes_intc_chip = {
+	.name = "RISC-V INTC",
+	.irq_mask = andes_intc_irq_mask,
+	.irq_unmask = andes_intc_irq_unmask,
+	.irq_eoi = riscv_intc_irq_eoi,
+};
+
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
 				 irq_hw_number_t hwirq)
 {
+	struct fwnode_handle *fn = riscv_get_intc_hwnode();
+	struct irq_chip *chip;
+	const char *cp;
+	int rc;
+
 	irq_set_percpu_devid(irq);
-	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
-			    handle_percpu_devid_irq, NULL, NULL);
+
+	rc = fwnode_property_read_string(fn, "compatible", &cp);
+	if (rc)
+		return rc;
+
+	if (strcmp(cp, "riscv,cpu-intc") == 0)
+		chip = &riscv_intc_chip;
+	else if (strcmp(cp, "andestech,cpu-intc") == 0)
+		chip = &andes_intc_chip;
+
+	irq_domain_set_info(d, irq, hwirq, chip,
+			    d->host_data, handle_percpu_devid_irq, NULL,
+			    NULL);
 
 	return 0;
 }
@@ -166,6 +210,7 @@ static int __init riscv_intc_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
 
 #ifdef CONFIG_ACPI
 
diff --git a/include/linux/irqchip/irq-riscv-intc.h b/include/linux/irqchip/irq-riscv-intc.h
new file mode 100644
index 000000000000..87c105b5b545
--- /dev/null
+++ b/include/linux/irqchip/irq-riscv-intc.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Andes Technology Corporation
+ */
+#ifndef __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
+#define __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
+
+#define ANDES_SLI_CAUSE_BASE	256
+#define ANDES_CSR_SLIE		0x9c4
+#define ANDES_CSR_SLIP		0x9c5
+
+#endif /* __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
