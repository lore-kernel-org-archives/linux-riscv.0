Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0664C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FHfTfTNZ83IO90GdHXQMxFB2jOMigmjMLjlRwEyzdU=; b=2K5nfH9QQNhula
	uQB3ixDlC/cldGWzDug+kdi67sh6vzTCtIXkGQinE7rj0rfAO4RuvD1bxj1njr2Gu6+bYEBV9PTsQ
	RUESWV5mu3WjYYbjbd8OIBatdj2W9hOfmNGEi/VtU4WVlw8jj/0GcWE0emkyUvCg+wVJlKYsnAPy1
	9ZNMPBK7wmWYoDFYPz2Jxq7D535/vIfTXPZPkDZ75ACv8U44QGizIomWmCeg0Wu/TY/RvxVWpf8tp
	1FhQ6bpyiofEnZtUFtcpqKqBH4KyNIMFok1ukR/dkXPnWre7rSCv/Kwub8TmomMR8a4V9vC9upDfx
	Ob70ruUsithm2QkzUkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyOB-008TS9-09;
	Sun, 17 Dec 2023 21:09:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyO2-008TMm-1U;
	Sun, 17 Dec 2023 21:09:23 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so2049395a12.2;
        Sun, 17 Dec 2023 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847361; x=1703452161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAUbIAntM3d+P1r7PxLEQx0z9V8P0MjzX6e4WUbLKOw=;
        b=cNOyRq9B5BJZvepvnP+MHPfaiAEA+4Imx1W0E+Obw8URZwaQIsIiCGHvHaETo90bSG
         aVM/pVwX26lTR+I2Wv7kL09f9br+AYL1w5VbjFLucQptBgoHvirO/G2biGHsc++nRcgN
         gEHkBEDxMBvHP5AIfjGXAM4+OaaeeJv82NdaXoMwaHxlGmiuKv3SSYIfmpgkYuEl9726
         ibeBv6rFZX+Eq/sekyY+b6GnP+rrSoym3q5X/AJgp7BWndLqYc+ksicb+E9jXeOTY3nj
         hur1nCGDvAZJFUI7r6HNSaWTApz4m5JivukbZlA4twGa2/tZYZH50h0efV8Fs/G6DX8u
         q9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847361; x=1703452161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAUbIAntM3d+P1r7PxLEQx0z9V8P0MjzX6e4WUbLKOw=;
        b=AaTN6j6crGTzlh7FkLy2t9zX20sYFpSsXppxT7bViPqC4cQJJT5RqA9NEFPE2rRUxS
         xouLdK2hkX+W4vhihCb5jlmYxxE5mlHByZ2G9qC8UOfHAbBAcF1tKn93Ateygwsnqvsh
         GEPTZoQvJ34bhgj6+8d0hPql6UDpKunRIgzgW8AoX/0lLFqxeWks0Tuv5eyvmYl/+ycv
         qqdbzW6fuJGSVRd+jWscklxAGOnS/AlgUsf1sQSyF+HH1+icaZVXLR8JRly0oKxKoLMy
         /WRLXLXbbAGCok1jAFGY+s8Md41tJ1QuOBvXjIRsTD2AaYl2QOPReGsoi9iXyALEI9Ot
         4UqQ==
X-Gm-Message-State: AOJu0YyiSm8pvEzYqVfqPYOFLJDtbn5eLkuleKYSchUs/sYfMZDsGO6a
	7PBNJJk84eXcSWbgKGK3ojI=
X-Google-Smtp-Source: AGHT+IGXBluqcGQB7k35DpbnUHnaijO7J6FnYJlOKlthAcSTpRKN4IAiy50prOqyAzcchEuhhGrjqg==
X-Received: by 2002:a17:907:a0d:b0:a23:3212:9c37 with SMTP id bb13-20020a1709070a0d00b00a2332129c37mr1452093ejc.50.1702847360868;
        Sun, 17 Dec 2023 13:09:20 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:20 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH v6 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Mon, 18 Dec 2023 00:06:23 +0300
Message-Id: <20231217210629.131486-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130922_599774_3455B77B 
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maxim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
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
index f989b55a8aa8..6a8e386dbc8d 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -606,6 +606,18 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
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
@@ -614,6 +626,7 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
 	{ .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
+	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
