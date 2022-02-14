Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB9EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaQjK3y7hJGDF66hZIZaPdP+v5b/sfzf1pEDRWQ0p3M=; b=L81Uyrze69LjXd
	xCZBVqiNiSFsl5U87NdX0LtlGScYrWoW0Dm0N2o0KKWacE/N2hRkBHk7Qgx+PleWfJjlaE2eLcic2
	a37NY+Ui8MaffPLTW5NnLhFIZuqbiBrDZVBsCCvtfakpP7T2j1+/MG5AEwa+tvRtMi2TU117ekKrM
	/asnWMV00E8UPk/Fz8ywOimGG/0+oN3jP2VfOBqnwlSJddwpIGZEJsmO2qH881KpKuoeBvNBgl9XQ
	CY0RCdBlbLXyU4GI4zlLEraQB3ZFjdsdG6RaxOunYNSeekYQGyhgIEEloiAmtWu7QFrbG23vrWPue
	jjvi+iigphpqM2AKCLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbqf-00FVpz-Me; Mon, 14 Feb 2022 13:57:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbqb-00FVlG-HI
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644847017; x=1676383017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yKN3bDJdSLql1NsGHOBK3P94QqFRIN+6Az1x7qpydu0=;
 b=m32nKzQNqrOnavJsEb+CTByawa26wBQnEJ1XNPdyJrI5jjPZmCX5TcFt
 1ucQKqRwhHe3d9oPoqAronabj0F8eiKSFQwi9Ww3KobubZADUQ2gMwoBD
 a0v1V+p0LXq74ktjszo8btcXVrKqO/BaYH7lXv74BjgcZaP4rqDccdCsG
 7NZ3rmMWoCtjtE1KJu8kDhMlXRH9gZpDKU7nJ9x+SwsQXnJJE4Z2Te/bp
 wZ/MGtiRtaPKtw0qsY8jRLRjBBPowxlZU5WnJGHEt2ZULXDyl52avCl9L
 doRyZsHKuObzIaVDlM8PbgNcMEOmT1LSRqzSe7bZQwRfCtMkM4FWJSQbP g==;
IronPort-SDR: e+TPGn9ywsN+zYX0p17ZyY3tKI37x+iWUepeyrrmmbN/tq89hp723X0rzXHORkmWQBCT3IV80S
 Rr2ibLlfyf+2XrgHuWIYs0UKuOjJBolQay3oBiGIkxr8lzVVBAWvtOHThUIdViPmpnlNJSVnDY
 HnpQxA8M7EmKf4WlXWuzTxi51zgy8HDA35dy4a/zLQ0IuHC3bWrJ4rTnQcSxR8qaajji4lqPV4
 N373/alqALUl7IxcYEXlDPXGlp0EqgXi25Pseh7VXDYHQvCkvAadkoj0rwQkHuYrR4TGC+bBqL
 Wljvv2nX6g/y2L/TlEUQkn1l
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="85633821"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:56:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:56:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:56:50 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v7 09/11] riscv: dts: microchip: update peripherals in icicle
 kit device tree
Date: Mon, 14 Feb 2022 13:58:39 +0000
Message-ID: <20220214135840.168236-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214135840.168236-1-conor.dooley@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055657_710077_F31BC5D9 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Assorted minor changes to the MPFS/Icicle kit device tree:

- enable mmuart4 instead of mmuart0
- remove sifive pdma
- split memory node to match updated fpga design
- move stdout path to serial1 to avoid collision with
        bootloader running on the e51

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 23 +++++++++++++------
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 23 +++++++++++--------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index c51bd7cf500f..dc5f351b10c4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -18,20 +18,29 @@ aliases {
 		serial1 = &mmuart1;
 		serial2 = &mmuart2;
 		serial3 = &mmuart3;
+		serial4 = &mmuart4;
 	};
 
 	chosen {
-		stdout-path = "serial0:115200n8";
+		stdout-path = "serial1:115200n8";
 	};
 
 	cpus {
 		timebase-frequency = <RTCCLK_FREQ>;
 	};
 
-	memory@80000000 {
+	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x40000000>;
+		reg = <0x0 0x80000000 0x0 0x2e000000>;
 		clocks = <&clkcfg CLK_DDRC>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x0 0x0 0x40000000>;
+		clocks = <&clkcfg CLK_DDRC>;
+		status = "okay";
 	};
 };
 
@@ -39,10 +48,6 @@ &refclk {
 	clock-frequency = <600000000>;
 };
 
-&mmuart0 {
-	status = "okay";
-};
-
 &mmuart1 {
 	status = "okay";
 };
@@ -55,6 +60,10 @@ &mmuart3 {
 	status = "okay";
 };
 
+&mmuart4 {
+	status = "okay";
+};
+
 &mmc {
 	status = "okay";
 
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 62bd00092bcc..5e7aaaf42cde 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -174,15 +174,6 @@ clint: clint@2000000 {
 					      <&cpu4_intc 3>, <&cpu4_intc 7>;
 		};
 
-		dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
-			reg = <0x0 0x3000000 0x0 0x8000>;
-			interrupt-parent = <&plic>;
-			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
-				     <30>;
-			#dma-cells = <1>;
-		};
-
 		plic: interrupt-controller@c000000 {
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
@@ -213,7 +204,7 @@ mmuart0: serial@20000000 {
 			interrupts = <90>;
 			current-speed = <115200>;
 			clocks = <&clkcfg CLK_MMUART0>;
-			status = "disabled";
+			status = "disabled"; /* Reserved for the HSS */
 		};
 
 		mmuart1: serial@20100000 {
@@ -252,6 +243,18 @@ mmuart3: serial@20104000 {
 			status = "disabled";
 		};
 
+		mmuart4: serial@20106000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20106000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <94>;
+			clocks = <&clkcfg CLK_MMUART4>;
+			current-speed = <115200>;
+			status = "disabled";
+		};
+
 		/* Common node entry for emmc/sd */
 		mmc: mmc@20008000 {
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
