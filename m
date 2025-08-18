Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E83ECA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoEEunPg5G2Ie0jINTO2uSwQhX3jJeBqp8U3Q1iQ2cQ=; b=1y4Oe6oOUImEfZ
	tVPybD4Co6CLVV2njoEYzLAo5oidKr1Oi20jaerA5BeQ1QBy26UCymrJHIToovDj6+y2AvKpLxqm7
	l0A+oCZzRlSrhAecyGKGREYGYfZzCUsXq4KlI2QUQARsty8jYszOAr19GELm0I4L16+Ukqy5lPGcm
	5xgq2zi9hJUD6IpjYlRdRuPqeTNYz7yB/ad/xnshyrCF1Ic338NWDiyCge3GqGsvgPjHoqUlhDwxe
	o7fkzJW/31tLRDFXe1GDip4S8ovejuz7amO+GPeRGR5QzKivkFf5bitLD2SPjofszxm/VJul4iEsN
	2CHkJNWGEP24+e7W1ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrF7-00000006RpE-3goe;
	Mon, 18 Aug 2025 04:13:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrF5-00000006Rnt-1m1F
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:13:08 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b4716fb8e74so3439112a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490387; x=1756095187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h5FwLL2itI1aaIPBkXXTJzNb4MmDc/qgyBrNo+u9DI=;
        b=Juo0b9flG+1usDX8BTyroOE3ZUUBQKjSRoXc4dzesvzd6a4eQmsNkMPN5Qsp4RNXCG
         YU00y/aJBuCFyKVY6ajCBUiWSzwIeja7YOAJ6Mnm6ydi9/b8ZBkSnjmYdF0ZKjM9xiq/
         cSgwm9zKny9HyTa2z2x+5aUYin8vPMkw28RqFGjMC5wPDvEAGYhJiZMAfS9sI4ZYProD
         7kXObj3aufIlojDid816mBrtr07nhEoTiZciEvyPiHZrUcbveARHsEa9IxekSso+VSrh
         NOWOLNT/lWPJToWpFAEiRhSNlDzrKoh5mnMey7U2fnmoxPftvng/Dh6p4HvW8uM+mG1x
         VTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490387; x=1756095187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h5FwLL2itI1aaIPBkXXTJzNb4MmDc/qgyBrNo+u9DI=;
        b=izM0aFH0RyDPZ3zqpq6WLSOvTdXPx6NX8Zr5O9YplqCGrSF99NGZVqBP9+hNA0pZtr
         S4I+LrCXhVHTqZZUcJiBuVFl8FYXvvqzwjCoxLIuwdO5wM0s9FCXDeW/PEk6YB6d0trc
         0NVeh6JqYxE3RcoVq6vWei5dSFgdJ8gKxuiWscltk+Ihu64lY7+dP/uZKxsF5Ydgj/Mo
         o8f+AdcwAUe1LECyyi4EBu2RplCap0dv+mIN674fMOfwfnJmkoHtRRBCl36QiiFoFtyI
         3rX3PCQz9ZL8bFhuAA0cnMm+p5QuAqZMo3+fofOjKbVBYVo52DKJpO8dEf2TA/lk4ROi
         40Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWMqQZelJMbYMmL2J0RY5YWNxHI1YEFxKYWG/DDcvPJpIECfYbWSLeYjKamkUvUIGQL3lUL0I/EsUqQ7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8zJTHMXKgzarMRjcxgbg2gZLwW1/GFOe+c7NC9egvNGehQcgf
	Lb9pR/SY/ZytNc59Dt/RGSKYG0YvAiWCorELmZOAaU7xuWrRx6eB4vzexHrwKCLByPo=
X-Gm-Gg: ASbGncvuy7aD3fgqXnnEMaPdlOz/ju0pR+z5wu9k/xzx40hMWtQQNrmygB/8Oow8MoK
	pWr2qkjyL6uU+Ei4SWN9PkH7uBlDJ4wlvlxIsMJYBCROBlunjhvwClWg+KlWZQL3SuYv9urWRkA
	CgNDK9qKkhCv6KBIiVLpbe7++UKrAIgda4Tp88xyX6fqf6qRz4593DgfxmAogX7njZVKGD+Gq0/
	lBZN3xqLOQ2xyIAK6B2PSMy5SHuBjPdI0GLeetJJjMkw7ekOCP2pnu51woxJK7GIkL8D0eGpHAj
	X2n4agQOO6VH8IQBf5j51f06BqqdYtqjw3fXmyVf3Fa/6qQtinnVLgbEcSQ/XPB5St9c/oSWJhj
	QERbuE45HzStdJB6RcHybGN61GSbcWnftKrO6sOFnFm6oZRRLUuE4sXncY8Zs//+j
X-Google-Smtp-Source: AGHT+IGkH4BDAXF4edn8TwIvvipLqLI6fuRlMJ8wwuhqVGiG5/9vRp54UNterQDaAwLw9x2Gzg+I7w==
X-Received: by 2002:a17:902:d50d:b0:244:6860:2f10 with SMTP id d9443c01a7336-2446d6d2d44mr179006705ad.1.1755490386542;
        Sun, 17 Aug 2025 21:13:06 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:13:05 -0700 (PDT)
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
Subject: [PATCH v10 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Mon, 18 Aug 2025 09:39:18 +0530
Message-ID: <20250818040920.272664-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211307_466905_C83D11DB 
X-CRM114-Status: GOOD (  22.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 47 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e047ba36df16..a61c6dc63c29 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -636,7 +636,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 92e8847dfccc..5c74c561ce31 100644
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
@@ -209,6 +211,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -239,6 +243,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
 	/*
 	 * The device MSI domain for platform devices on RISC-V architecture
 	 * is only available after the MSI controller driver is probed so,
@@ -252,8 +272,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -268,6 +295,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -277,10 +311,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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
