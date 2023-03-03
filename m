Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8FFC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkT5pxuiCuVleIpId4KRPf3ekY/EA5RofzX0q6rPTUY=; b=HJ6rk8AcG0ceou
	x6g6M0aVQnOTxbn8v+DbVNrGP3oMevqsfS8CIBT9SmDL31tPFPW9QwtnWWi1oYnk1BoO8pCelK7gd
	szanZIjoys6fYvrG8DAJHs90vybcn67IWccomSucpSou2eQnkR9GxBrbpcV0H0h9SkppDiQ9xZ8zx
	dhhJ0QqTe1UBN/KouyXYirCyAoEx4aN8g36527qu5/BHVzACsPvMtFSKsGlrrrFdoi5ImCwYPNljQ
	mKgHWMDfFF7kltfFAKMOjL4tBz2ntVpLWRP9QSnL0T02v5ruiM+HJVZNvkGpasbU34a8iaOZlLYWN
	us+pCIIee3WKf4yt8jXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5br-006Tga-Fh; Fri, 03 Mar 2023 13:38:07 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bo-006Tdb-Nx
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so6139192pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NTsYtUJNb7uS+HqQnID6st7LmlddjRj2NkYh86FZo0=;
        b=M25owZtphUqGcASQ2wyvBhUCpahd7MWa9/fmZwAfVRWgbrRzkft6axRYT28uRgX7nr
         CWw1nNLCuKzppnBZB0ssVkSqMGx4zhsAEg17by5BoUk1z0z2g419FysJb7yNcxXyW66M
         AubtTnC5e+7NhVdzDHizPlpKnPfaUNjI7AbbQn+CBY18I+AOSeGgBkkySrdZhzhRi5rc
         +l28bOnsnBX91qr7YXP4w1oPMSzBGdCs2Ik6H7DDUqFIYYLaaWkh/tp+61GMufHDMHVC
         AkpbptY08TtFh9wTVgXoIu1F+X4ASt7lZSBcUtRfRn+zqpq9oyYPtCbJY5sxeTZo8V9Z
         FCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NTsYtUJNb7uS+HqQnID6st7LmlddjRj2NkYh86FZo0=;
        b=zsDfzzMaXGslWxTzG2M409STOOJs+XNvR0eL01QZyC69w/7w4dO6+6QKcOE33YEGzp
         Bs3e0Vi5h62V8jTFg7pjPKRprB8wSarjTxqB7w54/SJT/aY9gUZCX6fjpg0ORxS5cTAG
         W24DyqJ8g0OC0J9xIqQdywNCDsAm8CwJQRwf1rWPrczQkyNj1JExhX4FmoMFPD0t8xr7
         ho/6vDRVJcBU3TBUuWtBeAM9ISiw2Q2PL+aTn3IjrDNTmxlccnCCqzZNdmAI9T18h4FE
         6bbvl+GcNy7Emf+Cd4aJKqnNSNBYZu1YzmjMS+FWykpD9vob2GP3dLjLfBp14O7bWJSo
         53/A==
X-Gm-Message-State: AO0yUKXLuCVK5Uid+l8s8idOT8nnET9JhU0Yx7QUx+atkSum1RPCLDIT
	yfQDu2UCg7KKakj30WTiXw+JegbZf+5rMX/e
X-Google-Smtp-Source: AK7set8ZSK8lfq07d6knUNnE0n6uZxnTVev5zbs5tzsbMO6Dnvwnt5Cbba1r0pUm7jipR5u8Ht43AQ==
X-Received: by 2002:a17:903:247:b0:19e:8076:9bd2 with SMTP id j7-20020a170903024700b0019e80769bd2mr2490767plh.17.1677850682759;
        Fri, 03 Mar 2023 05:38:02 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:02 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 14/20] irqchip/riscv-intc: Add ACPI support
Date: Fri,  3 Mar 2023 19:06:41 +0530
Message-Id: <20230303133647.845095-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053804_837489_8D4E9B27 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for initializing the RISC-V INTC driver on ACPI
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 77 +++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f229e3e66387..f522510dc1f3 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) "riscv-intc: " fmt
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bits.h>
 #include <linux/cpu.h>
@@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 	return intc_domain->fwnode;
 }
 
+static int __init riscv_intc_init_common(struct fwnode_handle *fn)
+{
+	int rc;
+
+	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+					       &riscv_intc_domain_ops, NULL);
+	if (!intc_domain) {
+		pr_err("unable to add IRQ domain\n");
+		return -ENXIO;
+	}
+
+	rc = set_handle_irq(&riscv_intc_irq);
+	if (rc) {
+		pr_err("failed to set irq handler\n");
+		return rc;
+	}
+
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
+	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+
+	return 0;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -133,24 +158,52 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
-					    &riscv_intc_domain_ops, NULL);
-	if (!intc_domain) {
-		pr_err("unable to add IRQ domain\n");
-		return -ENXIO;
-	}
-
-	rc = set_handle_irq(&riscv_intc_irq);
+	rc = riscv_intc_init_common(of_node_to_fwnode(node));
 	if (rc) {
-		pr_err("failed to set irq handler\n");
+		pr_err("failed to initialize INTC\n");
 		return rc;
 	}
 
-	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+	return 0;
+}
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+
+#ifdef CONFIG_ACPI
+
+static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
+				       const unsigned long end)
+{
+	int rc;
+	struct fwnode_handle *fn;
+	struct acpi_madt_rintc *rintc;
+
+	rintc = (struct acpi_madt_rintc *)header;
+
+	/*
+	 * The ACPI MADT will have one INTC for each CPU (or HART)
+	 * so riscv_intc_acpi_init() function will be called once
+	 * for each INTC. We only do INTC initialization
+	 * for the INTC belonging to the boot CPU (or boot HART).
+	 */
+	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
+		return 0;
+
+	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
+	if (!fn) {
+		pr_err("unable to allocate INTC FW node\n");
+		return -ENOMEM;
+	}
+
+	rc = riscv_intc_init_common(fn);
+	if (rc) {
+		pr_err("failed to initialize INTC\n");
+		return rc;
+	}
 
 	return 0;
 }
 
-IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
+IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
+		     ACPI_MADT_RINTC_VERSION_V1, riscv_intc_acpi_init);
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
