Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC07C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 18:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykkXplSPzTWz12JdxRq5t//LP3nCPq8Jin5M9FRThJc=; b=eyVYOrh0WnXyv6
	tngJMF6iTw5I2Ckx7Erb0L73d2PLqrXmak5NurmLzICJb/c/pcE4VLAcjQyCN0TxohvduajdgCXyA
	RS2/ncwarawNK3J01I/HwXdcp1/iFIW46X/C2xumg48jhYaErOxqzSRylcVRb5u0ns8aSaubjfr9h
	zY3Qfsg6wGmXXmbSqL/RVlcBEMlodsfclJNhfGhlrjq+215lZezJjUOhtqqJ9gJijy24s8Y3jT3fP
	wH06RHdrAmSTijFb43j/xTFPQ9yjUN0TmYzVSXy6LqDvESRbOdXJQzCHdwskjsY+4JH3AC3DALB0J
	0SOigrRsTsXIba/TeQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ssp-00Co2Z-1L;
	Sun, 04 Jun 2023 18:55:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ssm-00Co0O-21;
	Sun, 04 Jun 2023 18:55:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso41504455e9.0;
        Sun, 04 Jun 2023 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685904915; x=1688496915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=h5sKFEV8TA0OBcHdACbXty9PxKz8jgUpGUFbiy/GvEKjYur0hVmD+06SUCGLY2yHn3
         wHrmRZK1WNIdgSk5SS6PxT6kyriDte832Ogpjw6YI/1Su2MZrTtdLePKdfidrymZBSIC
         0RxemvtGNmqSZC4pe6IFvElKtRIapasNwQJqi6FS4I93LoK3wdw/uMn/AGaUAq2Kkmb0
         LMSDKc8O1QhhA8l+6CJf6kXCkrblhF5GuqRf0ednu15Ipzaju3PIIg0Mc4Xti0Bz5SRH
         v6r/EYkQGmGJaArsU5mnlErTUArViEoFOXVyEoX+YBqurbPADpdfhHiIqnHr5t9go+PI
         R9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685904915; x=1688496915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=GX6iZVb7hhwLvS9fziSfUIegxfwQAtJBCn/aW4zd2c3Zzamz8kxXVmOFdoNcG7WDa4
         BcuHt3C6gvVTTrXkGiwtjjVpwM1YI0rigL9NvTXazNC89BDGvZ9D/sVfEK9vu19uBaih
         uhq1Wd0Xt63wlwmgznEdpvYvrIwONW4oYNfWxb+yvpLbVle+a5OEF9lQFP4OvPsdnJ0G
         aAoCxtnryNsaMLwOIYEdENap4FsFGBzjRQ/ZedAPtlDElgOh2duxpdItGgoKiMQCIOb7
         u1B0MWLk7JbZy8Kvo7A4o5FUltQxEEsOsb45Gw+HgWM+RZsSEUI34y5x8TKSOt2SDkWp
         6b6g==
X-Gm-Message-State: AC+VfDwT99vgC3u3Tk0FCPBgyhNcIcnWK0R9i1jLOndDEXa43Z8yJaQN
	6fZ1nmiYpRhJwRNUVc03gzE=
X-Google-Smtp-Source: ACHHUZ6QHdcEGqIc3K5pPlZKWdJlxj3Jk7ECCuHaBZpxT2c/x9Cv/yIBXAYPcu1w8wPaqG+imTMVYQ==
X-Received: by 2002:adf:fb42:0:b0:306:2ef0:d223 with SMTP id c2-20020adffb42000000b003062ef0d223mr4541453wrs.62.1685904914549;
        Sun, 04 Jun 2023 11:55:14 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4108000000b00304adbeeabbsm7636433wrp.99.2023.06.04.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 11:55:14 -0700 (PDT)
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Sun,  4 Jun 2023 21:53:16 +0300
Message-Id: <20230604185336.1943889-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604185336.1943889-1-bigunclemax@gmail.com>
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_115516_668670_18CA8CDF 
X-CRM114-Status: UNSURE (   9.98  )
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
