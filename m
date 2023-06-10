Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A11EC7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC8/oJn9KFOPrxmIaq+B5/yp9akZgMRska6KvFG4Kmc=; b=z+w3zEyHQuwHAS
	00IylQYC7WMRIy7u0m5hKlGSx6zlmW2b4J5flH3YmGt/lLO/a13ItPtb1G7lOSDs4OIUynqUmmrHI
	3bY4GnuILteMAhFT9fA3FL48QlbVWhL5to2ihw244KDR9IBgTES2wF3GMueTIMCHCxHQKPRLby875
	xBbPzjPnZCbzIGFILadW2NcJ6ITI3LHFRTrR6hB0a9VQu0lYrJh3SvXfriO3jh0ek/Z5Wtv70uqW7
	n5kXLtX79XQ9JeM3ZcfOb0tVTsw8K55mb2srEsb01ND+bbyVhOGUTN/xvxak2ZUzWGZB5E7X+Zoko
	QNyGyKwddmsXx/2uHYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85K7-00H0xm-2x;
	Sat, 10 Jun 2023 20:36:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85K4-00H0us-19;
	Sat, 10 Jun 2023 20:36:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f7f4819256so22158755e9.1;
        Sat, 10 Jun 2023 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429390; x=1689021390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=Bm3zYkI0IGQ1FSCpqk+234/h0gkcSzDm70S2yoO/lXMfJwYUfFTD0FB2emzCrK2GI9
         9wgoLsJxkwXeEgLVCLrIVVkFFyKms9G3DIucdfZVi5EORIEi2w8nfGSckf87X0Hs0D7g
         sw1ncM+AoiTjg+p0jOgGYvJwideciJNJ4tZhfCxU/j2eJS1t/poY3JDuYc+NZ7SnGAni
         1whAg3p1QEiIO480DcOznESxesMcMh1P78/N+pWTw/qOjlkqaDRSsMvXwXtRGFJF80sT
         grGB4vXb/a8K+liaAGkrWio+4C3Nw/YGYib7QUaLe0Wdxe2YphuaamiuAcXdZHMO9BKO
         /+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429390; x=1689021390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=XqKZB6ESkzTF7ca/GGfUC8VqEbxlL2ucKqJ+5gvp5b4/tdboF7Fis2f6a+0Pb2/kgm
         Ii/f9pv+1jmZBOA6c114ABCE8rvgR10HpWik0/JDBnEs+qGgEOA+EC/x3jYVwkjTNOql
         9DJArrXR6oSJ/zFc1O8WmB+AibzSTgndSmPw2iP82geHBi8pLPyJ0QvjTSfvnOAl6LsM
         pr/9ATBVqHTgGyD3+iyVHmokTvEflY2v3ETQKA2EaNceZOfis9b32PTKYBWi/CMfAaPt
         1fLkJPYRk5Gb9kxafJfa31tRAgLZQ0wBbt//EE/J81r3xoOFoTax20QsacQFIUGWnkGo
         DHMA==
X-Gm-Message-State: AC+VfDzDqTuPZe7tOJHG98ApKa85opbJK5dGskhnld1wUokBaBZauFaI
	oLxWk7EDT5V0tyAa+q/Hkig=
X-Google-Smtp-Source: ACHHUZ6ztxNBWHhkcgno6mzQ/hQvNnl3aEdK/r5i0RGahfv9+1tI5qQxdo13vdx1ALpyyrMoMmQ3Fg==
X-Received: by 2002:a1c:7715:0:b0:3f8:153b:a51e with SMTP id t21-20020a1c7715000000b003f8153ba51emr441389wmi.36.1686429390438;
        Sat, 10 Jun 2023 13:36:30 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:30 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Sat, 10 Jun 2023 23:35:44 +0300
Message-Id: <20230610203549.1127334-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_133632_409396_51B53C82 
X-CRM114-Status: GOOD (  11.51  )
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
