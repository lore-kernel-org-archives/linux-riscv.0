Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40FC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KF9c87xzUS3FfMTQPyUqniffx/OKKJj/MCSS1puGer4=; b=UcM2IYdomO/J75
	gUyG2WJJY9POHWm1r82M+9PV5X+p+m7n3fH7o7QKhAM6dU1zptnBcYc4EN8vtmGSjJJnwJjvbcb+d
	fopVK2GVxIqlQJciVjNkTXZUksdh9BQZ6B+gYfoVgcJyNcTCD48jJ++9FzU2yoEJtM7FqLUgsE+Tr
	xRZH+HZ2DquKPhkSGcaTvb+6LmTDHAUNlpeZALdIGnihsZiyOF5Bg2Vl5lBfWD4CuAeYg3gFSBGIC
	nXqQF5ED3PNbHh/fLB83Pnk8rnizQVKasTXYBC84x4tDnM6CyCVXF+73eZi3+Q26WyGXoEnBoC4of
	vsPtDW54LiXGWzaw6QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz9L-00000006zkO-0OQF;
	Tue, 10 Jun 2025 13:36:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAT-00000006mLI-3XNQ
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=; b=NhtOgtx8f8O0YdtyJYvHFikh03
	RUUDiyDg0pgkhIY0L7LxZh8fNq7OBrPYc+YWunas/8M2U+CdO8sIvnN7cwMwPVXrETzM+hNtcQIKj
	IIEwcLqsBOKMOsN+7wHEqbTPhqZyZ0fwgK9fnbrTjPWSq75cZn7s3hq1RG/Ho7JqIjFlu8Ipsh9VO
	Jkd27rv7qFrTHf11PN1sZa23Pfes2Bi30+sc10OoE+M9ez2Mvsx3RYzZqZN2Wf8nHOgatc66AhRsq
	Od+sCYYzTWFQKNgNmd7dtb/2ljXy3Fq9Mgg6oMxyAPDMGzYOLfGfqaffbgIY/ZsrdujYuSGssBzT9
	Vw+CUUxQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAQ-00000001oTY-2M5K
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a52874d593so5188422f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558804; x=1750163604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=jnZ0xtu0jkrMhGRz8NjEhooUpCRQxllx47nvQQLmn+eZEPNmFuSkRjssxbSiq5ErjO
         qTBwxzZDWO99UBqPF8/xl1qUfDm1WEd04wQK+Q0cAuQmleOdQeuR7kVVGUwAfdkn1V0H
         XEi0jldMTxTCDHVQ5FkRnIiccuS+M/kcy+Dh5iuaUG++qC5Ylcdh2I2f8D0c7r8Fufiu
         /moD2q9lg1di3BStpVsSGsJriGnpPq5u0MUb126ht9EjWgYrn1u+aWjesfp33Y27gJch
         7Mk3/itlLGxtFSoPLIYT7HjjBwF4mdtEqN95r1rZ4OrSL1trB7tkCsnG6YTdVTELZpqu
         OVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558804; x=1750163604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=xRodVzBG8cmC7VVgQmWT0hvxrLMZwo26YbzLCkUI/J+QGu5qxDBjzjbwrwJpr95WU+
         uxXAJzLjYNdgFDVF4nUWm9bOlrJb2Q30+i4EtrkHjNLazndnMIPOri74tQUr9HpatB2O
         e0LMcRneC+SdJU+OomseiSrhjUjmUBP462S5aRxv5ERTGBKHDl/Ji4/D54yYqvASm/7q
         jJzTzZbfjKSPUMyMkwdmlH1d4cokxk41EEOgOdvr8RJwSIyTx6Wg6dcvh+8VqTWoq8dj
         +uCx7XNWpWmy7hpJQeYY3YJC70UkC6xkGWiHwV/ro1wIJ52j+60/wvrAK7Kq+hVaw/Xo
         EzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW41xXHQqsEAvIq50mZHMWaxNPnv7g9bg+zdEcdHuxW1osINmpKMHRrxGxUvqO6DVCEYmKIghCUMfdwEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoyJ6uw9czuaTaRp3Y6m8or85KVDZ/eJDedJ2NSALrKghpXBZw
	RAsJEj3j1CGAXfJIk+HPbshXwLUGOeL1/Hja+2a/YAI+1q0NphpkrPnSG9kwe3gQaDg=
X-Gm-Gg: ASbGncueVFznZfd/awxJWfAB9GpnhBPidQQ/xahqh9p3ViveZDgZuCh/PrYpACKHa7O
	+vASxLCP2ExyZPlSf6raWctrwVVEK9MtZrh71iJHbwtIjBLf4unqE68Z/tkUcc+U0Qal/IKPtsF
	rrn0nG7+7wOjsLUuc9JMdUFtO7IiuVDXJ5iENFUqIAdqKZ2yrIfX/bGMLR5SMaYZMSlyD0yJeTd
	1necqHpjDNxhAWn9aN5p2zhh6htOVkVDxu+UGbRRx+vAE0JOG+ntQz5nEGb8+gXzs/tG0CcNnX/
	I15FLqPU3fjhN5gKm9rY++tvYBDJTDO+Al2WopnxXg017QUGnM9aWQ==
X-Google-Smtp-Source: AGHT+IGV3Vn6yhZaRUVNvlMafFgkrcv+bSXbOKrnS2PqVCasr+PxmHXeoHC+wE2lIVXIMNJyFwWweg==
X-Received: by 2002:a05:6000:2504:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a5318822demr15550216f8f.5.1749558803465;
        Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:11 +0200
Subject: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4849;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/UH4x/fbI0BIFJX3mIEzmmNo36J/N7bN+pZNnL+oU7M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOFAEvwIEsxV1MXfRknm+eXRkQlcJgIZH4/
 +1R9Xhb0bKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cmxBD/4hi6WLQtzhS7/j0anJqFfcC06CXtfOJaLR+lYY6czknEMDeGFb+xLjlYIn4qRsoBWf85I
 drjoL1zNnkc7/SSy+dFT35KteOcWxXiAvJ5iRFuiQbUF0yyNvLP10Ee8/G91k49QfuQ8fRvCT/D
 jQVS1Q8NtvK2xD19vjsPWYvufNHB+CV1QiL/nB9PH5aVCLnrmfqHP7oXIebxMFTd5UyM6CV8u6+
 xxj6tpMDW17Idokc90HfORu+kEHNvJTH6pAiQXPUbN2OH8AGzNSRQnrHBPtSwNg2nNTsCX1kTg/
 JNZzoIy409MxDnaxREy6Zv1bsQv4gjInQXmp2v2IVtiF52H6mxNqydzNCswYmhOaXbjOflt2lT+
 R23/z9U1J1kDbEr2hbA2N8BKFRXNmc1rVTylsrzniQxCyHZIxRNXmA3gJ3zjDqXqH+0xT66ht+2
 QCNpNf2hD/r7aOyJoRRM1biGgO98Y1b5XgTH3Xui51nBMJNGcC75zIay96zEsz5XDv8KehN47xg
 CKLzxQzZtCPVgBe7LRiEmYBdjPJWuW0Rb72XsB4n3gcp4WylME3gGn1SGIAtwcjyUbT8MFoNW4s
 oHaokbunFa/lEpVFYZbi6gW1I28Hkpy4BsFekKQ7s2IZfh39C4/O3IoEx35s8GWtxzvhuhCj/uN
 /FpOY/4Ggy1QTnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133326_690849_270FF854 
X-CRM114-Status: GOOD (  12.14  )
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
 drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
+	return 0;
 }
 
-static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_dat, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
-static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
-				 int val)
+static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
+				int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 
@@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 		gc->write_reg(gc->reg_set, mask);
 	else
 		gc->write_reg(gc->reg_clr, mask);
+
+	return 0;
 }
 
-static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_set, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
 static void bgpio_multiple_get_masks(struct gpio_chip *gc,
@@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
-				   unsigned long *bits)
+static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
-					  unsigned long *mask,
-					  unsigned long *bits)
+static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
 {
 	unsigned long set_mask, clear_mask;
 
@@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_set, set_mask);
 	if (clear_mask)
 		gc->write_reg(gc->reg_clr, clear_mask);
+
+	return 0;
 }
 
 static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
@@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	if (set && clr) {
 		gc->reg_set = set;
 		gc->reg_clr = clr;
-		gc->set = bgpio_set_with_clear;
-		gc->set_multiple = bgpio_set_multiple_with_clear;
+		gc->set_rv = bgpio_set_with_clear;
+		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
 	} else if (set && !clr) {
 		gc->reg_set = set;
-		gc->set = bgpio_set_set;
-		gc->set_multiple = bgpio_set_multiple_set;
+		gc->set_rv = bgpio_set_set;
+		gc->set_multiple_rv = bgpio_set_multiple_set;
 	} else if (flags & BGPIOF_NO_OUTPUT) {
-		gc->set = bgpio_set_none;
-		gc->set_multiple = NULL;
+		gc->set_rv = bgpio_set_none;
+		gc->set_multiple_rv = NULL;
 	} else {
-		gc->set = bgpio_set;
-		gc->set_multiple = bgpio_set_multiple;
+		gc->set_rv = bgpio_set;
+		gc->set_multiple_rv = bgpio_set_multiple;
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
@@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	}
 
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
-	if (gc->set == bgpio_set_set &&
+	if (gc->set_rv == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
 		gc->bgpio_data = gc->read_reg(gc->reg_set);
 

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
