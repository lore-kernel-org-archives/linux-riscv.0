Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5776CC02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orwM/xYthxJLGjwqL1MpWEDVyNZ5gF35B4haGLCteNA=; b=FseTAHDlqGdaCL
	yDp1HeAHqBQRWC1lBzADddEHLtoX4nt01OENy8CkvIPgQsn0KFba2IBP8g67orP9GzbQwsDbrx02W
	tAkYhX/xs18tiOsoKasiUZdM1k1x7MjRMsX/uXwGztZgO+urK5SwjyEdRk79x5QGeZyZjNjv/w55j
	pLtGK/oboHsD0e8VvSyljqD5drRtNKcyShE52kbPshqL8MRsONWxd0JYnMkCX2R8b5Z/Oy3bv4G62
	Lv/417RRwSYX9x6yx5unY0EvBAD0rM4hAYklp5NN+ezW9yXVAg7/iXti9BtXvXM5pOQTcP4atCV8B
	9x5OBmkL1rEMSvMvDLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG9-0000000F3ym-0imy;
	Mon, 03 Feb 2025 10:00:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesC0-0000000EumT-1k47
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 08:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gfhx+B7bNZPEhRIXiDYGdJlXqpYXlIrkdnjsDcgJm/w=; b=CSh2CAfpXwb5ULgt54bfyOccb5
	jZfTwYtNzijA5nuLdJwUCsD//0pDuhHzbYCrfeEqWBX/5dmSmOidECtQ2nu3iHonrwk+px1MOTXEU
	rLD3Jp79nOgG0UXPghN6s4gRFsFn43pZN9ASBJwhHs/50VTDFmVMg/jNmtp1TQGAXSED52bEmU4WF
	mXifH93L3ciNYLMZHH7wtqC0iMUZHrUotztLiHPpbIFjWWBzQ6Ofv4LaXR6IsG5ikzJ8PBxr50SE1
	Lh0BRD2dX9DhlNDvnYyO45WnG13QRPqGuBzYvr/Wc3IDrZ3S/ljXj0qU6Kf8jcpSbL3f2nZwVFKXB
	IFNGWMbg==;
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBx-0000000G15G-2AFu
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:52:31 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467a1d43821so47869221cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572747; x=1739177547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfhx+B7bNZPEhRIXiDYGdJlXqpYXlIrkdnjsDcgJm/w=;
        b=ZnzKXYCXwxbym6xOt6vH2SuCvZfWZJXYWieyiAgLXfFqImKLc58tM42yL3Sdi0GgWd
         ejeoeKEcqNfHgZRZcSCWTfLwR4FuOG4EK6KnsI0o57svPbzU6VSWCmfVPYThmnX4r5AL
         GGxTHqP8CRRzx+HkaNiCTTz2JLju1qgYmaFOrdCVyxfNANTiXPu45NU9VurCBTC5DrDR
         yHEfbNvv0dh+3ggLhvbhT7ewS2UsxiXw3OP4qfcAREIh1qNa9RwrcMSr9fHy5kFedu2h
         1lgCFRfHj5T3dKIRWOU6YLMrmmH30ouIrL9MErUB+mv0WZSd0BNe0F6rYRHHT04NveYf
         qYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572747; x=1739177547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfhx+B7bNZPEhRIXiDYGdJlXqpYXlIrkdnjsDcgJm/w=;
        b=MO2/dS7m9R2foYDfYcgnG5JlrjtWk0aK0qfAYMqUiuOn2jDbq9riEymz7Gr1POquBz
         srfB1Res9DyjolVByyGjnhjTw0T1JTwdtdvumsVNFaXUYwc9fIHe+OaIABi95A/O6KFc
         ydPnrI7r1V3y7Zh6WTiNJdxiLIW4rEngSb0nS52/dFcKNxThpASnKQyBjDLXH34axx+Q
         AFnvhJFsLd9qzTJAwkxb7EZD1XWmtjSMMIqhbbV4SWmKRvsQXhD22jDJgf6A/p7NqC1e
         +Mumg3KaUb4uDZgOXI4yQ/6ZngnZTS5HjRO0i58uCEnKNs10txvPT6KSqk4a/2CYxzCK
         HuDw==
X-Forwarded-Encrypted: i=1; AJvYcCUynUccXDWvrlAZO8xCw++dhYHVRTQG/bmj35C4yyA9kUX6TfyEUNT3qJkFPnVweFrZAZMmWwEmuMKmKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR8e9ua7GFIpl2SdB/FbRKZfMCkjNZHtSaTPmQ7vVs2/glvWI6
	lTy+6bSM6aMmLtXHRiW83A8nUPuhWwXGxeJ8Cs4L/nWrxSwbQ4hNSBzpjccnpog=
X-Gm-Gg: ASbGncsHF77Dstz4kfxJjENgk7ayZatNumzkwusbyClqrvkoBeypEmV8gHEm8+pJ3/g
	BGjhHbEwZo+jCfYeaqUUGSoaficNWinK8sDE3rZ+3SpzcBKE66rODZvWM7O9MJx5bl8VIv8hCl9
	NC1T7ZoOOYMvdfyXPU7JuGRIVfSueQtJGDf+qaKLQgUQm0ixx4aQe9S5UvL72tjN56RnpbSxgpJ
	Be16NXI4lfm54fECl7lIAEEWhklgAv2+Dzdd1WJBYy9O0d8uLuKoAkVodSdYr5ZOdnIxyaGzucX
	SJMzt1df3xJ8MfjexX9JgzjuSrtzxIjl/KyiAsNhOPMjZM0tR3awQk0=
X-Google-Smtp-Source: AGHT+IEPC0fQonm+ZMRdOw/pHD+LkJDG4oWSy8Qrtuwi5pVXg6DvO84+wFFDLfBj5S0Srs5BOrRNug==
X-Received: by 2002:ac8:5990:0:b0:467:7076:37c7 with SMTP id d75a77b69052e-46fea10ace0mr175509171cf.22.1738572747168;
        Mon, 03 Feb 2025 00:52:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:26 -0800 (PST)
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
Subject: [RFC PATCH v2 15/17] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon,  3 Feb 2025 14:19:04 +0530
Message-ID: <20250203084906.681418-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085229_731092_97F1286B 
X-CRM114-Status: GOOD (  17.29  )
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 4021f62ff487..0ce89970c5bd 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <asm/sbi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
@@ -12,6 +13,7 @@
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -924,8 +926,16 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -970,6 +980,10 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -989,10 +1003,19 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+#endif
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = ACPI_PTR(mpxy_mbox_acpi_match),
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
