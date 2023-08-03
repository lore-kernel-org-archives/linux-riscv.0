Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA182C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp8Xsnl4frMcA2c7fZN8NLzziXQdSJvvfgMrqhPXotc=; b=mN3ieKeOaJGZLl
	z6/mhdYTmiOJhEc8/auZfNCqQDzHz25r1411beuMJ8aJqPF+X4sWPy1i7C2835fYu3z1UiNUBY5Ca
	YweQPKHlxoJ3tE8PEPm1/ceHTpeSp16U4d3EuBGEM5SkPrxRlw0l6TXPypJZjyt3S2CWY3PEuc4h1
	A6rxttUpkPO6xNqfj8hoUHp3NOU42zbZuuCsy4nj9qFGUL3SBeFfisfNoPt3bBoAXLG+hHTiCqJiX
	OdHSjaVWFC46VYPGhcgcp0vEfPhjlejqSlvCFQsNAatvrwVIn1Y6yRd9Z8sE+QJULo/poFFq69ikJ
	XmHDkVa3Io3AT/bes3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRce3-00AW5M-1U;
	Thu, 03 Aug 2023 18:01:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdx-00AVzL-22
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686f8614ce5so1119542b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085709; x=1691690509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F92frfK1dVqJ4xjy+nPCRdMbjnNZ2BaLZfo5RMrgYGc=;
        b=nb8MJ8FxfTXSyHfmc46NJ78oznoJARBEyZYQLu78F886UEH05u96pGX7PrrDE+ABPy
         g7Q9FL6hPeKgIvk1x1g1QIiXUI+eSCTn4U5OllRWdrxcoVajrrjHY50vfrwXSfjJ56rj
         kDL+iKNMiAcr3+BY7DKMcKwbrcyTolBMjohszwHk8Iqo0oHT6OJUhtHPMDjrZMpsSVf8
         do6JnoL+oBRfutMZgfrvxiD/OLmiQhPDP+a9oLSuKJQQ+mEjyNMxYQbZ5QXaBFSdRNqr
         cB+pEseV+eVkFLVS2cVDEpQHb3FQjnP4sNhw8f1RnohhupWYwX5f1MNKLJwhFIFeh8bb
         Vzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085709; x=1691690509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F92frfK1dVqJ4xjy+nPCRdMbjnNZ2BaLZfo5RMrgYGc=;
        b=eGjo40o0GQmIXTb2+1PHsflCfHhH+0P1r89Vc4C2MmI1Tv5x4wN1IxsfqSqFpLN/I0
         qugtz1/TZHrdI0j5N/HTtRsaSOVyOeTOaInKr+c2OPiTfKt+lCQ0I5fUp39IQwNnUcMT
         kOTM6mrjKE6yFV9JYaERLvoS0OfryFZVG0kAMiZwJ/rCzhxt7VIDfa+mtn64bLNTm4TV
         W4eqDZlrBt0z4lyW2HYIHYE5U9Z9fo0VgGw52A8TRhrjpDDhhvtSX6WpOE5Rby5j5PCX
         OqS5DkN1mhzr5jB5EMcgLtJm9extXAioWDsRhzhfMOuKIRrxIutTP/NAjHdBVwYhdSYN
         DvIg==
X-Gm-Message-State: ABy/qLaWSDqW9u+jgO72UjBkBszq41+rgMCV7TLU4yIZYFvA9OmrUAlV
	Pkg4XHp70muc3ReX66IHvzSX/g==
X-Google-Smtp-Source: APBJJlF693fygn/wN+Kw+cdkTi4UZipebFggWTsaaGrmDPSMtSqjJpJsaZGp1ItDXnGYwlZwJ/3sSA==
X-Received: by 2002:a05:6a00:1887:b0:687:7a30:deb with SMTP id x7-20020a056a00188700b006877a300debmr6591488pfh.15.1691085709034;
        Thu, 03 Aug 2023 11:01:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:48 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 18/21] irqchip/irq-riscv-aplic-msi: Add ACPI support
Date: Thu,  3 Aug 2023 23:29:13 +0530
Message-Id: <20230803175916.3174453-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110149_693026_D9A67933 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Search and configure the MSI domain for the APLIC
on ACPI based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 086d00e0429e..1948444c9e0c 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/smp.h>
+#include <asm/acpi.h>
 
 #include "irq-riscv-aplic-main.h"
 
@@ -178,6 +179,8 @@ static void aplic_msi_write_msg(struct msi_desc *desc, struct msi_msg *msg)
 int aplic_msi_setup(struct device *dev, void __iomem *regs)
 {
 	const struct imsic_global_config *imsic_global;
+	struct irq_domain *msi_domain = NULL;
+	struct fwnode_handle *msi_fwnode;
 	struct irq_domain *irqdomain;
 	struct aplic_priv *priv;
 	struct aplic_msicfg *mc;
@@ -261,8 +264,17 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 		 * IMSIC and the IMSIC MSI domains are created later through
 		 * the platform driver probing so we set it explicitly here.
 		 */
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev->fwnode)) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			msi_fwnode = acpi_riscv_get_msi_fwnode(dev);
+			if (msi_fwnode)
+				msi_domain = irq_find_matching_fwnode(msi_fwnode,
+								      DOMAIN_BUS_PLATFORM_MSI);
+
+			if (msi_domain)
+				dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Create irq domain instance for the APLIC MSI-mode */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
