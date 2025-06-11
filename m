Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC96C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RsUkYgQL1Lrjxg+vOt2F3SeEGPbpxjW/E2krHLWq5s=; b=Ye2dLKWoBli8Zq
	XhGGyjGjVGAf/w6RvOv7yxc2i65arQP35CJgJ1xrPWZNK+s+zfCGdxJYnt3Ccy85urb2FBfFvuTjl
	nTcUr4+Yw0y1r158neu8Kpk6v+Utr/Gnxnd62p+GY/ezBjxo3a/MAHeyM9OG9R84HHbbn2Az9Fuax
	RAOAODsSdiThoXe4bkqLjg+Ck5aUW5hPT1F/SFkY7Rr3sprrcjy57WLgFcr+LSPbvOpk/daAfghO0
	FA+sCjj58RUOd7xBig0O2j/loFo7qfFB7Q1G6nNS6FPvLARP2MExaEOZx2hqY9I1HHVWEUmdK5V13
	sJwEXffPdZoucAkNYiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuV-00000008zvd-0dQc;
	Wed, 11 Jun 2025 06:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuT-00000008zua-3Q2t
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YS9j9gcN2wQKo26dVWHCAmNvKNHMO5vB8LdZytpDdd4=; b=kb5YivyYgJ5mLmQdeOh3wOdXl6
	eAPs1pb5Im0jXyWq4NcedG5WUBWtdishNBqlR3SaLCX7xM/KhBMaJHzjpWA7nb2wL/pZ0dRqh/DqT
	BX8a3iccBOHGV3fWtV4emTGcUyeT4Hm2UTGlIKF1RQCix+PxeOE/skfIzWPTWm9n94oDmTCYuoCT3
	cPPGGur/PsdPmZV4FcXPQ+GbTHowi1t27JZLQ6I2rhaN7FujcvBgDKZ4yE4c3YlQh0GJ0FAMjD1Av
	eOYSBdvWjlOLApWH/BRjLiWU+TvvYuS754Z/NMF5AVEUshTaRPQ2l6Jx/+Jm6ChHjDrznvELV5e8o
	oqAmgEfQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuR-000000028QI-2USh
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:26:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2351227b098so48269025ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623160; x=1750227960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS9j9gcN2wQKo26dVWHCAmNvKNHMO5vB8LdZytpDdd4=;
        b=DliMBvws7+3SprP69fhRnhHiEWnEvIQzTwXPsUXRwBOyJQBYr7sn4/Y2upDiAAOLvV
         vgqJN1aPIbP+oxsSSApdp/n1yZWBwrPNxbwdZ7g0eoYQ8S0cT5wm+9aZIr8CSUHlWNOp
         V5CB4tul+e3PCrQbwqmcR2IqQmTeItb1Yr7FNxjBu4Blz3I/zOWgvhvkoy7i/3+4fnEE
         H4G3XjldM+GEYzZ3s4pqpOZcizNE3eBwHJO0tvLY8tgPI+qaQkUQvKdo19MHgduJcp8u
         PoGL7CkzoiX3DXmEzSy1vp58krVHSY5/lfC9gAL5Yn4xOkaSE6t+OWndasuWiZZVviSC
         Hl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623160; x=1750227960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS9j9gcN2wQKo26dVWHCAmNvKNHMO5vB8LdZytpDdd4=;
        b=adMiR7Z2oSixkNVe0Y/NsW7j3mm3mI/NPPNOUAZzxCPKtUn06ExP9ixsX7Ou09YxN3
         rJBbyIkJCg+ZFOHp618W0uycfV7QCNZrHZMAa94IRQetEJxyAgpOZmOCLYcZPlgvnCSL
         qAhqDLQwYJxijclBxMDYJXDpcu+HGsUSHiQdTLAoMxB9brM+vt2f8OtnVVPZhOQ8z6E+
         4w+L14f0dxWywHHGMxpR3eiMlsjGec9Ohnm+PCNH1W7ZywQBOc22qyOC2bYTtZAPareQ
         l4eqlF+qnAlr68P/PxgaERQHCxHBAprJYoodsA+UWF/65GgRYF5ovBGwH/6SVeQ4jRhR
         4Yww==
X-Forwarded-Encrypted: i=1; AJvYcCVBl05D4alYpS0laCQW2I4N3VS4OqOivD4BDJfpPR4llcrjQyOauppfJ1kjTfJ7RTxPCN/aBqo5S5E8Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKqN5+B+2GsaCvkgiv/xRiRijDCBXHyBsUp/s6sETZt/ybHeBa
	XWrCP6NhbaL2Sx/PV53ogMVhUrXyTQ2/FSnmYGM/P0LFV+foPXStfl+sGbL1ivBIGKk=
X-Gm-Gg: ASbGncuyjVTorseQZQpcTKb5tDau5W7fbuJzP8m+vWkP+yuSbvgJGApixYg9RdUTqY+
	5NKltxy3V6SVegFaMfpQYRqxjKGQpoX1EN3jWa1L5B8ksazyjdBd71PzX79R///qPr2sYiYEm7L
	6kXLhg69sik9Q3+4Y9jahwboLOlOLvBQbYzqhHTmx7+yvLXhWBtmBKOtX8jOq/K4YYz8IopAxl2
	AQbrPXES8Cv9x4eZlLL6DEMaH0y0hlrDjkss5hdW9fv0Xgd+C+Poo0hD4U7X0pLENl+HClNz5YW
	mkxlMm8jdr2U4t7JiTIPi3Yrl9lt3rxqlIH+p4FXybA1Xj4QJTeKrah9+iELkvzsyavV6FrAAZX
	iuCcnSePyyDoAJ+AjzAknKSjX6A==
X-Google-Smtp-Source: AGHT+IGgdyPwstKE3+iWn8KD2dTBYhJpnWD6M3so2zeNZkFWSUS5/H3BXTX0WABWmKEEx/TX7p+X9A==
X-Received: by 2002:a17:903:2a8d:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23641a99d80mr28376795ad.14.1749623160046;
        Tue, 10 Jun 2025 23:26:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed, 11 Jun 2025 11:52:36 +0530
Message-ID: <20250611062238.636753-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072603_720877_3128B08A 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 46 +++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 96bf6aa55681..dfa8cc0e23dd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -619,7 +619,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 06f64936802a..d424067d22a8 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -9,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	fwnode = dev_fwnode(dev);
+	if (is_acpi_node(fwnode)) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
+					     &nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+
+		/* Update with actual GSI range */
+		if (nr_irqs != priv->nr_irqs)
+			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
+	}
+
 	/* Set the device MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
 		/*
@@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -266,6 +292,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -275,10 +308,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
-		.name		= "rpmi-sysmsi",
-		.of_match_table	= rpmi_sysmsi_match,
+		.name			= "rpmi-sysmsi",
+		.of_match_table		= rpmi_sysmsi_match,
+		.acpi_match_table	= acpi_rpmi_sysmsi_match,
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
