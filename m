Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E39EC71132
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsR8scmffRyPw3AN8L51DWwkU1FvXvnNTdSqnlW6w0M=; b=jYqYMuk+aZWm7W
	V8TRZJGMOTpaG7Xj0XW2QlLbHk3jWZZDTgSiUJiKr/smrVepNpEAD3xYeCRvPJqLQqPbqyN23OVME
	57er73aSKfj4rQRneSAmnMdVgJDvDW/S+Y8NjsMI5zL2jZtk4MTF2wN4j6w5g9Ka4q1B/ZfeeNhNM
	jy/cCiugRoAOeM0EJNvv7ZNNwW4VuhE2MocEysA6lgjeJl9AI9DaBlnHSFSgxbCi1YaWiXD46Udl+
	gh70QYUo7JjF2CckQ3BgORHTIcibzFAlLgvMFbMLpWrAmcHVfCnz0et16uzhU6Yf+FtFzZxtylnCa
	gVMgogAhkDSc0VN7coqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pV-00000007ILs-3F7P;
	Tue, 10 Jun 2025 15:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAe-00000006mPn-1yoH
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=; b=KJeWOO0aYe6Iff+AUI9AdQoZFl
	mfCVoxzaScFiRswoGgOJp0IPgN5pFC700MXAz+QRUIVebaCpqqc7AvH6/eCv5bZwdVWYQCsnS9Wyo
	1guKvcqurSkS2GZ+5ZS5CKFMFmEf7Ub9zl7rXQv8gOn+T3jFo92UPTaHaJcd4wnzLgIQ3J0Ywoh/4
	FMBhl/U5Q4RWFkLLUTMKU2ytgmVaXyZVDUXa50+lqr1u/jVTroKs5V77fziDB6soiDuZ+OptLDIwv
	kusG1HqTU8OEUS71ICSoC9OLwQ7mfB69n03IqlQYnDffpTzQlaJ2mqOVSU+FVz/eJs9GvBERvB7Ro
	9Cko/umw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAc-00000001ocT-22ZC
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42020685e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558816; x=1750163616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=NUq9MmL+yN74HKVbR5TsWhKg5kzRhY/rHNutY/Pnacrag+EfDb5T1cZmvp1CtFsQIJ
         6FR7SGX/Gh/LmWtlDwjZOzb9IbOKtNTTNfftpSyUBeDdpmgZ3w8K648A+FbUcXo6odej
         k6+qatZfF7t/G/cBZiJOy0tK9v/a97+M+RwSLQ922kUMK3Yk7g8eAhSKeJgd9V08jy/k
         k77SAtCKWD/GJcxQ2M4Z28DUwmHzVRCLsi6WinW+bnSTl9Q6Ixj8RKfAtD4tP1w3HGZd
         JixIydkYl+ZNEIOI5217QXAAaQIpnTMBJFbdrV3nQdjU0jdSAbmvvoXuj3yjJNiaSkoM
         5ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558816; x=1750163616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=Aao895yIjZ8b8ax3k0SGhLKfzgQCEakMts2dNeLgx3hohysVaSXr2OnEwFOevtDEHL
         FVfzhNRWgE5HwAQZ4WxCJ7zxCg2A9EgCRwsvjvULlACHW2SN3YBygA0mT7HM29/fmx7R
         nSQ1t0Vlq2/pBio8oQJ/7aEGVGX24Xg+XFTyvu8y7NCTEUDHyOZi5NNsoXU/HyuME5yt
         iKM9xcJmZf667UmtHbYUWMVQ7swjIbUU0IBJx37lPM9Lp4moVkRSEiBy9Mxy27lmrHq2
         N97u0TWs46SZnZ4zAcVxoLmCsako36mRWyDBPqoEcc10ZqzCwrYoGZhhSWLxwiGWZQNP
         Xx3g==
X-Forwarded-Encrypted: i=1; AJvYcCUiWQyf69iFGPPA1r35VVUljIVjO7qKX0NLmyDlgHojAgd7pwRqBCfbtsRpAFhwlBDupuObYIhX0eeqaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvqMKxxrc5ubqFHt4vXpF4ggzTJVK6mS9JD9dJPgt55hDt6off
	/nnylUkZ1NXvOOEHXR62hECBAmw44Y3nBIug9pz+1XQfnS0nGvvzTD5Gd0HLY5yYqbQ=
X-Gm-Gg: ASbGncv44RtQqyLzp2H5uZ8w29LUQVH3uXfjDiRVT0gsIFJy3qUOH9ONlr2m4tbaLGj
	RYS7X1z8ZstwTDevA6y0/Twl1rOuCNXRmhBLHBP847MEQ3r2mzKiqLztZqN7CXTleyYBws+dGOf
	IC1pqNQW1RzwWmlEo0i+LWPen9Wjc/rtUeVFikbt5GKXDHS0+fDtKj97GTXn+BaGsnX/HHv03GO
	noZvp82d01f7vFyv+4YCfsMf0wMQljiQXXJzr9OF/HIacfX+fkxDFcfkLl2WeTKdtXoNEMRD3nK
	RlpeT+Us7pwqt7weeJcBLC69/KBMmxQxk5UPC2nSc78ZbF9h0NRcNw==
X-Google-Smtp-Source: AGHT+IGEb945pctd/19j/70DlEklbdpCSjS0SXNKlhgiB1IZnKkMVBIGu/KwhCfcg7w0J6nsDegN4g==
X-Received: by 2002:a05:600c:354a:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-4531ceb5f3bmr32427015e9.1.1749558815837;
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:22 +0200
Subject: [PATCH 12/12] gpio: palmas: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-12-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EJnUqbYdFsX+B+uS77CC3tICbyCNOST1Ifh9i66zy3o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQH0s51YOk3kPi1uWti8T4ohdUn/yx53NBp
 EPSYm2TbnuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cl6HEADDb/gC8UYIxfieGcIPlCLMVRxpN6B1QvZbRdjguBGn2V1R4KRaQVA4VHY6bdnfwHfmTEs
 PyBGCdOw5W7KfEBvAHi1BPRg3jZ3AhPL1MBtsbCUu3wkmJaME0MAZRi/9kTVnBd/90m4ady4fob
 ZiVpTNRYaxU5/agaxspedLUZ8yS4ru+4nvF6UhNZ6xCbzJJ098pcxmRPwL4nP3Kk1aFacQAXgoI
 RlFmAUUCPGcr+/1hQ44LYPBhD9CFSxqmk0/peAbcioUE+37xiupVSMPVtmphojgLgRG39WdsAW6
 wHLIbw8YDioA5qjexp3hLxB9k//QX08V8iDF9H4FALJgdECvDhjcNfqx8yoMW+M1koIJkBDfnZX
 ng84ih0EIA0Wh6fqeKTsbJ4JOE6/eR2EdcuY3FxX2k4O2JDELoEnc/UERh5Y4DHuNtG520m7uyt
 D2MG4nZJAZjiBZ4wZ1bDW0t09L+XCI8V/1vpwCxDVmhkEeUduyWT9w1zTgWQ7at0NdbYAgZ+nG/
 jmrJ7UptwMJ4P1yZmWdfEYXlSODp6TjS+tPzWIXQcLoS3eRRpTav7CIm+nr6xe3tNiOPBqNb1H1
 ZqpzpL7iVd8AuUaR4K75BWnU1tcbiTDFsuLnE8/CZ51sfmEAj0VyEK/pDJgoZj7ekTL7Yr/ve8p
 M8J1VvOFz+l99wA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133338_776444_B2FAE852 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/gpio/gpio-palmas.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..a076daee00658a9e423a0d78f14ad48d61956d7a 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -54,12 +54,11 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
-			int value)
+static int palmas_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
-	int ret;
 	unsigned int reg;
 	int gpio16 = (offset/8);
 
@@ -71,9 +70,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 		reg = (value) ?
 			PALMAS_GPIO_SET_DATA_OUT : PALMAS_GPIO_CLEAR_DATA_OUT;
 
-	ret = palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
-	if (ret < 0)
-		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
+	return palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
 }
 
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -89,7 +86,9 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
 
 	/* Set the initial value */
-	palmas_gpio_set(gc, offset, value);
+	ret = palmas_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	ret = palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg,
 				BIT(offset), BIT(offset));
@@ -166,7 +165,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
-	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
+	palmas_gpio->gpio_chip.set_rv	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;
 	palmas_gpio->gpio_chip.parent = &pdev->dev;
 

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
