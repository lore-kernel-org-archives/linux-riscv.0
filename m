Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D9C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yK0x+ABYYGFHOIRupfNQasMQv5Xz59gfyux/kWy3t/8=; b=Z0y/2TlAOt3ylq
	IzLm3UODRLrdDqwkV7ryVsH/Z6wGuj2VgRisFO3gUDi/zyjx8Rey2c3nguo2ZRjsrBurVeS/o51z+
	53ZgBSXUKa5qNMGuDpE1F8JkXu1XJbPEb9LnJknt59GVsL2ABCZJe7ZOgz2+ccztqijLXJsIWp1Rj
	iNgCqpYPYixOYmpne+TDXklFbI4aPFS1fiVWnnZySYWCGdZdSkRgcP5qPy9NAvfrLnUrLEby7pNeU
	AqwrhZBf/193qsuTYm21ca9PynB/F9TzcqQA99RRzNgGf0+UWQRu7wpsgmbS8z/TnOl6ORHZOzBcC
	zHkq5Ls/Amizr7fsenBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8i-0089ZY-0Q;
	Wed, 19 Jul 2023 16:35:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8c-0089Vo-2s
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:34:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b852785a65so7322525ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784491; x=1690389291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY7X996NeRiPR/Rn6FoiwTLGW7DQeNpFoBjkmVc9GgI=;
        b=Or+/RZwQvNw8bCsOMpm2hSeXLxwp0YuvAcpxKF/K2j6mFJlt3xZGR9ukX+ORaAabKc
         S/BtVbCvnXG7wClDGpbGAMoCX/el65aEgzRnBn5+XjPwirv+/sC6G+nt5vaK46C5cJ5Q
         ut6Z72dE3exsn0wXnTpjlmU3IG8rj8ONqqZoL8UZAZ87q1sQR9ZrY3TIcTYSO5eCMkN0
         K2GBSS6WcrAdlz0eN/pd/f6gjwGcO56TIdZ8xhNSkqMOd3fcEa1E8jsNB3SSSPRXacMs
         RVqOmrJEu4o7Dpfa3m8IquxXcYW+JF2mpl9Bh8EWRGF9EJMZ5WhDBUiufGw+kw8cGlnV
         I0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784491; x=1690389291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY7X996NeRiPR/Rn6FoiwTLGW7DQeNpFoBjkmVc9GgI=;
        b=JgW+VTtIyiC9go3Cr+fbydTbax1ILkbffJsQbeEDgvoInk++EtEdlsfd/psaAuVgCq
         suKHVhKtHaLrQZBOsOKBGrM4yzWnPxChft9R8ZJhR9SomQBVg/cffwCVu1t178SIpc9b
         ZJNvh4wD+TyX/N16gxwvoT5DpKXNGhJIZNN7SXP97pfibpATDG0YtfKA8mfFE/Sxopmw
         BeMT9WrR2y9Mt5WTOGN5STRLtcdkTAj/kIVMU9q2X3gFda2ymv5xV+mUZ7P6JFUkwLjq
         oZaP1ci+saUsXrA9HoYk3Pf3+eaiC8CyHtUCPw+pZW9M43P2l6BNdWbyekXZqdc/CFhZ
         tuTg==
X-Gm-Message-State: ABy/qLb9ehjo3qa3BUbKROBcds2tl5wr91CtI0Z2I2tJQlZjJ53IHMVs
	hZ7kQq3BJI2AJxMe297Ogo43JQ==
X-Google-Smtp-Source: APBJJlEdZ4LQSFXZ1B6gqxnku1+mdn1+YmhZhDbIEaXe7GUhYDR8hCg+4i71OKmpuzxzwsW+MP9rUw==
X-Received: by 2002:a17:902:bb84:b0:1b8:8728:d776 with SMTP id m4-20020a170902bb8400b001b88728d776mr2926304pls.0.1689784491343;
        Wed, 19 Jul 2023 09:34:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:51 -0700 (PDT)
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
Subject: [PATCH v2 2/4] gpio: sifive: Look up IRQs only once during probe
Date: Wed, 19 Jul 2023 09:34:43 -0700
Message-Id: <20230719163446.1398961-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719163446.1398961-1-samuel.holland@sifive.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093455_097031_9198EE7C 
X-CRM114-Status: GOOD (  15.06  )
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

of_irq_count(), or eqivalently platform_irq_count(), simply looks up
successively-numbered IRQs until that fails. Since this driver needs to
look up each IRQ anyway to get its virq number, use that existing loop
to count the IRQs at the same time.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index ab32c952c61b..6606c919d957 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -185,7 +185,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio, i;
+	int ret, ngpio;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -202,13 +202,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-	ngpio = of_irq_count(node);
-	if (ngpio > SIFIVE_GPIO_MAX) {
-		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
-			SIFIVE_GPIO_MAX);
-		return -ENXIO;
-	}
-
 	irq_parent = of_irq_find_parent(node);
 	if (!irq_parent) {
 		dev_err(dev, "no IRQ parent node\n");
@@ -221,11 +214,11 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ngpio; i++) {
-		ret = platform_get_irq(pdev, i);
+	for (ngpio = 0; ngpio < SIFIVE_GPIO_MAX; ngpio++) {
+		ret = platform_get_irq_optional(pdev, ngpio);
 		if (ret < 0)
-			return ret;
-		chip->irq_number[i] = ret;
+			break;
+		chip->irq_number[ngpio] = ret;
 	}
 
 	ret = bgpio_init(&chip->gc, dev, 4,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
