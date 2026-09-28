Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479FCA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPltB6VguDzu3dUM3xGvRXe3Ar5gbWZnRAQ0IL9CT5g=; b=LZlel1nO366vbH
	pPp6dMOvslFfn+7zwkF91iLY4VwqUTeenb9/gxMWFqX07C/thEtFrj6vuxGfQAD2Fn04sLiVmjapT
	ISlBqLoAFR59AHb6ytrQdO9efl4ITSBfUtadKOt06jj/je79IOp83Av+yRSCstE94G9DFv4/Q5MTB
	KidO2BuHL15No52i0zwxcjFn3/xAsIafk9179YnJ9odohqtf5GuqriidlJXBbNvB/mKKRaLgXc9FO
	U1goGkpsxYQMeuwfIeWVTkTik61RzkmBlMG/ykC7tQqlQjnJdJvxYmLNRg2Zkjv7rbsD9j0wUJvWG
	+6Km7Jq9nkY3MVYuAxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJR-00000001c6z-2tj9;
	Mon, 28 Sep 2026 20:51:01 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJL-00000001c3m-2Vft
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 20:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=DlQTGPWIR1/gHzQCLPtQyd1MJT+Ewj/blXbZlbpNF7A=; b=CxWQjxnL20OdvhuGdPm0JTP8R4
	Tyfeko0q9n3MeN4D+r6h+gLZNiusyuqEhdZt5dj9ekBfMjUE30k5zLdXsCykzD4LaJFK2MosCPBwa
	3IS41/YYAkslAdrB3sna0epQ9MVZPznfFFqaUxTtjPh3pgNqhSg2RoJrzRGIAt4um96NX4RiYj08X
	EUX38Fkym8gQTtWTDxamqw8D3hjlVEME27ZQPRavKVZ5AG48kLAIChMCAzAfyZA+4pbK5uxGSQTfw
	gh1R/kbTy1RGCftY+t73s2NKVbwoaArx88SdYFQkWsQN30SESwAb9UAqE4AD8urBwliPYoIhmRZBd
	toUbj7sA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJH-0000000F7qe-0Rly;
	Mon, 28 Sep 2026 22:50:51 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 2/5] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
Date: Mon, 28 Sep 2026 22:49:07 +0200
Message-ID: <20260928205012.3689405-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135055_676792_11B5CD2C 
X-CRM114-Status: UNSURE (   8.79  )
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

The SpacemiT K3 has 4 USB3 controllers labelled A to D.

On the K3 Pico-ITX board, the controllers B and C are used in USB2 mode
only respectively for the M.2 B-Key slot and for the RTL8852BE Bluetooth
controller.

Add the two controller nodes. On the K3 Pico-ITX board, enable the
controllers nodes and add the two corresponding USB2 PHY nodes.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 22 +++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 60 ++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 0a6f669d509a9..5aa6fa89cab58 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -323,6 +323,28 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3b {
+	phys = <&usb3b_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
 &usb3d_u2phy {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 1af47b7f1c8af..cf1c8b572c86b 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -441,6 +441,66 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3b: usb@81400000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81400000 0x0 0x10000>;
+			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3b_u2phy: phy@81500000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81500000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3c: usb@81700000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81700000 0x0 0x10000>;
+			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_C_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_C_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_C_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3c_u2phy: phy@81800000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81800000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
