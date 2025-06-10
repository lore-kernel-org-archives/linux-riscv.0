Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4F1C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pPdycEwn3+s8qoq8jGhHmzhx1sQLt4SdBSUn+2pKrUA=; b=2O6J5NfZ/UzxQV
	40TicRzag+asxQoO6LDReXUy5Jq2qPpDl08Jf2gOXQ6oKVs2NBcoz0eGmVYRcoINuDd8Xkklz3iSr
	w5CA+ioDA7L2RWtmwZnNimGi1Z7f04/knzdUcaIVfRXF/+940M0N2rTFahNPg7KGU07R9+goRJdNM
	HkJMy1Q4/1msdNWl1jX3XSDp/PxQujAYZdx/BXxksQmqFA+AVIkwMED4lnyiqF0xnA7MeVoAwOXIj
	ZdXh1MIJIUlC31SC5hOC3Gp67IYccCKa3G8kCBW0BdESflcojJhUoKT9rYPb1MyJbe2W9+p7oNedR
	CTW3FeNW3Xl0Kju/YpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz53-00000006ykU-3vzd;
	Tue, 10 Jun 2025 13:31:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAT-00000006mKv-0ltM
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=; b=G2tyQ6JbTFTlyiYZUPVfF01rTA
	3KG5f0XHLRRGfXFBTMnA3p3dD4bgeInJ2hpTxPlrzx8a2g5NB+lzIrHfOgHb5TSQwOaYwzMdXYI9Y
	XUePAX8ewUKRIMNTPU+9L//ObpGxBlEGfRy16QihVIezCU3HBBMxd2P8BO42Z+F4U8/a8FYa70kFt
	S3Rjrt6axwWTFT7+YDubtUTlgGqvBm3OHEfzBAGfn9YLvE6qjn0tzh+5IRoVucVndA4LqLQFKukyC
	tYJWdbZsyDNWmrWxjfX+C999gPhWQdSE9rFb6d7V73QgtSI9JPv/YZLuG44nrrump29I2xy2baDBG
	7D5xc1JA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAQ-00000001oTW-1K5u
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so44578835e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558802; x=1750163602; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=Dw84WdrFST4PSUi9SC/voryiXKBdVdQMaz4V/o+EbKs+toQ/hxuFZdg+lpbRztoGdf
         WUw9G9cg+causVGIiQcuSY29iUaNTOf1JsDToTifxCUgnADrxMB6v9c8DW2lqnDQpuyp
         6JoecxTpPZsOJ0G7/94IB0YGZ1jMR5Icfc+PG8hzeWpBhDyDiL/5fnB4W9kizIuEMUCi
         dL2bMQgoJIV7INIUN58CG3YELgbgLKjBS10lZMQqQyGMUmwBHYfHWppY592U+kyqR+yj
         YTHJDAwYUm5nb3sLRTDql05D7FNrTvI335/LOj3/NZNA/g+QYYy4eUWVMwHn3IvTFZqo
         yvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558802; x=1750163602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=vUffrcahRk4e3JxDKZGyPN48N/tAp0gfjaU0Nw9eThlrJ3pzawZVqvlJwnYSBUkuNL
         JNlgbHoIPH63NvraPcUf3ztEsC1MsUHUMMzt1wmHjFNWLOQKr5mEYdy2o6h9H9aOejyX
         Y831BL1z/8RF5JnV3QERkK8vqply5LNV2Q6/bmrHn5gYM5vdCjJqYKSZ/JssFxLoMQou
         lzeISRMce0Drz45H1rkF96EQvRFq4PBn+cz8Pce3lMi06XfGO4ctT/Db/Dn8Y2wKBBQd
         3sgcSBH5bIIVbaCbqR4Be/VCB50TiNByNbnSXlBaz6G1WS348dIRDHqAGeX34LEVbYmo
         bd2g==
X-Forwarded-Encrypted: i=1; AJvYcCU2XRYhjFqnzFzm+XoiOmW2R1cOMxCZPClGb1Xg/UfjCs/PkbyFTmmhkmMiP2C3gimVqNL+MZFoJ0OiQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3P2IMvrQXYekbIKVomwwOeJKtMfteD7BC68Al5K2m/fcMr3Bc
	sNtyAB6WguV+fRGT0Nc5vZ51T5Orus85IgqEOoS+e3vOqvzAJ7fkS3pY9LPvzb03eu8=
X-Gm-Gg: ASbGncsq8nkzCDrKpG7C+HE5TPmae5Fk7X1986YK3UJWerE0Ebu0JJNuUOMlgOOcnB0
	rt1nb0inxUAZedHlbXYus4jm/hB6Ub6yOSCu35pYwyKmXfaWLP/ov5yFvQn1WAM8E1xBQgasFHJ
	e79r9cZcwoJNNwMU66XIVpy9TEeu67umH16N72r8hFT9Am1pp5O3/z68sd0t8HA/9js4nCnoXWG
	SdboruFbdUm3YcfAYq3GvKNf2MLqecCOOPnR+FkPeiZCs7LvlQ7mj6Zb7Elrfx5xfPNanK46YJP
	i3tgnKjJ2OQHtyyh8ei9TQjfiN9c0jUKNXKImlYqFFiDuOY7vg1B2g==
X-Google-Smtp-Source: AGHT+IFlnKIx2sPK6MrXH51mtosjIEJBmZxPRvw+nyl9XpBpBAq4wOuT9n5DEtW3OFTtEqksbAo5Kw==
X-Received: by 2002:a05:600c:1909:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45201437502mr155154265e9.18.1749558802123;
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert another round of GPIO drivers to using
 new line value setters
Date: Tue, 10 Jun 2025 14:33:10 +0200
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAYmSGgC/x3MQQqAIBBA0avErBvQAYm6SrSQnHQ2KhoShHdPW
 r7F/y9ULsIVtumFwk2qpDig5wnOYKNnFDcMpMgoQwv6LOkMkrHyjaX9RqMWbclZp2mFkebClzz
 /dj96/wDxMn9UZgAAAA==
X-Change-ID: 20250527-gpiochip-set-rv-gpio-5071a2dad129
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYLDKKT/3+Muqt6vpoLhH2yAyeaiX8AvzjKc
 lz6bLAcJ8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmCwAKCRARpy6gFHHX
 clG5EADX3eLse0M6879cp/rXFPzvNb0m0LUCg25b/7UyMAlntaEe6vfqpVdDnOymoShonFCkXzv
 UAW5igUaY4Qv+2V2lp3v0/nKaaYeJrOCDfUqrVQOxgrjQbfGFE5/gVuucblr0r0CSv06TL7XYn3
 95jvOjxXJS1R46cvDsFOvc8iY/Ysk5EE2kaHqYX1Zez3Fxe0j+P+AhjsjUgxExgTaYkgj9X9zLp
 Iu+nAJxFgnOojFHrmzm9mK4lntAhEgFQO/F1JWyaM3iBwo9mt6sM1y9VSJTI7BPRFEKas0gge/c
 +WO+kKXAYEQ6wmlUILezREVVJGDIx+bRxn5AIWBFuOd/Z3PfayT5w1/Y9xACMAhzLxl9yx5XesP
 nrKUhNloMEin8f0em+DkP0y8cvuSlidQRetWsqPNH0toyKsndjNNLfj2la3e3jr7a+jT80cJPNI
 1Avz+GrNf2pfgD4bWKTCV/os10gXRX886aWYB597vDmJtcg02a1ir2uHO7jVDLBeCnTA70tWjZI
 N5X9rUNrlBfLU0A2y3Fuu4E2H5BoAFR97vPSCLg63FIrfsm7vPc6BLdNICULsKJ1K+aw/vp9fWi
 KLUZjmJAwGPKjiCr8Wsw4Awh8QL0olPep0PXVM0IxA58xDrvoZkvlp/2/NT0SUetVd8mNoJ6G8j
 rmFYfB/NS4+mWZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133326_541630_421A3CA5 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks

 drivers/gpio/gpio-mm-lantiq.c  | 12 +++++-----
 drivers/gpio/gpio-mmio.c       | 53 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-moxtet.c     | 16 ++++++-------
 drivers/gpio/gpio-mpc5200.c    | 12 ++++++----
 drivers/gpio/gpio-mpfs.c       | 11 +++++----
 drivers/gpio/gpio-mpsse.c      | 22 ++++++++----------
 drivers/gpio/gpio-msc313.c     |  6 +++--
 drivers/gpio/gpio-nomadik.c    |  8 ++++---
 drivers/gpio/gpio-npcm-sgpio.c |  6 +++--
 drivers/gpio/gpio-octeon.c     |  7 ++++--
 drivers/gpio/gpio-omap.c       | 14 +++++++----
 drivers/gpio/gpio-palmas.c     | 15 ++++++------
 12 files changed, 105 insertions(+), 77 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-gpio-5071a2dad129

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
