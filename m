Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDEC83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8Y3qDA5KOC0kYEBHWHn48KKlvnfZoJ9pDm7CTiAHu8=; b=vIcW4rlzmexRqU
	ZU57vjxpLegph6HJcnTDqQprh5STf4LaghpaxRk1aDAHfTanlbemjkoVKnvAzMr4nzaDzxo2NAbHu
	vpeLLUMAirIfG82c6oR+aY5U+Vlldg8yocE8OzlVkDQSXp9Sef9AETb8EY73ZXAwR19f8riQlcPrb
	0diPgJyOA1tDjR4IfEOOsSHFWgBloVifPPTzNKDCjpmieph0Ar4gpiQqU4Pf/ivzq4itmlINHl2Nm
	fsu8sS6EqC53vU0TOnjs/O2n28kn8R/n6UlBHXWzAurbs178d4n1Hduz+CGnS/bpSBbe0kkJ2QFOM
	EBHTVWahijf/DTqPK/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWy-0000000DWKw-2LaS;
	Fri, 04 Jul 2025 07:08:20 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWw-0000000DWIK-1WU4
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so900611a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612897; x=1752217697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg2C8aGrSqthMYzi8AM2pKamXBwNz1uMo88H+80YoNE=;
        b=GfFl25J8iaP3OuQvtccCFqzeI1utgLKbNK93hKQUS1yo4J/01xOnqSLX/QHXqRwWeO
         q69IQySxanK0ccNgmmkkw6BdcvP1RPwk8+msfLsXxlwneBWiol1gxB/buzxQuWxauSxS
         UY+a9SBNmrJKLhyt6ajAlXKQN1UhwSeAg42mg2AIcQ2VPSOCmoXVzrcD5E1BjjiLYXw1
         o/sXFwgDhCTnd5Id7q6neF2CGl3O5o60FlQivCGiRWishqfpL0EQXjkoSdB2foAvDGK1
         66jafPM4/OHJNoah8i9issiZ+fRH3zxegK1vA3X3sEOd04wYHIeaemMExq8yZ4q3wB1L
         5m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612897; x=1752217697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg2C8aGrSqthMYzi8AM2pKamXBwNz1uMo88H+80YoNE=;
        b=nuN7StwVRQgGhxB4umysaSmYJhIvbw5Nzm4xtYWwXw//qwDOYj4IOUtk62v/eNk3/b
         GKIJy57BIWWOLeUmM5NhDJib1iFj8Tvkzs87nQk7kWFWQ/SbthPYdDIQeuM/FOIAKpaz
         X75BVGBoO8Xxdbk0L9hlqDPkLoAKKmBx5WOBqZeKhoJHLg7Zz48kcFVPJr7HnOILe/79
         S1xEt+JXuzpXu3zs23tLF5Pql06Y0DJ/LuEP1+rZEBbQDjqGzUjc0TWVZlN4K2q07x9b
         Y87J55JWcVIwJphPHz6rimxJHtgsc0LYu2aEtyqXQGLnLylxo3Y/njFT7P5ZzPaNX2FU
         Ssjw==
X-Forwarded-Encrypted: i=1; AJvYcCXLoKAfFD1kXyTlyJD5oACaS0vdah9f8YNg+VYbvXRjdXR60DgLbBeH45ZTgNXtUJSmU6eA1giiQ7VY9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YycX7wqYrL6+1EoJPKNV3il5tWbGrBfDcuexiUWvK4nZMqP0IDL
	NVAxsBGsOjJUu+LqP39Qvi1ywpSQs1PeiljPlFR0r/M6jEK9Vx0MnCcAFGKVmZGxO+k=
X-Gm-Gg: ASbGncuzxtHN0llLnCt2mDkxhwK/oM64opnAmpT6nfrB/Al26iE2J3EXDzrxx5tsb5u
	H21c/PUxYRGQdVlFd515WJ1YrfDowCBcW7v2NBUhA2bBnQADEoQTzdJ5Q1SgraqtZZQo9qY8woA
	cI6o1sABzeTkUjMMUumsZVy2ys62NFboh5Wn2LH3PpEqCUU569lX/NAXGzbKiVlxQVi1M3YWHZK
	dnfIoQIw5YOemQznPJVtuk1pEwnqXRgxQNrqQNbOp0+0PFGHfS8D2zYnViIPP3y0h7gGUOjKotK
	ianBMFmQwPx4nRTt9nzAtl5FDEpMfBsnCEw+Fb1DcJyjGHKlvvYl66cH7IftvZuqUTZWFdUWzUY
	OVRLfIPlPp9dSUxDE3nCxIaEyYQ==
X-Google-Smtp-Source: AGHT+IFT5Pa0dkoRqff/joV4++Kb+3u576Zbjs98XhITYJ3V0wKn/H8sYSAtGybI3ynT60XjUmc+dg==
X-Received: by 2002:a17:90b:568b:b0:313:db0b:75e4 with SMTP id 98e67ed59e1d1-31aac5333cfmr2825712a91.33.1751612897430;
        Fri, 04 Jul 2025 00:08:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:16 -0700 (PDT)
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
Subject: [PATCH v8 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Fri,  4 Jul 2025 12:33:53 +0530
Message-ID: <20250704070356.1683992-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000818_401798_D6730C6E 
X-CRM114-Status: GOOD (  19.15  )
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
