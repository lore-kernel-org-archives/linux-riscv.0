Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2CCC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4XxxLord83Gzlou6FeZSbrT96sW86FPUAHaoRPWxMw=; b=GRkm0EdE6FgYl3
	daSYA8jh2lXRe39c223B0GvqTSnyeH5mua5Siv5UjfW/Hyv854ngc4oET/xPMwAmdYFNeLyTs/HPq
	TQLbYpwYUu6pZmvxbDzNFQPWNZyeNaRx1rL0iOJyDJO1Ht+MIdVgQvf2K5zm12tPCkoGhmogWfMEt
	aIop0+2egmU00I3xIGN+5x+1vYlMwmCQ8kBIAeTDrp3yOLpyD/txWU00UV7jc2OKStESYFIhbp3qG
	11zUoRvOq2ylNfsQ9OzpQMPxHChTV+03t5y8UNoH/4E/IbDKHMqFJ10BUd0ZvnuvyC6wXIWYlXDrw
	Mwj0NYziBS+qN5yTcjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85K0-00H0tN-1L;
	Sat, 10 Jun 2023 20:36:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Jw-00H0rT-2l;
	Sat, 10 Jun 2023 20:36:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso21260925e9.1;
        Sat, 10 Jun 2023 13:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429383; x=1689021383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=hCzJ8w/C8XAiKMLk1PQVqDGJUYz+ewadst0OkQUn4d5nizx00kUrz+JvsV5fjHJOs1
         xYN7oz/akg9Y/NBAodNbp7uwpGj7HcK++NNAtUFmiRQTPl7g8/4jYmmg/y0cuvOudf1z
         EY6uBG3TAPq0mFe3X/T8YGU230zN5YUKmwSoODaUofWBqgMEf5ZHqRO2vFsZ9giLPHD+
         xbaWYFLF4lEIo51q7jS30UB3k5tgtJSEalnDNpZNciBuNxSt6AJUubqrD1V9pbvpOdF5
         zOkfgWYCkLE4YeuVNtGKw1XL7w6HUJravJGULA496KvFehy6T0ENZSaQVGYE0sXfj8zw
         R0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429383; x=1689021383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9cOOb3r9v8BRSMkdUQlBjQ12Gi0JnIYbGoQ0F774a0=;
        b=WoJ/3bcAOgjeAPASw8nTiYvYwMyvsKTaU1MyORMdeMr3zs6uJnCB/fUiCTSMgResNH
         vwUwNbfBK57NlD/FKm1/6t7/hnArzvSnoVIxhDyKaH5S9n0aX92NwZO4fMZDAOz6KwC7
         xgG5fyE9DanCLZwJzT0sHSajKIzRLn3Ccg3tk8PrjUJfev52SWXTYWXgFsIlbOLPaui+
         RsnkLaeygwcYvcUawH0jj7U056kdUXna/XD4TT01jvACi30xkkif4XXR2A14KbunU+EC
         PSDrWKfNsJz3LKVDtGxOe+icS6/rkaER0x3KVbzULYO1i9XfVxzdAeaKESshQ23zVBzI
         r/Zg==
X-Gm-Message-State: AC+VfDwTaJLxZ7pKiu8qCIgj39FB22vfgU5rW+ZkEB3nZVm4WDFFbTnm
	HmBjti7XJ51hF2WWnoTAO78=
X-Google-Smtp-Source: ACHHUZ6znngh/wR+0bLuo2/c7FCAm/DUauulTjJoR3scCyrl5bnT5rG0oH5Yd0jsw/WxkHptEHGjQQ==
X-Received: by 2002:a7b:c7d8:0:b0:3f7:16ed:4cb2 with SMTP id z24-20020a7bc7d8000000b003f716ed4cb2mr3232250wmk.13.1686429382439;
        Sat, 10 Jun 2023 13:36:22 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:22 -0700 (PDT)
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
Subject: [PATCH v2 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Sat, 10 Jun 2023 23:35:43 +0300
Message-Id: <20230610203549.1127334-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_133624_894041_E75AE25C 
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
