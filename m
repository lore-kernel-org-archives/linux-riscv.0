Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6F2C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 14:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k38ewcbRvlIfagkGjWBB8Gg7K4TMsn/u9SD/8dECWE4=; b=DatGgtOkhJTpna
	Ye2bcu0RsNy4zWOH4Ikjga/YkyZT78dviq8fe1G4fiaICMQwnxzKZiSkDbt+m8o27fU3WUPClKbaF
	TiRJe0r2521PqlfQZbZ5L724YTAvnYW76dsb6U1RC2ZdHoDn0VAUT2CCYH4YRps+VyzbDb/w92XSm
	YK3/cOA3HQRwRhebWOhySp6ldqXwCCDaLonwO/0gdBo92hrHRy34AyE3ZmeighDdaLuhnggGbTRMH
	x0gk/OHCFabtH/vpdqbMxKjjBx/h4BCfDNCNIy5/KJmcrqXliunmypzYiG4S4/lJopb+29sGKv9Ep
	qIEOaPqXrhD+1lxqOcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzWj-0000000746b-42of;
	Tue, 10 Jun 2025 14:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAb-00000006mOh-2oOb
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=; b=AJj3AKZ1qJr/eA18jcUax0Fffm
	s2ddoHpD3kkUtxxirc1pCf/XdtdUlqY4pBHm8WxMnDEmjvVr6kZBmVX0+zUK+gSKF2BxrqQGCHvQV
	nr5gX2jZe5ZY6CdMRc5mLqNySb1PfzngDRdJPPYLy5rxXtezLlCQbPBk5wnJX0+B/luerkpgrGk97
	+DWlHTkLPYDaHmsd0BtDYdJf0HkjHQ0Bn2yD0VATC8gvdH2PiBGIKuD4/+O6gPi/XE0WYjv1+qCIH
	wqpfNOslckchJLulw9Fe3Sj5B6tztFcTXcbAY6YgJm0qgdNMSLEE7v4QH8KjdviM2i3h8lw4n9r5y
	1qrUvXeQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAZ-00000001oaH-2PD4
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3639577f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558813; x=1750163613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=U6uOspt1QN0WWdN2jKs2nVxxZjbA5MtXJ8aVAyuIhwB6f5cDhtvfFbYe0DyNxY0KEX
         OkOWuX0AR1uor4n2yCjWeQF29+YHE0yzYXlx6MF1zkot8MM0VYb3gjmHYw6LmstXEP0+
         Qr6DwHUb5PB1Uw3Qw+flWO6AEyEe4XDOrv7GLx/htzW2u+Dw5XRF8H06hGtaqzVvyZ2M
         xkr9w+3ohmFAujDuCIBHnQQVz92RCxkW4u7hj5lRjqNZWxvuAJi5Xv0zGDtQJxbJYanN
         JFlIuF8QNoZNca+Crq1txMjCoRw2MWdkVh8HxI3sT3xoelKoIM8tHTrjFe5syqFb6m0z
         aH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558813; x=1750163613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=M97jBkyLf8NknGnyJ7tJIh207u4ZZUjqsYxVEfqMlVLN9N7NTCmugDpVaT4c9mKvl6
         msanZuE2nWKSvoeiQ4vcTSbrldfg7XJaSydrghjuTtZV2dGYIBzD3ko52mliJyqrlfMc
         3Rvmuc8hC7Qp/jG9utRw3wKaFCklTZobF8MU7Gn0f5oNXTgyUqP5B3DON7eP9mtwB+Em
         lNja1q2zj5oiKUhjIEHwJQtnnslFq+4PBOVMZiLZ62NAlk+FfHeXo3FQWgJY1Uwxqaj4
         ZwGMC0B8RxAB+nqbIyrKRkLRNa+9i6oxWZuTpHPF9VRpmhGpgQDYdyt2fCIFCeVIzicf
         5m4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDpvTCKZ6Gq7SlcUjlb5SpeZkQQaBvFASo1ez/5ieSb1jbUN124U5jU/Xf5xOS14Oa056XguaGEM06TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk6OgYINPuqLNAGzhoY3tWpCCUqwY7K2a8Izeq0F475+7Qf76M
	m/bNklQ5oEyO7d8jlFutjopuMsBcky0FltLMVZedX2kN1PdrhjA5l+HovA0hGWJBG+s=
X-Gm-Gg: ASbGncsh/LXUkLTu7A4by6CX1fqrnZ+wVQh2fIerGnPyscb3JuN6p0SyUbwE2qA6X+r
	MVIIzxhpMnexuhZQBwOGiC5KINKYSHz4e8EhjCpv8issnFtHMpK1YXL+6n7aVf0F3NQI56x2xrh
	kp0gurDbDx9kW4DApQXby7UlWOSVKHI/LOjPfmV9BaC6Ba90LtWzZ2gXCZEdXOhScnKwwGUB5pd
	w1+n0Q63Wm2mTmvHbt0gJQpk92dIN7ZqnsgbbLyX6AFXdtrkDTK2c0H6DhYdj78PNL9RW8KCMOX
	HsjE4lyC1HCMwrbFKJx3gOMx9Ktl8slGEXcf3GNw2XTCeXkEmvQ4YA==
X-Google-Smtp-Source: AGHT+IFgyML87FC7sXwU9H5OuYAASfbZLFGVxDzw97GzCafTQDbHfQzd+kDvtAb5xiwbEFxqnYxW+Q==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr13136061f8f.58.1749558813586;
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:20 +0200
Subject: [PATCH 10/12] gpio: octeon: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-10-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=inYE0B+JIbFcYN8GhgAuP7ekd2fsyKlPqwAEHBeRQ6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQkSSfeELcCg3oaC15IzD7nqU50aRHnj20R
 3Vt+fMHWlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cqyAD/96GLYr1WlD8IQwvSvdKxhhNMNdPLuDvV+muwAcy6JTo0yVwtFi29APezY85UQRA1fBdH8
 tBj9XT9r93hwmuW1csYQjI0Y+hbNfmuqJcmQBr6Dzc+ADZk0/dhgqr5t3VHtV/Ur5QvhQGvn+k0
 2lsUOiGUQvMHc8A04WFfw6ek64gegW0vBC+68qMehtMzvgGAwtsk3D9VnjQ0GjZmqeVb/r9sGrz
 Eu41NcHjU6rXmgqDfSm2H1qMh+Ak5Dp49H9cDZbQ0wM2ODNFF3rLCiuZSdMco7jGPXJhK+BIvQ4
 hi7fC69+1/XtsXP59x7xhKZjX5bYObsb9oC6CwW5BaOxMmXKR7Pt47oshFdfYmzRxaJDNYTPcdu
 gSxBr29xktm4DI9JI+25hY4hJQpSsrQOKCBxGiU+55W8miBMG8h9pe71LysUt8Fr8AR8LbZG5sa
 Iqj+eIMUujT95lGnffsd7RwYWfvennBwTykRmBumWcA1HNt7m/gzgU8Ktm6ZF8fkNzEtgu5yWrk
 ijJFq/SPI2UnsQcs5HEbTJe7Ujvsck3MfkGILvNmjHgK9NVsdY+Kla3dGFC0oqKxRSxxlo19Vvq
 mg3UGgaOALMKfIcTu1FOeAv+aBJudryS+uU0V2ore5yflhFusBi8OdDuO+BF/7pbSoZ7qOIkPV3
 QRPFnoLRMWGdKnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133335_771603_1C3E9EA7 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/gpio/gpio-octeon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afb0e8a791e5a8f1b3029c4ca890a5eb9b8efe44..24966161742a96082baeb850f124c71b894e9057 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -47,12 +47,15 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int octeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
 	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
 	cvmx_write_csr(reg, mask);
+
+	return 0;
 }
 
 static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
@@ -105,7 +108,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = octeon_gpio_dir_in;
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
-	chip->set = octeon_gpio_set;
+	chip->set_rv = octeon_gpio_set;
 	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
 		return err;

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
