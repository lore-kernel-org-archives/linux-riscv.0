Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1148C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4qzCxzjXuUab6rCGSkuaoQMls2yYzkoWlfe0K/QTJQ=; b=T7JPlyIIE3PHgk
	0DZJf+5qFxwS5Oi9nlETafhBqvXXIiiuByDizYxQqJs906lQ8mgT2lyQW8ye3aa6Qu9QTAXnV0v+l
	jRyas6I5OjuKhDLgmfjLh4DyDAJaWavvlwohwqr7A9SmwWU1fI/C/M1OyeqAxSB4BlR+V8oHvlRgc
	6AaO3fiQ6qKwkrNrb+8Oozj4Dch2JknJM0SAx8/J/PIk65mtUuko4keE9O1YjHRfnAL2RU/otTx/D
	YcauBolYUSOcIj/4tSS6cPPNSH0uEK11Rd3w35oyMuRzfO9xSpSx6itpfJgmCsFJpp5uF4pwSXcKM
	USQBDgbicPeklLoRNfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr4k-00000007Plh-3xkK;
	Wed, 02 Jul 2025 06:36:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppu-00000007GR8-0t4b
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235d6de331fso51559465ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433405; x=1752038205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V0Odgdog0meYxYnmF6ZJNtzVV8Khw6QA9VUe2JT1O4=;
        b=AnwBTV2eS7jLxVpaS39K4ObSlTVIFX5HqBkK+/s0f6sdr9iJEn7UFh00sK0GPBwv+D
         C/Qqf76AE9gfSOUBCN5rx7YU4AAAf6Od7tt2/pw1KGvhOYOWF+4uHsDrWCvYGyWTWDKV
         zYFXJxnrZ8Y0/N6FLb6AnAYDvW/CRfwugciojHk4FZqiV8EDtPHsoJo8JKt55k2u36ZZ
         bLeZPvyAshMsWUWqUqiy+Y1MozwZlmt3NPZIBw3v3uJWufjY6x1/1fAvCFXljEFmsUNr
         4WggQV1IDTrd24W1OoHFKqy5gYiCAFRxC9FYPLXcnQ4CDQt5Ripngaamju92VBK4Gdgl
         ykxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433405; x=1752038205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+V0Odgdog0meYxYnmF6ZJNtzVV8Khw6QA9VUe2JT1O4=;
        b=F+IyYqXGYBxN+ErC42db2lvCynsUMn2ot8aR8PNR3Is7Q+pOKtR9z+9fnWnkzjlfy+
         RK5ZZ86s0sUnJAR5am529ud3kukl0prxDu/3PEnyllZWvWLdBkXjFwwHDpD3WMY5NtcC
         9DQegdpoty6dbH+wQG+ArKTZjZ+HIDEm2B5E1umQCYoxs93vv42+GL7qz3GtCDQajgu+
         TYnq68GKcvNq9O6eQynYpKECTS/NhAeJiJmuKWRfWVFeIevMShBUhUh8fOmcUWRjZKZy
         RcXf+pMADx4nmIYG7G5cxdzk099XjKnw0Khk/uZntojb/IIPI31Fz+vxMtsbZtC9bfEc
         uK6A==
X-Forwarded-Encrypted: i=1; AJvYcCX4hm+ZTcWtcYr3Q2sDeeG0LXupj8oaSZWONyyw1HkaPCMpwJkMwgt7/Mrh7U/DLBlMepzq/XiOzCJVng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww7i6aNzeiA8MXYmbxGPtlsEmndB2m9gt2GD3nFAuOB48PBL6K
	xwArO92oVX/+Rhszh2k11ZnRAGWafCTPAtkm01zcDFbIp13uApIux26gITwhwWJYntk=
X-Gm-Gg: ASbGnctksDK8TTweX4ZT+1R5P7CbIJ1x/wLmFAIDG3siVfKV49VV1PmiTJ80032oYb5
	uv+62wqJoV6k3+bCuBCNym5GECSfj23sBeCCyDeuf3OOO0SphhWeGnRUVEYI+SJHfMD5IMstdhc
	BiyI8VZGeHbGR/ukWDrwg2tr9xLiSI8WguJgRbcH+y1NbNh5FhTNMMUbJJpjv4+XcdXvID9zBkc
	ZubI2aqm7W3tTTjgbnbdjh1SR8p1yj54R/Cm0Pqvovk4ZVOtoaMZQr506SDIuaQwAp3xtx0H1iO
	Nx1uMXuOUz5Y+sQPV1tdOTTX3b02Xh7uK/Go8acnrM72Q07kN2avFLXKwNsRPYLZr066x6I5Ngu
	yjpX1EeRmgq79sD2K
X-Google-Smtp-Source: AGHT+IH3e0m3Z712B5FuScEtM+R3UhY2+EC/UOkyXFHE4lffL+PCS6CYNx/+xTtoNWCyksjFpU2g1g==
X-Received: by 2002:a17:902:c94c:b0:235:ef67:b595 with SMTP id d9443c01a7336-23c6e56c276mr22583325ad.35.1751433405437;
        Tue, 01 Jul 2025 22:16:45 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:45 -0700 (PDT)
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
Subject: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Wed,  2 Jul 2025 10:43:42 +0530
Message-ID: <20250702051345.1460497-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221646_264367_4E1FE149 
X-CRM114-Status: GOOD (  21.46  )
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

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 129710f947ae..deb269a9a844 100644
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
 #include <linux/mm.h>
@@ -779,6 +781,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	u32 i, *channel_ids __free(kfree) = NULL;
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int msi_idx, rc;
 
@@ -901,6 +904,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -908,8 +913,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -954,6 +964,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -973,10 +990,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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
