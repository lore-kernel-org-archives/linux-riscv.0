Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC17C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NuWKAiBdVF/UTN5k1+Dx0EBeRuEW479C2NtvM72u7A=; b=rA4+0JLnTPFdU+
	CJQc9Q8v4gdpFcVl7SNMSjPfYUk9t/e5xClNKsOz66ipPdO1dMwCXCAEznvei99RJ71UYg3lvFr9/
	o67JeBClgOLyNjUjd9fvNz17gjBEHV+ekSrUU+wUyo0Q7eg9K2ea06fwG/qqJOCf6YYsVBxBf2GD/
	X76UFZkFHbkSRoESbkIsbHITIEY8NIO2Pv6HjGsR5+tvu+uNTM/Au/rsUhcMShMrl9lNEAhdf4tZz
	6bOcwXyJp4UKXPE6kIXz/URnukfALoBApjRw2+EEHPP0VhzJQ7vNJzhnyTZn27mlIpz3ODG6FMCtC
	wpMmgR2Oflbj+PaeqWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpxD-007jM8-86; Mon, 11 Apr 2022 09:03:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuj-007har-JD
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667649; x=1681203649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPt81KGByL2JT3h91dRTMfPIeeyxRYvMJGbksSYGCkQ=;
 b=lwG3my8wtILXVpW3tuPue1yGyrx8cjcs72RR8pcXvHvVtsfY5VbZWzyY
 C2zFiJlXmLEQm6QgFXghREVuyKtqmZPjrd2JylXT7YLjPCPAZEa6bume6
 EVs4exKcMQHoUofqVzJIRHQClCj8GXe9JEd91B3uNLUf7Ec+CfSqorOYX
 LjSeml1leEZOMzICocrLRg0xP7wfE2DHt0Oxq7eqffk+/4kVFe6WqN36B
 hGsddOAwefXTE8d7dwMn1CXV4MmK+W6bM/2YiWrmj8C+X3+W3bLhz3+Ap
 bBFlpqlSYp8D+L6bAvqrBVAtDrIx9ReoOKC+h5qojePR2qTF+XChhB/RS w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="155113068"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Date: Mon, 11 Apr 2022 09:59:17 +0100
Message-ID: <20220411085916.941433-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020049_800965_ED8CFB8A 
X-CRM114-Status: GOOD (  11.97  )
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

Fixes: feeb38685523 ("Update the Icicle Kit device tree")
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
