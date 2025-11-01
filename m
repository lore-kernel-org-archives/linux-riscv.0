Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A98CCF9F0
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqElp2IRi9+0Gn9khNMS8IcsmNhpcf3wC6vcnRJL/To=; b=fHMNG+UjHVj45v
	5sXVWPlDIkcSp6kMCrp9erdBkJTnh67YZ67MlAC+HDJ+4xNjX4cnAeOEQD7RbrtteAUo2J8b2im0O
	6aU66WRjKafZbIW2BxdKTbpsZYLaIz2FTre3kGDHgLGNWLFn1xWcyXsUXCQjq1ev5HT93JBQtYvTX
	0R1xjDi6p+cAn5O2XIsUsloBH0+hBU6549fFR/J+FfPGbksBv5KxDHQPBD7Ozaqfu3/VsUn1SIVVm
	sV2nq/NPrFAZQtMasSaTDQr6XB+ENOqh8F4c8XwG+Lbe+4x7pLMfDnoTYOCd2WChFBWdqyw+CCcZD
	VhPZ1acP7rkxE4JKG1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wn-00000007DDt-3vKF;
	Sat, 01 Nov 2025 09:04:05 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wk-00000007DCa-38bb
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 09:04:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761987840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBiJs2WQjHw8UYmAw8T778QlQ1tMZTE4odg9x5Nma9s=;
	b=eKcrB4lf7+ICg25rkrUi1rF6Ld0go7A3Zu3w+BzvbL5UK9y5J35vB3+FTZkvdynrMASvDA
	1u0XTIMTdm2uEOmnGQH/+PCetg0c0VcSB91MNyNKpCQK0TYHOG2qD8jyzS6/nwnpQOK2Ac
	mNMN2cCH4/mxbA9SLpEPBuKbwN0Dx0Q=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 01 Nov 2025 17:03:26 +0800
Subject: [PATCH 2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller node
 for K1
MIME-Version: 1.0
Message-Id: <20251101-k1-usb3dts-v1-2-dd2660e5740b@linux.dev>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
In-Reply-To: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761987811; l=1584;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=3YiLR57+6Dxa5xB+On0XN2AuxKYOGj2xQbXtnep93Hc=;
 b=RO46HnnWwT5Ud1pKk+OX7GYV++DZhj9XZff79ejdHzVGBoGqcQkQE+0tDK7JexlUvfaAjLgJM
 L2D8gdD/x7YBgwvzqJLmGowi92qLrPqw1qgxKu+ypEpEq3orMojnQUe
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_020403_068584_FBBA4AA0 
X-CRM114-Status: UNSURE (   7.13  )
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

Add node for the Synopsys DWC3 USB 3.0 host controller on the K1 SoC.
The controller resides on the 'storage-bus' and uses its DMA
translations.

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index d4d3c6d88a29..1d1c6276e9d0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1010,6 +1010,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb_dwc3: usb@c0a00000 {
+				compatible = "spacemit,k1-dwc3";
+				reg = <0x0 0xc0a00000 0x0 0x10000>;
+				clocks = <&syscon_apmu CLK_USB30>;
+				clock-names = "usbdrd30";
+				interrupts = <125>;
+				phys = <&usbphy2>, <&combo_phy PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+				phy_type = "utmi";
+				resets = <&syscon_apmu RESET_USB30_AHB>,
+					 <&syscon_apmu RESET_USB30_VCC>,
+					 <&syscon_apmu RESET_USB30_PHY>;
+				reset-names = "ahb", "vcc", "phy";
+				reset-delay = <2>;
+				snps,hsphy_interface = "utmi";
+				snps,dis_enblslpm_quirk;
+				snps,dis-u2-freeclk-exists-quirk;
+				snps,dis-del-phy-power-chg-quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,dis_rxdet_inp3_quirk;
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
