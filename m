Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F30EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnGXdYMZFITvzohPxsI3/z6mTVooOUrijEsIOS8WWO0=; b=d0qs06Xda1VMqp
	VUiyP19tMIeD9Ov2kL3GmE8njfhaJdVyjiDe5+YhAuOIZeDrmmyZ/IE7SYll9+IfsrwaU8RCDv972
	+ebH8hpBb/lpNPGZPpEvENUfconQg1tqpfzXb06XWb/DIGVGgJxk1gjtz1JOnt/Q6XlPfCNNltpRL
	TYCnU4xR/5oxgJMRRX2+L6hKMuYRimGTJ1GEnQ2CQqR4Y8ipG78BUHcna5jSCQiv1ewc9Q2Bnavcb
	mMLjh4Hl+E//ksYiT2eWl1RkIHQGddymhMxbApq1a+tC+oKaBG5Kb1EUDp1Ljnwxm5Bo5Mn4nKLPw
	Gdo79HMbbybUA2QlGUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2u-00BgGQ-1R;
	Wed, 14 Jun 2023 12:56:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2r-00BgE6-02;
	Wed, 14 Jun 2023 12:56:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so8433929e87.2;
        Wed, 14 Jun 2023 05:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747374; x=1689339374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1eo8xae+BqZ3lpEIIaUchjB8XrAbrJIJKlx1wdExKg=;
        b=UvakJ7HBiMflkT+GTjEx7eUO+ZF5M/UQXd9WYOPFbdf797iEVzkTvlUo5fVxcciifz
         frJ0ouFGcgjFa9YWRSIe+67tC6STTVHFInpiU6DWx7JycvqyFpcoN4zcnyxZ/GFmo89X
         /Y2GtqN8ou+4m+ruSsoEkhCqka+7FAvCPT952KSysXaUeJwBgXBUdFmUmMB8ycVGJKib
         x8AwMqtsLgjkSWGoqP5wXyMY4mlSH21j6BDJAweuFb7CYfOLbnUeujuox2T28XQw/Gwx
         /u2kc4UMqPnUnSzPUUJ5GIcG2yoUgSfruMBIymmtuI0krA+jr/ftSfQLdD9q8VQyZ0kf
         rPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747374; x=1689339374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1eo8xae+BqZ3lpEIIaUchjB8XrAbrJIJKlx1wdExKg=;
        b=S+YmXIEJqu8HirV6R3aoubHyp9h3ndoQe52O/AVjG1+qsvFzNfbhUC3cFV5s11KRHN
         SZ/dbsRvmC21tXWXPIU5D6nhm5Sspb1b/OxxcizElLNfw7u5YRK9qJed455Fx2WDXVTn
         Ml4isSfuj63nMCiYyDsfWkA2eA3A62qVDjthZBwp68lv0LAsD3XP0CLPXc+hYsyGCXWk
         cKom7o301BimhhMCZrS5CNto7PVWcuElesvtvrT+72/0m6/2Jzs85NZtXvLWBMLiG4ua
         zFlQE1a8LwHZA/7bMjDQK8UQFTrFOMoLwH+dz7UgF37se0HwYjW4tLMAy8XAQwlcq93y
         lLjA==
X-Gm-Message-State: AC+VfDz3YTTjZvvDZDekUCOZmF0B4OqhKC3CnWBnQ62/Z3Eh5BWmfmr6
	2J3MH1E1kEUMNTPPBODtREo=
X-Google-Smtp-Source: ACHHUZ6Kw6DeSi90C1pJK+Ei/gwJ7+BPa9Ig7zhSqkWiZ2L26A4A6pgW4OZlts4EVAcsqL3514sjWw==
X-Received: by 2002:a19:f20e:0:b0:4f6:54f1:ea36 with SMTP id q14-20020a19f20e000000b004f654f1ea36mr7594684lfh.43.1686747374315;
        Wed, 14 Jun 2023 05:56:14 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:56:14 -0700 (PDT)
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
Subject: [PATCH v5 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Date: Wed, 14 Jun 2023 15:55:21 +0300
Message-Id: <20230614125530.660597-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_055617_054040_640A9A25 
X-CRM114-Status: GOOD (  10.08  )
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

This patch adds a thermal sensor controller node for the D1/T113s.
Also it adds a THS calibration data cell to efuse node.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..9da1e4ddb662 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,19 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x02009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			status = "disabled";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -365,6 +378,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
