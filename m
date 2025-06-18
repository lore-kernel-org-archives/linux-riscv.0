Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3DC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+PjZp8mezoQfolxN0vdzshcYRz7A2W/Q0pBYCmuJsE=; b=nFdeGhwmNDAIhg
	hbF2p8Eohn6VNBWTHPyNrjDs6pUoNjkOedhYaswX8Hwait1BTUDeI5aEol1e3t/ef7n7EMpfeHYbk
	YUDo9z+kdfOo35jZ7gHFtSeE7dT/e3rgt57pcFCu4nVkfQxNuuzVUfH3hhZs6ej1TfRIWJ5lSVsBU
	lIzE94TsqCAyjMjAeZxdFChFxSaQ+928nzl9dYq/Vbhkx0U8EBCa9LrDMoJsMXs+iWiXDVmJkz0LO
	Weem596jbiA1D3LIKcKuLPB7im5O6NAKskUW2zI2525KZ2C/6OTTU6LimB7cPSkNtcPsx71qOSszC
	22HXIBh31V8iaBcAK5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpN-0000000ARH7-2G6v;
	Wed, 18 Jun 2025 14:31:49 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrj2-0000000A5fl-2bXs
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:17:13 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7481600130eso7450330b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249028; x=1750853828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUhpwTX4n1+Ryhj35+Z6PkHkJ1jozXai7DpNR9V4xvU=;
        b=n3JsIJo2lV92N72HW5lPnIkYb/YfGe+UMzpUpCOA+G/smlwrko+Iy7U5cOBIXA9qSu
         1QfxM8VufdFwvkqKHkSwy2bTAumu8heD0S9GuxyC43WcEAItLgAEb8r+fLLn0FdwVZ45
         HNzQNsXicd1oWYr66BuXOu50RmXuGIgmOpcT2bs0pponDI0LzH4xsI+8K5ZUQqX+ID/i
         zc9t1bWFG28TExhHZh0JGE/octANLXGCNh2zb1NAVgzi/8J9TZx72gEuaxmmTnZj7onM
         mIkehSftlHGKPcfSwRGBBFw/Augfo1mnMlZM6s0lkwy6OHLj18zNYmGDqQtUidNYVR4p
         2+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249028; x=1750853828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUhpwTX4n1+Ryhj35+Z6PkHkJ1jozXai7DpNR9V4xvU=;
        b=kzf4SqDgEiRSMd7g9Bm2ka1/Nq7nhYVwlITU1PBSLc9d+aSWHC5YUsjQN1zOiplpwf
         daKshAYHHj2FZFe+WIFCxq97TxG0QeGrSr/r/61lWQWaRPi5VD9xckajthjJP40l2yMY
         9hnxzzEyNUSIzKHl+C9CldojN6MVQJHS7aTndjkG94fJZ44GmGcwpifR+wRVKpwYylV0
         H0xBLkJgEHBOrwXm48KsiM/+QDC5Ql495ycKnF+msxEvlQm/Xknc6rzAq+Fw6yathomx
         CHEHhOlwlhDQrkoSajA3t9QsPzG2/wsxguboBlKb70pYRKPamUK1b0veS5QUO0kNbtvp
         TagA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZZIfoPK948LmEHQOUTKNKaIFlbxywkGwD7gVyaqvPlBwtQMua1K9/Uk1e8a8ajyEESREtM8GKgRQ7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwVuQTSB7c/4zPk5YPPwAULv8BBKOS9QlLa/+6lac3LYIqUQSq
	VlMJW3GRZ9j/1Cz8QJVycyWo35iatGhEInxxpmRGZfK/EdmgQzdUFE336Lq3YkmJj9s=
X-Gm-Gg: ASbGnctASAJsdAJoI13ER4jvDTEo2j4y1myGEwVujc0bvInSHUkX1nUoS10HgGzVdm5
	C0PxraUSrEV7aYA4c+TLbTKZX51HnfmeNT4jcQfUdg4OUF8O5K2LTsnYWVV33hBVyI/IjQ1+Buq
	HRAWANXAA+Oq3oPxfmZaZK5BBd37ROC0hXB0T+Tu8fBFe7+cESPnNEaHZ6ILOTaQysDNyCjJB8l
	BYe35hTvqUu4e1hCiZRdJaD+xktkxCPLyPyB+mfgnPEku0Ve+fuYV6z9ILzF9l31x0aB83wQZSR
	wJmDph8Sk0mJQGVLFSur5uJD4TC5llceufGzpAg6SfwoA0BnMumEQEYLkJAVKMzbxjVtM4JAV1O
	qSPIRw8h1WJvhldb1oQ==
X-Google-Smtp-Source: AGHT+IFE6quWJkl2csNe+aAmuz+xVKTGmBp2V0J9lQvhod/0F9ABAe+poyvH/tQKvdDDGrYHyVdAVA==
X-Received: by 2002:a05:6a21:513:b0:21a:de8e:5cbb with SMTP id adf61e73a8af0-21fbd550de1mr24741695637.25.1750249027864;
        Wed, 18 Jun 2025 05:17:07 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:07 -0700 (PDT)
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
Subject: [PATCH v6 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Wed, 18 Jun 2025 17:43:55 +0530
Message-ID: <20250618121358.503781-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051708_723371_6704F4B6 
X-CRM114-Status: GOOD (  20.45  )
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
index a94c7bc692a8..8c3f82fa37d6 100644
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
