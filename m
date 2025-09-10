Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D696CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6n8jA1Tn8sRq8shfIxf+iiR0feQMQ6sZgNgKtgedQQ=; b=ymqcq/pxeVjU1S
	Aet5ODaD1WsIjgLzvPq/WWNuZ4qFFkK9+H7h04ZkWGdec4SdIniCwmPb9SPko5IG/MnlBcNVUjjUl
	4kjHCQFqCMrVFRRronuCIAznvZARcntYPbkNb8U4HjJ2pr6zUJT3HQkLvOmmf7QGjSX2BH6GXpi8Z
	WT7gLPrHNtYXWblXx1/x3onVPoym5VZHNTwx1fJbp5SvlIT0uJ59Xd665UJleHsSB48xjslivIK8W
	04xK5S2zX8bv8cBgTZhQdcIFO0E3rdrvlJuCUxUpwQrNuwYriYuX+4WCwGKq1tkhSJee27GhHkfpc
	JR/xl6FxL0UPkxtNYFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1u-0000000CT1v-2ip8;
	Wed, 10 Sep 2025 07:14:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF18-0000000CRlR-32fE
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3dad6252eacso2927055f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488400; x=1758093200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltg8cFYbJHRlJhkC/eDYTc0LHBKn0iBfadbpYee4nfY=;
        b=z0BOfxiUkE2nE6UdnZCr3Gq0m3OZmWRtO9+pDQtLeavo5Xq5X1WKuLtniJHbM1KO/D
         SfREV39bUj6EuTlLFww+PCnLSMJ1jqTLec7g/BLg1XNBrrVb4LkI0z+UwJ8TC6UelYfZ
         e/zI99soEEC6otzn/E3aAvgMXOA7+jVI8+tOo/csk0ylI6h0R3ewm/vQChrEAb2SXO6z
         0030O6800uwgHScYhQTLTrDmxIIDtg2ChlPf3EzA8uvudkbs9CwJARAii5p7iCUw+Fco
         5T7lQJvKgJg9Frb3EmUZr5yFppxA9EwE4WgQX+uRtrp/aul0G8aiye0/PvRlX3nEjhUa
         ncyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488400; x=1758093200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltg8cFYbJHRlJhkC/eDYTc0LHBKn0iBfadbpYee4nfY=;
        b=SV2M3PtfiKr1wfHqoGJHy7xjm7zAg5XIzvxuqFYfalCe8FzV5wsFMg/jD0k9WN/80y
         djLShf5YvNtjEBIBUmVMYHqNiUVBR+cUqnbormjju4UMh1TK77jCWsUYGkzReInkqMoc
         gkX91qJ8NCHj2DG4KD8gc91gT2FpHPY7AQXk7ewMA9JYCDaeG6Vhi6A/NgNKUFjkpZW4
         49FweWXBa62Bt3f5cVgVUFRuuS2b97I5Gh2dHhQyHCZgX7T46Reov1mdQT1OzaG+JEdo
         rAQLLWqZrH53DHF2DiXAhfu0UBYkA6duEfjBPyj9yCY0c7EZq2/dZQvqO8O8mLhFITrl
         Ix9A==
X-Forwarded-Encrypted: i=1; AJvYcCXSbmaidXUIm7SBsKszsgzgKlvF2vvJd29wp5S4veOZtJ5bQFssyMSfK4altExvRV3U0ZZF5j9rfT9rbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8HVr+8O3ISC3aDlCPEnFNnhpG0SzDMQKzJMIbWVl2jFIUPTzD
	PyxomsPdW86GvjSlRXYvP+klaVllUh99WRGF52ZQs10cQy33WwXvVI5MCBz2Ny7mzak=
X-Gm-Gg: ASbGncvXteAigYl19BihIcwUK8n8pI7a0oV506K1QPO4P8irnztMOP+9TNdauY50MDx
	2ZfHPo8L4bUsbjnt98RXsbUkGPAz5Yhmd1YBU1Y+VK54xdh4hG+7G6pN6gEHvQmrEOon2wUvZ2W
	JbtG988ZaswgG/rllGQKEHhYSc44Xb7GeDDMMMwrvZLysRwcnd6wCK2qWyNrBtD2UkNpJe+LhPz
	70JUUO8R5pW0X3jS+rNVhGI/83m5XoKkO/rk4yjzRJhUTpUuQMhlGoXWKY8AetA2fOvmV9c2FZW
	nvFMwSz2mPqDvEwxT+uJqowSnDN49iq6kkZwkoOG/VAHk8B44Ww0SbHFI48lga+oURFTETG1MeJ
	WTTiYspebBD9Hk80aJSyiRsGLANk=
X-Google-Smtp-Source: AGHT+IHpXLfO1ittXeyoewlb0wbUWJJJJnWemocWkzf48CPBUxjPhZlMWV3u+kku9wzJ4x9qVOMXsQ==
X-Received: by 2002:a05:6000:2912:b0:3e3:f332:7414 with SMTP id ffacd0b85a97d-3e6440f05b0mr10423515f8f.58.1757488399749;
        Wed, 10 Sep 2025 00:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:48 +0200
Subject: [PATCH v2 12/15] gpio: spacemit-k1: use new generic GPIO chip API
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-12-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3464;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7HljN5YhPsu8emlMa5P74agbwl9gGUa+HLvxmV4i1uQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTvGObIqzCZRhNIWnvmsGIXqUuwrXRy1NLnq
 x9/w4JZh+GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cmEKD/0Sb0BUjgIMEsCZyVuxoagIRtAeniWoPwPxhUft/dqMT3ZJvidAdyX3l9nSsFcHyE/DaM2
 f2D8tR0Gjv62Sy/ELwhCFO6/+SRfz0pSHms21Jh2fyujS5hrPZp/zhyeNj74YxzJLOsXKjRq4sb
 xjcbJKyExsFwlts9hFC5suLEpGDm878AvzMubLbwx3FMKpXQW5cPV6zUgIXj5n+u+Gztyj3sIdc
 zhP0OBL22izM5RLAHirBeShtjXJxMh9tDz3dOcVEy1Il+s+9s2yChjuStp7cVXCkaoUgnAjs1id
 4NUQJBbK4WjAXtrxwJiqvbHDp23AdWcCw+Ebr6S6TV6iNEwqKSlYndYj15LZdgYnY1rOARrsIML
 ib2ac92qQBa7FI+BA+4jJ4EENCATWB1AsNCrNf1EjEKPIZrfBWCaLXCeIEWEMSYUPfKZf4Zy+/n
 oq15989/GwlzA9bb0bH6s7xStvFJKDv8dHMJohlyIu4XYoZU6RCJwvILAzdiH1010OOsOHqR5ka
 hongG1UtzTdmiNm7gdqkGfxG4uzqal9yKQ1xDFcNyhY2jTUWYYNyjpnL4crYiLmhIECZ+miVMFi
 KRzvytADA+lCkRldOPrfOcaV2fOJkLfDzs0J7aO+ZdXnbBtFZQwgC5lEARZMMG+pAAT9hlTFefp
 oEpxcj8b5NUhK9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001322_917720_F3216F67 
X-CRM114-Status: GOOD (  16.96  )
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

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..a0af23f732819be9329af1cb62887dc6eb100ac9 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -38,7 +39,7 @@
 struct spacemit_gpio;
 
 struct spacemit_gpio_bank {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
 	void __iomem *base;
 	u32 irq_mask;
@@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(n, &pending, BITS_PER_LONG)
-		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
+		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
 
 	return IRQ_HANDLED;
 }
@@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
+	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
 }
 
 static struct irq_chip spacemit_gpio_chip = {
@@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
 	if (i >= SPACEMIT_NR_BANKS)
 		return false;
 
-	return (gc == &sg->sgb[i].gc);
+	return (gc == &sg->sgb[i].chip.gc);
 }
 
 static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
@@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 				  int index, int irq)
 {
 	struct spacemit_gpio_bank *gb = &sg->sgb[index];
-	struct gpio_chip *gc = &gb->gc;
+	struct gpio_generic_chip_config config;
+	struct gpio_chip *gc = &gb->chip.gc;
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
@@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	dirin	= gb->base + SPACEMIT_GCDR;
 	dirout	= gb->base + SPACEMIT_GSDR;
 
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
 	/* This registers 32 GPIO lines per bank */
-	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
-			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	ret = gpio_generic_chip_init(&gb->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
@@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
 					IRQF_ONESHOT | IRQF_SHARED,
-					gb->gc.label, gb);
+					gb->chip.gc.label, gb);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to register IRQ\n");
 

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
