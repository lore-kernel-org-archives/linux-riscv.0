Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E666C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+gJmrLK+SwxjQkBLN1Tnx2i70dVK7arRhoYI5S8IAs=; b=EUJCycvyUHkWj9
	fxPvZ50mlyBktstpArCkjohn7YvXBFuliNOTgHGVeVdwW98j4Cyd34b81e0TtH9sRID5bCvqv5Wh7
	DY0LRZW0zWVrtmch3mUHlwRTPQqlLFS/gEo1q89chmjM7zKeXopPKc6VC41+tbVAdYG3LXxexcnao
	80tQc2OmqhyzbhW1fRwvVnG1bzyqUU/NWLDdA2pMlMWCcsgP9JaAnKWPuzoS/eI0XxQzgTYDC4sHs
	+anaNIZsvqvlmUxr+TQnoKLjjdSLIx2tmxm3nybEZmCY+sFIiOrRAVEZaJgVG4jnfBXteb32TSoTL
	r11KZaxyJzck/5Wsy9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDhM-0000000CGtK-1S2w;
	Tue, 23 Jul 2024 11:28:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDhJ-0000000CGqw-2Br1
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 11:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734130; x=1753270130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BnMHbAdBH79ScPTvVNbtezh5vCswpZdpOoIuQ4RzEE=;
  b=zwHqgf9uOef8BKZyrBzU/K8FQIGXKQJrbpc7OhPviiHxitbc/RNIRdgS
   9Yqw6K1QIVowthpM4Ua7NfR9tofhOo3n842gEENEIbmTL7HRYQ8Cj5ZtY
   dOXFBafC8OGoG55j30OdHpphrYUYprRRtyBABKvv03lvDxghKMQ3D7VYr
   5frVuEbz0U3lCewOPJVPC3iXnhfNQFZUlN/SIzZBRKNZLgIVJLqzPpfAn
   3sWDHiUW7YTrzR9aUENfxsgnOUlZ6XL8KhylWg/umM1Ip4ZzIo2CycB9m
   vxlX3niAGEmGQtjmldcw336OxvyUCXXaWv2JzQEWQRWYzlozcVmwWglqL
   A==;
X-CSE-ConnectionGUID: ogbmHU+kQ5yxZ4OX2mUEtQ==
X-CSE-MsgGUID: Y70jeUQRQ8adVIWl7jhXaw==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574987"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:24 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 6/6] riscv: dts: microchip: update gpio interrupts to better match the SoC
Date: Tue, 23 Jul 2024 12:27:15 +0100
Message-ID: <20240723-framing-chaos-9f8e2df8889d@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0BnMHbAdBH79ScPTvVNbtezh5vCswpZdpOoIuQ4RzEE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ0+c/rLzj6Ppc85Px9Je/mcOm3vjiVrjRbV1iqs22S4J sjB901HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJcJYw/C/J9V7+K11BZNH0Rcf1vT czOGzLV//19JlVpFygvVjf13BGhpOWzN8z95a/mrlzou3PjANBLCaiLZLJzdY+MxdZxjTo8AEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_042849_591628_5ED467BB 
X-CRM114-Status: GOOD (  14.47  )
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

There are 3 GPIO controllers on this SoC, of which:
- GPIO controller 0 has 14 GPIOs
- GPIO controller 1 has 24 GPIOs
- GPIO controller 2 has 32 GPIOs

All GPIOs are capable of generating interrupts, for a total of 70.
There are only 41 IRQs available however, so a configurable mux is used to
ensure all GPIOs can be used for interrupt generation.
38 of the 41 interrupts are in what the documentation calls "direct mode",
as they provide an exclusive connection from a GPIO to the PLIC.
The 3 remaining interrupts are used to mux the interrupts which do not have
a exclusive connection, one for each GPIO controller.
Setting of the mux should be done by the platform's firmware at boot, based
on the output of the "MSS Configurator" (FPGA configuration tool).

The microchip,mpfs-gpio binding suffered greatly due to being written
with a narrow minded view of the controller, and the interrupt bits
ended up incorrect. It was mistakenly assumed that the interrupt
configuration was set by platform firmware, based on the FPGA
configuration, and that the GPIO DT nodes were the only way to really
communicate interrupt configuration to software.

Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, fix the inaccurate description
of the interrupt controller hierarchy.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  8 ---
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 50 +++++++++++++++++--
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f80df225f72b4..7a9822d2a8819 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -83,14 +83,6 @@ &core_pwm0 {
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c50..e31e0aacb943b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -465,39 +465,79 @@ mac1: ethernet@20112000 {
 			status = "disabled";
 		};
 
-		gpio0: gpio@20120000 {
-			compatible = "microchip,mpfs-gpio";
-			reg = <0x0 0x20120000 0x0 0x1000>;
+		irqmux: interrupt-controller@20002054 {
+			compatible = "microchip,mpfs-gpio-irq-mux";
+			reg = <0x0 0x20002054 0x0 0x4>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <13>, <14>, <15>, <16>,
+				     <17>, <18>, <19>, <20>,
+				     <21>, <22>, <23>, <24>,
+				     <25>, <26>, <27>, <28>,
+				     <29>, <30>, <31>, <32>,
+				     <33>, <34>, <35>, <36>,
+				     <37>, <38>, <39>, <40>,
+				     <41>, <42>, <43>, <44>,
+				     <45>, <46>, <47>, <48>,
+				     <49>, <50>, <51>, <52>,
+				     <53>;
+		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			interrupt-parent = <&irqmux>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupts = <0>, <1>, <2>, <3>,
+				     <4>, <5>, <6>, <7>,
+				     <8>, <9>, <10>, <11>,
+				     <12>, <13>;
 			clocks = <&clkcfg CLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <14>;
 			status = "disabled";
 		};
 
 		gpio1: gpio@20121000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20121000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <32>, <33>, <34>, <35>,
+				     <36>, <37>, <38>, <39>,
+				     <40>, <41>, <42>, <43>,
+				     <44>, <45>, <46>, <47>,
+				     <48>, <49>, <50>, <51>,
+				     <52>, <53>, <54>, <55>;
 			clocks = <&clkcfg CLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <24>;
 			status = "disabled";
 		};
 
 		gpio2: gpio@20122000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20122000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <64>, <65>, <66>, <67>,
+				     <68>, <69>, <70>, <71>,
+				     <72>, <73>, <74>, <75>,
+				     <76>, <77>, <78>, <79>,
+				     <80>, <81>, <82>, <83>,
+				     <84>, <85>, <86>, <87>,
+				     <88>, <89>, <90>, <91>,
+				     <92>, <93>, <94>, <95>;
 			clocks = <&clkcfg CLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <32>;
 			status = "disabled";
 		};
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
