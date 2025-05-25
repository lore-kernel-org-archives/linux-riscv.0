Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE9CC5AE59
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBE2L+bD6mYTnj67EDOAMm3SSuG2Twx3X7WoxyfG5GU=; b=KF4s7LZjUgyp4S
	9u4Y2T6iDWvi7mMQDMKaFjjTgp1MSt5NEZGJ8aGR+/pa6TfhsueFa1B6Xb7qxXEqFf+iq0dFICP9x
	4fGkY+RonDPzq0e3FUcCH+lijnQICfb0g7EnjzYum2BH/1w8mk11ycAKjtKiBsjU/leEkKs0AvtCu
	8rmE+/Cvaf47BfNR+zlzR3VQxE/MU9PD1JMycJ1KVNw8xrLh4uHNYeqe7rFeL01mONdkIgmorxVxi
	wj43n3oCuJJzRfLpN4AXt7ZwpjOcB7b998HnREZgKlDAnb7sUPU+FeGnh2DxPJw/c2oHAqotPsLuA
	RAM6xDHLRQ9PTNV5k4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74v-00000006ni0-0D1f;
	Sun, 25 May 2025 08:51:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73n-00000006nSX-08g4
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6V6QbiInxE/Um6Eyr5jQlxs29QfT2mwTqovmMoRPQuU=; b=HZ3mRjF2nl+K/6JNeC47nAkBbY
	7EEq21z4/IKyEW+U5c8eBwijrRxOubs57msMHSCcPAP5u2sT48TvJFOpF07mxkQqiwh0vCbe3b6Jg
	zqy/u9b9eUwS5C8veUaeYGC0FjuqOia3oOomGRYt61QR1ZkiHSuFMY5rhuOOOqLuZyF4LSaFI+sRp
	HFG4x1BRo6vWNlcTYHjPEMTdGB4s3q8pIyN1qpZ7eisf2M0TyaxE2HtxyFB6gXP5hfKLEshmFMFHl
	IHRvLccUgaCviA2PVPYw40lphAkPKQRAZYyXIg+g4z0R8DOqBqH1DPrDZIDdgq+gFAviEMUbQjPsc
	BsLfPD7w==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ73j-00000001a47-3iQR
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso954014b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163017; x=1748767817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V6QbiInxE/Um6Eyr5jQlxs29QfT2mwTqovmMoRPQuU=;
        b=N3csIbt/oOUpL9EarVuem1N8OJIXZaElfBSSm1uKZuPFp/gaLMKh8xhma/7m8KwrRL
         buWJYtofN7GvcJTzZzKysiPWCC4eNi/bOI14jJzgfkkqkx7y8SWXgXWSUl05Gtd0JuSa
         uBvCXg6wxjL5v9TwJuEYoCdRD0lDa/ayUUf0wW/4Mk7VIKCDyvLNNVcfgBIiPAmwzv9G
         X/Z1zQ9lLhDc+0r5jVf4V+vW7CF3vfRd6EXhMMAUprj2ZKE5qqy1CPhHAuenekOUk/3f
         j44ygbeSMuFK2NU92TvPZEooATvF1r0jVkSZpehNpmw0HV4kF/zox5MLm7Gwfb9Hx1vp
         RaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163017; x=1748767817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V6QbiInxE/Um6Eyr5jQlxs29QfT2mwTqovmMoRPQuU=;
        b=R4DCS29pDDXq5p+AK3iGsfOuIBL5mcsjtwAxNV1R8MgroSmtZ6IuWsvGf2wyUkPmSU
         5yhkhUc44E13SKbr/j6Tw/H14kU27PmmEC8qjZxHPBAg1CGndzhdIVbCivwQH9DnpOhy
         Efvh8m88iY8cV96blLx1A0+RPtj/Avj7MKyciiK99eD/X3FZdqzsygvyOF2vdI+ASLx7
         R9LZ8mdbkqt5t7fZA02QlhM+MKU1MnBzcDgbJTbbhCNVbBG1CE2dOA3KP9jqXkzmvzKH
         7rkXUyB4a/TOJbu9TrGKgaLNf2bpJi24tUrZBOVomWTmAa14tVD9SfG2nMNUnoUFH1jw
         wzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4NEUU7xbUB5TndcjzGmlea9L8AZF/TGqQaZDWA8q66IGzboyu0dE+CNH52nbfXpI5SnFSd9u6RjCBPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztfIxSg1QY123Uq6BuoAIuE7n/jMdTk778t7KxAKdWY+cr3vYK
	MmR/Fr+5n+xhPk4jtR3mx56ysr0lsCrZQBrzZzK4ZWYXSIj+oukejF47SrH5SGyR0UM=
X-Gm-Gg: ASbGncsR/fqHj8iKdxvgXAPWjMAkRajSVVuzOO9yfb3dXAvRiNc/wq5c2jZYK9n62ZG
	b4FqhWPJLIgQs/zGD1jsdv4MK2ktjtPkyJcybuNxgqHTQvjIzeG42w4CViaPQ8Bc5xdBuNkgqmy
	i2gOsytkuBN8aWjQloR1TUxzWbsXamhlZbiPL5Hr/fld1hnKD/Nkm77MbU5aoy93d/5bbLxL6Gq
	HRe3AUVsgW6p27ZeQk9fkzhEDmuTA48w2giCkHmYzs7i4gbCCbN3MPwSh8oHsM4/MV6fEBdLi4H
	0ao2INvgWSLNRjpAZSfMfYjm3JOXb8Z7yUY5u83RRcfC5p0WZyIiFsXG4Jg7ykIWMiLYKHTbooy
	yVUtZBYHZ
X-Google-Smtp-Source: AGHT+IHA6vG3gnOFkfnCkqjtNt9jIgboUuMsLJqr0O3oyAfcFRpaKdyOG2hZOtww2NGmCEAF3xsiNQ==
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr8436680637.23.1748163017053;
        Sun, 25 May 2025 01:50:17 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:16 -0700 (PDT)
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
Subject: [PATCH v4 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Sun, 25 May 2025 14:17:08 +0530
Message-ID: <20250525084710.1665648-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_095020_110289_DCBDD020 
X-CRM114-Status: GOOD (  22.30  )
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 48 ++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 83700fc2ddc9..132e56a596fc 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -614,7 +614,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index d7b19fb7bf4e..6d27c036928a 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/irq.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
@@ -209,6 +211,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -240,6 +245,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -249,8 +270,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
-			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		if (is_of_node(fwnode)) {
+			of_msi_configure(dev, to_of_node(fwnode));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -265,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -274,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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
