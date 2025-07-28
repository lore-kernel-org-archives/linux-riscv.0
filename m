Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7375FC87FD1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpQ0yF0Q4GMDhHyzNdeyY5rKOEdpHH51MmUHSKjKGLY=; b=eKry4Rw6ft0Plu
	LD4G7l8BV2a661HoA6Xej2gcuVlB4dE3ZyKd3UVPLswJhJxRoF6dJH0DAoBcTAEDsrJhY+yZRKkHg
	iVZbhuAgweo5j4GT1LzsmGNJEYqvcxCPfTxXOXZZixllyaDXoar2VajquOCVGnBvxVVVeDZiOEg8v
	RZZ5lXTMwTKvoEiepcLH7UjTet8IpCTVz94rXojhgd+cwPRwVxuA1QULrmG3L8ade1TUHQFZm6bvK
	3PaiDiqtmEPDZ8/8OAsezC882sOpRqnivDg/quM+DMtNgzSEgQvF36wjIBKC4DX6xIx+i9XyfqbVd
	0QUU9YIzIXVVO6Au17vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKRi-0000000E9U0-1UV3;
	Mon, 28 Jul 2025 09:47:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPJ-0000000E91q-3c2Z
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so3471320a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695873; x=1754300673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlYXC9F0O8zbv2hE1LP7h6LlplF1lF+tvzzZDmIs1fc=;
        b=pUaSHjPgLhPyHv14XviPiKxxEip1NnUwEYYQzywOxW8bjsDPTsSVTOcCSIqzE1ihBN
         7xqI+q1Ae0uGyonslUmlU1OSoJW6LSIM3ZeCjad5b1V2X5/yYTu8PNmElhInxP45FOXS
         u6IO2VmWE8DPECNpGaTVX78IRNC7ZKu0kaX+mE9Ubv+kKLaj9dbkqARnDoItLcOs8RFD
         J1ETrroAk81EjTW9QcjaIQ6RW3gG5IdLQfaU8AWuL2XYNpD953WRoBQhMH0bIa6sYGs3
         WrDqL2JLaJhjIuWVGD3cZltDKWjqg4VeyUGbaspJAt49DlWAvFgcWN+2HYIOZwbyUWy7
         utYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695873; x=1754300673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlYXC9F0O8zbv2hE1LP7h6LlplF1lF+tvzzZDmIs1fc=;
        b=Q4KCaFwSUuXrqCiK93VNanrMZgEnjMMjyBdho+NBZk+q/3OBwA0KVR0nKUG+F71in0
         GQK47mO8tD8LQihutCxgEaQ7Chp/P4fB5otzjEAz7hAR5SC4QQsGgB9lxr6n0K2Mtmyo
         yaTERBBUs3sPZ6i+tuxvQ5hItwPlEJgQdPUG5KB6+kMgsT4j9kqsqf5jrMAQJVbJXKgD
         DvAuNVZoNAIChiWuTuK+1HaekV9ZwYkhy0Aj3SEci0MwwjZUWO9LpQOKmzHX4ImmzgXC
         k42+/+c457OprGNOuUNWlq51RyyT5fyBvBvTMhA13mQbZoaq5UP5fFcz6A7qUXA1UI14
         eXaw==
X-Forwarded-Encrypted: i=1; AJvYcCXRAbGfpS7JlCFITvcREJyxQKKHaG7ASdoLylXTvNACqrULe3rdvh1riRmoZ8cd80jrO5CGUlt7xFCCeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvQPvtCLefYk/FiAO29206QPwfvujM+XKmy6joTxDp7tmVEOZy
	rlA8Nu0Z8TYteEm+jUNkN8eZjnKqWB3R9ZcDj6XAIKd1QMJZi788lL2zXcSvgvI/EU4=
X-Gm-Gg: ASbGnctuajPJS2nW+a/N/ikyKPVerDrxeDPKfbpqZbHxAH9Q40E8LkOSXDWsOzQgX7a
	MHKs6pDBUOXciHArzZfe7eGpXNbsVLtaKakIsS1dDgrOO7Wl1QQtNzTRHDfZmwrtPFC+cqYXfJa
	arcTkERsKeFhmdd/BUidXjoCIyZ5Ct1arPJdxnjJ1Gk9RPMXWA8gbdYoCPQrSxi4MggqMa0Js95
	HaNdbvi/QdCh2P76pR7ACTvu1VoHOz3r59HVl5oimx4obsGfsw1SIcOD1ZJd29vT28C2VGTO71/
	838SMi1gTrpbmkdnXeUbG0g1l1HdXx92/3fHok6waUw0tdILC9ys+hJgqcqf+ny6C195DGjEJr9
	JtCSwxPpcAkmbGo73TFT2E2tpNYiQTu8gWt2QOe06r4Dz9PF47u7Qbi/ggPeqwxh28OZ7g58=
X-Google-Smtp-Source: AGHT+IGAwJvkdUw2Iit6cp8KQcw8fgP3DTpOBB5lX+b717WF4c4kBlnVYgF0+VaAcfTFETTz20JkcA==
X-Received: by 2002:a17:90b:3b4c:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-31e77882e8emr16716236a91.14.1753695872826;
        Mon, 28 Jul 2025 02:44:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:32 -0700 (PDT)
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
Subject: [PATCH v9 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Mon, 28 Jul 2025 15:10:30 +0530
Message-ID: <20250728094032.63545-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024433_905778_9A544FC5 
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
index b10e36db2c63..25bac6a21a88 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -620,7 +620,7 @@ config RISCV_IMSIC
 
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
