Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF21061B22
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gx5xOWrjSgHPIhhlLULyWsDK8W9OsmBFneR27702tCg=; b=xmrR8dUUw9eEdL
	gvalg1391UkEMb/cKkv9OIryAHBHC35uyiuU30Sp4TDrYqquEThtWQFaR8ccA7iMxe7CB1JupckHv
	bjRQ7jTQsVf9BNP18tsTLr7+t+zuTebv83Hri2tfbkfT5l0A5KLiArn0EzK2W7cK6z7epEJKsQn5O
	VmqHBcGrKVuCNAqKh8OVKYy6AnrMTaWXnflZjW5k4pWHRQh/IdgeMw/rklyDobyhlVb5Mb3Ub4g2w
	nV9nNtrSIkbqzOdgVyRV//eSUNM/8e9jDRd9KXqJJR9EIKDE1ddkRlaPTtJmnx/Ex8hjCvzTuM9fm
	qmMKcfGIKcwtYBetl9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KtS-0000000BxLu-475H;
	Mon, 30 Mar 2026 22:15:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KtQ-0000000BxLX-2x79
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 22:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 053184405E;
	Mon, 30 Mar 2026 22:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFC4C4CEF7;
	Mon, 30 Mar 2026 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774908931;
	bh=qjAg+6PPtxvBWUDMLHc0BJyd1JvaxoRS9Xtij8EoysI=;
	h=From:Date:Subject:To:Cc:From;
	b=gxdJeiPrr55bjs17cHuNG9EzbzU4znBjus77AH0SbQsg/vbtWuXbSH5BOUiO5Dfj7
	 3vAnyJN7MAWnD76WlCVIPT6NLmFp4zylNbKpak0PhpVYP56kERFb4FhR1Li1W1jxKU
	 vsNraXSz+3BAHV9ucPJZ6fIHrjS0ugXaH9jUG9PXX0bncP22on6WVk1A3g6GnX4fEy
	 zJ5C12wlM/9jbeRdQxfraBvIheHcnWmU630+Xbq8YG8izgx62+d4JW7ulC3DTfuyWQ
	 Et5lLW9C53Ov1PUzFOazaB+Bhl/3RHQoElX2g53hBD0cohdas02zjySEr+wskx088M
	 77IWmdZReS1VQ==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 30 Mar 2026 22:15:21 +0000
Subject: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
MIME-Version: 1.0
Message-Id: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPj1ymkC/x3MMQqAMAxA0atIZgMhBQWvIg7VRg2CSqMilN7d4
 viG/xOYRBWDrkoQ5VHTYy/guoJp9fsiqKEYmLgh5wiJcXN428iE4TJsWvJSIBwclOqMMuv7H/s
 h5w+ZV3duYQAAAA==
X-Change-ID: 20260330-02-k3-usb20-dts-670aeb20e2d3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3947; i=dlan@kernel.org;
 h=from:subject:message-id; bh=qjAg+6PPtxvBWUDMLHc0BJyd1JvaxoRS9Xtij8EoysI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpyvX+mHVaKIYWYUOcJdpo03hzTPbH3SDDhkNhx
 6Bx2v9OmeyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacr1/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1JNA//ZAO5nSqxrPRkZ3DQBCfxBUxcLrgs6rV12I8JEO+tumXMtoH52NhI8
 vVMiUeBxdBhKd4KWNQZe/ftXzFttoJ/ZbNhUegQAbO0CPkpKnB+dAPy4NaXhE1lm2LsORc/dTFw
 +sVY3dnYQ3B8CVJB2KBeyApWJ6uHe9ma8EC3OGjVhWUuaTx1R4tdK17wsi5egaR8zo6rMPB5UWD
 MfRkxtnWPCmzKMSCifJ8/ukGwH+I+hcBxnc8bpuh+cFeQcOAQ38IylTRCFuoG4rkCPOq6kKtuW0
 k6luBHqGSyT5ySXto1O2rpFXvBZS11TSYZ41ml2X+7D27qEe12c1wjVftYDGKihbQQ097ffH0w4
 RDG4yMc9V0ahie8ZwI1Z5z9vMh0Jt461SXmcZfBiwLtoI+pMoEobhf2wvo+s8j2YKqI+/rTxHda
 KCBFLkQG3V2ZAWK1cvxldLhqJdFa2yG0H1LmCZBQwG1frb1TDNp3NcOxV5uVtR58Gld+VSrZGjm
 bdOwt6istzFfWL0ub4vGLnY5oRNJkk3l3YDEmCU/yv6NsKApPWQ6q6Ry1o+0jgy4bNwHb/ANzdZ
 TVFnA4nQH7T8AKvbSRODsr6E9LEk2bdsbvN/3O3gx4fPpiuACO6pjDwpchZdTN1EmUOzLOAn5VM
 py6IAqWrNugDWIhNRyOgSCIl+TfpOM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_151532_827392_939BBB64 
X-CRM114-Status: GOOD (  10.42  )
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

There is one USB2.0 host in K3 SoC which use DWC3 IP but only provide
USB2.0 functionality, and with only one USB2 PHY connected.

The USB2.0 controller on Pico-ITX board connects to a Terminus FE1.1 Hub
which fully USB2.0 protocol compliant and provides 4 ports.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This series adds devicetree support to enable USB2.0 in Pico-ITX board, 
There is a run-time dependency on USB phy[1], Hub[2] and reset[3] patches,
but each series should be quite independent.

For people who interested, I've collected all patches and put a complete
branch here[4].

Currently, the USB phy[1] patch is still waiting for maintainer to
merge.

Link: https://lore.kernel.org/r/20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org [1]
Link: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org [2]
Link: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org [3]
Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [4]
---
Changes in v2:
- separate DT patch out, no code changes
- Link to v1: https://lore.kernel.org/r/20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 24 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 31 ++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 4486dc1fe114..b89c1521e664 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -26,6 +26,14 @@ memory@100000000 {
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
 
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_aux_vcc5v: regulator-aux-vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AUX_VCC5V";
@@ -197,3 +205,19 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&reg_aux_vcc3v3>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..9eb2ff07218a 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,37 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb2_host: usb@c0a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0xc0a00000 0x0 0x10000>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB2_AHB>,
+				 <&syscon_apmu RESET_APMU_USB2_VCC>,
+				 <&syscon_apmu RESET_APMU_USB2_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			interrupts = <105 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			phys = <&usb2_phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
+		usb2_phy: phy@c0a20000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0xc0a20000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		eth0: ethernet@cac80000 {
 			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
 			reg = <0x0 0xcac80000 0x0 0x2000>;

---
base-commit: af62a095eb0c3359d477b55ef72d2afd94c83c8f
change-id: 20260330-02-k3-usb20-dts-670aeb20e2d3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
