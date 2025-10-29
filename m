Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B2CCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4toUDXY2rPujF+ro+yKW0igwJowdwxnN7znTrY3szmM=; b=fuyx10LvEUITEC
	we4N1IlTP/yOXm/sxxz8AnhED62Ka1X+aN09X7BXIheU8+kO184bDrAnKxvCeoK4t8VrUft7KcH5Z
	oJckXnoN24VlVFhlvBYHggtnmzV4d/iyBHPriUFaeB/GaZ+gSAFTbXFIQW6wIg/okG3Gukon4Y1eD
	fxkEcDCEDXYvqAeUNG8YtQx0CxJq+F+o3rCH3B8ihOJpRBpZmtRNK9SPXC1w2dcARqJFuEXDbWIEg
	uXaT/Y0v3YY+Zkfix3jRv5PtrZjwzY8hd5wA18cUZqM49spFe744YUXPZOk88JY4v/j43zfIpbNnq
	xasEFdgMbwLo6YSS5HbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8m9-00000001wiB-2zl8;
	Wed, 29 Oct 2025 16:11:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8m7-00000001wgJ-47z4
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDC264916A;
	Wed, 29 Oct 2025 16:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FEFC4CEF7;
	Wed, 29 Oct 2025 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754310;
	bh=o06pwj8GQhduMpl8X9PMCjFDAGlLMLElJucB88tSCYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0gI1KfZlA0/45L4U9eJrx6qpu2IGzA4wsjML93oPVhLNXOYtnWX6CXllgZboqBWY
	 vhyfgBB7crP61m7dAm7gSTWaW2puf4AiUZ0jf2IkEAYPPAsdIeOWZ46byVOAJny4vt
	 vCJBbKeyLaK6wA0nB1rKUpAWQmZh4kYAkvaqM4xicqU5J/X+9ELkj97AtmW2+tIXA1
	 mOQw9x9JmMJRo7iiaGICMrZLj6sNQ9IweicaszD5IzK59M50W6DfWee2Nm6kQWLMB6
	 FLvzrC/+KfgsiMu13uEq2OeZqvvKZpp0eFsDRZSnXJak8K7tXoyndkITATDw8434ED
	 dcNcJp4fIBM5g==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/7] riscv: dts: microchip: convert clock and reset to use syscon
Date: Wed, 29 Oct 2025 16:11:21 +0000
Message-ID: <20251029-polyester-dubiously-55915f5c7962@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+zR8fbMXO9YW4YzwKnjp5SrmA8iRht4FGjwYBRXJ6yY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlMNut3HPy0mnNWf/rhFwWOM+01G8SW19s+mH++M/St6 h4r7aurO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR0/EMfwWVq15GmWRs9jj8 +qGyFMu2KuEjAlv03W977glfPo/p5yWGf1qL9SO2Rmddm/bttfaSq9/2h0pYNjKHWDqx8XfUNU7 ezgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_091152_067540_85F87628 
X-CRM114-Status: GOOD (  10.23  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The "subblock" clocks and reset registers on PolarFire SoC are located
in the mss-top-sysreg region, alongside pinctrl and interrupt control
functionality. Re-write the devicetree to describe the sys explicitly,
as its own node, rather than as a region of the clock node.
Correspondingly, the phandles to the reset controller must be updated to
the new provider. The drivers will continue to support the old way of
doing things.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index f9d6bf08e717..5c2963e269b8 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -251,11 +251,9 @@ pdma: dma-controller@3000000 {
 			#dma-cells = <1>;
 		};
 
-		clkcfg: clkcfg@20002000 {
-			compatible = "microchip,mpfs-clkcfg";
-			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
-			clocks = <&refclk>;
-			#clock-cells = <1>;
+		mss_top_sysreg: syscon@20002000 {
+			compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
+			reg = <0x0 0x20002000 0x0 0x1000>;
 			#reset-cells = <1>;
 		};
 
@@ -452,7 +450,7 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
-			resets = <&clkcfg CLK_MAC0>;
+			resets = <&mss_top_sysreg CLK_MAC0>;
 			status = "disabled";
 		};
 
@@ -466,7 +464,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
-			resets = <&clkcfg CLK_MAC1>;
+			resets = <&mss_top_sysreg CLK_MAC1>;
 			status = "disabled";
 		};
 
@@ -550,5 +548,12 @@ syscontroller_qspi: spi@37020100 {
 			clocks = <&scbclk>;
 			status = "disabled";
 		};
+
+		clkcfg: clkcfg@3e001000 {
+			compatible = "microchip,mpfs-clkcfg";
+			reg = <0x0 0x3e001000 0x0 0x1000>;
+			clocks = <&refclk>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
