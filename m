Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60827C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGHjVPLAtFhn2NlNWrFY3elieayIv6G725VksrRpGyE=; b=t6s3hmFT5wv3Lz
	+zAcaGA9Fxoo2GYeJ5eDbUkBbHHmWBDt1PTkJbxbp8pHvGWmzsJzwlAUZS+CFcFcH1AxMFR8eDH2C
	GQT+04zxiJ+9f0RW9rFsBVHVGHTyfjJT/8pD8f+IvvP+aI6mJ+zyF9X8vbVt55oKJdWgIUI/Z5no+
	ItvT5YVIDFPiRychalzUueLpLfL71dIbDm3ryyVkh6gHK5FDHrasCFO95ISXn+yMBg+35RBy4OO3Z
	dsIZEENxuT/AllyDUgE30E0RBuNElzijnCiMoAxhXfwDmSYtGcGOhFjpPJt4XIvt2FVJFN3vzD+hF
	h0i6xNbxKN7A9zHndLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncon5-00HOPY-Mh; Fri, 08 Apr 2022 13:36:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncomn-00HODt-Sw
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649424985; x=1680960985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WqzRPC7S8FgWbVe1N2Ss8o565KjZHWpG+6XZV54ABig=;
 b=arHWdtbH4erupZBqbQQ1PjF3GmxzhMlVV0biRDf0J/tVdaqxqLoY5hfu
 mJD5xxQWJQnntg6eV9yKtKTAU3xnCZ0gKxFydpp43GvhLoxiv9822uSKD
 1kOttip8fpu9cgDqGZghDGPcbWYA7ns+blxDpsHDaiFo1s1EFVkZOlk6v
 MPe1zSyiKLgnHMYe9sfsmX2v8ojNfWU42hVUu8IQYsCIUAXpuunExyxZD
 K2lS6yewO6sRYdT/5wz1j3/Eq5B2TrAPSgPfI3/epRgms+eJ46C2YKqBO
 dJ7Zk8NDzJ/d70+T3N4WQAg5Uhu/re4OmRBUDEWISJfwgS+4zPkf6XITP A==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="154919623"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 06:36:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:24 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 06:36:22 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>
CC: <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 3/3] riscv: dts: microchip: fix usage of fic clocks on mpfs
Date: Fri, 8 Apr 2022 13:35:44 +0000
Message-ID: <20220408133543.3537118-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408133543.3537118-1-conor.dooley@microchip.com>
References: <20220408133543.3537118-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063626_071140_1840DF7D 
X-CRM114-Status: GOOD (  10.79  )
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
