Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3761BC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYM1MJx/pAtBOUGXYq1r3mtjzEOwx8zoVbjQqz5kqKA=; b=gvUu7bYucaHayr
	jbwRaYcYO8xJVV1aVFK9aW93V5R3NPV/jBV85VV2eennhxvgSYI59JvngisY7szioM3Hr/fXgJxcZ
	fIGqkHarOmP0CQfZBCLoHOm8+YhShq3I5feB6vYzSFWcBXBKQmzPVoEIkuUiHRTMjH8Ffw3mDGIWt
	2HZf50wEsarzYlgP42yV7zNl0N/1ICFBRgmxBR8bU2nRAMXpuABY0iZvHc/ypu3aCSp4hvKFE52sg
	rRtSDgXB5JlFboPDqqjYbUxIXBxeA7fkdibXzzAkIweLP+/P3csxP6/DmrnLCB6t3nIfDBBuLM7Q2
	EIrnYTR2CxqRUdAkyjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7z2-00000007Owy-3arv;
	Sun, 11 May 2025 14:48:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xO-00000007IX6-2nYK
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OQArumrrnU/ogtbn7Qd/AO+fc3Ys7a312xLrFyKayPY=; b=AennwxZ/ycewzEUgCu/pHySSqD
	eijCnR4++nibaNojJv0OL6YKMK3/iDlJZt2zA5OT3xLgzSWJzqdAUFNNfUm+/voEeOtTT2ITNAy27
	ax7a+Cs3C6dekqVRKpSq8bTlarlLmaLqiC49QGLHmcv3fpUFykhBG9YJNdUXAU3PWW5UpVI51fiW9
	SP3De/sMAzpvTTfXoa9OuiiGz3jM9AM0JesXaedOUVwfdsZJ5zLm139ZsBbfckiFvvrsLJgClgHTF
	KsxJNNNYZhsdxRn5oTKVj2+W5PVRw7phX1L4g/w6vFjV2ovNI7ih3/PDgQ4tvrVXBmXEi43FEXoyb
	8TyPeeSA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6xG-0000000Gc5U-3Trn
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:43:05 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22fb7659866so35636035ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970975; x=1747575775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQArumrrnU/ogtbn7Qd/AO+fc3Ys7a312xLrFyKayPY=;
        b=H/3UnyWBa6nat2Xdue1oLdht6BnmeIM1hAf/jxU9v6qriFbXukUPJv562TmdsjRCSp
         IY2xWu1udWDvEP6qm4UCzeY+5PwmskKG1pD3JKdqn4259g/+0AzckPu+kEyJcFKxSmau
         WW1GwI2OAlsZ2YkNIe5bTQqvpy4poHGqbcoBfBdnreLYQXHX13v4dzdtHgNQHG5FZOMl
         NA6WrSaoUxRq/JRgGNrwpRB+GMFmm4Sk4jcFubPa3HL1AAPNXeNFu/M6H392BBSUT7Oa
         HHU28DbJVYSVpHZT8HtoB7X02qK04rF0fJuiLnS/yNhuJh/B+R5KawKJZ+kXOfin+Tlh
         xSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970975; x=1747575775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQArumrrnU/ogtbn7Qd/AO+fc3Ys7a312xLrFyKayPY=;
        b=Buo5onbhhBm2IgqhLMdKLyv9W1PoaHgT/8V+jYzje0fgjkIvVv90tOX4vXpcknIJGg
         D/gS4CIrcpMbAZtZXR8J46lyzvh8EofR1IuHXzdROyOv/ZE+YmbML0TxSH6uiVm9IFIc
         FSCynW5z97XMT1Ehu9Y+gRef0ZRpD7n9iBQTw8O4YbX4d1tdZTueqOXU5s9po0eiyUqM
         i6mZLEpD42FEEiSzIq/Nkrvn76beEsm32cpe0+PEF0RBoODN+19Nc7eHbKajl24nwp+L
         WWvc76XmHxvnuw39rdvgIoNoSpP9miOsLxENpl8kG4+oPx95OIy9JBaAVkwb4tINFArV
         8VNA==
X-Forwarded-Encrypted: i=1; AJvYcCVTQFptgiAd9Pzcxr+xBfdvBgEiOIg29l8On/OrNiBl4P37PMbXqXA5H0JXMLHzwapVYe75YWZOE6Jrow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJfcDfFVUam3/j4UxYYUAtBuVG6GKgGMhIeqFYrCzSsnnWfS5y
	0xtkMw7+GEbME53ZJlqTDj8/dQXpqFVusujaUmbDBkbY6S6nUqMxjLJpSWzq37I=
X-Gm-Gg: ASbGnctYw+BgxJ6iXNUWNgKVGW9DF8WN4OkvH1DPhd2OTPEezCjGY4YFDZUjpY80hb1
	9hcNWbKWx8hs8GTZ1McQgC6nWxnLlN7cPjWofYdaNFUetZ+VnlGVVQ4LSQH0zNv8K1GtkzafyiR
	nLJQv/93mHgizyOfTYQ/V0HsKIrCmPAWpZh+cHa+Q3ogOxq0dTtgiQBfIi9WyE0LoBXDCTl2eZC
	mYpoI/hTk/EMi5p8STrWzLM5u2VC5BpDsSGpSIXieL1ieQv+mIZjyvSt/vbhP4SM29XkOm3zjn6
	xRR6x+q/tNBbuXY6ydEv09Jx8k/XrllxyckjuCFC/0BnaJEUAU8O7zfhfWRVxnEWJF0BSuZyhy8
	aqTgmzGv+zNcTOuHqMu+J0kGo
X-Google-Smtp-Source: AGHT+IH99Zv1aZv5nsnBv9MERKHyTW4da2QONHroI0asr7GANUih2QJUdTnOxyfgJFsPzfiGqRq0gQ==
X-Received: by 2002:a17:903:2448:b0:223:f928:4553 with SMTP id d9443c01a7336-22fc91a735fmr156129915ad.44.1746970974847;
        Sun, 11 May 2025 06:42:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:54 -0700 (PDT)
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
Subject: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Sun, 11 May 2025 19:09:36 +0530
Message-ID: <20250511133939.801777-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144259_060369_4DBF2799 
X-CRM114-Status: GOOD (  17.44  )
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
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 240df2f9d5c2..eae84b26d628 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -6,9 +6,11 @@
  */
 
 #include <asm/sbi.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
@@ -775,6 +777,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int i, msi_idx, rc;
 	u32 *channel_ids;
@@ -907,8 +910,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -953,6 +961,11 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -972,10 +985,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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
