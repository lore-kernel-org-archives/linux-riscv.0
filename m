Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C3C7115F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQVL/osC5aVsEAcfY9EkZdHLDWPh+9WgRkDn+WmKu8o=; b=4pRzWYImLWa9nN
	7DhfNUrbIjH/PfKa1S+nt8yZJfTu1BZagx/WAsJBs47CKGAEGquuT0lJZVeQYdamCdfO9xjW5bj+U
	/hHQq98yyWAl3foS5R8EVkubMulfO2Nap4eOMKtC7qMZy3n0fGkfnqBJ2FvX1gQa6WxhjTAbr9TmG
	Aow7mmolsRJqwuaeug9HIlntwS6E2/lsD8oBGFdDA7JxivFso2+OXjDe6iYGrSBHCPD5JSKkmti6f
	HG2pqGiaNTBAgLJqy44XG6PJw1W8FmXqzgbgJ4g6ZPZ8s689sA9Z1KpQwU64t3XylqywLFfMlJrzP
	bv4kPd7d1zSMbJmDgKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpO-0000000ARHi-1Ikj;
	Wed, 18 Jun 2025 14:31:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrjB-0000000A5hS-2FJ6
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:17:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5175013b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249037; x=1750853837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=KqohD87NxwlG6eD/g1/7cNVFlc87nVLWpKOVFIC4y5DeHDKfZ+tpPReNvIWjsxeeAe
         HrfFKfIwMVckbQVQXKouCQD8K6N/wrgMWMGeWDeDC3o/IT89ilVAguK1oRk901ZIGZk1
         M5hfEHRhWEdJIGS7fb6/eVri8F8MZ1qAggh0/ObhbzSi0LYloN/dvcphA7u14ztO88LG
         oc0fGavj6xuvCudL4ZbJUDR7XSFqUiv+tSV0RjIEXTYCSqYffQpqa//TpsMX3PKgtz17
         eqmU0xIaOIdwcsU+jIbAZjHxjy9ZjRhQEuOWRLCw8s2RDCsRBygMtFM53FOdeRdJzYtF
         SY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249037; x=1750853837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=UEnFhqMbwzKIZZJL9G59qaKuif/hs/bt5rCYrQWcZlP1aBYsjVcfSBPgB3gUjOuuU4
         wOHXjhXmO7wDtuoA0ODd1lfHWjy3q3AP9sANMV158j7k7P1G/L6hLCBZnSOM+7aCoNSq
         rIW+Joh/bNwxOGDLHui2TsrazGXh39/yreRy++OVGQxNj3KoCklxJmJk37wag4aHLAl8
         gCg30mYKIVLQsgYcxQFZs9YTochi96Q29nVe0hVkEBT1XdTYJpWQdEKMKKsytW6TVFy8
         T8nj+UOPQjIGs9VY9HY+VJVt9xOgKiemVxUTyVUSI3ZwITSKgjVXbApnh/UnNHqHbcWe
         7MlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfqgI1yO747BY9VE5Uri7LtNxVtu81cfOBeY9MRKhrOFw77huAhD4Bkn6f3DoirJgJZcTap4bIbGSTiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnkHz1X3W2J5K/ZVibKsFpZwfBsCnXh7C2Q2a7c6hV0nTp+/3r
	Pl0bl/QwXeq8uZngIOd40OVo75s3u2f9CIFqB5V0D1t7IYPTqScLwIPa9P75xeaBYCE=
X-Gm-Gg: ASbGncvx+1lexOuvsU3pWvopn+TOZuOA9ovbY+juzg+sGFeJWhzwj6R5qE78ZSrpxMl
	Z+5nw2G9RX+6Lom9krQaETt1dyTrCNHb9OOzAqgX+0uYbtIuCMPG2mDDveDKKeOAvYdxpE4nAmY
	0/TLB2hSvrY6MVDoQHFt18JF9kdBpFjJl0Ye/iJK96SR/pqW1DdnhPtXBAKe+NH49hOjwR4wN/T
	A6yi5RLQlW9ktWF9rh6FOae5b3GF+O40yWKkgqERu6uA5cr+yKW8dxg63y1hjlTNJKkYMGU3KCK
	pUggZlg1WN9wACpk1Dy7bS28ITKWGX9/FQ3hvWk7OLr71u+fx829g4W+rpQC4P/3rCO+L7sW2WB
	FUhZOUkhJZ6HTFA5xe6CMZE3nkmue
X-Google-Smtp-Source: AGHT+IGZxm5K+fImPTj80yc/09wm99fEy6jDG9RVHP9Gj1V5pfPQ80BXgbZFOxeJiG+mqaum26We2w==
X-Received: by 2002:a05:6a00:14c2:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7489ce0c6bbmr28455044b3a.8.1750249036547;
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
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
Subject: [PATCH v6 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed, 18 Jun 2025 17:43:56 +0530
Message-ID: <20250618121358.503781-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051717_584317_F7DE22C4 
X-CRM114-Status: GOOD (  23.19  )
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
