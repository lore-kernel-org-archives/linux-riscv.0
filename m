Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39385CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HThThAxjDhYeMkLQCIaNOGl7PsGJT0HIgmq4JNzZiHw=; b=Se77RVNu8y0js6
	3RPDH2lDsR5FEtDVZRCppHEbBjWIqFxjKHenY1A4zTcdBnr/nheEkNy735MwTahADN/UxfYWLwQE0
	BTqLiJtA/bRozDkYblT13fOP0VzAVfPQUKIL36rJu50ZB2RcduFRdyqVaVf7gmQn8cVw13Ljwwi0N
	1QKlmSul7lrJ0IzRTFUgh9Ip4h+hWUFY1aAmtoM71PxFAWdQnzDzw+hmVxYuuK9bMXTbdxpLEPRxY
	ySyReWz+89RdDGodh7j7+5wwh7MsQnAvb7yheybBzfguxsCxITgz/40QGrunINQu0eIkheU+3iQD/
	nTCEPA7hUL0qYikqZXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1d-0000000CSU2-0sZL;
	Wed, 10 Sep 2025 07:13:53 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0w-0000000CRSq-2Uo2
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:14 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so4153901f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488388; x=1758093188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=EFb0TVh64r+zGtm/3nZWcL1lBbssR+2rHaD02GMpD+G8KsEwKK3SF1kN4PD2ONljZk
         IA47ue+AjwBh6lF4GZ0zyfLz8oMtJdES3dvYyz/wRiV12MAsRAE1QY8yMpsprpK9fHMP
         07lgTzVj81yA+NPP2YtyxTmnJMQ++EALqQPwy9gUF2COBhxEQ/9Xb5RHdplj4yxQwWrz
         HyMv4NzWk1oFuNfdJgd0UvHjLVW0Puy2JMXPtApDbp+MKkdnlLH5tqeOrUVCoaD3p139
         5+2+7D61fMrX0k4SwijS3MI1B2936inmuWfQVe9X9Mu08gxCnl8E85YfRl3JZ51Ujl6C
         fU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488388; x=1758093188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=Q7IfNHBpF50bsbya1lm5Buu48eVMl5YDbguKEC+d0sxG262u4DzZRJDPoXxFBwXIBm
         5hOlU2vfLFjqN+fEnzkrPF/0A/2ir/dvLasZqgnO/YmrhUoDAaAVLZeZLwo6gU7qygDl
         CFHSqkQe2y+LPIsNQzv5oSYco+8pWk28H8Pdjr2asg5PuqKCNpNHmvW1ToH05I9lX0kp
         H83RvsdTJ2F3XBjNyHpmWLfvGgirKBRzHwNZzJKc48Ek2IxOATz9THJuEjE5zldbAC5u
         ERxdSSdvbYCIcqAgwP+BdZWiu8V1b6GDC8/4yOJO4lvz2PvRMDOgQLbhV7uT0lFAlVYb
         4iEw==
X-Forwarded-Encrypted: i=1; AJvYcCXFFpeMgCtjQOGPjJU44w9pIzzpCP5SI9ldo+3GKIpkOzF3BgKgtW+OVDAnm6PeX7seH/MECnSKhPHOqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKz4Jy/NIX5RSGxDAYfj0vSlpFvXJIr9rHMEdbAYt5w2XkaY7a
	GkVSPnp415JRDisRml99htLVSHKGs+/2itGErUnHz8OS5OiZCVcTDKuVwAHMhp51GwU=
X-Gm-Gg: ASbGncvjEolHqYTysiNXKcnzgZ7viuP45r1E0cUCZXE/tw+vemT9mJZwko7n77Qb8At
	Ia+0t+R9SiHIbA44BWeAOTKgVzcU0nz6GssUXwQ9m1mkE26PTbr2gnzwU8aq5MXIC6A5gQnj0Fz
	Db5XPpYRcRWR4PgWzQBkbPzwv3EkLSQrRtSo0fh6yd4fiNk9ZFwaDUM307sFVGZqbWqPv9oTeQO
	wWXH/rJ5APbTET5vCXpnbiiQGUR2Rx6nH0gjjBBEzKEbHBm08Bq+ENobHr79Xz82hlaZD98ohiJ
	5mrDw+UlHXO9+JsK/yOZAj/a/XAB9QQkfWwmud6heV3HGxHc5zJMCndpnU1kjOaKqwlOBswLNVS
	GgZuzO6CJ4Wbzzl1HXvTLxZQpwJgttRiOdwBtOQ==
X-Google-Smtp-Source: AGHT+IHcvhZZzP4TZN8dDM2cz7gIErp9PBji/Vm3N8fCFTA9CGkIGjusChs87EXSmOouxgrha6RBMg==
X-Received: by 2002:a05:6000:3101:b0:3e3:59cc:65ba with SMTP id ffacd0b85a97d-3e64374208dmr5090711f8f.50.1757488387704;
        Wed, 10 Sep 2025 00:13:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:44 +0200
Subject: [PATCH v2 08/15] gpio: mt7621: use new generic GPIO chip API
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-8-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sm2OibAFBIz+8HL11qXL3Wby/ipKKdaG0xSU+4Tx1Ws=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuMKok5DESPFbhymqYsolQEfeTgC5P2l4ck
 1ZZifwJvnSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 ckp4EACxMivANhAd7XZ3l9scDS+B5YYyLmSQ3Ny+BN657qboxkz35tdtCqo9RM2p4vwJoj4F58n
 rjt9YIZ8WE8dMVbEfz3YWyz2izu1kYq5xHXgyIZll+ttlgAkxUJMWsuOBlNE/mEv8eqfcVyE9kB
 fhGVUoTUQXe2kClwurlIT/uqlyREzW7/hE/AmyHfiJlKDOqTSymNVLaciZ1m628rEw3f3mkY6x3
 1VN/jTKqn0fwwlzZos29x0Jjyfc1cnUDSugp+Uc15e9NHBZ8057+Tqkyj5rulMP7p/pBDGXQfKr
 E3xP1G5ACUTJrVHiWsG60aO8/ouvgevz7upK4Sjv5n2qXzPBDaUUUVY9ntkMfsDBb5aTP1KXKev
 SE8ZtNSNtnUncL/Fo/N//pBIkDpXL/pSZJZvi4YAeO8SaOwCBnOdJlP53HJ7L83zzuNpBUjEW/i
 ksoRPc05p8Mymr1HGMs4h4dnZg6ZPQ7HCxgcHCK6ciFupdOexJxm49Lf73Pum5dSOOYzlkP3gM8
 5gUvz/9RvDf5rIDYx7tCSpJC+y7e48f8iuJnObLNJPVt9uQtnS8fDEF0Ol7dfs/dvCRKjERzjOZ
 SK7mIZEGfXac9o9DC5lg3H2DAUewgoXaHy9WqzS6wO39syN8uA85mWEaWEZGA2YQP+7a9pIumwe
 1hvajsW11qzliiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001310_868402_D10AECC9 
X-CRM114-Status: GOOD (  18.38  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 93facbebb80efadbdd3fb4500e0db14936287f1a..e56812a1721151c8f3b32b5093aee5c74bb798bc 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -6,6 +6,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -30,7 +31,7 @@
 
 struct mtk_gc {
 	struct irq_chip irq_chip;
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	spinlock_t lock;
 	int bank;
 	u32 rising;
@@ -59,27 +60,29 @@ struct mtk {
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
-	return container_of(chip, struct mtk_gc, chip);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(chip);
+
+	return container_of(gen_gc, struct mtk_gc, chip);
 }
 
 static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	gc->write_reg(mtk->base + offset, val);
+	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
 }
 
 static inline u32
 mtk_gpio_r32(struct mtk_gc *rg, u32 offset)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	return gc->read_reg(mtk->base + offset);
+	return gpio_generic_read_reg(&rg->chip, mtk->base + offset);
 }
 
 static irqreturn_t
@@ -220,6 +223,7 @@ static const struct irq_chip mt7621_irq_chip = {
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
+	struct gpio_generic_chip_config config;
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
 	void __iomem *dat, *set, *ctrl, *diro;
@@ -236,21 +240,30 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
 	diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
 
-	ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
-			 BGPIOF_NO_SET_ON_INPUT);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = ctrl,
+		.dirout = diro,
+		.flags = BGPIOF_NO_SET_ON_INPUT,
+	};
+
+	ret = gpio_generic_chip_init(&rg->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return ret;
 	}
 
-	rg->chip.of_gpio_n_cells = 2;
-	rg->chip.of_xlate = mediatek_gpio_xlate;
-	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
+	rg->chip.gc.of_gpio_n_cells = 2;
+	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
-	if (!rg->chip.label)
+	if (!rg->chip.gc.label)
 		return -ENOMEM;
 
-	rg->chip.offset = bank * MTK_BANK_WIDTH;
+	rg->chip.gc.offset = bank * MTK_BANK_WIDTH;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -261,7 +274,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		 */
 		ret = devm_request_irq(dev, mtk->gpio_irq,
 				       mediatek_gpio_irq_handler, IRQF_SHARED,
-				       rg->chip.label, &rg->chip);
+				       rg->chip.gc.label, &rg->chip.gc);
 
 		if (ret) {
 			dev_err(dev, "Error requesting IRQ %d: %d\n",
@@ -269,7 +282,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 			return ret;
 		}
 
-		girq = &rg->chip.irq;
+		girq = &rg->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
@@ -279,17 +292,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		girq->handler = handle_simple_irq;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
+	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, mtk);
 	if (ret < 0) {
 		dev_err(dev, "Could not register gpio %d, ret=%d\n",
-			rg->chip.ngpio, ret);
+			rg->chip.gc.ngpio, ret);
 		return ret;
 	}
 
 	/* set polarity to low for all gpios */
 	mtk_gpio_w32(rg, GPIO_REG_POL, 0);
 
-	dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
+	dev_info(dev, "registering %d gpios\n", rg->chip.gc.ngpio);
 
 	return 0;
 }

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
