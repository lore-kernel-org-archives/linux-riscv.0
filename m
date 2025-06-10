Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A577C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2j9lgioNqNdf0Akc5iW/S3ZX+7VqlcdZCc82w1WwUc=; b=PYrXIHxj3InoC6
	gmPR70I+iSvRRKOzUZOcNl2nuWMcaxGWR+4aalr6AFxppk1dFFpwLtEXaKlXaGZET2dKSKFwOZeXk
	AWyeuu1eQleQ6wj4AzYtYbHitbdGBDApQGcb2exo6RqfCGvkP9fyLPxQchhkMonX59118S19F+MV/
	10jMQkBWkmGQH010QPpxvC3inDnpmzpSfOTZ8WpZi6omAS19gFDKO/7dUBjDZdQscclUejrMcR2hW
	aVoSCmNuGRB8Itjo+HryWXBaUZ+pEx7TlZB53WOAWtRH3ZkwOhHk7Bv/Ak34YOKQ8bNx3Po1bofXQ
	ZVOjyZfvzOTD6zCpxDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzHq-000000071OL-3v7j;
	Tue, 10 Jun 2025 13:45:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAW-00000006mMu-0EWb
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nEf5Gc8OIB6seM5Xwo8qWzla3rwazzwe65/yd6IeVS0=; b=JhB08e7BTm+D5iZ66lIoRMxIyr
	NX2+t+S+Lfjltol4y94j+48R2RE70EKlxrMLl5E3ll+PxLXENrRiRipZJnCaju+j/GwO6XXJkVJbD
	FlT4uwmn+jaXn1v9s/P8zo/w+7ClPbM/Vgc5360IOk3lpxEhAuxS0FyUPPmmbIrttQCrNwf1yZ8lK
	8Dghjq2ULzWWZ9mNY6NkRv+gGJi8Xg/4MThaRGB3GYKiu7LIR26YWZOfre9U31xnlnl3B+r8l48/1
	+SIgq/+xgQM30TPFlqBDx7Mc/o9rI50UYZsO0HU8LHLstBjLjT40zjWe0q9B2jzQqU/KSsIGe/iBy
	YnMCarOQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAU-00000001oVs-0CxL
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441ab63a415so56220325e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558808; x=1750163608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEf5Gc8OIB6seM5Xwo8qWzla3rwazzwe65/yd6IeVS0=;
        b=fIVUUlU1G6xdg5hcXhs7WEJ23Gqh4eIWIrSisOdt/L1vmryHcNynYrtVV8XT5mOd/V
         FYirXTKbRGQUjDVTi9ecgqZAB2QGu5H2VNbOfo3Q0414kolphrIT4mMA4dHHiPHpzt77
         x2w0Q67WhWdW6FtabgZgcvwoosQLQXCuzw6ag5lyr40uFdqngaZ6fidnHmhhJfx5TeGA
         XuaJUT1N0Avv2NqB0pPzChL1bABWNpJ2E9rSuHRk4rlgbSQC4Gvm6jRZmu7eIrWOQRn1
         OTGXvADmwFQnqi9p7WEmS9FUWZeS9t9VtAdCwJhJKJIJmYq4l7eVlZoL14SAq+E8onq8
         YcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558808; x=1750163608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEf5Gc8OIB6seM5Xwo8qWzla3rwazzwe65/yd6IeVS0=;
        b=poUlHEg1lg6c+tapQDubxh2urawmB6w/9rkqD6E1acv8NIvuD4MahpJDMRUEMYpol2
         KDu81iR+LXXklVAxATizZFb+wBFZksdWmZa88dATvbOzknpsh+bpPIfripWKTbKORQH1
         rd0VBXqNjuzW11BSMrF9bNBi2D98Tmk2uPy4wIOSsg/aUvTJoSJVV7EyrpnzSwcsjalt
         B+BhRhEpRtFb9tdpzblgvXDupZ8z3x3CyDQ8t0+5MsxIkSgmupvHuUS4mG65NSX9HxEl
         HLLp7prgc09uO5Qm3qaTiFD6dPhS2x4UBNm8hmQT0jjFp2Xt+UFdtCMqCiF1xxXRA2Oy
         lhlw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ps/HDPcCSWa7JiET4r/ZzAR59ZJnFp4EUkDagkgbI+34PcEEMU2OajK5n2pLuzDv+f6XZQeacE7bLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpaDsmJM8bfEgiiAbjuIjX7u9ls9hagSGKCtFCxskJ1U9tuL6C
	zv7jr6vgy1Jkb/qur7i2NYO8z1RNuIZ3NGRSirYA+bYKKqsz/FshJDosBPhCSRpfw3oQ9X14VdX
	SPKHq
X-Gm-Gg: ASbGncsZ9s4QR2ViLYZPQRuBueylXSCX9PeWZBFlOF+zolMYXIUK1dLUUhqwpu37mbu
	Xc7JeIoozCMBDYWRGNzU7BSf4F/CMxGPjMukC6ZvOhG1qPwVz7NqO2wEwlGfBE1FhkFIILvQA/W
	lClKxEABdHIkJC7C5Z01HNbS60LRo51sWAvDPd8piD15Z0BUqHTgb3qEEtu2g3RTXTlJ/Uv6uU/
	jaxxHpEbOVEnONkg4pOROSdcoGPAfeWG0fksDEI6b2QzOQ6WakBg8d1ELjpmBEJojDTDUlwkmZN
	WGEW4D23VIaoUeh8+4HbsYevV9uTg0adegU5YYn/iAObiRwP3rCUyA==
X-Google-Smtp-Source: AGHT+IETHAD7DnXMxmzo7SdLmc5/WglgRFKEzRxI0iE9dDNUlCk/3LFXQSCUEAkPp5r5aRCIVtcMtw==
X-Received: by 2002:a05:6000:438a:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a5522e58c0mr2096741f8f.59.1749558808061;
        Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:15 +0200
Subject: [PATCH 05/12] gpio: mpfs: use new GPIO line value setter callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-5-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LJhyLcUOS+h5b7rEBajAPZSVOUjvkwn05DngH8alAwc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPZEloPYVfxzVAviTn9YklxaSXEOfJeOwsL
 R7IvzJurSaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 csXgD/9eTtN8ZefGVcyBA5Sqi0yLe+7DSboB4eiFeuPn1Qp2CZK7sZczomtfCljg4IDGEXmyp67
 tQyoMRkwYZ+BniUdTs89iZTV15o7YlLkxkkfWLJb6s6ida4C2LK7ci6BOTlpZPvg/+ruCWG+q0c
 vgaodzo4cHgZ0x/5gtXR3LNkiFX8xUCuoBDakmGGtUdc7V1vpDNR87G5AYtMAKfv5YAHZLmVtgX
 FYUczRur90WLzpocuHTLl17SXcAiDO7pNKlDy6wtdx0YDcivwE+jgNSSZqWBgjZEtLD5UoN6UiQ
 dAV6nc3d6i+AH8WVEBfuQpq6wAVz2xL5YwR1PZ2O33tpPXIZnii4pKhpY8wfB1i78dvSvztHDMo
 w7WWsv5B3IR6QDHHV97atmPnmKDED8QMXf6/Upb0uRLixEDhx2Cx/n4/kbXbkHtNsPJm2x4C1KN
 3kWUQef3cQ2FywZtTnDGj9PSnyXozlf0erTFQVv0V+J8psfu5icbuey2A+twL9kkFUnNeZmBSXo
 DYVkosbRnq5IKLzdn+KgvkJrevZDRL6FNqyQS60w3Bytlf7mpPTDAzjet68U8nXsETXBvyRHgyQ
 CEfZhGnIObe+eUzf2Np6b96R7syeqYaTChuKpOhp72wOm4IkIkTlzyEKfwnTHXs7gOkxrFiDMT4
 dp+YIWOY5u+7n3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133330_204643_BD58C445 
X-CRM114-Status: GOOD (  10.80  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 561a961c97a69f64c21d31c0d924f930c985f131..3415cb7ebb0f1dbe291bfa41b02ae41c18488ff6 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -99,16 +99,19 @@ static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
 		return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->offsets->inp, BIT(gpio_index));
 }
 
-static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+static int mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
 {
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int ret;
 
 	mpfs_gpio_get(gc, gpio_index);
 
-	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
-			   value << gpio_index);
+	ret = regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp,
+				 BIT(gpio_index), value << gpio_index);
 
 	mpfs_gpio_get(gc, gpio_index);
+
+	return ret;
 }
 
 static int mpfs_gpio_probe(struct platform_device *pdev)
@@ -147,7 +150,7 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
 	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
 	mpfs_gpio->gc.get = mpfs_gpio_get;
-	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.set_rv = mpfs_gpio_set;
 	mpfs_gpio->gc.base = -1;
 	mpfs_gpio->gc.ngpio = ngpios;
 	mpfs_gpio->gc.label = dev_name(dev);

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
