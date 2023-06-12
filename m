Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B6C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOyAw08BgRnzXBxwNu6sAxUyDJRHZslpQf/AyBXVeHQ=; b=OvHUe1n7uPrxbx
	UGZxXD3X72x43CHVyoyP6AxnszDstw38cnXWg0Zzu3AOWUheg8LzqHNViB+is7UYhWPewgwK2ndA7
	lJWNbT7ZeRg0U2LA/uyfwrempWDaCniUyj3DuGqcfQMNGK35+utVL04viGOoWJeb4MZ3OGIUQisxo
	wUsR2p6Tl4e1EXOahzunZHcOq+TGAWuGapINcXzcdbGF8ebtNhGbfPZz2++r8tNo9O5Eigm/wUQTI
	f8U0S5vJCJas07Ws+a6ZN0AwO8KKNqxM5bUZS2LuBes1ypMiT/8pPjbb73ptKCIT+Wkl4Wk4bqmiN
	XyyZsV9lgn3K3pHs4Tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b92-002mXk-31;
	Mon, 12 Jun 2023 06:35:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b90-002mVD-0E;
	Mon, 12 Jun 2023 06:35:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30fc1514745so590022f8f.2;
        Sun, 11 Jun 2023 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686551712; x=1689143712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=HEsC6Y/V5ELTnxcks3EC6dUFEJf/RWjGCudz3+N8RfIor9hYGVnW2+L1EMaDtAMPiB
         xugyU6wrJVom/xY0F3SVs2HnNuqLcZHeVPIQyFRBdw/k8mytfndm0+llIdaerxxd7F03
         tuhk9QjKjuAXWbzXGOZp2IlBu6iUkxBpe72V1wZta93zFeJu696ZsHVPqtYtX8ftvZZ8
         TdgxIte29iLf6cyuqkn/0QCTea4WZBO/4OSdpBziPuHcLhAPzCRbiQDNd2pkNDomxeOm
         Ljimww0CxQCPrCSOfkKPT522D/FbSfUOlAq5O8GoEB+gjGEXZtbDr4u8d04/Jjpbkyj1
         fEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686551712; x=1689143712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=d6bM7qqnJK6FH7ZetTLhF8r5MwbHjqz6PqkRbR7g4ds1ERJL9TFNaZxLhB/4O7Thf6
         BZGoBXVmAKF4iwIZ1kqx2NVGXVd6n+5NTnrkIEd/H2n9K5NumStD34NIDN47vwDeqsUI
         aP6htZ8kDCCuS4bfgUU6PjmXrvhKTp/uIfxfnFOB/NLBr2tGOCgvpnhODk5/viO9xgo5
         AdsQyrB87n0GnOeS1jO4IRIbAaTebqzYlLVWAySe/AvI0JY9eMMgBV+XVbMXQDfOyIHK
         zHvKUGSSDrRUFLlV8CXUK7q2Ea2NN/HHF1afENO2FRP+pI/rn/oz+OYlVsBggrtrfrxw
         5Plw==
X-Gm-Message-State: AC+VfDykNNinw1yoaGMmaPku0ttCBfMU6NCpi1Q0h2SY96ys3+aTz9RB
	2OJK3iIE9x/aphxo73+bktE=
X-Google-Smtp-Source: ACHHUZ70Cj57LU8Ff8JQkoBSv0RL9hBJhhZSL6SwIfAD8toe6gVQ7t4REqheKzJzanSnq6DqIrnN6A==
X-Received: by 2002:a5d:53cc:0:b0:30f:b341:79ef with SMTP id a12-20020a5d53cc000000b0030fb34179efmr3851473wrw.71.1686551712345;
        Sun, 11 Jun 2023 23:35:12 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm11484811wrn.56.2023.06.11.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 23:35:12 -0700 (PDT)
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
Subject: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Mon, 12 Jun 2023 09:34:19 +0300
Message-Id: <20230612063429.3343061-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612063429.3343061-1-bigunclemax@gmail.com>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_233514_110776_26BED212 
X-CRM114-Status: GOOD (  11.11  )
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
