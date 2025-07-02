Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CDCC83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQVL/osC5aVsEAcfY9EkZdHLDWPh+9WgRkDn+WmKu8o=; b=OuGQLDdZ4CdX6K
	+KVyxO42g9idldDQck3cpZRGck5pV9Unr13h+3dmPQ9vQ/ScdBaUFGCLpnm4AqOYhz8sL4dvcS9QQ
	255m9Q5k6JR68tLPQdhmqnvt2vUs0iHwcsPEvU3FdBMUEb2UqI6uqv2SAEePq7VSkLVI4heSmusCM
	YnMfsT2U4uYFKwzKlIznliwQOL1LLqXfvUrrhfwP7psCg/tsNiEXavVgIcZu+0odvucnNfMQ0SOno
	Sjx2n79a+cG/lSXDFWc+y4HovAEGZz90qSNQcy/WWqSpJxe2fy0ocpb+0eEX7wRAVZJQYStVIichT
	bq2arleiRZFw/yq80LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr4l-00000007Pm2-2KzL;
	Wed, 02 Jul 2025 06:36:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpq1-00000007GSx-2iu9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23c703c471dso1225045ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433413; x=1752038213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=J/ETpCGUe9bV3Y0VLSTecJOOQtnZ1Mti0oWJOmmDMVt4vryyVeqqrBfVzKcWLkkq8Y
         xxYPaJcjPAGMq6XLBfNrFlWhdBgIxv3evqfCpvcE2B/QI6Z1DrDzg4lKdZT8NXabFK+u
         lz2NqeOLiN0ckQ+ElNZhNKaICyF8Gl2/EiN35eVGoCHBxkhpSUtF+SWz1ObUemvtgs3+
         N6NvmcSd29ja5D7PaZsfZR8bEUyS7SR1bb7+khgXUiz5TcaPUB599yDFkCVLgZmbR8a0
         FnTPK+9GMyRRcx0gCcMbZZzq/oa5QS9H6rcoQx+AQmFxgzOWR00Apoj3j70T3KbDW0/v
         E/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433413; x=1752038213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=uwMyBxryrIVHNtFUbwiNYmWn7bl7tVMlYNC9sRzxZUgAWM07fjBR4lFujYSopD/KCP
         5B0jf57/FGBMVEDfajMRlKdoiK3nCSRSXdJ7uZBAF5FNt78J7kAj1bwFpaMebcfTxNw4
         TdjmqdY6mAK8E7r3JXTfC31Ff64Go9YUt/Y49BWlkOV2tqNIDVWdqJdfenVMGHWuySHv
         K0zG1b3nBnmoypFM+Z+SezJmMwszap52zaaO47JUL0LvOtIbQH1Z9tEAHWsjAAmeeMln
         BhUpdddvAw3DjqZZJRnLuna/H2+be3ufXPj41T80MMjJoB2fgjhpWAybV2meWtsBZRxW
         J45A==
X-Forwarded-Encrypted: i=1; AJvYcCWOqfKJswCmt3P4cJ/UZLGfznDncaCnCTu5TY8EewFeoqQaI03vmTcIbLP1p8Jpjvk+VvJM/9fjyphZTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQR98c6ZNFfWDOyi2OQf5P9LFmVm6UONPptAaCQOaVzLXNj+z
	8sfM4lotTQbSR/hTHlyoSzaMSV5yLljznmon0iAtzk96DC+DJPd6j8MXPl2GYoSfadE=
X-Gm-Gg: ASbGncs5Ul6nBJ1yO4hq18O45jpWuSlZ3nuvwbDaP9oe0JJI1kvjSDFHtJZKwTtKidu
	gW0HL9uyraubftgtpoRMF9mjoUasiSRTp02QRDogt8vbWrh4VOQIJe+blwRN6PvN6b4yLmu9HV/
	HaTzz+ss03MpRUb+ds/ZZRvTCQ+u2Ao9yYUknbLHw66N8zH/rJ30FRqeZUKZLLTs1qRmRb9YVDe
	BzELEijVtZrBtqjjiwG8aNXkukEWgT4Rk5Mi+nl+sxtvR2Fq1jZKzJ7rYbHIyusiMGC7LnttX7C
	8xzzfWhtzitJZSmnhXrtNEYY73UjIrOo0A+3pmb7a/SI2TvTOdE63ONJlW2d+bDo++4RsApmLjb
	pHB1FT7nYvSiSMV3BgmdNzW6xcGk=
X-Google-Smtp-Source: AGHT+IEB3xOr/KqlSjqwIoxg7iMcYneYBHYIFdD/yKkygLO37mz3QttZMjHHl/DW5Dvd44FsOdfqIA==
X-Received: by 2002:a17:902:f542:b0:235:e1e4:edb0 with SMTP id d9443c01a7336-23c6e83ea60mr21119575ad.22.1751433412835;
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
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
Subject: [PATCH v7 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed,  2 Jul 2025 10:43:43 +0530
Message-ID: <20250702051345.1460497-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221653_691186_B93A3DBD 
X-CRM114-Status: GOOD (  24.31  )
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
index c42fceab71fa..6b64a93d3c87 100644
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
 	/* Set the device MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
 		/*
@@ -248,8 +268,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -264,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -273,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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
