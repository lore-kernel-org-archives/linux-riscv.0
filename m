Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F0CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkPGGEzP9fUqXqzu3KTqSSA4LNZTqL+rFWfNhhSKM0M=; b=JIaWFmyZbiNrPp
	/Wk3+pXwdo/fmvl/JsD1qPcphv5Ul2G8113dHXUMtiXJZEgPGsx86h4N8Eh4zjQJFfdUHftIYq0cF
	dk7Twve8+Pk0eFNN1t8c1FRc57NzgIHXiCg5hbygwhIXCOLdlo9aD1xCwzN+Hc5w2yh4iteSv/Me9
	aR6ugca+BT/CWeaTNb93dNQBXomB/6/GHGndaHxcpQre/IRipVgzHvGSI6wpAz3lHJB5QnxzZ3fp1
	b+/WxGcsENDaUXOsiijlSLUO4kLiZgQP/CObWK3aRSZ4hFNDciiyw31pFxb2CWk21xiNOst+gqScl
	NwaIF+o0HPNH/YQyAaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrF4-00000006RnD-12r8;
	Mon, 18 Aug 2025 04:13:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrF2-00000006Rma-3bub
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qnjod1mifEH5b/qp1WwSmznv0TnT3EP+iS7ZheWdF/Q=; b=Y9BJyE3jdGMFBXMnI+q/28NYQN
	miI3ceJTlI0o46hXi/Gi4YYP6jyi0YMG/IvOG7MN8rE4GsSYt3Umw3a4OPFj+ZIzTQEpX+Dw+tCOn
	10BBzEFM4E0BG4Um3hkFhOjcex2VGF+MtpN/Y7Xjk3F9SWj1B9xalwnbaCxkuaBOSoVO6d0wR3Ddv
	V8pa25aKFI2/oXgX8167wqVqaNJZPv53PCHLW+Fo9L03icBApVJDHvRbexvYW8CwVX+bRuhmFCNqf
	YXQEseG/MjM30AZxGVEUJegMOtWLIfOIXfdsLz6NA/OnFXqU7pl2TTOprqJpmcWG6fC82C9OpF1AB
	8+8gfGQg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEy-0000000HEJT-3NJC
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:13:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-244581cc971so44275425ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490379; x=1756095179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnjod1mifEH5b/qp1WwSmznv0TnT3EP+iS7ZheWdF/Q=;
        b=XqAqNT0ZQQwmYQnja3GmZehWWCxgQEB8N8jQA1bTWGrreHnfgoDqdqJ+zKmlUA8rYE
         r8g4KKWRiFvydbtfKco3z5N9RLadW2zYjmgB0WJTVoVdiGQGqYpN0zgb3EaqEe+2MZ5c
         OHQn6w1a7LvI2fDHlbkySXdXXUs5SBLddjA8SE2bKvUrqsuqCUpYp8Nu3/sqnCXFq7sK
         /ej2ruqVqUXuUTl84HcCJy7/joV8npao5hwhtIjT2aBuS9ntfiG/CW3aIahv0w59sBOH
         soEMpkVvX3M4I6dPSZxK+eAKOvT1O5lvUK72mBuuVLYLZj8kWxB18xGyj9u90YwBsGUn
         nTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490379; x=1756095179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnjod1mifEH5b/qp1WwSmznv0TnT3EP+iS7ZheWdF/Q=;
        b=MC3OOQQk0Ei3s5SMN+Hws6D7zCQ61V5kIDRk2g7fgeLYF5kyx6koZkWf+M9r8ce7D6
         YW5xkfIahb/aNa2q5SDv9EzQw+BtH0qG8TM2FO0NSRPOdc/rjGsrgI+PpLGuXXQH679f
         6cgxoHDqAfwDuAZJ410gt0u6J6Tb/+GCNpKXRla/6ndAaVIC/Pg95ljDIUcaqDFd5CjV
         JN4vu71wFsqzcLdFP8UT3t5m0Of58PL+cZi9SRalo3YWf5Jjup3mxg2stISRAlmVETst
         XX/JnZp+lyEtjDAbv6UBYWXQKMlkPhodI16+Umb33iZR3hOtKdgIxX1zTlbtfmCzhKTA
         OGOA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wjieXI599Z5tqoJnSOUYCYIRqHLIXyo3ebo2QhxrCiJTJ/T6iNJhM9GEvliOLQwQfwh/XduJcTTCVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx32+XmuTgFzOp0mnAeSW+Q5ABbTtwUwUDsB7I4nI+hgTYgky4K
	2uJu8iPHJsmOgp48+Ny2iZG5pcZSXB77YVG2IGH83NO2WxIBo6gnHSFuxutp6TJonec=
X-Gm-Gg: ASbGncvo0puBV7G4UK88HqUVJjxCoMcTE30OAWye+C7Xv0a8qtZPR//5kF2t3a+8BGh
	d0Ml2wqkwhdf/1ZHL0Q+GFNogzSAwwkOLwgFJVzCsC5QPy2e0Z4PPLFpGArwzR/vuEwgGfmOyQE
	lmQuglX2gk2Jo+MGa9AAIGaB2xr5Qed34hgWcCPWZWkOSIOS8Z5RgOBydBTSlDtXymA7nByu8jZ
	0yayE4MJZdf/lKG9wajqJsW01Cf8JOn1mGbeFkk5kOwiNBjdJ1Z4M5f1uXo+ILzi4GPPzFoxVeH
	M0jJxD3Ydr+GUrt+F9FqPt6tvItfdeYIHT9RaLzoXBZCn2U3/ECJkoHuEEICOb6o0Gqt2M6TZmX
	RXNhN0TfHLFh3+Nr+r2TVGCxhQpxA9ngNWd/ga7ov0TqwKgWO0mmmsg==
X-Google-Smtp-Source: AGHT+IG8j5so9LT6XTGWsEtufkwowpwix82la3oqJqNnsExlbLVaOnLWc/li5RhrKLvcU04tm9JZeA==
X-Received: by 2002:a17:903:1983:b0:240:38f8:ed05 with SMTP id d9443c01a7336-2446d8f36edmr131628175ad.36.1755490378108;
        Sun, 17 Aug 2025 21:12:58 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:57 -0700 (PDT)
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
Subject: [PATCH v10 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon, 18 Aug 2025 09:39:17 +0530
Message-ID: <20250818040920.272664-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051301_698668_3374153C 
X-CRM114-Status: GOOD (  18.88  )
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
index 21404baa6df0..7c9c006b7244 100644
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
@@ -906,6 +908,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * explicitly configure here.
 		 */
 		if (!dev_get_msi_domain(dev)) {
+			struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 			/*
 			 * The device MSI domain for OF devices is only set at the
 			 * time of populating/creating OF device. If the device MSI
@@ -913,8 +917,15 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 			 * then we need to set it explicitly before using any platform
 			 * MSI functions.
 			 */
-			if (dev_of_node(dev))
+			if (is_of_node(fwnode)) {
 				of_msi_configure(dev, dev_of_node(dev));
+			} else if (is_acpi_device_node(fwnode)) {
+				struct irq_domain *msi_domain;
+
+				msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+								      DOMAIN_BUS_PLATFORM_MSI);
+				dev_set_msi_domain(dev, msi_domain);
+			}
 
 			if (!dev_get_msi_domain(dev))
 				return -EPROBE_DEFER;
@@ -960,6 +971,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -979,10 +997,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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
