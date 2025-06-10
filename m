Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C4C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1TZK1mxDyVJFgHeTfM6RpgTDRwYCuK3L40mj7DUU5c=; b=ezTksKHUx8f0L7
	wTahwAK4stxIvlOfsktr1Sa1w8TIS6/Ne5legaLEDYWooTKWhyVROdjQieJUXpFx1G5DjdzinyTVm
	6vbZZUR9ja0N7z4Drnn7c+7B/6VB5NqDeeJhFuHfElaf3o5P2PKqGbTz1yblZZACb1P7M0a6Tb0uq
	WlaRl6ANbte5l336Wo+n9Fs7bbkW7OlLO5kgwcPKbdDnEedVrQ0lqxnsjhBvIoDYDdqtCVhjCd6NY
	JAEyeFvjBNdfwBG4C7i5umjrJqjQSt49aG83RnWsv0/Kw1zpfX6QCminP+UzITCxSIertDU92I+FK
	x5SHg0E2SBCEJ8s698xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzUb-000000073iC-2Uv1;
	Tue, 10 Jun 2025 13:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAa-00000006mOM-1FIH
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=; b=I7WV6Z4fuj6vt4vguihM2cI8CF
	ju3vIDqVaESX+MOD1vkCPmyaVMcPFP5NlRgOtnRNboFdigVelDRVk+lJ+55cwrZEO7fVWvgwCVUB3
	iaS/57M9k4NdjXGUQFZ7XlpZr1uZQUhJfeavprNDXgq84epPGmb+aJpCIONst11475+xRVq19Rs0V
	0Y7vgf7ZHnoEGqnVDVNQlttMIjEj1yyDCjU1130LHgVkQQjW5t1FTw/6HP3D+ETcuN8z0pNODEVfg
	CuS1p1bxwUXF+LdJ9sbxGlzqLKZ2O+qgAhi8DY4HyMgn4jPuDe1TmjnvpIZF73507NPFUt/Qn7NBU
	nWPIjSUA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAX-00000001oYv-2y5y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso50393635e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558811; x=1750163611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=H2XkPol7fR1q0X2fSqyRYWheao3vXI32S46r6+qS52t6TfVFoAE4lQwi1U9cNoCi5H
         68gfPMNn4NbuthoBCQyCTND3Ujg0CdhazMKXgoyXPlxOSSwTAaDWPUADoJuRWFYzF8J/
         dYHrS1tQw1vdaEc5pcG7a09es70guJupl8QxQrUpgQ8wZVTRuuO+pNx0YCXb/PpczSFi
         zy+v853iO071Da1KTSYY5qPiC8glN2cE3h+igJzYwiRBbTjaHc3l8gaLkadEjETV+4rP
         xa/wC26kBvPEsmwdFrhjCkgQQtVRg094x8uy1SMLfUsl1fJHt5D8Eyy0V5sRTz4OFYwJ
         dzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558811; x=1750163611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=Xh23RFKn//TYGWX2QM4UHET5myppfOHCAQRvgu+RLTd2Nc+rzgP9U3LZvQZxVPHuLt
         6jtxvQPrhkjPPqO0K/sMbGdblkkuFOZr9j0/pN9GqTH0WSmqQ+EINGeXdwBvOCqoyxsI
         S42HPGn8BXc5QWIFTeg152cdGDSIy7Kvn7VY7/RQhawMDJbitqnRI6Z/jNIzvqwgARLS
         iZXpKyDJjUMHUNjazTEvmr4CUASSeu5vdXQ7lsYFa/SNe5m8NIKN+VARUqH8FZLrWxs7
         HZjNm9TTAl5RE1i2QNwOkVdTXXpeOLSggPIOQ2CfFnEa0FFMfJQRrOwBPTNvpbo877T2
         e81g==
X-Forwarded-Encrypted: i=1; AJvYcCVBL1RpaG6gVOiA4JMTHvnpnmV0+UuDaapigtfJU3F6M1XTRQgw2eXmICH+iTjf9sbN3rWDPufDN46wvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Ttw/gY5jIypI6LIBsd4LsDfhqT7UyXeQPieIddGZ8jtUk+Ix
	xLVZJk0HlK7m8lZPT3qN7g66Nk8GX5gf0gfR+ge+KJdmX53VvrbG+pdLkJ3iVcchrjw=
X-Gm-Gg: ASbGnct+P1+2q+bqwSbZvXWvVvDmVCVbX0ypB5eZfpmSJ211zJepe9rk3xUuQ2Tnr1e
	jDoBUoAxSUQKy6YhxOqI7etUxoHe2yCo0CEm9CbqIgdb8i3IW7blsYvqfqnirmjgBM6rHoDO+fy
	QG9mv7Q/WYuknK5UVnpkMMJqVbd2jWcbqLfkf21GbmsCJFlYOkiAuudpR+zrZdofgLxKo3aSRtr
	C5SbjjBj8ddHzhi+R6vBkSARCSNxow8v58x8Yqd7SrerxJ3+7D4lbtwIOg/8MpEJca6P570Gxqc
	/BZcY1r+Py4ibjsh7uzaGS7ABjWpTH2gvyzxCTXY45Ze5ybExPE4PA==
X-Google-Smtp-Source: AGHT+IEiNibcNMiVsbQHF+47L41QAAVONmrgvcTQ9HOwW+eRgKNTCeQ/gU2brhJ6L5+0fDStZI1sQg==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr14618808f8f.55.1749558811315;
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:18 +0200
Subject: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8SMFcEMP/yadOAddKphU2LRj+bMl3thvtyJ4brm1q7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPNZX7SmF68qJHpheQB5Bvy2U+bFuaYHRkk
 DPVGcTa+SWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 coOIEACRhw6kCcmI6Qk5Uj1hqmX0byLLYekHcBjVu6C0ctu5rgUkddKMjGT6YzbWLvwnGp/o+az
 B7cu6TULK+CGHrcSoGO/JBAtpG0vLkNjQIDPjUr0j75ifLhmeuE0jvgszHFIFyVSHSOdthyj9w2
 rsEmzCLFLsSXCDgBh2oFj2EhfJhxZI8rkjn3ox02VOjRjDrtAt/aEljk/mSrvKj4Tq9biIjCIgo
 o53nCEEkmYf6kgeNtBRKqfNg0ddAaneqdwzZ7Sh25b72vVSBWwaBVZ6d6S/RsrYndL3woYZ87Xm
 /dePA8YZOs3Ectoylv+V7MZcEGuIZro5nVhzeMBOYZiBUXedMjRsm87FW9+ltwQUiAeZfQz+6zI
 nNOeWzApu4vwd0hMs9rtxT3GRXGaQKpXx+mGZBn1Yq80KptRmM/VUbh9rfGHjmet99x9gtRchCh
 2ACbns1aWtM+B5mgT7GFsDeG46pOv50D5+6uuGsTdssLU10ve6GAQpD6S3ks30fY9kQY8/FsvE2
 RKDd5G0DJ4BmukghAk+CEvLjouL/qWS+JDyjagXehsDB16fWjwSmxOKHF+TmaOC2M1uS9qiz5wS
 /6f3WIunj+fATUaxSl5bQdqcPthCVIh7B8BN296a5zC1QRO20KkJF/m6PNIGSKzstuOJNOLhYE0
 d6QPrHLcpkEmVsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133333_833059_34F9716C 
X-CRM114-Status: GOOD (  11.68  )
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
 drivers/gpio/gpio-nomadik.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd7ae167079b34a48f669a38ec4ae7..296d13845b3009a52068ecacd8d2d6a25eede9d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -347,8 +347,8 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned int offset)
 	return value;
 }
 
-static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
@@ -357,6 +357,8 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
 	__nmk_gpio_set_output(nmk_chip, offset, val);
 
 	clk_disable(nmk_chip->clk);
+
+	return 0;
 }
 
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned int offset,
@@ -672,7 +674,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = nmk_gpio_make_input;
 	chip->get = nmk_gpio_get_input;
 	chip->direction_output = nmk_gpio_make_output;
-	chip->set = nmk_gpio_set_output;
+	chip->set_rv = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
