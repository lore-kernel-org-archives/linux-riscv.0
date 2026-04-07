Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431F0FF5104
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v9QKh2wrREoxrmB127nEfn/3uLZZl4nR6pp6OR+lwQ=; b=QzyOQvtsrI6Skm
	0cb4keV5NWRGagMDWCD/Ne9spzBukxtoFdaTIOnSGbrPQzjw5pyfx/8dhnL1EwHqEQUz48zT8YMPj
	cwcHBqpwOEWU4V50IO2F/deqHWv6Vw9a6gbjrTcNXF0iuscL05GjeHtNG/9d1Qf4ATfAPhCzdPGtq
	4OkA4S8Ix2QdTccqL7llZ0s82+icItw5tj4F3hJtmrfU0eTK9u2jql42rbZzmjbQvBSxRc4xei92q
	w/yYdFft1m1E+kHiZoREpBfhifsJ6S1AJbzBiyo0wVC/oyahvKXi72jmnXLq+wfg+KN955Youm3hr
	F7x8xUN7aIvjbo1RinVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tm-00000006igM-2WsB;
	Tue, 07 Apr 2026 15:36:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tl-00000006ifr-1t9O
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9877860141;
	Tue,  7 Apr 2026 15:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6E2C116C6;
	Tue,  7 Apr 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576196;
	bh=+i/v/5Bz6CBBWsw0gSI2PCxHpGurnmksUFqsg15Zrig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6ogPDjJjwLCIB3AD0FvfnINgnXNs1H1hYuWTZMhGKSIQjNYzuMArH97KIR1r+m7u
	 RqLlWRKV2uxkyTdK0xtcAg+2lfzDoNjtv1GdBgWiRmFo5NnrjPCqpnD2P4osWPYYJF
	 fUXB7ilyABM2ztGS+8+HK20+6vnNggXugnuZU20SXMJW+D4htKQS4+oGQyWc8ufbxt
	 tA4W6Pr/fMZm4tIzv4+aPGXN/wGokKbXuWHjkicFxj+LCbTqk6gbMew6fEZxpRarwB
	 1bdbjjLOOfPf496X1ok+rMPfeODMQDgrr3X2Ja4X0reX51fDNNfCa8cJc5fCIWwHbM
	 au/zddGqmJNDA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: dts: microchip: add tsu clock to macb on pic64gx
Date: Tue,  7 Apr 2026 16:36:23 +0100
Message-ID: <20260407-laundry-clubhouse-86450e4acdfc@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NLbe8+yUuxA8smHy5fVkynrXQ8TpWNyhFeATwq1MbaY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVSpyZzNpPLv/iDXsEN/twv3Ls9aYTtJKEBQM2Jv9V /PVpnm/OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR2GCGf1ZHhP4f8+UXcb7K xatjxaP8h7GK7XDCw8lepxP1s2uiHRkZnj/Uvuw9X9qTd+P8H+t/vLl94+EF/oj8m0xnVi9KLZO +xwYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

In increment mode, the tsu clock for the macb is provided separately to
the pck, usually the same clock as the reference to the rtc provided by
an off-chip oscillator. pclk is 150 MHz typically, and the reference is
either 100 MHz or 125 MHz, so having the tsu clock is required for
correct rate selection.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/pic64gx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
index c164d7bc270a2..e9ec376b1776b 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx.dtsi
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -459,8 +459,8 @@ mac0: ethernet@20110000 {
 			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			/* Filled in by a bootloader */
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC0>;
 			status = "disabled";
 		};
@@ -475,8 +475,8 @@ mac1: ethernet@20112000 {
 			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			/* Filled in by a bootloader */
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC1>;
 			status = "disabled";
 		};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
