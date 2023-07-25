Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA147C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OshJhhT0ZCr7Kwk9v8kQkHmp/4ba9QXcwc+muC+lmXI=; b=ySFc/DYL3Uul6U
	4zIgaLxlhDXtdl92tEdefhyRXgfn3TzEl+ErEkpq7z15ctosLl6sastJK8HPErUTTFfWDIBIxwRoL
	Q41ukumpb94RptFk921/3lxT3ANYfczpumLZgx1d5Gt/cN/3QufAgvh3BO2yD1IcbH/7+Lgo/ufae
	O76ogZldTNukf29m6GV+iHrb3imbnRdmy0XMbeQ28+xpVtR3dq5COro3R+nq/MT3Wy+ZE8p02an1p
	Ct23aSavTDZsQpYldJnDrfEG4szWp0ptoXJFunBR+LRGh9sCqSNeuaY4oFJVAU3tQ0z+I6J2WiAka
	BCE/BJ6JVsB1QufheBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66h-005kxz-1X;
	Tue, 25 Jul 2023 00:40:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66d-005kvy-1G
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:40:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b4748fe4so27991695ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245650; x=1690850450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ4si2ANa5XEPPWMZ9PO8V5jNsPRui14yTgaPNCpuo4=;
        b=l4ktA2eQh99fN+gk7I24zvtI+5PZYFbVckqw44nSX4ED6yEtC9WPgWj5ibE5ZKyUpd
         5outgAZ4AGtaHnx8CUSLGFBgija0550Es4ZHdCs8hEoL/irxd0ZRYV621oTzrCKiH4bE
         2fnRPF9IbVCTjwm4SE6r9zv3iF5VsUOk8IWaBpkPsg0DJw3t+Ge6qZT9QUpQg6FvUPUe
         reo2RCg7Ig3GbXwa2n6VYb536XSRo4s439LWR8PQECFlFqXZA7XQjQ07atUv8KNXIs0R
         E3u5LOjPl534zqDpW38rL4wtQgIYV0cqlwZUvUUzWK6R25wjiD0CvPYlIZ7eMADOKDqT
         XMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245650; x=1690850450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ4si2ANa5XEPPWMZ9PO8V5jNsPRui14yTgaPNCpuo4=;
        b=TcEm0jk1/LxxUeBGvaL+mFDxzjxu3fT8/roCGcB0uzGLF+UNrECgudtK1Ol+q4VhLi
         DD1oW420Xp2Ho2oX0tpuhCJIq8lFpb6pDi8CLPi0sK49tA234Vn3oGkpNQOGEBAAC+4Z
         KpDZKSDxDw147oLkaKiNcPLsNfUMLtS8CLAJzd6jOR+NP2ZsOyg+4NysPukU56PmKf0P
         l06swqfhus2huyhyW/Lg6lX/KNU59r4B4JOoaH4ZxnMPakSGfsdDzc0hSuF5L4d8FAzW
         2n4/Z0Qiti2UhkE9okeovUl0SKXy4My/P4nYty+gZt70xJjslAY9yrLvrPBl/FruWxXo
         17mg==
X-Gm-Message-State: ABy/qLb3wOKV3k+KNhb5tE0buPrLLpMDdtrSyVsqe7U4OrWOmC4lapif
	6QKDVwaabnjJjSXDbRwfdRLbkg==
X-Google-Smtp-Source: APBJJlF54q1B8nWOxzcZtLj8JrVNRf6Ffas/NcjytDBVLJF5ZOTC1n+Z+6A9MbTuRw17TV2FuLMY9Q==
X-Received: by 2002:a17:902:b083:b0:1b1:9d43:ad4c with SMTP id p3-20020a170902b08300b001b19d43ad4cmr8706634plr.40.1690245649916;
        Mon, 24 Jul 2023 17:40:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/4] gpio: sifive: Get the parent IRQ's domain from its irq_data
Date: Mon, 24 Jul 2023 17:40:41 -0700
Message-Id: <20230725004043.381573-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
References: <20230725004043.381573-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174051_427029_0187505A 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Do not parse the devicetree again when the data is already available
from the IRQ subsystem. This follows the example of the ThunderX and
X-Gene GPIO drivers. The ngpio check is needed to avoid a possible
out-of-bounds read.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Keep the variable for the parent IRQ domain
 - Add a comment explaining why the IRQ data lookup will succeed

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index e96829ac731d..3545bc0fad13 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -6,7 +6,6 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/of_irq.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -181,8 +180,6 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 static int sifive_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = pdev->dev.of_node;
-	struct device_node *irq_parent;
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
@@ -203,24 +200,22 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-	irq_parent = of_irq_find_parent(node);
-	if (!irq_parent) {
-		dev_err(dev, "no IRQ parent node\n");
-		return -ENODEV;
-	}
-	parent = irq_find_host(irq_parent);
-	of_node_put(irq_parent);
-	if (!parent) {
-		dev_err(dev, "no IRQ parent domain\n");
-		return -ENODEV;
-	}
-
 	for (ngpio = 0; ngpio < SIFIVE_GPIO_MAX; ngpio++) {
 		ret = platform_get_irq_optional(pdev, ngpio);
 		if (ret < 0)
 			break;
 		chip->irq_number[ngpio] = ret;
 	}
+	if (!ngpio) {
+		dev_err(dev, "no IRQ found\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * The check above ensures at least one parent IRQ is valid.
+	 * Assume all parent IRQs belong to the same domain.
+	 */
+	parent = irq_get_irq_data(chip->irq_number[0])->domain;
 
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
