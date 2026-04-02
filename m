Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D524D3940B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4nnYo0ALWr3CuWNjasu6L/8v6qwTsJ1Iph7FqW63Bo=; b=bmZaTug6yo3XSp
	R2P/NgPpdDzgDAelrX+QE5b4uLWnmwybkGRif83CAeXr8y20dq7dn1XBqqLbNS1bKxvWuvUiHAvS9
	uP2zWhHoBk7WXUc3n8xpNHIRey5b0+87TYqcy+5R9Y7/fnrrO5jGDTJ5t8/ErieGKWvjjkWlOI/q0
	ouC9KjIkUsaOlr0r7JPDadIRppdwU1ZAI90UOQfinVBTocdiIHZ4rng1prtACuLTHDB76qd+8fi/l
	3oNprEgJEsvgSBKLCumuJKkgRFxKIkOxT5Gm7U0Y9K7pvvENRejWmFRapfCsoy8L7aPgvAsX7egE7
	V2Cter9NuhenjJqWgNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Evb-0000000HLDH-41QX;
	Thu, 02 Apr 2026 10:05:31 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EvZ-0000000HLCW-0nVz
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:05:30 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 394e0eb06;
	Thu, 2 Apr 2026 18:00:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Date: Thu,  2 Apr 2026 18:00:07 +0800
Message-Id: <20260402100007.110201-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402100007.110201-1-amadeus@jmu.edu.cn>
References: <20260402100007.110201-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d4da3133903a2kunmcba6113b55c1ba
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkIZVkpDTR1KQ0IdQ08eGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030529_417788_0117D4E1 
X-CRM114-Status: UNSURE (   7.03  )
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

Enable the DWC3 USB3.0 controller and its associated PHY on
the OrangePi RV2. The onboard GENESYS GL3523 Hub provides 3
USB3 Type-A ports. Enable the corresponding VBUS regulator.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 929b70d384b5..ab835c30dd86 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -52,6 +52,20 @@ vcc4v0: regulator-vcc4v0 {
 		regulator-max-microvolt = <4000000>;
 		vin-supply = <&vcc_5v0>;
 	};
+
+	vcc5v0_usb30: regulator-vcc5v0-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+};
+
+&combo_phy {
+	status = "okay";
 };
 
 &eth0 {
@@ -111,3 +125,13 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	vbus-supply = <&vcc5v0_usb30>;
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
