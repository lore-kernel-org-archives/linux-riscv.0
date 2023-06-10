Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247EFC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC8/oJn9KFOPrxmIaq+B5/yp9akZgMRska6KvFG4Kmc=; b=rttTPhUzX8mqK6
	R174z67gZnmbNeGZQpLs6YE4gEidLPN59bjeZVUVzuPO525ec2+neZpd6MHUDOKqj4Hv50mOum6gj
	WSRMcD9/hQbz771UpcIZSaX1LdbWf/8S0bE+XS1d1HLfoP2pM4N4Hh6CuRov3/3ZFAj+H4btFktWc
	Db/9t/84exT9oGxmK1qDKwnxUmAN7iq18HPvYfXncZvsEgvGrZwVvxs40Xw/RvMb4C19J6eDWxR4V
	GaP49dcswku+93wDTJu7PmMZNjUZZl9FJLzPNBvzR8upWkzjK0sJrbEpeROHJS8S3/uGz5ObPJrpL
	735Ton92SV/QxMolJ5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zQ2-00GL32-32;
	Sat, 10 Jun 2023 14:18:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zPz-00GL12-1L;
	Sat, 10 Jun 2023 14:18:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7f6341b99so20688935e9.2;
        Sat, 10 Jun 2023 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406693; x=1688998693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=pkzfO/5sjuHYso+oiyL7XG0FVK9wYghdGfliIDHkuHEiBLv06cMTld/rPbe9ZcWq89
         q5zfw/OPDhI5rl8hUlLsjSD/Y3sE0DDEpJXtoWttBEwADBgfV97tRv9SkNXEMh7sVweQ
         iOgdA5YtlapviAswCw34D/Ex9EcTRe6FG98PT+Ygta0VcuxrnKxRD8afLvwDWVVaK0sL
         6H82RYlSoRjAKTalAG1Pr+6X4qIpg8x5kues3GSMOIxOtK3bVT+r9oL6G7dMMZ6FAMUp
         6u8yvU+TJvHddmSXZmzCR2YmUdWJXRTYJk0lXTsID5AHjF0kE2PlcO6JdJqMBkjFbgjq
         lZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406693; x=1688998693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=j1BocdnBn22aEPpHdxNvJQXjC6YDQzK2XVr7WPRRbntJgEWUyMXS/mE1mRClG3ZOpj
         ZOmvYaIALsEDtHv0wlaVEhxTsk1fCHyU+zwg2SUc5/R7IJiU5AYeNt0x1Ez1BDw7BNSR
         ct0lTl0t1jaLwZpooknkOpDU7XymCIiz0lQxUXIAX+0DJlanaZpzOiyNyTQme4m8eiVF
         9r/x3H3M7Q4mXlnkImc9j9Xg5euTLZlPkeVvpoLkLIws5bS4mE36XqQ3+qrVFP04eWOf
         SoF0o7ehiQyTsKOYtkfzxBaqkllhWzQMfx0tgnnNJ8ek2ciHlOVE0z36b1ZOt+f7uGo2
         iTvw==
X-Gm-Message-State: AC+VfDxylafUUB/YawVBJwbVA88136R+2bwaUYNk9L6sTPBq+iglvFk3
	MifWUkjv8WcHyZDO/PWMFyE=
X-Google-Smtp-Source: ACHHUZ6H/wa1UlSMhfTLRDVrB5/B+5RG6Gcpeun3sxfNKg2oFLWcPXNnSrhggzGAV8XE2nKtgJxfLA==
X-Received: by 2002:a05:600c:290:b0:3f7:3991:e128 with SMTP id 16-20020a05600c029000b003f73991e128mr3027448wmk.2.1686406692941;
        Sat, 10 Jun 2023 07:18:12 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:18:12 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Sat, 10 Jun 2023 17:17:33 +0300
Message-Id: <20230610141739.999268-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_071815_454620_74DF0880 
X-CRM114-Status: GOOD (  11.30  )
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
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
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
