Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57756C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGHjVPLAtFhn2NlNWrFY3elieayIv6G725VksrRpGyE=; b=TG9JhKcZshyx4z
	ML8j2HVsbxk+HkUx9AxW4dVZ40YdLHJj4Eemo6ANLFSjLPZSb+Fs8aLmxeDO+bkdzs7l/mVdbnkVo
	UWkLeTfpX4ae8xU1FSGyFWZu5iPOFz0ni53X/agOwPk6QVXFiY5sCYP2zR7SiLTyVKD9/A8mQWg8h
	kSxzI4kyUGw7TOngYLvgNBgB9ybZpP/+Zyqz1es5LSJ8aUoYiqRXxiPwCIg3EC9uKyNYyECUCM3db
	OJFCIpV95B4Jvqr/xZe5RVgHYAaDgoU9hSM3aFTW5X/o+a7yTkIa8jsFxvZRdH3lpromWY/n0N5bc
	xXpfsm4FgTZhrQD9lmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpuu-007hvV-OB; Mon, 11 Apr 2022 09:01:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuO-007hX5-EU
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667628; x=1681203628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WqzRPC7S8FgWbVe1N2Ss8o565KjZHWpG+6XZV54ABig=;
 b=qOb0ZeGJykFBQWFketJo76vPs95nO7gpCnjxuNVARBAN4o08J1OTA1Fq
 pWKOmN3MacFfAC0hPWHzsdTtrDDdvxcppbDZ5gzlXC7IiD2HrttuewT4f
 c4dnqUUlgC0eSy/7H4RR/pFa8ts3qIpMp72xWvWD/c8Uq4znSvahiq1na
 PH1jStuloAQUwRwblXN9UUeg3JwPwvb/A/eO37MnezRsgL1+velD5z8Lp
 /ZAUT5aZ6rbJy9jqI5XwaL3FM96Edvge6UEhgaX1pq10qzQPRXPlia1TX
 Fw3VLJDJWbKeH21e2zfPFvaYl8798tRKy5UCv9DwoIZGtaxAr36e2YeBm A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="160047633"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:23 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
Date: Mon, 11 Apr 2022 09:59:11 +0100
Message-ID: <20220411085916.941433-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020028_559500_1341F5C9 
X-CRM114-Status: GOOD (  10.95  )
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

The fic clocks passed to the pcie controller and other peripherals in
the device tree are not the clocks they actually run on. The fics are
actually clock domain crossers & the clock config blocks output is the
mss/cpu side input to the interconnect. The peripherals are actually
clocked by fixed frequency clocks embedded in the fpga fabric.

Fix the device tree so that these peripherals use the correct clocks.
The fabric side FIC0 & FIC1 inputs both use the same 125 MHz, so only
one clock is created for them.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/microchip-mpfs-fabric.dtsi     | 16 ++++++++++++++--
 .../riscv/boot/dts/microchip/microchip-mpfs.dtsi |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
index 854320e17b28..ccaac3371cf9 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -7,7 +7,7 @@ core_pwm0: pwm@41000000 {
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
 		#pwm-cells = <2>;
-		clocks = <&clkcfg CLK_FIC3>;
+		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
 
@@ -16,10 +16,22 @@ i2c2: i2c@44000000 {
 		reg = <0x0 0x44000000 0x0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&clkcfg CLK_FIC3>;
+		clocks = <&fabric_clk3>;
 		interrupt-parent = <&plic>;
 		interrupts = <122>;
 		clock-frequency = <100000>;
 		status = "disabled";
 	};
+
+	fabric_clk3: fabric-clk3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <62500000>;
+	};
+
+	fabric_clk1: fabric-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c5c9d1360de0..3b48b7f35410 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -424,7 +424,7 @@ pcie: pcie@2000000000 {
 					<0 0 0 3 &pcie_intc 2>,
 					<0 0 0 4 &pcie_intc 3>;
 			interrupt-map-mask = <0 0 0 7>;
-			clocks = <&clkcfg CLK_FIC0>, <&clkcfg CLK_FIC1>, <&clkcfg CLK_FIC3>;
+			clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
 			clock-names = "fic0", "fic1", "fic3";
 			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 			msi-parent = <&pcie>;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
