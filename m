Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A58DC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyPay/oCpJe34a9axhPPBdh91PBDzcYaqL/oyHCN4Ac=; b=hjBSQBXdR6iLIB
	brdYTEG4BYapxJ152YxfJLVZGftvcPWGgZg9ed+4ITyNwBpyMkXa4j1cTNuggt2+VX1uXbLk60mgA
	lU8FzM0utbS9NXqzK1qTTIHG+M8RqZGsQ+ON9jlInJ2skb+jdIHE3dioS2U4r8sYnkTvMdxtxeL+i
	VaI9ws41vgej6Cn3s4ggyzL/bsxgTwd+NrHN8jxWy5pX9Anmq1GWsVeg+CD3BNcwOOvh8IBm5oiyh
	som4PZrlnxGbJ83RjpnCZR8pU33zZ+9KMWdDm6lRnT103AJAsmv2AWaEvjqGaWSGe4zgufMx0HHs8
	QTzPUsBPuqgTwoyrXwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP07t-0000000795T-0TRe;
	Tue, 10 Jun 2025 14:38:57 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAQ-00000006mJz-296m
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:27 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453066fad06so19263385e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558805; x=1750163605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=oFM1RNxZaHy8aNHdrHxPRb/r1SWJglK8SLM1TBgs3oPsWfUjzk8ubMt1U55wOab28U
         OfHNfkraYrEmrFLxde+jmlef+GeDdrM/K92rILWCeN3Z2xT8jOpdR1qsuSE12q7NNiVv
         9AaDDCnAfrp4jTizEfJ4okID0GXfg/mPC0s6NdHyKAGfp9MG+A697Jmc3pU7Nlqgusq0
         mEcCgDX7dAuITJQ0pf4NreBU36f5roM82APG3mfjZjzXaVjVQmQNm3xhtAfsiBmmT3XW
         PI6wIZ9n50eFPbZQXkiBpIWYUWbXfHaez5zAjIz9SymFNQTvDMAIRhPhofK8xQ/1fEns
         ZGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558805; x=1750163605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=HvllbmJGXfVIplBlpbTPWzb0+Saw1WKpTR2YrKGORsV+zh5Cx9+apOoIK1WM2sHdAq
         9XtIFFNU3j1AqQMi23quEuLEZ1WcYYJCheVCc4pUTlzGxHihzf/Sei9qwnZk5+gbwaxo
         5XYF3Nnp3k2xYrOu5w3s7BIC21tmSJ3lr8aaqW2BQb/octlQ0CyRdKDXkywFl9TRHxaU
         YSfAePSSTULjEtyUspiysTUKLbSSJ1IYZdr/IElZ/uGIDWUpdzjwS2G0aQIHZ6Bp739O
         OYCvqHk+AdI65K9zdRVoKN0qvh6VbfTTAQAQ3K5eV1yob+SQ36Cxfux5GfBTnXsrCT62
         QxjA==
X-Forwarded-Encrypted: i=1; AJvYcCX7yzBDnFqgf2tMtgIMPNE/XRB0qUsl5Su9C5SLn0O3jRPRgL1saF3/OGudjYHY8DWru9H31i0HjjJwrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy75uKTxzw+u3otJVbtszXnFpypI2M5nVi7msbyaD4G1JeQH75r
	6b5utIFpBRL7WtJmK479HPwnh5ZJwJFELT0O1oJOOYxA4/vmLS5029imULhlePsh2NI=
X-Gm-Gg: ASbGncuhr8eqEgv8cmdiqlU8uafYzrDan3N7z4IhhUlqWhXdu8otmLUWyxyzSU5HopB
	hZXavhVTuUBfyALTdjHqlnEaF12TrOwsx0D4THonoUvZObMAC+jiDI1cUUUFBGIYfk72gIwODJW
	arQKXU3j4U8sznTNMXuWO3Wj7savcwyKpQVrovxXN2d7Qc7uFLhYm44lfuVI5o8FNhpnmyTO5Ee
	l0Zop1k8FYPb5onaUJvjsKLYPHbvbb8D3EqLw7wO5CaY3S+RKkvu5ytaQGem2IpKJ5oOLwR1vu1
	6rk+u34hKyXMIEyMBQDpenaP6hQ2bDT2ZG5zC/k6wNvgk6xh6Cgi0A==
X-Google-Smtp-Source: AGHT+IFSBusLtZEhcB35bdsLhsIDJKEdI0B2x6nuBuQEbHF1Ukz5MK6AfplwzfpXypgWmTNJf64szw==
X-Received: by 2002:a05:6000:2283:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5318a90cbmr15138062f8f.33.1749558804571;
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:12 +0200
Subject: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h//lpMqxpm+YSvksV4b6ru3A6OjJcjH0LPneHhPANFI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOyVxQ6f3OBK/aG05w0mHNnvJLnDT+orDrz
 CyfWJIjJ4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 ciHSEACbAaLEpy3rIEg/INTnqZRSZcKjIFtdWlKQuLFDeybOyeiSxsXh2wVCKE9HyLBM4Pe4aOe
 VeJn1Gr92epXjzFOgr9ljMI5XuvfDKiUaJ+rYkq7/Zs0doHxU2JdVUOZ56W/ksVaQRwyC8wCRBr
 1Wli4N7JwPdD4t/y88MkdyHuplV05Azu8GK/HebhanaJmAdKsKGHxR/A4RYuWfrffEarVVAQ688
 yj7fctEZEtajQVjw+qCP5GBjsONGyfRiTciEzFZk2Eo6IIQCZEYQq3wc8Gd6b/7f7x1mHHGRecY
 DySlDOvl/blSxGU/19Rk59Ji7N0jIHlFGoRdOlEfDYsyxYcQ1YGhBm/EWbwy7C7TVwwmYmhRHjQ
 6U0crUDECD+RHZf8ESHp1fzD0gQD6M87Z2n5Qqj/iXDfT7F3+/E0NCfX2MGjJEoG9D+gFkzNSqN
 ovpcvq/yrRt4BiP+N/+81NwzARAgmNtA4arZxeyh5i4OqTMZtaMMgDsKwlZxHweLeCJzeHU2c01
 Gd0uc8Rd+iWf1vbf/mnnIHTHyTaSYWwYmVxa/FJSj98NsXYkeE2f9VoTVKzBj/b4ltLuEiTBWHq
 cm2Kz0AGsiu4qJ7PmhkesDqXdEvXX8g0I9jum1a/5pvlAwYSlfyl1w9eyBKPjCur8y1vx+5atSV
 t1BHqk4gNTPA4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053326_544470_9CEC5A45 
X-CRM114-Status: GOOD (  13.62  )
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
 drivers/gpio/gpio-mm-lantiq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 14ae257834381186faba94446ea326cb3be99ca2..897a1e004681c085217bcf295bd971f3424011b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -55,9 +55,9 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  * @gpio:   GPIO signal number.
  * @val:    Value to be written to specified signal.
  *
- * Set the shadow value and call ltq_mm_apply.
+ * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -66,6 +66,8 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 	else
 		chip->shadow &= ~(1 << offset);
 	ltq_mm_apply(chip);
+
+	return 0;
 }
 
 /**
@@ -78,9 +80,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  */
 static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 {
-	ltq_mm_set(gc, offset, value);
-
-	return 0;
+	return ltq_mm_set(gc, offset, value);
 }
 
 /**
@@ -111,7 +111,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 	chip->mmchip.gc.ngpio = 16;
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
+	chip->mmchip.gc.set_rv = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
 
 	/* store the shadow value if one was passed by the devicetree */

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
