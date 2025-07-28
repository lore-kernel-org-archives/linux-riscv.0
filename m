Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F43C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Anu3PI/UugWWCtdp0GtHLq/M+2zO4yIUsM04URgspDE=; b=JJ10inu6WPLkWN
	A7mocbnGcvcu4vT232NMx4U9meMy8HVI+x8uQXErsBXDqUlCLY577EwNHywouJBSYzijWNjpS13Ej
	xlbz8myh1DiW4cmpX43QP81cqbwVCzM9K4T5JbnktbL+ebzwPcEP0CfrfLk9JZfvSh6QF38wR+Opy
	ivm0DHKHk0nuktVppK3T0MxebdIDAlMDFuEI6QOCqXiItR0JraVFjr+W8qU4JSOQUi8AsejpTBgoZ
	qGMSLVHzwBdtoln5Eu4t8NDdlE6TdgeaMVr1dNnQfow3XwQWpX6dGbQF/Au2iYLbxKHt7/pPzMXV/
	NR0ZTTHwaSCD2S6zYzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPD-0000000E8zx-3qIE;
	Mon, 28 Jul 2025 09:44:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPA-0000000E8ye-3fvK
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so3508935a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695864; x=1754300664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFGMp/8sUfZuk+3Y8XCd9vyHjPUvGjLmyL+w7ERUYQc=;
        b=i0GD8m9BFNNqpfY/kLvSTGuEJrtkWZoA2DVfunhdZrVmYFC5cdjlgLSxPiIcZwTHU5
         ovIlg/BkUd9A6nzPGM5ICZ8pyD0L6cpH68QvHJ8mO22u3VO9rhxtzoc0D4dN52YdFiel
         TGsj877QBapl955EmAIPEttJHRV2nHCoCUh0z7EvwUZoxPc5Sr2H/tKWRhQlmBNfMfHz
         60mRAg0t45lGb8GH0qEfGl7FiBIMexMzRBol5tliR0WBjau2eJRCPxt3C4gzZI+QZq5l
         DsDfdr0s0nvL1TZcISGn28flXcF7hFv9ga31UDv2yynZ6sPfDqK3R5J8ak+yzcGpNEX4
         Unxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695864; x=1754300664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFGMp/8sUfZuk+3Y8XCd9vyHjPUvGjLmyL+w7ERUYQc=;
        b=gXSayFH+1pVnpUlkLchYi0XI056KeTZyf+bmIgPtBtiQ8Kqquc7R4IcuOKOXXTvd8l
         p97KLJn0Q+f530WCOgB9p1S2wsgRgo3qHD4a7iUlbfOJBfehICujtbMfX90BmUiu0mjM
         t5MlOW91X5NYJ2W1J9nzVJVTBv9+AUbcnHa7sS9c/gXBQ/Qp8Xh47ADrPUHKGlBaYKul
         FHaHeKnSUQBpXdE6IKaerkdUuKMrEJgy1r1D9Mjk28pSFpWRB37/W6mBS5YW3BQ8EwLx
         X7qd+hFvbdKOQHSfZG+axWAuYOgs1UcSILa/+xg8T0JshlwG9PmlG5NLiwvF6LK71Gx3
         U3TA==
X-Forwarded-Encrypted: i=1; AJvYcCX42a+ckBAlyOcky+YYO3m2226xYs30EoYmXYP/JXjKOum9eiU38GME5K2LQffTZigIalPWNBIYYxEioA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGN7nmZ6DZ7SaRBb5cZYuPGRCzhiR+67kPVlVhnEBhFazRf1Jm
	vTJmwAZ1sxpEczxtQZVxNauvJAfGwCcOaVzBrbMcIreS0C5BtaL5U1IqARXxtk1FP30=
X-Gm-Gg: ASbGnctmZQ5YLAIZpm5OrY7g4QvEQTEIMpmRweRo40hCCNWdtjN4LA9We2Nd8D1n/90
	HQ4n/2fs99OAmQQnCDpqo6VaidzrfsMbTI+5sWvpFKDxu0jtkAtz5AbbnPbXiWmiHrkU9rt9+HZ
	ECDiM7qIMjkYZCJCpV/jnrm2be/FJWNkbdYZtcypi4HQ4d2ESckV6b2E5K0VU9l13spKa37BxjF
	kf38nwPHVJMc99qEXbte8ng7ZcPyyg/UKHbuI+hYQJwxBgp6Z4rwv5aODiohgZkNA5sAPRg2opI
	qnFY9n6UHaapl+MSuPVXRCvEjSnFwWJ1xcqvpXCl3QD6vVUSI1brqNrprf6NjZdDrQW3uDuNhxz
	LnBjwl4sREKuBCig7ZGOhGNmNbQ3B/1CeK/r7jwk4py/5/njzC+9Pch9ANudZ
X-Google-Smtp-Source: AGHT+IEDGiXI75AkHkQ4o0aOIbn/4zDgCxZFmEByTpNI6PDAP9qRlU1aFkohBNQLk3i6jzgU5OxoGg==
X-Received: by 2002:a17:90b:4d10:b0:31e:a0a9:753e with SMTP id 98e67ed59e1d1-31ea0a97a21mr9736203a91.25.1753695863519;
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
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
Subject: [PATCH v9 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon, 28 Jul 2025 15:10:29 +0530
Message-ID: <20250728094032.63545-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024424_917012_D5C0BFC1 
X-CRM114-Status: GOOD (  18.93  )
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 1a8a74d3ad4b..a739088c3d4c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,9 +5,11 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/minmax.h>
@@ -902,6 +904,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	 * explicitly configure here.
 	 */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -909,8 +913,15 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -958,6 +969,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -977,10 +995,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = mpxy_mbox_acpi_match,
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
