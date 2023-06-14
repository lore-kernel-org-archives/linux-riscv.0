Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DAFEB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyDx4w/FSwHB0FkyC2al0htQLdzqRmeXnCmAClJ6AUo=; b=eDQHhMmAR0QJw5
	mrKdouyhH0n+rRHmAxzUxoOKJFZFhfQBv0p7mEYcVwxmbUXjrDMYMAdsz3tst6NShv5+lMByDqA44
	uV3gu9vSFjtWP/cj1gvwuEyet/R67sH84qwh4bn+lLI2WVNozgIRr/6XhwzXASF8j/YYuI51/fjv0
	3ROtN88U0QW3sTnb8dl88o6dLhmO88EDj0XmxMzPJ9F0xHBR5KWfa25P4mNvIxfLyetrfHaUp9O3x
	07zDRzicz0qzuKIek+GemW/16rLei4x1WxON2DTzeQdwtOhuw0hMS1fSUe5x/muHGASZybfX5/cB8
	giOwPu5AjhJRJKsdo5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2l-00BgC0-1i;
	Wed, 14 Jun 2023 12:56:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2h-00Bg9R-1a;
	Wed, 14 Jun 2023 12:56:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f8c74af64fso5738505e9.1;
        Wed, 14 Jun 2023 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747365; x=1689339365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YepcUjgWrlzucwsUXaypG8Xwm55IhlbZIwruLgPvyBE=;
        b=F51kGwChgtMam7+0FLFHEzdk+DFy/9+MlYjnFjYPdWQhHG8jv6vSd9cO+88v3BfRPw
         BHCQwfdLUYSjub3dCSa71rl6vUYkohnDsgpoc+98YpmON1uNihUkFG4vJZiPy5O13zuf
         kcRvqBmcbmtEVGwbSB2CdZjd4wqqDaIdfko2K2kHmFqnMsgUVNKNisAjxRGA5sMKnlnc
         HlFGkTFVm6M6LrrHzI7yzcQzMSwaS/S4lfp1JpYzCyn2viM0dMNikN1d5nGe5Hryy9/h
         zhKFnH/NJT/IKKGoXIrNS0rPjg8IJKIPLZf86Kj4YJ4/rjAwVIAn4ivceBv7ICw83b43
         PFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747365; x=1689339365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YepcUjgWrlzucwsUXaypG8Xwm55IhlbZIwruLgPvyBE=;
        b=TtQR94lUfP2Ven8aoHhej+M9b+Up/3egso/UKZhf81XQWmMaHrDtV2zcumtKt71NzI
         qpfWah5qZJ6My7Bf9TPaG0cv3T4yFuGv7IB0ns+QlOKwq6NhiGYuHbZzItwT4YsdptvG
         G3q/4A/e5Kz97g/sMAY8BzaKt+b2ZSp/iVNehcOvOVGS5Y7/H5s6K73GJ3hdeg45F2ae
         jQGPYdT/Cnl2rBb8ESnbv74TBk2s2xuCreFwlQGIk0hmB2gYH1WMPdCacpnPDRry3WDE
         wR4EG/+vFSIUdSofeYI9Btxx+Und2O9JlxagEOFo2h6M6+MDFGDYfhKkheZwO0XF6bK/
         7RBQ==
X-Gm-Message-State: AC+VfDxq9v6a/1ONdcK6sfKEW6QMyBU3nAtkgdMgjEre/pFsw2RmUjBF
	laMpPkthS6ASsy6NesmLQF0=
X-Google-Smtp-Source: ACHHUZ4jL/18v+yeoDRa6uKUlkZ94eQoDQIc/G0RPv2dXEDM634qS0fXpWbBMwLe/D9AttbkyWXPcw==
X-Received: by 2002:a1c:6a18:0:b0:3f7:19f9:4c4f with SMTP id f24-20020a1c6a18000000b003f719f94c4fmr10721940wmc.21.1686747364978;
        Wed, 14 Jun 2023 05:56:04 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:56:04 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Wed, 14 Jun 2023 15:55:20 +0300
Message-Id: <20230614125530.660597-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_055607_528441_2AAF3742 
X-CRM114-Status: GOOD (  12.68  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller support for the D1/T113s,
which is similar to the one on H6, but with only one sensor and
different scale and offset values.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 793ddce72132..01cc4e130892 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -628,6 +628,18 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+static const struct ths_thermal_chip sun20i_d1_ths = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.offset = 188552,
+	.scale = 673,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun50i_h6_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun8i_ths_calc_temp,
+};
+
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
@@ -636,6 +648,7 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
 	{ .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
+	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
