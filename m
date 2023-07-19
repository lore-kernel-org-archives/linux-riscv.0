Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CD4C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPrpQQLnf+npBuska+leNlssvQWZ/+OK7OX32kaWnhU=; b=PJLtAmqBjgu1Py
	1h/xqsi6pINnrbwoXpkIl0WHyKonIRJIHlQ6jzOGeJElMKDpgz2tElJL6x5zoeGoEieoFwqtoBXDh
	nfv2qgWiFwS4u5HCLA/kSliLUSp4OlOI0I+a8H2c8BuERE7kQjwaaEzFThYUJ02jR8zIsya8rAMHP
	JI3rIi5jH6ZBZVc6bjbABLLnpOkj0Hh5EJgmakOsjo3g6TR/3LyREa01qFho7Pgz2+ZFlkmuVqNUk
	LedgNeDDaZ8Aal8m/Lm43r74jb16815U1R8S7FY5CHTdLEzagjDFdRF6bQcSN4QtBVpK5irwFz1ba
	KxnvJa2qEW30QjaVPOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8k-0089bg-2u;
	Wed, 19 Jul 2023 16:35:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8i-0089XC-1u
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:35:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9e93a538dso40656445ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784493; x=1690389293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKYrsbwFkQq7mxSa9jMwKApOtesu39YvxU4CShJxAhI=;
        b=ZvLnrY1568MZhaU/qXPqlRY4i0xnbvv+JpUWdEukxuSZl/js2HLyiHv64/36av5u3L
         kUf3LGIWVHKuEZeht318sYiL3rd50EHbqXS0SXHIx8tUVeo1gBBrSfKjl0evGs6RA3Ph
         g15fyNoVbYvClluNk5HufnB5tU27SwjMx5sRXAV13WPnOgbqZokaYWmyXm001+hU3wzZ
         pjyGKQGGSPgDbmCq74EU+FgzpiZ9qp8PbTz5jkNX35QqD0fTRTcLxPkTgUTIUr7UjxPB
         WIr+kn52YPa2S/ZaOznqmSXXYvLlDmov1AW9dqDgYj+1cv1QQdhKmZolsnN5t/wTas0R
         BFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784493; x=1690389293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKYrsbwFkQq7mxSa9jMwKApOtesu39YvxU4CShJxAhI=;
        b=ALArLMwt3UOe5q6E64SEuFfiAj2zJNBRS0d5PLSmTlZE42vbJNhnMqX013lzX0CnZS
         qvXqUSCgwfb8uF4oY3Slz3QvnesHd7LtCoYiWJTEU9WqgtT02moMb5t7CboMN0e4EAnY
         cgT7mwKygIsckaGZksydnev6GNLNdI/1Cvl2QIqeXrQ9JrrRgiWESY3b+NSzcF4ElLAp
         HMaksiXjj6q1kEuXDabvlIQK2dVYaR8ZhYcUnUBBTolFSMlokQgxdvLmdfwWdaPlSGOh
         4s6UI52fH0gsjQrZjDl/67qq1nPy9cDVbTTF1g6YCk1egaYsLyTA53Ly2oOiFVUxs1bs
         wLQA==
X-Gm-Message-State: ABy/qLboyX67MlKUdEzPhkmVEQII1VAmcKnSN0jnPKewFxZX8aWVXKO1
	BMnqCwDLyQoCC5O0uiCc+DoTRw==
X-Google-Smtp-Source: APBJJlFipcbSu/NojN35HkrEsviKbFWtcYcx3WLvCCXo8NC5ZDt1xR4dBGQY2EMiUvSm/R5cz/pIvg==
X-Received: by 2002:a17:903:48c:b0:1b8:7483:d47a with SMTP id jj12-20020a170903048c00b001b87483d47amr15035853plb.37.1689784492938;
        Wed, 19 Jul 2023 09:34:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:52 -0700 (PDT)
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
Subject: [PATCH v2 3/4] gpio: sifive: Get the parent IRQ's domain from its irq_data
Date: Wed, 19 Jul 2023 09:34:44 -0700
Message-Id: <20230719163446.1398961-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719163446.1398961-1-samuel.holland@sifive.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093500_697607_A36BF99B 
X-CRM114-Status: GOOD (  16.51  )
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

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 6606c919d957..46a42109d6f5 100644
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
@@ -180,9 +179,6 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 static int sifive_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = pdev->dev.of_node;
-	struct device_node *irq_parent;
-	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
 	int ret, ngpio;
@@ -202,24 +198,16 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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
 
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
@@ -248,7 +236,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq = &chip->gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = dev->fwnode;
-	girq->parent_domain = parent;
+	girq->parent_domain = irq_get_irq_data(chip->irq_number[0])->domain;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
