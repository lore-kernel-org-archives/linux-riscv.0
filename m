Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67430EB64DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wnayIfGVn9F86TcDyynKLIdBqcWjfcLITBpfU0Af7M=; b=FyzBWNE0tztRNU
	Gy3MmlINNPmbCTdhJ5qzsP+jmMy9LZVZIoiHdhq7YXdum7B5lur4nE/T0pMDiUYB8QpW53eWzbNEo
	AJHgrZ9f2ylJhqzSPatd53o7ojt54mTEBiEY5Y8QBhs4wah8XDVCUEtAEOi7/7rIkhW9mqb3R4OQg
	RG+Z7PgCEknyxpLE4E444PBJ1qfgO4+PEe55Xf+rQT5xlTNCYZG9JpnB4lFphTA4xq0M+JMU+Oazt
	D8rdHHkzl4FetkYgVrucS5daaNW+Ib3Gi82I7K4zhUJK5Yg0K+05q74gnP26IvX//1LeWzng6Kjzj
	O1oy+ZK/T/Trla/5oKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH3a-008oYu-0Z;
	Mon, 19 Jun 2023 15:44:42 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH3X-008oXU-0G;
	Mon, 19 Jun 2023 15:44:40 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so4690227e87.0;
        Mon, 19 Jun 2023 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189477; x=1689781477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2xW1pdD4hh2VGs4Mpg9cKE/j/pXz/wg2o6KnZsreRQ=;
        b=SXi9EuYemDFlDxp0BqouWi1+qLw4f2dj8Wiuwrapoqielba8KLGExvIZVg831z4yh3
         n9YHgewmBi/vaHWDfDGSKEpC72HxQIzH8PcrDpN3EpQZvZMqRoHVJ7V8WC0h071yrRd/
         yjJ1KFmUABIwfoo0Cwrw7pSyffKMlHGB0qgS1k8qkXTXKQ+OBnZ0SQ8rnR2diuoSUD5B
         fWhRAyGZkSnFTAsdlUAwXFnx2UYjxddxGfSfNnLGrO2nqRd1bq9WNetJYb+RsWW85ED2
         zjFc46hV/eGrfqKuG/LfBj6tpbAUcdzezYY8RJOCeJSfHi2CKqHwiHBukPmYhJlnsQkq
         VzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189477; x=1689781477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2xW1pdD4hh2VGs4Mpg9cKE/j/pXz/wg2o6KnZsreRQ=;
        b=V6rhqC3Xj6cgO8vL6KuchG2FCvfZJcWdSJMEwIM5go+p8V5XxLwu1/BFuj+5LWHUN7
         /Xqp+zhxcYGheP797S/+G7YZUG2ZdCNVTshRFnBvGAbmyFtxusN+KUi/tdvyfA4v2Uvo
         91NWI5qPj2YGmZ32aMe4ziL5W9tziSmFajMBumi+qS2uq3wOQTJ45j/eYatsSNLIWP+C
         aONM+Ofainont15L9HwDC2nsmIzUiK/BlSGJRICgd6u+oTvn0RVOu/1htz1PBe61IEZE
         ZzJSEVN9jaTjY/ojWGcLXM8axeXTJivNxQSaLP6aswN6Wi8MRC4TnzchDMrlaIgbS6h0
         pZNg==
X-Gm-Message-State: AC+VfDyx3nhNPTX6SgmPMxR0q0dcumKjuVaNOhEkfLSbVXhR2z6ame3q
	nlK58pchk8QO6eC4OrvMAro=
X-Google-Smtp-Source: ACHHUZ6fyzgyF6IaPo1cFaZ/Jbu3BHrWZiNQ4Ii9axwoUxhdnuwBR6cJW7DJpqJrgj7c7vZ8IZ/jdQ==
X-Received: by 2002:a19:505b:0:b0:4f8:5af4:73ef with SMTP id z27-20020a19505b000000b004f85af473efmr4062285lfj.28.1687189477519;
        Mon, 19 Jun 2023 08:44:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:44:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Mon, 19 Jun 2023 18:42:27 +0300
Message-Id: <20230619154252.3951913-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084439_119127_ED995F4F 
X-CRM114-Status: UNSURE (   9.83  )
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

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..cb353d5805cb 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x400>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
