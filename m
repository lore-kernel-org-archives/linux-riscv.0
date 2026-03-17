Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7F7FD8741
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgIHgO1b2lc3lFOLqEew6VVrXJqMblQ22RVP/FXA+zs=; b=cqP3aM2gPhV2su
	4oRDCECA2M+24HyfLIyR563KuXEWJX8dH55RwPtyp+YSxUH60HtluvexmMp2oZVNxfjREE0iNbegS
	6hk0ZArMk44KHs2FXx6NfY9CSC9V9DSVGRjGCsXg7M0r50imsR4THpNAsf2zE34naOHNaTkzgTQlK
	S8CFaPGGprc/xDZ/nUMfTzAQXtRrPg19oS8s0Ej7Lf7r7dT12Fc346gjlNmaiyZgWukxcgWEnGIDF
	/rZzYckKXuaR/LA1wZn4FZ5FHtW+QTkCl53TiKi+tePSSQNqdO8PYfKI2pBh1LJthQ4d7GiECEm9i
	lW80N9xU1JLpcO2H60kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Szn-00000006EiM-17TQ;
	Tue, 17 Mar 2026 11:53:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Szk-00000006EhF-3Ctr
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3495140642;
	Tue, 17 Mar 2026 11:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F918C19425;
	Tue, 17 Mar 2026 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748436;
	bh=TFbRVqkiInsEoxByPRhntBXJ/89VgAXqRLdHlEElC7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W3u8qT8iX234qAkuKOT9R26PYD+5bu2AUIllqebot0uqXoiPPE4tOdug0gfa/BPaw
	 Syu/+qdCe6x6VWor3PJFnSgJiipkI0kCSktHcjO7cLuFApKu5sqFdsnp9lvOcCj1Qm
	 KS1bBR+NBsZJjbTJMDUIK8ZAwG5NdvXrWnzI4LEJ0attIalJTV5delmehHHG4ybOSL
	 JpXUJLeAXIl4dCORdwdp6GSuqag5MLSkliqiN/c0Wm73GgBrzFeVAP+qt4Fp6Xke++
	 sW6kBdgbpnqyQsXpgYlxW7HfbhT6ToXrj0RHXG/npCofPfGZYCWYrK2k8S7pRSjTqe
	 mXOonvHUO6DqA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 11:53:04 +0000
Subject: [PATCH 3/3] riscv: dts: spacemit: k3: Add USB2.0 support
MIME-Version: 1.0
Message-Id: <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715; i=dlan@kernel.org;
 h=from:subject:message-id; bh=TFbRVqkiInsEoxByPRhntBXJ/89VgAXqRLdHlEElC7Q=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUC6kxU8ZFSs2QH7Z4NuaBBrviz0VT4CX0uH1
 cWSalc4mTOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2k3Q//bs4WGQhdkRT0+EcWnZCioYvfBVrvgHOMCDRfGx7m1s3UboTsulZxr
 Nyl9PXs+wWO928+4hTFO4mruZFfKfgJjSnNBsKPu851XwxH6YksaTfg+bHpZvoEqFjbZI7hS/uI
 fAXyOEs2w+vCBhEvObn9GnHnofejHUx5OPwCCfNnRT0FxRXq5LDSwBpnNNCGvP1Sy0T0cZ0o3y+
 /W5e+3SzK/YqVRSA8ZC9FnCbTsVSJNZDvAjAJGrV3vOH/UPod4lcxDL87ifoFnDZLY2Q5GJnWXe
 bRmzq7epQYrxCPeLVOHqzmH8ydpcBGhPMw+bmLWas9VLXv4AjZfGAzdl/yjHIHXVzqo8kP+PCyP
 TsA+0ps1XDrsNkSow9p33OxDM13Z06s4My2apY2X797if/EGBtO+o01ZVA/L8bBpaBQWHdsvqja
 OBpmPtjBA352x4E68wQeKBk3Sv8U/HlECPdCSc02pDonbq/N+SFIclwAjRi46QnfKnSK8z0R4Dh
 Ulhtt8303xkWJ9cV50RwH2yDgzf9lr8gHELeGOYmql8rd12iWcqgFoTMiGOY7IJATO8aYFy5/dB
 Yc+K9G+MAu+ozZ5XNnItxhLX2de2DkMz/88r7CrkTeyb8Am8aIzTcaafOPpgZhxgjzmutpd5qyp
 XCEcd0r9eEP3rInm5fONYMBP28Hdy0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_045356_853974_706BAA05 
X-CRM114-Status: UNSURE (   8.08  )
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

The USB2.0 controller on Pico-ITX board connnects to a Terminus FE1.1 Hub
which fully USB2.0 protocol compliant and provides 4 ports.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 24 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 31 ++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..393a0ce65efc 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &uart0 {
@@ -30,3 +38,19 @@ &uart0 {
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
+		vdd-supply = <&aux_vcc3v3>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..52be168a0496 100644
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
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
