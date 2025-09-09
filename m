Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47B2CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNGiRbL7dTPDzaCmV3bjcHxNtGqYNNJXRodKRChC1lw=; b=cFoKuU+DyvdzJt
	56Dpet0U1prOGZRo1UVZdd8Zpwr6pNoxMglwwA/u/hb6fRFxrJA0V8T5/sYLvr9AUQSBsDEGRAnHE
	3GWLvVWUCw5hMhUzB31a1XMkJZFzyDEqiiq+Ct+XCGDPDx2JoAp/v6dUCc1A/14GZ7C4DxRd3D0u8
	HgWzt6yVhKo32hlxm407cpyX+FMO5BWomYBAHp6qG/enP5Y67eSCgGgAeEgfv4VI5cNFyP3yfd1uc
	PQ0roPOfK89uRiO2fcRqkdVy84i9hgTtzMpg/crHGiZ+Gz2a0jRkmDJOG14MSj49csmp0/FF6PpsK
	5HPYDAc6RUDcLNi+oIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwnv-00000006qVS-3yNQ;
	Tue, 09 Sep 2025 11:46:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSR-00000005svP-1uvF
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso45585695e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409370; x=1758014170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=grzwVRbb4CITRrE4/x+1rlv7vSJLSpOU366gmV3ChgFJQIHc9EECvkAr34Y3I2UprX
         z8KSr0LX4SBLNHkVTUewm6qp20QTpB3xhi5/LYhqKz8NQ/y7EuKWzw52v/6UG7lg6BkB
         pKHxiG0oETGBNsdGM9j5imJd2EWe7GA8B0H1NE+raOMWaMi5CK3Nj6lW1KlV/grlQIKs
         axnvnHV4px/hjCR+g/31AKxjI+h+LQH2M5J0xUGIX+1avi1Ip9SmhK23v+IEWsQTHE3F
         XwSbNu8hp0QCaVsZG+rcQkJFQuSWTOo0h/PpqJK9LvQUP9jErj7ukA4PZY4rRiDHQO71
         x60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409370; x=1758014170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=P4Yf/Um5w56RmQho9nfT9+wDjYbiDZUWQ7Pdv+CY+xpHht8oC6kspxcOIhwL619GhA
         O+z92sfnuQBQQokJasI1kT1Fe/ks0BNLHcnIWUOasokoPiUQwLom9ILAv4yMxWU8OM0+
         waZbQFHNb3bGcXc43zYHjeSV+3eUIz0KNnoalhLoZ2jpyq1n/x0U21YCORaYIMS3JXAh
         xRNFv07OrE7zH7RINIbfxjKDhPCdCGj/hj/0IugdmVp2uosNPRyehTpx3IMb7uYdea+f
         R1V7EXpsPEUvscAo/k5aKNnAtCmhn1kmlupPIzCQk1K00qMUYvhyDyfN3M/rcM8PVPIT
         VtPA==
X-Forwarded-Encrypted: i=1; AJvYcCW24j0cOFUNSYq4hq3WCjNuvYRiQ7IujmH2uNSkU7wzEZwm2ZbiiB8rw3jF3MfT4glFPTwpTE7XqEgZfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQ6OUiPpi2j3Qxwj7lwpVGfaETvOO7PgyVV56+WAziVVI8d6m
	RxlDUk31DyPdgroS9b8K/5OJFJQ876GHkPahzb/kjM07Ske8a8Vdr6YtN+ORiybpFKk=
X-Gm-Gg: ASbGncswqdOZdmnCP/ylsymiHzxeGCuKEU4fyNk7M7shSnusNal+IxsjgW7vk1rq4yC
	9zBOxgdIZkfvlXsm+7Hf19zJnCVtAtX9ON6c8yAMIKGfWv2k/HIp9Q8om0o/NcyL0VzFx3gyHO1
	iT6rrsI/VnOqRyJxDqA3XsFfUkohMNhJzCdvrh/K6MWweI4/xGmdJE86mec9C1qVybgk/Fucoxl
	Gsq+Cup2Mf/x3DUClmdJE6HUAqU+0P6bpS/hdGAEh2jviZHMDf0HFRWy7zwEsVbQ/rjtYOTZwh0
	1uIkp1UI4CAjH1Z1De2i0TQzS0lHIqjdym8C3hBVM77K0k9jgEPaNL8dZJrMtyxcJ6oix9SmdN+
	j6iWdWTzVz5jRQoDY9u1qZ/CEt7sI
X-Google-Smtp-Source: AGHT+IGoJXBvUJSpBt2lyPYKxW7iuqKGK81p5w4PzJvmsSblYb1erZflWT5xfvs5LzLHjloaRsoS9A==
X-Received: by 2002:a5d:5f82:0:b0:3e7:4271:8c6d with SMTP id ffacd0b85a97d-3e742718faemr7197437f8f.34.1757409369974;
        Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:41 +0200
Subject: [PATCH 14/15] gpio: mmio: use new generic GPIO chip API
MIME-Version: 1.0
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-14-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ghLIXnylAYcLYVJg4ksyA9B4/RaoUKjw1Cc8UARhArE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A7M1kWuQRnL65yzzeom2IENhFIls+CzXrAj
 boY3wL6vvGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOwAKCRARpy6gFHHX
 cjUbD/sHaYXToO+u0YqX7txBkP4Ezr0jc2j0S4iqMhj2XV/ZOkALp/qxGiMGm3GaPndvBOHLlko
 a+JYIaEtSb2cUM4o/Q7qpaiHJY7TST7XfNadxyDo/SfLQtQr7BzQ5FBU7+WU8omyvO2EonGCvah
 cCGCSQagVc7uqle5HXUtXcx5bglGy23IdFAi3D5HcPbgu8r4hegVKRPB35R3L196GVHJOARdZlJ
 SqGKqXaoRrqsCjoV7KfdkJs7Aq8KZs5lAMV/E7/Vjs0OQ5oL+IGXlf1pkfPQrk+m+bxxPo+CD1s
 o1co0Zh6+J34EVC5uiOvxm4QiWuJNJZ4OrU//m1bYHhAksr0qaLZmf6sd2eJ05ZyV2pCwbRyGcK
 NdN/wr81ld7t7tuLtbiWO85UH3i8G7+jlHyAB5kk4Bu1czKO0SCtM90ng3QeNoqhG/sI++TESm4
 JXHWeVwLLpSZqMU2Bf3EBFk0bPm1futJyBqmHcfDoPrXUJck+4IC/VrLUn09S8Y3evWzn9eTA2L
 NoxZIkWhOuNM8wZeBEuOPJ3IROTEAl0i0TNfkgOm76aAzuo5LXUEgUbIHQbNNi1KB3Wy8DD5i8d
 nkF6QDdT+keKJjVnvSQGBqIefYenhz+NehXtlsxXnYQKSdf3vpEEpWJ9iObJDEZVE3REDYl3+Il
 tXWZSivklUydFdQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021611_534715_02D70034 
X-CRM114-Status: GOOD (  16.74  )
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
 drivers/gpio/gpio-mmio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 79e1be149c94842cb6fa6b657343b11e78701220..a5e2f8a826af40ec96d2a3ea58240f1ca8ed250c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib.h"
 
@@ -737,6 +738,8 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
+	struct gpio_generic_chip *gen_gc;
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -748,7 +751,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long flags = 0;
 	unsigned int base;
 	int err;
-	struct gpio_chip *gc;
 	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
@@ -777,8 +779,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
@@ -787,13 +789,24 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "no-output"))
 		flags |= BGPIOF_NO_OUTPUT;
 
-	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = sz,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = flags,
+	};
+
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	err = device_property_read_string(dev, "label", &label);
 	if (!err)
-		gc->label = label;
+		gen_gc->gc.label = label;
 
 	/*
 	 * This property *must not* be used in device-tree sources, it's only
@@ -801,11 +814,11 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	 */
 	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
 	if (!err && base <= INT_MAX)
-		gc->base = base;
+		gen_gc->gc.base = base;
 
-	platform_set_drvdata(pdev, gc);
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
