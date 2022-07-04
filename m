Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B87C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL0PdsvRN0GjV8gXNnu8nftyEliYmr2WR8zvtMIhyXU=; b=Ovz8kqr8b4J0k0
	qcYKIcEDxiumGI7uTveIVC8MZFSqbB2d7y/jRLYJsBi6h0c1/xFH4BFYi5Pi3xVYmlnQ6ma/cvwkC
	DzFf48MuxTIeq3Fm5z7MGRZAd4UzdhYtx15QrdcJhlzkpYqjFgu97eM4PajLb3dgNS5HNnQqsUyB/
	NNjXED2dKM/YkLB2R5KmmAHxoX8EEylc7FfTe9O2Sym7AkviT0+1ATRxfKNwkLdsTb3nOegsUYLp2
	XNgi88y9UbupLMcJWMve4EQU2Hh7sHLu90vimQar5wB7W0v/A8xiOpPpuMAPP76pdP4dyj7bweqid
	R5uTCFrGL8eHSY+SRrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0L-008fIy-9f; Mon, 04 Jul 2022 12:16:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0I-008fGd-K4
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 12:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656936998; x=1688472998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vbBZBVb8B22VRpxKb/0dz1k5O/GgdpM5EBwjjdArU6w=;
  b=2bRFkmWktuiHpw3oLbf2RY8gOn/6wc1l/ErD4PDC6oAWr26yP/QrNXa2
   BRjjQzp1NTK4mHVGlqRgDUvr8pXyt9dDdW5bRf59rVOMfyditeQZeMmJk
   8OmY9GXvclhfPVwrFqvr7T2YigR4TdKi3FvJWdq+iK01vWNXX6Pmy5emF
   es6/e4e+q0VuEouDBBneXUDzVf/CF3+MhXO6XJFqEu8VZMigKqK67NHAE
   xpAEc4NL8ERPrzovV3dye5KxbICsNltrzOb9cdSE28iE1rifrfXMMg8uk
   eeqCADDXAAbXUE9VOui8c5KmN8PJMA2xRiGYXJ7nTBZWjRMj1nUjk1ods
   g==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="166262012"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:35 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:32 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 05/12] riscv: dts: microchip: add mpfs specific macb reset support
Date: Mon, 4 Jul 2022 13:15:52 +0100
Message-ID: <20220704121558.2088698-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_051638_764610_E81AC4FF 
X-CRM114-Status: UNSURE (   9.95  )
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

The macb on PolarFire SoC has reset support which the generic compatible
does not use. Add the newly introduced MPFS specific compatible as the
primary compatible to avail of this support & wire up the reset to the
clock controllers devicetree entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 8c3259134194..5a33cbf9467a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -197,6 +197,7 @@ clkcfg: clkcfg@20002000 {
 			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		mmuart0: serial@20000000 {
@@ -331,7 +332,7 @@ i2c1: i2c@2010b000 {
 		};
 
 		mac0: ethernet@20110000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -340,11 +341,12 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC0>;
 			status = "disabled";
 		};
 
 		mac1: ethernet@20112000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -353,6 +355,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC1>;
 			status = "disabled";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
