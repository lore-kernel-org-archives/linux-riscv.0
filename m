Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D15C02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APB0al3fEhGNhLIhBvu/Kxax8EvWWLOVQ6GGAFJBjNI=; b=Zb1EOnc5o6SlGN
	g1+7zY7Hr9uiwIgYmsD5pPvFIHFepwoBrhJKmF+Y1zVy7+K9lR/vbI9bGYhE+J4bJUqDsKaYGVSS9
	lKyyaBmzGORhL5LekKJNd8sA4Fy6BuJLWs6WV8KNXr8mE3WB70n2ya53sD5hfbOpu4SA83+MkooSS
	oV/iz88yHazzcVM0plmPjNQIzr7m1eu90h0ht0WbJKCdeVwZ56vdX295iA8rcYOjDIwgZ1uNsj8qk
	6OTghVNzGSiDdlf3qfB4/ZN/apFm/y/1wWVzxNwhGkNCReAXLgcum+zk0Xt3hEq8Itxs6caKrrD9y
	iND0U+pUrbYOfnjvIkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesC9-0000000Eup1-2DPi;
	Mon, 03 Feb 2025 08:52:41 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesC8-0000000Euoa-02ZG
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:52:41 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46c8474d8daso30064591cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572759; x=1739177559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMc6tRRbVVjIuFrimhD5cbba2O5fSdoBYlM+WudqAOg=;
        b=E4cLqZJm+OqcNMoMPyex9eXvLZvxX8QoSE0shPjBO6VaTX68A/YJ6dt0yXI918qteo
         7rCibIQ5b9wH/dlgSCGiSKegucGUJbD7Gx3X5Nd/JAF6CScbmc1pLEv4VL27oC9v98Fc
         E5Pa1Qnp79vxOa/vMFaIxrnFii8CBK9xyfw6ZSNB1HtxMFuKwKcd3uQVZCkQaa4/Dv67
         E87+UDQeMexHo1/cWKDq3KALNbvBQBZsAbJfI25NYTxKMZrrwE5hMHS/0/1T/t5SIfj2
         AcoMrKUVKV9F9pVZer4camH5X3bBfFJjGo/1DGYbWh3NZukgazf6Bnk8u+QJNkjKtXCg
         Oj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572759; x=1739177559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMc6tRRbVVjIuFrimhD5cbba2O5fSdoBYlM+WudqAOg=;
        b=L+tHtljQrRyfeqPn4skrFwoloXbdzXPNscgCL5efHNXK6fsNqey0OGo5mytfbk2u/X
         xTcR9Eky5nUdY5kwcsBbozo2jA499A6txPJvWtHHhaL2ofGxJNZkPkxit/YD4gEzADfJ
         k8y7wag/XjDbNMgo6O2QXBuGkN2E6XeS27OsbP2XrTC5UFGPR85nxrGkEp2J39VkwXrw
         kAS07PmUosiRKgrMSze5qtsAMxP1QbauoEAQnWSaALgIxeesG6+LwgVoVx50eiL4d95U
         wc9sddG7AHcGDXANvr/hdd405052Fo/YemJbWSUHHJkMPr+YxGpMe+vQHeXAVvl51GO/
         cYtg==
X-Forwarded-Encrypted: i=1; AJvYcCWar1BXRUj8lKks1XkLphTgUWU1nyigw6+J4QKpSwPP5xvbsCyfj7CXJs4pRrSjHrftLXrxNx5RgiozkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC+dehaGCEVIKzE6POCxDaADyhTTdTCng56+cbUQg9m0ecRbIm
	YaPT7dLpg6SvCYgDT+oOoZ6AAbUOpQxkkDs8+Qs09WOzACwzGIO/rTeHrcRzzbo=
X-Gm-Gg: ASbGncugztGMt+ed8VLYZkaOBkQoeC5SdMgAxFNYYK2Myj7ET0vNCW3CUlBNQU2GegY
	XeOioaG+MebSovdl1Jx6M6F5k7JYhsMPRpvWuS2AoUu+MiPH2A6mYwXZbbAjpXDGAlfYgnCmacO
	sHHXkMFRqwHruk4qBtdatRSDTqVN/CLzy6LT8x0CqtXZ7OjTRzRekAJwhGnBuKROe0RbdIazUy4
	5q4B4PmCOeDMqga6Kv9pyEwv+EC+89h7B9e/yeBZ25GXvFaNCapGoQPxgagLPi6YWeqjD3p7CRR
	jF5SYZOqwkkbFRjaNKTe/q5vk6K1fL6M4rnjt02jIXv+s/BpClsCUXs=
X-Google-Smtp-Source: AGHT+IFAdiGU/iUBycYCxgRM5DsqzJFg3ES5gi2sqFYcXQtsQPK6UBgEZ5OP+FdlHA0Q+Cdlc8Fv6A==
X-Received: by 2002:a05:622a:134e:b0:46c:7152:317e with SMTP id d75a77b69052e-46fd0b753famr297039461cf.42.1738572758960;
        Mon, 03 Feb 2025 00:52:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:38 -0800 (PST)
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
Subject: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Mon,  3 Feb 2025 14:19:05 +0530
Message-ID: <20250203084906.681418-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005240_053700_1E686D01 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 34 ++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2ae44354735b..cf96382113ce 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -599,7 +599,7 @@ config RISCV_IMSIC_PCI
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 3022f0924c94..1f03241920bb 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -215,6 +216,7 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -223,6 +225,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
+	if (!is_of_node(dev->fwnode)) {
+		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,
+					     &priv->nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+	}
+
 	/* Setup mailbox client */
 	priv->client.dev		= priv->dev;
 	priv->client.rx_callback	= NULL;
@@ -252,8 +263,16 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev->fwnode)) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			if (msi_domain)
+				dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -264,6 +283,10 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 					  priv->nr_irqs, priv, priv))
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -273,10 +296,19 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+#endif
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
 		.name		= "rpmi-sysmsi",
 		.of_match_table	= rpmi_sysmsi_match,
+		.acpi_match_table	= ACPI_PTR(acpi_rpmi_sysmsi_match),
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
