Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA0C5B541
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWAFFYf1fm8R8OogkMvnenqEAn4SZC+B/3O1pq2R0Ms=; b=SxjRZAFUuhFnW7
	PU6/KhZjDoXDvoGwY7pLz975fB665dTMms681VT0n5plLtyg0rcojM387LuxdUUVOS9GFiVxUZlCV
	qoUR6TqIEUFAx/aOVXYy5jlROF/I7yZccpg2vWTEfTyFVVz3IE7PZN1h6FwRQsKCIERdw3Cp/S5Yc
	4EhsRWQ6mv1HnwTvcMJYpTYG4HZv/puFAmDi+geSZxynQPlo0MwFJsCUN1u8AUXXzN32nQJYYslor
	3YtdG2hOvgupwv/hT2cuNm3+9LLnzxA9WBSDxmhjlIZfdGt93Y98L+q6ko/j5L9A7li7F/talkGbD
	a/pU3YT+5J8hx+SF85Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74u-00000006nh8-18K3;
	Sun, 25 May 2025 08:51:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73g-00000006nRp-1xLb
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=; b=Pn4Hi8005oPY4m8PVy8QD5dUSp
	xbmmWIKKIZBMEwr8VWr7bnf4L+7CTHuRLG3UsWRN9NIcbRxPPkdIre49g9Hk4W8egUhikXG37O6FU
	Gi+CGIUQ9W/3ckpr1drdStE5lkcrxG6e6fwCoyxHthvh8BMTNJzg5WFbEa8Xok9APMxPMuPr9vxJY
	Ugi1Ptb2eujD55YkU9xAwfLPkyuSePvSMKxa/pmCM9JHerHefIOPtAHgAZavmk3D0Im8QKUwZooDL
	+Q0Gz+CIgqCwyj4HdyPxjjK51RxVJELVWvbS4EU/7UiJ/2wKlhM2x5W3Ejs6A+wgs9jHMeRiBlYNs
	i14Fg88Q==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ73b-00000001a2G-39mB
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:15 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso684044a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163009; x=1748767809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=gVigGX2QmC1aNShjbEEZwQwXoS1uf9Pnf3wdC1XPguBCuvaK6pcjl6fHarnl5O7EMl
         c+dTmpvVi144LLxqExb+LMq/iZUFaFRYgNXQLzhrFZeBsgiR2A8lB1tPVWztrb8Aen6f
         9gKzzRL5RRn5vkp+kxdJnJt7shRN/EWjsOJ1YqgRysI5CuR5yQCkqbOBZNm0GlKDiUJU
         6KTxWYLzEaKtIhafYJE0RqL1c3jPhuDDI2An14SKJDqDAKKdv23oYHhigOhmVKBNbQsp
         v+gnP0jBPIGxtf0nx8E93+C+CHeJ84HaXA8H1fHhyJwjNlSjsv157FXfJLPQ2EJ7E2uY
         wYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163009; x=1748767809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=QeLT2G5VW6lq/+/7NRGsJcxloFG2jpgrufpsPqyqeyfKREFCGHa1LyUdjLJEF+/94n
         XTPfRInd+8pn30S9mtEqi5EGZASBmmxl5mJxIPmsWvL4B8PnfHeOS5OJQ36dHtiU0oCA
         r4cFa3O2+IMwJghHczJKg7yixlFWaJXBG/KO5fUDFPyq28TXL6Fc7gWaVXgWC7ztF/f9
         KT3VX+LZQ2qIjxcD2WjBjNS6KCjwEH7+x42EZe1tdNYR0ta/ze0ni3TZHsEp8NmywiMs
         iq3RiRbwKoi5ba0ybiF5xifPDCZteGt0w/oLF6x6ESkpb+C2E4g2PzNtDJiY4Id/LsTe
         kpqw==
X-Forwarded-Encrypted: i=1; AJvYcCUgomKq1Vs/J0U4Uag53ctW2V7N/McjTyrF0ZHt6ox7znLyZ9opys4g4NyvCguGBOSrhgZlJAOvCf1rxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz08pdpurHBrACLoCKs1Aq4732/oQI9jPIUWgAnIJKElecl5Kgb
	C8sJNaJ9oR++WR7ijxeEJd815ze6su1cmlIdvVDyldLhIpoKK2WTD9zrG33w207n4UQ=
X-Gm-Gg: ASbGncsSo5Gda4wgXUrxMoIlb5gLm5Q6kBQ+IpkGkeVh1sTBCbXQcUbb2ckvzZO6h9l
	ra+8mQVVR7wMcoIxXOEVC1KZrtpmPCOtiAqOhdmx+tmbRdKNqfl0rzvcXu1mqqSKjhwRaEK+rQV
	khioOWxzegb4/eP6fVyJPyvHNLjY9T/w3rG14/ygc7bTLAOXMkhTBW+N42Tt9I7Na7lUcgeVxTK
	H/36G3oLXggdAMP8LeLZaPxuUSm5oaodStHVjpkoALaAcENZlnaHELcvevwjp7bQhuq5NEak6rM
	/sMCv50GH41hsikG90v4kOxxhFaGsEu/ykIpmqJAjfZYKl100boQsEdd1Radf0VXoJxmDyA81va
	o71aE0dc9
X-Google-Smtp-Source: AGHT+IGBMpKQMQCTT7NisaoM1o5YYuoZlK0DnedslPvydIVxR6+tdzcYF9ryA8HgQTUtwWvs2xaGbQ==
X-Received: by 2002:a05:6a21:4781:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2188c28bc20mr7948535637.19.1748163008895;
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
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
Subject: [PATCH v4 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Sun, 25 May 2025 14:17:07 +0530
Message-ID: <20250525084710.1665648-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_095013_852559_9DAA7E8D 
X-CRM114-Status: GOOD (  20.81  )
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
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 28 +++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 121ee5fd3d0d..3d71af6321c3 100644
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
@@ -767,6 +769,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int i, msi_idx, rc;
 	u32 *channel_ids;
@@ -892,6 +895,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -899,8 +904,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
-			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		if (is_of_node(fwnode)) {
+			of_msi_configure(dev, to_of_node(fwnode));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -945,6 +955,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -964,10 +981,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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
