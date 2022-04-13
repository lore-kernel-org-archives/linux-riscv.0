Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6D8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hONhGXKgokPiHh1QFpu9F4eZNl5AG9Re5YEZBsPjSVM=; b=3MJrc7P73A07le
	7AMWlFcBRPPAccJfSvZOK4YwkmQd9zGvfhuhGDYC94Dv1rEbJlf2W6ITPnqp3b/b9iUqfOP7Hkd26
	CJiVOOCLAvhFXhmjhkJhzqRip1zBLP7IR0WdJtksg26GvWiChW5gozKobP3804g0AGX5N1XJ84Elm
	rvvDItgCFAU3vQ5wsMbsfGodEq9nLgRvhSLuu06MeLQTC/NvqOgPQqPLty2shWrPSxeK3ii+vSg6a
	dHkSTuHQFasptMFPgTapzpafTK0gqKjk52gh/ZrZGxVSmueDQLY+mWwU/c85mcu/BDBFnYUZXlVSL
	VToc3VO3zQKBL/p/qE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXxa-00HWPw-RJ; Wed, 13 Apr 2022 08:02:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXxN-00HWG7-5i
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 08:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836949; x=1681372949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oTEpoAPnyso2h61BCD6hUWgh5IMvEBbrEh0BiLEeJ8s=;
 b=PcVbmL6eEoFl2NwF/9J5lVl7wWaQDbk8zxP+ZiqDu7VZqr3ZqOR2QPXB
 Um7nB70X9wMlrav5MS1p2XvOEVFao6A9HJOsMHNU1bX1c/nsI2pLb0df2
 iV2dxF+54ZnFrVJXrrk6leXIPRU8WzCpYhNx1XePfpJnQ0yt8bcSijtR9
 BI98dM+9mk9YWnLhnV6PbBRaG4ZyDW31FkC+x7rTEAPDHY3/qvElFLx+P
 QzcwYE42y2jdtljhU265nn8j4pV9/zSwDHVUWlv770lrt+ixiR3g0eZHs
 /lg0Ejt1Qt/CwFf+FW+/UA9J2zC7gzzWh1AFm0nv0N6g5hQpf1jpksJri Q==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="159940090"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 01:02:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 13 Apr 2022 01:02:24 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 9/9] riscv: dts: microchip: reparent mpfs clocks
Date: Wed, 13 Apr 2022 08:58:36 +0100
Message-ID: <20220413075835.3354193-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_010229_248085_40046900 
X-CRM114-Status: GOOD (  12.76  )
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

The 600M clock in the fabric is not the real reference, replace it with
a 125M clock which is the correct value for the icicle kit. Rename the
msspllclk node to mssrefclk since this is now the input to, not the
output of, the msspll clock. Control of the msspll clock has been moved
into the clock configurator, so add the register range for it to the clk
configurator. Finally, add a new output of the clock config block which
will provide the 1M reference clock for the MTIMER and the rtc.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts      | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index cd2fe80fa81a..3392153dd0f1 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -45,7 +45,7 @@ ddrc_cache_hi: memory@1000000000 {
 };
 
 &refclk {
-	clock-frequency = <600000000>;
+	clock-frequency = <125000000>;
 };
 
 &mmuart1 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 3b48b7f35410..746c4d4e7686 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -141,7 +141,7 @@ cpu4_intc: interrupt-controller {
 		};
 	};
 
-	refclk: msspllclk {
+	refclk: mssrefclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 	};
@@ -190,7 +190,7 @@ plic: interrupt-controller@c000000 {
 
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
-			reg = <0x0 0x20002000 0x0 0x1000>;
+			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
 		};
@@ -393,8 +393,8 @@ rtc: rtc@20124000 {
 			reg = <0x0 0x20124000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <80>, <81>;
-			clocks = <&clkcfg CLK_RTC>;
-			clock-names = "rtc";
+			clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
+			clock-names = "rtc", "rtcref";
 			status = "disabled";
 		};
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
