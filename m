Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24286C7EE2F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykkXplSPzTWz12JdxRq5t//LP3nCPq8Jin5M9FRThJc=; b=p96SU97UTQuPhz
	y9QPyUls7RtCtTVMfjVSK83UGy82cbVkyGQvVR4+wIzGOamBu/vHnFwyfS2ONn3WQvPjJpcbNnQLE
	OwBWTN3jl4rdc8LgkCZzA7n4xxGGnw6U0YfDAFNclLlwLAO4Pqbe19pAuzE6ETu+25bqB6U7CECDD
	GJ+V80nZeelbEIefK8ko56BHSsooq6GjBsFzQPj/nIlku3oQU6euNuGcJU75R+fA5I9e7SwS5Bx3y
	4RVniS/Ym8sWBAxGQFTt/50fv9xYCHS2xftPIs4bXVc0XahLOImRJJItJV5DKTaPq592/6cf6riUt
	1A7B7u3iKFmRWKnkuwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xkL-00G61H-2V;
	Sat, 10 Jun 2023 12:31:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xkI-00G5y3-35;
	Sat, 10 Jun 2023 12:31:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f61530506aso27696435e9.1;
        Sat, 10 Jun 2023 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686400261; x=1688992261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=LXnm8gPbPQkQWKDuC02ieMibyFgLdcZnn88V0/4WRrpJ+/82BLx419ELyBKEzKDuJ1
         EytK1+TtoApSioJlkL9L1JGf9koy7mTG6XAERLAil475SHg6QSPUHAcwX0NkqsemMa1Q
         8fmyO6WeLVmb5MYgiaL13FR6Z8OZpf0fIcfitSS59euxOUES68UA9aReJ1o70FjbI0RL
         hYrclT9vuW1CCHdjtveVm19YpZ31bwdJtbAujx4+X0w2ndKHY+JII8r2kmsYmZrU1o9R
         eqKQPmpOD2dMZhKqNXDG9K+TPQKHWcVFQud6DPUVWiTwbuSasvYHBLee2lZ+9aG4oR9v
         4Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686400261; x=1688992261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=AKiqLPeLfzhAwK7Tipi14peOyTMJBOeWpZF8TkGAkIDCQb689CXTHJaOOqTqdnmj47
         Bfmc7H+9L3mlXO71LcHWZrn96Di0stnMMrNHhO7prWmDZ1maL9pm8bgiBzk4SW10mTcm
         eXYZjdk3A0m1/LkQuARiKdViv6Qy56I4ibJxXcflqcm089eUqnI9+rnXzIqEADL2VuKk
         eCAOO+YqPhEAeDhrs2/sSEePTalJjGD3qvDvOEOv1dHa2doyz3+f66VTlDm7/vOSthLl
         ry1qLb5kpu6K97bEt48V8I7cOB5jrJ0kfSV+76r1l64ml/+rbiffirnGZPj4AwFrrImB
         9Cpw==
X-Gm-Message-State: AC+VfDwoEuJEGg/Qj70zgYZfTkcnozO49Lc2L2C81vntv8JhhGtqEc+5
	QmqaHLYVjYc0N2LTYjGak8Q=
X-Google-Smtp-Source: ACHHUZ6oQnfcW+hVFxDL3r5DfdtcISrzUdyYfVhCOqBjpbqMOY2nywjUESWhtMB1LNwj370onHD7sA==
X-Received: by 2002:a05:600c:2186:b0:3f6:e79:3a8e with SMTP id e6-20020a05600c218600b003f60e793a8emr3710347wme.12.1686400260702;
        Sat, 10 Jun 2023 05:31:00 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v26-20020a1cf71a000000b003f80e81705asm2310487wmh.45.2023.06.10.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 05:31:00 -0700 (PDT)
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
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Sat, 10 Jun 2023 15:29:09 +0300
Message-Id: <20230610122934.953106-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610122934.953106-1-bigunclemax@gmail.com>
References: <20230610122934.953106-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_053107_005988_1640CA24 
X-CRM114-Status: GOOD (  10.03  )
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
