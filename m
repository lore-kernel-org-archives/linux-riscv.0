Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D387C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmE3wYY7WrYxEyN8jN5CcxfBc6wJHqD2EDys2QReEWk=; b=i9XqZjlaLhPgO0
	e3roTVNcg1ip0Yn985TF98r9ToyGQ6hXIJAoNH99YSg7k7OKZsUnAtUyFZwq9Hr1TqpXcpMIdqU+6
	khckSJLPg1glkaGkXH30/oVvBLKa5dT3Y2irkdz3PBlVkvYJILa4dSn+ffDMR5VO0IUKlclxgQ+ed
	i3sry7+/iaAqylS6TFMKR/0GC2ZV9Uvjmh8vxIKe92Tb+yrrnyFnvy7jseF47+/1/MlOENKMAcEkq
	JOB+qbi/5mUL4uT/wGDA8EZy9P5702k1H8o8ccO9ZCScGwy8SwZ54LDsZIm+ydCKC534L8Mf6+v8L
	nAbMk/mWyE+glQmZM20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbfn-0000000DiL3-15Gk;
	Fri, 04 Jul 2025 08:21:31 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaX7-0000000DWSL-0ohX
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:30 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso352983a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612908; x=1752217708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXIk2wJTifWddC0moyVA6HWex2pYqM3d1BK6ny8Nz5A=;
        b=F3dlEMntb7yKR0sEPDyjX2WhF/OypHAhKO7yYYqVVUipOfoM+/s+r8/giyecKQ5Oke
         Ano3Mr3vmTGzyk+SILzSQsZWlEI9eyGL7a6OmaC6m8n3XFC2ysguG6RhvIpsexDdyhP1
         Q/hvYDXu3x6ZF3+AumlW35cYH/fyEZDSbP35e5K8Wp0kfPBnie3Vjn9Hl7jRguNGX3LM
         s3MoETC7gbE0D0Rx4A0Pm3+h41KFJJXHXNtW8JOKstSRq3VP1Cl4zrGV23wm9S2m4dCn
         TTtGwrjh92QyK2y7dBgKrxUBQg75p9Z1KeRZZSVOjJPe30wDk83s2vSzgRzLfXrb5tZm
         9LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612908; x=1752217708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXIk2wJTifWddC0moyVA6HWex2pYqM3d1BK6ny8Nz5A=;
        b=KKsbd/5Fww2YRqkOUGsLI8gKqJuuig1OFlChcP2R+x8gF020jxuxOui+4p51sw43Bp
         3mFPo2UHohHoKWbv0dL0M8z2cHFIgaJHFG4cRcdCLTM+qarQJHya7Cm7smA5+T7cAWkK
         aJVpyg+DEonEm07azOKY92Etz7t/Y7F8RxKhh779H11oKqrktIDBa37jw+snpryvdtxM
         ot4RUkuHHyQUjruSfo+0aS/nwkbdzJzGMiI+a5wOHAOL5ml2GHjYSe5/ajBK0usGYH+H
         dImXyFfgCCjv+ppO6jfNYlWz1nB8wp+ZtrQaFVccIVEsv53+GtwKeSAhr6cVOndaClnt
         tM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIAqcd1tSwtSOMwuc4rFmQ1oihYPREvP4YTm7EsYzbAXMoZDKZkcoS7Lc5eeu7tbsUv77Qh1/138yb7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTk4eQIE5yi6KGjVMDsH4U0oqQSxeTiHTDdWIP5EITcqmqb5yX
	EqxJuFlwTU0I+os7Ol7A8z2sumxo6Q5ZNxGOD5XkPS6jLhIUU9aIUhv2spm+HM46hOo=
X-Gm-Gg: ASbGnct6RswBoSs++cRwuxGtigHLEUqsYOKa/H3fkD8YJj4B/jUIvLhMbghmcJO7JuX
	fhhtNk9KB7t0ffhxwqlEebjwyO8n7eJLGfzJAyODrLzjB2ffMobgbNnXjW6TQrM4ICO/tShZeWn
	FymUKUWCt9/EKie/EqSxWo9sjZHi1n9WtgrTPm9e1fU8nHqqvVrcEXmVk+NY1HNxTZQu/fLrPTn
	nlVYJFRPeJzcECt2AwsD2FsYCaYMaTthFTIeB2bLi5k7e5hff19O04OoNcR1MDuYM0sV12dYmIz
	xrpicpc80tjIMZjksPVK1Rjl9D+Tx0AnRComaaWmcMHQcMddBB0gyruo+BKo89lZBEpNdZVBnZl
	HfLnov261upgCVDt1hJJusrvR/g==
X-Google-Smtp-Source: AGHT+IF05WFmbdowgMKPPyXXWCNrZhPQrflWbhpnzrcFI6weJVBBWzHArAW3aGdBc+YuLB+9c8B5Bg==
X-Received: by 2002:a17:90a:dfcc:b0:311:a314:c2ca with SMTP id 98e67ed59e1d1-31aadce5676mr1522577a91.6.1751612908338;
        Fri, 04 Jul 2025 00:08:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:27 -0700 (PDT)
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
Subject: [PATCH v8 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Fri,  4 Jul 2025 12:33:54 +0530
Message-ID: <20250704070356.1683992-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000829_240023_9C2853AA 
X-CRM114-Status: GOOD (  23.01  )
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
