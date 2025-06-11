Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA41BC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEI2HYom3gMmpqk5OEN/WCNdCyHlp8qQzLwJrx0Zf6k=; b=C7NdUBOpDzOscy
	qgMDAHZXSFqq7zpWOI90x6sq6m7GKzFpF60mYAa4e07lOucyVAWo/gvTFc7y3+xepcCGKJfdqDBFD
	9+qXUgZSSM5nIpuXOAX/JW6FyA2dBgkzQWLjet1Cj/SxTqt5cPOZmhC7i3A+eAIqUX3S06plVU4K1
	2bQTcA7adBf0lDKNCFIGam8F0R+G02acj+X34muPcmIMPVxxB59/s3PLD8PlSiCVM+wrejaFWXfL9
	l2XLkzoX6pDg1XO3FRHTP+6ZgyK/vpsK0ugn33Fl1t4zdQI5d9b42r7hrMjaFToJvh3d3S4KMAqzQ
	Kv99iFEclRf7qMyywdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuK-00000008zqh-2FVP;
	Wed, 11 Jun 2025 06:25:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuJ-00000008zqO-47qh
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SHGP1kRF/SF7T23OiU1gKTpSZCj2TzVO0PDfKD5QgtI=; b=QXXKYQFnKBEEDloI6t6Lxcc4we
	05gdrt/NufBfwKmZK3oqcJ4D6LUKqRF5rKZPpP/wwU5nh8iX2+U+D7opIxJenQ/7pd/3GXQq3/jgr
	Z9PlMsUPz7i9WIekAMx889W82Z0AWA8ebkMkHvbX4wEUKtSAaqQDNHrXQa2piyvmFNgN9CZjQAFsc
	ZreS2VvrZrLe0TF6+7oapquGiz2tX+Jvc2LgtLkmganiYDgs/tj3bo4cBG00tDUu6LSYOHDZGcKbo
	UgtcS/cx9AosFw1X3iS5e97AonDu5c6IjvUrfBNG2+cmnVoBQ+ydsTASi/rPnTyw30mWWav6USZhD
	VQ4heYuw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuI-000000028PC-0moK
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23633a6ac50so28518795ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623151; x=1750227951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHGP1kRF/SF7T23OiU1gKTpSZCj2TzVO0PDfKD5QgtI=;
        b=U0H/YnzeCh4TVxdy6exnawd9J/iL2qonuNB++GxvyMK0RB+q2ldtuTMOdTB+48DLEE
         Ne2crg+Bp9Opo6iKFYB86ZIf69/n3LgJeO0GT7DjpNbVuZoPEqO3PUNH2tW9OJ+Vymyd
         iB6N1CfztS3R1bQos6/yAjxnxVRgqtoxrap8Dwz2CBZB0RUJ/xgtSptAQNBmawKcICw4
         r+I11p4vF4XYLajDdTGoIwJCgy1F1vfkxzB6IOh4uLfVHEw21DyzO/OtWnYvZ2vhqWYf
         8gIoayxSmm4NTKWSe4RIfKkPyCb8CzgvpcDdUkDeTkl5MFkMiwC44k4KmHEAOknMLZBY
         7Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623151; x=1750227951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHGP1kRF/SF7T23OiU1gKTpSZCj2TzVO0PDfKD5QgtI=;
        b=hsXq7ykV+wIoeoXZeOQuOqB/lEOfNdDCW7NMWUyJApkTvK1+EEtP+zncybjrA6RQFA
         ERtBuOY6rHv8qulNqsHVfpHumrclw7tX/3IOcU38MIOTehL9J30Hrpt/Ix2Ei1N97E17
         U2SeVAcyCjjQZcSVggeEPmzMt6AI2cZMfCBLifuafCUzaJRfCUV+LrQGkeaKOc05fHRS
         TQOMmecwfUEOaF/aFoc2u8pE9NDjguHFi8yNnVsbm71vy8y8wLRCHO4gaqSPN5sEt85k
         snIgCfZYlB85dyCVOlZQOuexQ22Z4QIzSirKLBWSc2Vb9dGzt3HWWJU59ob4YZEjKkKB
         MBLg==
X-Forwarded-Encrypted: i=1; AJvYcCXMT9gmN64hn1f5q8DsIjJ8LGkNd2ARYfWj94RL/QfH37ZOuZXKMpZdYoHpX1GU3jJZmlUmONKgR7yfZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq4laMQHxH3aQsc9vIvzDSLMWkZYwWRuEEuH93hlWs9KwNzcwM
	r+QPKBOz9Qqc+BDfB803Alc4ON0yiMvhLKc17G7Gm9/ZD5vHStCuVFT8MGjq+89Wtow=
X-Gm-Gg: ASbGncvYDvTBSFk3rTxCwfzt9wMuBXz8kpgCpqMCPpkuJIvSf4ec/aELaj6nfW5r8aB
	PnJ4JcpIvkeTUaHttRNO960/bTozpQz7p8/P0j3mh5vrC91gR+T0D2A0YO+x710CDRlYQM4I3yv
	oqc9Np50NVXQRKGXWltRpnSxgklfqs6N1RZz3jpwH6fnCv4VxRDS2hgnreT7BfWuySz1uA/vp6x
	ee1CDIh2VV8doo7fRW1BygZx4vBSNu0Q64STX4ST+wtCyTj3+CYHGQVYXeekI9vzDABn6PtwIzl
	WVe3LSoIsioPrWXm8SDVSuMbKC4+482snWDupDoAztPIZVUpQVpFTVkDPZEmaJ4tsfVonGd0G5n
	sBeStgcJ2xeGyb0VoEh0Br31yRQ==
X-Google-Smtp-Source: AGHT+IH6nfiBAkGOIya5bHfPvFUBz/4//w0r17J0S0KttXRyJ2RxRUT8VeWrU3bXJnI2eud8IG6zCQ==
X-Received: by 2002:a17:902:e548:b0:235:779:edfe with SMTP id d9443c01a7336-23641b28c80mr32543345ad.43.1749623151173;
        Tue, 10 Jun 2025 23:25:51 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:50 -0700 (PDT)
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
Subject: [PATCH v5 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Wed, 11 Jun 2025 11:52:35 +0530
Message-ID: <20250611062238.636753-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072554_300387_BECA49D0 
X-CRM114-Status: GOOD (  19.96  )
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ead67345456e..dbc76a254c44 100644
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
@@ -769,6 +771,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	u32 i, *channel_ids __free(kfree) = NULL;
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int msi_idx, rc;
 
@@ -891,6 +894,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -898,8 +903,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -944,6 +954,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -963,10 +980,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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
