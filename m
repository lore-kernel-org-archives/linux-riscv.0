Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13E8C7EE37
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4XxxLord83Gzlou6FeZSbrT96sW86FPUAHaoRPWxMw=; b=FEY93+upS1Y12E
	A6F9A9G85v7S0FznH26dI839FTXQPLu5MtP/nSnt6yXnNA8L5aFZJRrTSp0amzpLR+nMU9C26wD7V
	eL4uNsszzdlqXJoJslTcc1YPklhwvZqPW/bXU3AENZ7hgr4sIxqAwRnBXIqkER2ND7SZa5JiM/Q4v
	YWk6cYYq78WFf4gZmD3ZAhKKO/Fa+wR913cyHxPNmVTNaxJhcAwxyW0X0+RxSbRZKhGHWTWq1wWVg
	vZFS7wmFs8F1xMke0Ldl1oPCK2qL9NMOafXPYSCHQzIkUst9x2K7PIl6L5lp2xkt7b3mUFVsGMQSO
	NKKHV76QAT8VOXX0jYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zPw-00GL0c-2B;
	Sat, 10 Jun 2023 14:18:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zPt-00GKyS-0d;
	Sat, 10 Jun 2023 14:18:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so20630555e9.1;
        Sat, 10 Jun 2023 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406685; x=1688998685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=kNwy6UQTNhOxiYaxn0QFVJliYWZalve47Symz95XFyBIaz9YlzqeRGPP2Gk2ZX/S4e
         2XSb++WWR7c6+CEHm+6NxWdHPWmwQ9OWaK3Y2fLZGFPRq/7e3e6xfyCF441UX5d/TCVH
         o+BBxEhrQ1ulFxmPKAyrmVHElgN3SI2DEYycJBbPnELadGQ/D/R9q1Hdkp+2dqc5f2I4
         lHd9xVRtvrPfhvt/7sttgKpsBU70eHal+9s5GpesiZjzMlJEVC2bMT1J6VhxUXdssXd9
         f5Rt3kCxdZ8iyt7NJ68SUW+B74PFwiw2116CwZZ5L5szsaeJwXMbJ1gXynQhn3j31f6B
         lMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406685; x=1688998685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=M3/q6BVZGtRrYoOaYTc3m+6Z04/0+OB7EfTIXYUhV3TFZidjkAuaI7g2NisSGFsCPA
         K8WdOfDKZzIlfaL/CTBYXeLnAESUvYkWTKmUV7O9Ib4PhHNGVp6ymAD9IDh5nyDLXQxf
         iwZqJ9Ejbcoiv/kkKzvzYMs/2UyTRpw2N9o0KmXOvmbyl0Fcmc2Szx6Pr+yIAfAtj+4b
         AcFj7H5vcVsaYW5sTr4ahZ70v8b48Mf7EgEnGn0a63kottruqTwMVggugyT3ObdTD7hQ
         w7epS57yUIFqcbZUQof4Pe56MgeCiDY8BmIQ4zX4nAsfYjL4ixr3ZUQXQfbaXoIRpaGQ
         srsg==
X-Gm-Message-State: AC+VfDwDf1ud+gmgyXABB5mdTyInm0dRHqUAUNveNy8sJf+5XKCarrKe
	wMced+EfKLaXzd//YaQ/2/g=
X-Google-Smtp-Source: ACHHUZ4t6WdLMB1a1Zu/zRrvwabow/BVaPFCOtPx57pKegTzzSQLjim87rOjjJ0/4WboYFgCeASoBQ==
X-Received: by 2002:a7b:c454:0:b0:3f7:e6d7:f711 with SMTP id l20-20020a7bc454000000b003f7e6d7f711mr2743988wmi.7.1686406685338;
        Sat, 10 Jun 2023 07:18:05 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:18:05 -0700 (PDT)
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
Subject: [PATCH v1 1/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Sat, 10 Jun 2023 17:17:32 +0300
Message-Id: <20230610141739.999268-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_071809_240285_3C138F8C 
X-CRM114-Status: GOOD (  13.24  )
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
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
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
