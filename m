Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F08CF31AF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMymppqR2Ebc842CQft5yRT7N5f64DJ+bYK4cLANowU=; b=s1ndjfC/bOpQuV
	lrcshVFWRKJ1p0XQKZQhUMz1rJQp3jJK05s4Sq6bi/bYbJnKMPRnrbpccQ/F2NRT2E0LBsIcAD7c1
	3T29b3PxzA/F7bIB0bOu7mbCuRwzPIJrpmUpzB7EQpWYDgRslJUeDPpBq8mNLTZqUWK8tordXzaC0
	x2AAarN5TMFysEZ2wsk6HKYEwZUL+Y4+uvH9t0GgwRAcorVQzC8tvN9jmaXvl1qkOpfS0AbP7Y9fF
	NvAC6+9YOd4zHVyEGHDXUsoV8iJcDjLOM5Q5IyJN8Pj7EcyTcArzTO5kBEySyrMlNC+Fft+vDrpta
	C/r9vCXA1K+9XeTONMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxAF-00000005bHk-1zZ9;
	Wed, 02 Oct 2024 11:05:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwuo-00000005Y3f-1Qap;
	Wed, 02 Oct 2024 10:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB2B85C03CA;
	Wed,  2 Oct 2024 10:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C795C4CEC5;
	Wed,  2 Oct 2024 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866145;
	bh=qu+RgAvMKGG6eHj1nt3ZqKEHLWp1YZIU8I35f+U8nJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ghbvx+80TtOagxSSx1YVAs9g9hcuxHcr6yLQqp1K5nKrFCl5BE+jQkcvY5Em4LizZ
	 7TTfyi8Q1r8TcaULi1V78umAH2v2xFGVp7jizdudRRavh7XzSIkt004SYipWNHZHTG
	 pxNRE7mWBPtSb/DiMBEpYpprx67f+1uZNjJslUZoh3KB5JI0Hz93sHd6cZOtd39/dr
	 N0siEYxDw/yM27ljqrztpfd7ToSWiyXYdOFd/hCQndIOngs9/gPohQHUsRnCFoWhjf
	 JjcCU7SDodapmr53g0FNnpZGRx65eKcYekP7qv3pXRoyKT/12Id4B5vvAi77tXDQIK
	 yXLSJFNQtwPlQ==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 11/11] riscv: dts: microchip: convert clock and reset to use syscon
Date: Wed,  2 Oct 2024 11:48:09 +0100
Message-ID: <20241002-porous-mangy-4634b6556202@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-private-unequal-33cfa6101338@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BB4R12hb6JJv+m+wU7R6gaxBtVYrpHfMfCCdOaNVhVc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/VR7pXuTMmWI1dz5P/0rJRftzznEdb7XzW3u7THfu9 qnVD5otO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRZ7sY/nC3+v6yfXGLZ+6S xrl5LvOFDT+JsHXWS37dPPtXKdesKB9GhrsvP9jds1yvfTTPX+HuMX/n3LNWxs83TzT3zGQWk8t 5xw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_034906_493740_7BF488D7 
X-CRM114-Status: GOOD (  11.43  )
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
index f8a45e4f00a0d..08aa4fe03fd30 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
