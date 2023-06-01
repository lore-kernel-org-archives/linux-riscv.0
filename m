Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B17C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykkXplSPzTWz12JdxRq5t//LP3nCPq8Jin5M9FRThJc=; b=SfmzhoB4sUaMvO
	x3KF0aQxzGx64+zBVgMKaFBsGNaiuw9hCuz6xGcKemBT13U4pVDGDZItuzCY5PmJOJW4hWdHQ96qb
	hqWWdWgt4Kzs3RAalNbdQt2wlb0Ke3DS4B28uhyKKMr8RmywCaWhTqRNo5gP0jwZJNIi3sb8fx4Pd
	nvCB24sZqo8ZMTL9rKyiMnMHBxaUSatSTuUlwg0Li4EqMd8blRmkjVdTzGKw7UlwVgWC4sTYW5ZTl
	pY+S2a1VrDIOWoYImJzFgIFs64SZ+Wa/msyP9UIMwFtA/kMJPiVGSrhJnRk+Qk6rH5cjZCk19uOO6
	UTwYwsxwaD8hdY0J1nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qqU-0058db-1t;
	Thu, 01 Jun 2023 22:32:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qqR-0058bU-28;
	Thu, 01 Jun 2023 22:32:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so1393578f8f.1;
        Thu, 01 Jun 2023 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685658752; x=1688250752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=PONnEob4cS799koyjCLxAEsadb0C5Fdkmzoc9mRcit0XlOSYJQv+wlsMZI1/KUhrq0
         EmiI5N6UUlzX07g4bppV5fM/ERH0Kc1q6C1Ecwo+XK/lBO+kqZhSWdHRQTJn/r+xHJ3Q
         /RBLLfLxgIVRLbYYoZgGQ+EM/XZH2dpFGccTFJrYUZ3AkWEYYPMaVSTUYmlnEKCu306P
         mM31tPQ8fqWiFZRgKAMLFy8HVh/vqXa11YJMlUmyGKmSiVSSfBBkOZuln7xeu0urBO3P
         kdwBI+K529QyXPDED8jvlTPhU96rtmoSs6MoFIw1vWgaQmEoeT+EXp2xw9pGcPw+t1ZH
         J4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685658752; x=1688250752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=YDWuGQ+CRGlre/F1yaFT3qFgB81u3PV4Kc54lFTIEiN38f5QGWlp86y+E8QSCCgpD4
         0taQJf77nuop/aQll82dbX6DrGL4wqR4qnfSy3NJXWQ3YoHF0SWqYK+/TL9MQ//GFMDu
         jxujI5oL+/uAYy2F16cqwzIPgIJmFFYnaa6p04Dg8fmrDs5WaJcnUZl6mrTdimsy73cD
         iahaX2cyUdK1Ksz/5bj+inOnpY2QGWuk8irj4hpu7jnAYjSjWNvjcM9TRiOB7pJ8yUL0
         kkPJMQ+tSaj+3OxID69FvnKFoYk0p8Xk8zJ3uP/msXrW2w6OqjpchgNpCTHCnwioVzxc
         flpw==
X-Gm-Message-State: AC+VfDy8d1+yi8dZQxPn2xtLOyw2lwJQWlZAIctBCSwscVnRzd2G9PqB
	k0z/t+l7euRJDpKAX6J6uRI=
X-Google-Smtp-Source: ACHHUZ7+6YZkcaeG6CeOS2iTlIxdCLfJll9IA+N/ujkTvPbYMeBBBBx/fSq02syrGNxPfUZeojqXWg==
X-Received: by 2002:a5d:6709:0:b0:30a:eac8:e5c1 with SMTP id o9-20020a5d6709000000b0030aeac8e5c1mr3088955wru.6.1685658751871;
        Thu, 01 Jun 2023 15:32:31 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b0030af8da022dsm8619149wru.44.2023.06.01.15.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 15:32:31 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
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
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Fri,  2 Jun 2023 01:30:41 +0300
Message-Id: <20230601223104.1243871-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601223104.1243871-1-bigunclemax@gmail.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_153235_697922_47761E5B 
X-CRM114-Status: GOOD (  10.41  )
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

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..90c79041cfba 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
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
