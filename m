Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460FCC3ABCC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XW4vzAU3LPCaSuRzGFcRkk9Xvg28wZ9KNufTxKV8JdA=; b=FY8WsiUfOeNuhY
	yAU15HUcwhYhWJzFxEeV3Ovbcte7EwbEQiRQ0ljSsvtVkw+urK2eKmQJV4sOz4CcW4lB8/nfULf1a
	gwBX8e/e+yL4/ZJzrZ9sPxjBQNJMRdj34kA55V93eeky5zADs91iHIble2lIusxM7rCZk0be18Rav
	aefHo6KVgtTuYtWldhtTz563ld6d0x+Ac1xbNL+PNGh/FVRFcb4KhFixCRBjA7/WMjSM5i7G54AmR
	AQDr809f5N0z77ujHmKU9XRDURo/sNt2FB1bFGe3CmYygtKk6tUJjrcB5ntIv/0Kab1o+2xVFr2Oy
	lpv4oyunEkoxU/D4hJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xZ-00000007IZr-1URo;
	Sun, 11 May 2025 13:43:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xX-00000007IZA-3An8
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6cxg75+BmbsVK8by8Jg0JGFQhw+Q08MYdBoH8jGW6Ls=; b=qW+jB23ZzLABOX6tEOQn9UO5hD
	Uri7jjDGp0RBObbK9v/vpd4kyhVJaH3LbFcpFaHbzc36HNShPBcR1K7tbdNP5q+dKOEbisi2WxWna
	bzEqlnxVkLG/DztE2KD5wSWdzB7ptwt+6fcbvgzf9pu43VB+5kjR2wxBuuH01MzJ2Y+C/01M4C/r6
	Z33oXAwj2LFhbaLzbB099svGbOD52GGnZBZ9KnQNgk646KErtcAbk5gQ1i8tX9WZis8YssEcRiIYv
	sOO6SgQnFKvYm3WGa8pUeb7sQdsLAlaOc58EF60lUt5zfaCkwk8NEhtO9GLDOzxfNUZLXoQx6ZXCF
	MKkpzbUA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6xS-0000000Gc6x-1eZW
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:43:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso1003467b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970984; x=1747575784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cxg75+BmbsVK8by8Jg0JGFQhw+Q08MYdBoH8jGW6Ls=;
        b=VQrOX0w7+/34len1i7cCiHXFNmUSyf4LjtDAuY4yaaO2NwIWGZaj+7IEs0DoPyLizU
         +b9xaSVc3ZDwxfQK2s7IpaVLGC+/0aqPydbJUwg9nindKCCMsh+nj1CxZKf6tVlXgOOC
         JVdosfFlT7Hq5KgpT0v+c4CS3rha0ssBYL9aonXgZEpZYZVXrGD9EkCVXk4C4f+OXJ9E
         iCBqXDDpy2/G6xTn5sr1nvEk9ysHzU78ga5S3B7dDO6o2vverdEJwGol4q3QYymLNKcb
         OExtdGiwEWdHy/eB3rZj2Ipl29s3coi46SVLDz2zbgDlwU5DvMjNzDdgDn0ks0m2NnBb
         cxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970984; x=1747575784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cxg75+BmbsVK8by8Jg0JGFQhw+Q08MYdBoH8jGW6Ls=;
        b=HbC6DB2+mLu3fjKwDIMa5Nfxjtx+lsRdNYIbxCReILSeOPiOfzIJ9Qoy86f7AgXgUd
         IM8djVsxfXP/GBoSOXHJsjrLPoQ21ShNcaTFkRubwg2UViuOYa1gBnHp/D1I4YIRIyw8
         B8hFgE2j0TFhlJfD4f2sIyzuuHoB5lnzCrOnPiKYbpxX6LgsAscMEk5Sldv30ycOO++W
         rhYAUukdARd0HOc2zA6HxaPxB03HvW3FGib+RqjH0d7j5HTY3ZM+Ebd4fC0J7L95hYNC
         27eQVPRVBE+zQJIZqPRyV4P+wWCaak2Rl+3MvCcY74oWgC4lDR9ZECZwOaQvdWB8I99T
         zZAA==
X-Forwarded-Encrypted: i=1; AJvYcCW7JHvBbwHRK4ERhlbHbk1vpfLw+TOp1XQIzFDxe8nlncegQasveaKNulp4w1r+QIpOCuxvZSMoe2rp5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2OpephX2FiLlcAbGCNdqYa7SfbVsp/ETPioZrDtZTTX5ncXv6
	5I78HquDUrkxnLC4H/RjmL05+kS13GtXhBgzQotiB9HjGI/dDNzOWja5H/zAVk4=
X-Gm-Gg: ASbGncuXxBMEjKXktPl1h1V8oeupw6mE7N9pls1puLFYjzw0mkk4v68WsmZHLTHvL6r
	2I3t96sCIrMsETNL+YUvU7sf5OqYP1f2Rhz+JVe3Ln8SZ46O70L/3XLp+4uIQ4VobbRxxcdTLL6
	yjR1oFJpV1DJ9icX8ravO4sy7jkCJIXo9D8erRL3/SBUXH7zLwxYIgLaFIQDWk7gza9QKt+ERk9
	/QDqF4/vVN71+YtMQlVsaIurRNwFIcQT7xKi8KMBD7p3K+KH+Qq2GG0U3A+sgz7X/Uzr744GH9Y
	+lmg8M8jpAojU03+eWyD6/pdgsA12Ie4XN+U9MYV+Ued13I8JbmuxGbbggXEBM9vnLjYFylZlRu
	ygqr74YY1KZMdxw==
X-Google-Smtp-Source: AGHT+IGimxLIrk98Pq6CzitTPHpo8INIdEParac2p+qEDKU8VjpHbzTRWz5rjvW160LTHxYOVVCdIA==
X-Received: by 2002:a17:902:c7ca:b0:22f:c91f:d05f with SMTP id d9443c01a7336-22fc91fd077mr102748145ad.46.1746970983702;
        Sun, 11 May 2025 06:43:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:03 -0700 (PDT)
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
Subject: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Sun, 11 May 2025 19:09:37 +0530
Message-ID: <20250511133939.801777-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144310_613721_FAD23EEA 
X-CRM114-Status: GOOD (  21.82  )
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 41 +++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

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
index 9f14a92290c4..cfe8d45dba97 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -3,11 +3,13 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -212,6 +214,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -240,6 +244,21 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	if (is_acpi_node(dev_fwnode(dev))) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
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
@@ -249,8 +268,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -261,6 +285,10 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 					  priv->nr_irqs, priv, priv))
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -270,10 +298,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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
