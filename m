Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B4C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccoGGVXR6ODP57wbxatjOLGzS+/k+m/ELUlv6AwT3q0=; b=MMN7IjDOPiXkkU
	FxbSV+YQOh/1Opyir1pGRWSaHvti2IoDABqYMQFYwJLkNsNU3dk2gURIRYY+Fo7tqMERW2jya8AmK
	QCkYzd2xMaPS7TEOvqWjdqEKyi4Il5JjqLOBA+TtFBCm3TF5uWJ1k0tVlYb37Ws9cbEz6CbGheQx4
	ktY6HowpGpnxDxSc82cRKG6HYPCDI5Hbd2cl5kXG/zEZcYB13tk+rlS7dRKcQt/6pKZgpx4OC9hzq
	RHEsu3796UygE3DZQHJc7I2JK2qTpejReRJVIeHkZwd7TDk9N6Vl8UEkqeZwU0L/ktYpzPRRPZQmy
	xelryCQsSI3ribG98Mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PrE-00EbY3-V5; Mon, 17 Jan 2022 11:07:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PrB-00EbVf-De
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 11:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642417646; x=1673953646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pD2aY7DqfNmFRox5FSceK6PpE1ZFD5MRqAvK8t412Tw=;
 b=zng9ouQgyqpNcPtyYs7FXSgtno1XVBqfRq/7QwE+9RlKC+7bSwehwd3w
 TYBYnj0uxO67mCGB/u8Ek5LGFFaDy7wJJhnXRb0c4g8EYQUJW+8ABbrH+
 R+pEoLQ5vsh/2FDIUuAzvU8SpLfTfaYPHhAk+S73h7xp971SE7ynVc4UO
 iXK9mblfKAhpl1v0HhQxjQmjeLAyHB+GBuduSIADXV1l6bnecYOF8TPU6
 VcXcQqIj8bpfPLE6FGxVNQTCu1VsQvHK9b5JfJBQ80Bn7jVVVfP8ocCOU
 rprTNs3i92z9O7uoRrNbTt9yQfttVL4N6b5H/IBNvlJGEGNc1BOkWoEO7 Q==;
IronPort-SDR: 2p3ThZoxkLDgVPS2Nx73TbKIaaMgzmcGaOIIOseXHRln+LXTYMdl6wOEyvieH2t8GH1Twfhvj9
 1WTiXu7H0Jz5aDzSdgbM5r8p3KlKXSz4/lPCtl0Y0k0KGZht8/ofHOZNTIDodCQUY7oADyN16G
 yFWrk7tySgYmC/rUN46MnfiD9IkpdtmQ729LmU+OkcZQzg8XNrWZ/U5PMpP6wQKB7DfsFiZzMW
 0PUUf79rhSBcS6g7z+zPPRGnC4RpDAIPvb6PcQAxJJXS4SQA817/b5PtanychTF7zWfbQAZJAs
 ip+jAHYIRQgShuS4daZi8Qmm
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="149870690"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jan 2022 04:07:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:07:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 17 Jan 2022 04:07:07 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v4 12/14] riscv: dts: microchip: update peripherals in icicle
 kit device tree
Date: Mon, 17 Jan 2022 11:07:53 +0000
Message-ID: <20220117110755.3433142-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_030725_505847_35E8439E 
X-CRM114-Status: UNSURE (   9.08  )
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
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
