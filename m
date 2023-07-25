Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D5AEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJQiHIrVfsWdO1M3e4m7hRsBeu57WkkAJALm7Q6/HRk=; b=EQDzWD5X7FFbsi
	50Zo+W71SIhTkBbjB8Qh1rlx9AboD3PYqzkquxRQdx/8rz42i2esJ8IMSTY8zHhfhaH1eXHIBtzMg
	2HdJfsTGy25UAjaBYYRQs7oeCbIFpH3bYUbMTThvmArbO9YSN68tjyeRuYtIW1ZEu8X3E+aEIHz7t
	sEcxIgcrxDSQud0HseBro+9WjwX3kNDzGrJYDxRonqDMgdnpU/bC5W3TjC7HnOiHJrBGsx3QyCinw
	ee5gv7JCHqvPQE5Zf0NKcRYpj/Ae4SDNKRRsBQHmmIoYDiAy+Jk6NKQ8OkSozB6GoQhT4eBdZc3H1
	Kou6HDBATQBTPda4YvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66g-005kxk-2u;
	Tue, 25 Jul 2023 00:40:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66c-005kvV-0V
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:40:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bb7b8390e8so11992445ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245648; x=1690850448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBxigjkHLT26fx4MKMtaVEtMyHCitliLAz5UQAux20w=;
        b=WZLiqvPphZp2WlZ1ZnEhvYWQlvYox6mkBzRwKNXSEaEcIBtHZmJOqFz3y5ctV+C9Ja
         ydG8XHMTHzmxDUulcxrZZZ9vN9aAnJZklNgcDsZ12J3q1hrbRubisRAecjEQMajFYQ1H
         +rMSI1HuUkJERk1ObD9d6InI9b/9wU5tBI9fW054Tp5uVJwTILezeGr/0dUBkd8OXEar
         A8xOEAeazmyF7M1Su2kHHUT9XCm5jJFwMtlxtKyIE+q9ykxKIv3OjgSPulZEm0w7Xf0F
         ECf4CyJzqU5PtGO2XL/g8PjosqYEZdLlyE48bhYBOAqfzoLESAwcXXk0Npq53qdb/pkH
         bXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245648; x=1690850448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBxigjkHLT26fx4MKMtaVEtMyHCitliLAz5UQAux20w=;
        b=ZyJGrD3PntcOWM66NQdMxOWj5ir8owdcfNcg6XNFQvEGi5gd+g44TDvkbguOdH6Ebk
         be8RPe/HGdjG4MdA/IPaY5Je1y2FTZPQWQiRQohrUpTCAgIvyrvOl09AZmIIb/lxmAYx
         IwC6lwcnuO1EfCfA/ZJYlPlExWCNAu33pfnhvTcxEu6ix6f/kki6rcyH7lkkuVOiY85L
         fMSi4JbT3DKHCjbYjNpJizaYwqZLBQhWkmtSkjxPUrJIAaPJ10snYIVUSNr1tjGOPNmr
         WXMSJKksXBr/5jtZJA5l/bhtBTOkdsDXx+RbwimmJpPgzgDxOm0Vnv8t8tgSZtHLXpPt
         iS4A==
X-Gm-Message-State: ABy/qLbu6TnLf2pJeoQIZoK0HgvqCnMD6pb8g6QTXky51k5sAuNFLSSt
	7lVQbw3S8lLB5eWceaAhn1Jg9A==
X-Google-Smtp-Source: APBJJlHktQtCw+j1j8iMYY1ICtRykWLvEpnHmtnMYvGbQrb3fXX3CsElOJGtSObCOKk714nx3RADZA==
X-Received: by 2002:a17:903:1245:b0:1bb:b855:db3c with SMTP id u5-20020a170903124500b001bbb855db3cmr1053335plh.41.1690245648721;
        Mon, 24 Jul 2023 17:40:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:48 -0700 (PDT)
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
Subject: [PATCH v3 2/4] gpio: sifive: Look up IRQs only once during probe
Date: Mon, 24 Jul 2023 17:40:40 -0700
Message-Id: <20230725004043.381573-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
References: <20230725004043.381573-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174050_199293_1490DB9F 
X-CRM114-Status: GOOD (  15.85  )
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

The check against SIFIVE_GPIO_MAX functioned as a bounds check for
chip->irq_number. That is now handled by the loop condition.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Mention the SIFIVE_GPIO_MAX check in the commit message

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index db480cd7271a..e96829ac731d 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -186,7 +186,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio, i;
+	int ret, ngpio;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -203,13 +203,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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
@@ -222,11 +215,11 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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
