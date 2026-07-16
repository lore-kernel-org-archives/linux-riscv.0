Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C779C44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6bZzBmjrEokdN4V3x6WtJIzdwpIR/HrzpvnTWchHZI=; b=NQNLz+kd7UBoDw
	COXUjFWQeJxImSoss4UfnIuAwp0HJ/OMGdA/4yqgHuXJ3rjAORkVzUOYyB4qa2HqAa4AXgQqF6qgZ
	5X6APCjV6Ho2tiHT6EFf6x/LPcKx1spxMEKUzl+WNRws5YIn+VlnmH1QzPH6cHU32nUZRxs+j5XXv
	339Wq3PManxaU7CLf0tYSXDKMXXpgnlmWUSwYWmSo9lwm2WxxFo8bS+AljtCJtgRWzDoZsy/YV3VE
	AJ8iypMhADq9SrUTxaOUfW4BQaogRuLIbvzteOB5+F7P06o0m75z1/gI90/IDqtSygwV0nPoONrlr
	nXH+HTEW4HX+caWoqHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThz-00000000dDT-3J0E;
	Thu, 16 Jul 2026 21:33:31 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThw-00000000dAQ-1DuC
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=MFR1Hi6i7aIKGEkXYS12ogWQN52DsFNDyd9nQVlY3ug=; b=lIAPXGHu1UWFC4BqQrawNnCUKA
	e80fwyDrqESRH9Vl59xIw0c+jGY4QNxbSDYPfP17VnYb1borax0BwTBiFg4SIhDYA04cmAJFxb83n
	mGzcPO37U2Po3qVeAl9+Ie/vZWzl/oKKx933nTkrRybC/bDXmmOfrQaGVsdIJJdRxNA/380BpdMdC
	K605UUOfOxvj632h7O79YAvzFtVFcl3PHfLFjUV0Wr2bAbb4y9N7Yie8DsGSvIBKHB7udwu538P8I
	BVMUqG5uyX9vZH7WzSkEm7C9ZPlwdBUkfCCNOkUuu3GVi1odRJ1iGIDFHJ4QdDzC2luu09EJD7ZWd
	bPFgWzaw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThu-00000003GZ5-0Nb4;
	Thu, 16 Jul 2026 23:33:26 +0200
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
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/4] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
Date: Thu, 16 Jul 2026 23:19:03 +0200
Message-ID: <20260716213314.3027969-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
References: <20260716213314.3027969-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143328_357723_D02DB32D 
X-CRM114-Status: UNSURE (   9.86  )
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

On the K3 Pico-ITX board, the controllers B and C are used in USB 2 mode
only respectively for the M.2 B-Key slot and for the RTL8852BE Bluetooth
controller.

Add the two controller nodes and the two corresponding USB2 PHY nodes
(the PCIe/USB3 combo PHY driver is not yet merged) and enable them on
the K3 Pico-ITX board.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 18 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 65 ++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 4aa7d56fb7568..011a35e6372e1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -325,3 +325,21 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3b {
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index fc46e34465e47..b14bd8a164537 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,70 @@ soc: soc {
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
+			phys = <&usb3b_u2phy>;
+			phy-names = "usb2-phy";
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
+			phys = <&usb3c_u2phy>;
+			phy-names = "usb2-phy";
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
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
