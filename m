Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6ACCA481
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DXQnxGdy+lzGIo052S4JS+gA9g8SNVfSmmguP0u81Q=; b=ohm92i8SjBfe3n
	AzHVCF/QMajITgK7qtZwTGXYuVP8TKCjYybNYA+jHP8sLIQkxDaBrZ6pUGT00YX1Eye8uOpe/R4C1
	bKea45T9a0OaMvOwQk38MSQ1b0XFJM1Mue9ZgCAajrnKn4HGZAn5u2WRkQk1hr90dnbyo+crY3A/v
	kD+O+qQL6HkNAy9sMKghdcD/EOt5r6VnPZzQL2u7mckEhSetuo/gQ/9Mzqq3szQ0QLWRG7mMW37cz
	zANRF3X36Fda4osa4Y+YEQB+aVIYRTNFwwx+x19+IE9j/QWFta0f28iCqU/zHWmoiJTmMdKrwiHH4
	sJ4h4Lh/T3vVWapnEj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8poW-002qN5-Mp; Tue, 05 Jul 2022 21:10:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pg6-002nIF-VD
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:01:52 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 562E542450
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 21:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657054909;
	bh=EI3mxEAHkgT2vU1OOl7PeFFTw9+zwdjdFkAEZQkp71M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=dSz4cd2tFkr3LwJF6mzXRHMLCRYAZXql/m3onj8t7TN3GrGE5OuUS6+cPlIFdxDLl
	 M1BRPDO6Gy1XraS1SZVqALPlvn0JiqZR9+VXVHc9gUUn5RLj1MzrSntfH4bfVaaOUT
	 OOl7QQlnyQ7e+6fHnuvFhaboVEkj6PknWtIyKdakxXaCCOV/valcW5Vr8YZ77zsSWq
	 6iKqBFW4pIX4ws0lD+5m+Ei4l/+QQMnu3CvqYh7ZFBkAyIDjRhH5nLxERoF23Y8kC6
	 o5lvo2WJcZqwPqTP40cyYjhQp7F8BrbGAInvkFpA0cPYlBVlbc06tkq6ZcWNFlaBz9
	 LLjs9ksAQWTCA==
Received: by mail-wm1-f69.google.com with SMTP id bg6-20020a05600c3c8600b003a03d5d19e4so7300164wmb.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EI3mxEAHkgT2vU1OOl7PeFFTw9+zwdjdFkAEZQkp71M=;
        b=I+osFzy5O8llVCt20G//+gmzxZ2KhK9Z8kvQD/o5INpALDf9+vM69kiQeKg3n8QHUm
         cs9QHavMeeEVyfc/krMgWsgDWbeXzKhPf/dw++QZfZHfpbzo+1dCSwyNRuvWeC/lgbIU
         GQC4C3e/WCouOc6nQj/gjxfSY5drb3Ry34keKyzQySFGrPvzDcNIHZ/P0TOEweTdlir5
         wzwghPjQhztiZE4ObzWAC4BZm8Mc5zIBSSkCbKhgaAaS4ZIkNecxJBLfsxVCuRgZTW9u
         WuzzGFIM4Bf+dsFZHjClQM3W6KijwiFeFMod2tRZ0eBNV34jMmiUKo5fAjeOeIiuA8Jj
         5e3g==
X-Gm-Message-State: AJIora9/JROipk9WnbAOyWQrLYIijeonJ/2QHfvKfa81y3QsFGLe6TgN
	OgVd9VJE+RpDG8Tq0vl+JlFHtOEgOJu4O4OvbB//6f4Oq0EuvGxGrZ6xHgtkKz9cxyqz4MnwEI5
	OnEXos1t9jauxgHSyZIlKzIAd5I9NvDsfgAJEXwMiP+zJxw==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id v5-20020a056000144500b0021ba91907d3mr33143879wrx.545.1657054909197;
        Tue, 05 Jul 2022 14:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpGtr585A4zBiBrqeprE38gSsAvDrw/l/xt/heeVYnerThl9ghX7+cZz4Gy93kTP7evrM9SQ==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id v5-20020a056000144500b0021ba91907d3mr33143858wrx.545.1657054908987;
        Tue, 05 Jul 2022 14:01:48 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:48 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/4] leds: pwm-multicolor: Support active-low LEDs
Date: Tue,  5 Jul 2022 23:01:42 +0200
Message-Id: <20220705210143.315151-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_140151_200210_39C48EED 
X-CRM114-Status: GOOD (  12.66  )
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

Add support for LEDs wired up to light when the PWM output is low, just
like the regular PWM LEDs.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index eb67b89d28e9..da9d2218ae18 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -19,6 +19,7 @@
 struct pwm_led {
 	struct pwm_device *pwm;
 	struct pwm_state state;
+	bool active_low;
 };
 
 struct pwm_mc_led {
@@ -45,6 +46,9 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
 		duty *= mc_cdev->subled_info[i].brightness;
 		do_div(duty, cdev->max_brightness);
 
+		if (priv->leds[i].active_low)
+			duty = priv->leds[i].state.period - duty;
+
 		priv->leds[i].state.duty_cycle = duty;
 		priv->leds[i].state.enabled = duty > 0;
 		ret = pwm_apply_state(priv->leds[i].pwm,
@@ -76,6 +80,7 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 			goto release_fwnode;
 		}
 		pwm_init_state(pwmled->pwm, &pwmled->state);
+		pwmled->active_low = fwnode_property_read_bool(fwnode, "active-low");
 
 		ret = fwnode_property_read_u32(fwnode, "color", &color);
 		if (ret) {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
