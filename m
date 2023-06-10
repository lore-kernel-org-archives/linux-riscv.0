Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD75FC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOyAw08BgRnzXBxwNu6sAxUyDJRHZslpQf/AyBXVeHQ=; b=c90rBdFE+KgGza
	gtRMdaEYeBpZbK55m6oDQkEe/E8V7vffdsZ9iGz5Vu1u94uqA/UpRiM6/zDhgdPlYc3RfO1YynFx7
	m2iC2QWboLi2VOgmu1NpCXCXBoEb2fii8wGkbs0GkIE3KtOjz+sd/PqBQZBMeBXAsgShaCvTm5lgl
	QeV6BBv81weOCxgYxxS704A/I1Pz9GeVa7nmCpAwNqt9e+SK5yuJrETIYfxOn+Qpv7rUvpNi6zqbV
	UDCiccMFd1iQRX6cxjfolhjGV/Ex2fblGS1XM0r8npty58xBYCS7mm9/ERc4yNL4tdbFCZ011/tDp
	R4CypIz0+8UgBxDZHwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85QS-00H1wr-2y;
	Sat, 10 Jun 2023 20:43:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85QP-00H1uR-23;
	Sat, 10 Jun 2023 20:43:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so21636615e9.3;
        Sat, 10 Jun 2023 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429784; x=1689021784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=kpQA3nekPL+98p6cmI9mnzaVKKHSve6cxGy1RhXCla4biUstK0AKaCtI/Yd8gbQI9C
         sKvam+wssABxv9MLaA8kl5BJhpNt80OT9bNZPqEmuKvB7Y1ZlMAjG5j1EByVLPBFSquv
         XZYWdbif7Djrbj3cU6/YT0/+uIqkCKD0uhA31WONT9nr87Vc+mqKv1p723rj55+9H79T
         Kk8WI4Y4aYbVsEMcYPZ5hDCoMCTI0rh34BEzenayM7ndQUqivI9EIRPkk9GG396NAB47
         brloEtunNG2rvV8Q6S66JAxklc2EW244yyggOBvkLx2SDrPU2Xds3WhVzhas6d7dA5jX
         9ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429784; x=1689021784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=lJ2Pfu0oE4TQaXQ54qTn6VvL3zFT8ncBXvr5vq8IFKCXybl9g2WOwOkJrkY7hz1H65
         nRiwD2yc4fatZOb1ecDenikvZF2wU5curFvGSbdiiO1P7JJPej5n9Th4KkMpX15E8zZQ
         NZoWLmSkqmW4X6GnI3iY4/UUh0r70V/uH9HEUHQ5y6Y6z/oE6x33LsA+bfy3cCp1Texz
         jXmvlQ/L9Vfh2UkN91LsbUUsnVAso0p3pi6Bntkrzp8JG+/t4DwF8N9A/fLMm9+ALNsx
         7D1jIgW/JlDO82lFB9CDJdzauC9vtn2j9705MTG43qKhhqQymaMh9egs+ce7vTvf4bv8
         FpAw==
X-Gm-Message-State: AC+VfDxvPVoRgvz9V8yYZfoA76JEK1OuYdGPHhHIKL2I2nQIlxgoGoUh
	EPV6NpjzdCkvJ+Cpx97xhTX9b2ta00aUp85z
X-Google-Smtp-Source: ACHHUZ5WccjoBrBdIgxWWjOpvDDn0XwQ7s5E509S893oS/vgBLryWQLqdG2psuevCq5s/c2CFP1CqA==
X-Received: by 2002:a05:600c:28d3:b0:3f6:48e:92ca with SMTP id h19-20020a05600c28d300b003f6048e92camr2906917wmd.39.1686429784280;
        Sat, 10 Jun 2023 13:43:04 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm6547733wma.13.2023.06.10.13.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:43:03 -0700 (PDT)
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
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Sat, 10 Jun 2023 23:42:20 +0300
Message-Id: <20230610204225.1133473-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610204225.1133473-1-bigunclemax@gmail.com>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_134305_692787_73E3E824 
X-CRM114-Status: GOOD (  11.40  )
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
Also it adds a THS calibration data cell and thermal zone.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..b893f3325554 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun20i-d1-ccu.h>
 #include <dt-bindings/reset/sun20i-d1-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <1>;
@@ -138,6 +139,19 @@ ccu: clock-controller@2001000 {
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
@@ -365,6 +379,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {
@@ -843,4 +861,12 @@ rtc: rtc@7090000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths 0>;
+		};
+	};
 };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
