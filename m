Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2206EC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/cb+fHLMn9Bj4iJIfLNOc385fFKuivUw8xa1LpKhU0=; b=M8QMt0EnT86X+0
	+KJhjX3NKGVfk5xvYHRhB3ca+pFW1KeYq4ePnTFJOf6AMbJcnlbNs0LJOeIt2wnbr+H/5sj0/e4Ht
	L32r814c1iNfe2Zm9LA6IZVwTTxZnC7R6VMv7rEJaXQjeEgLBshV1qpauKSsmYGtq11VglUyFGlJy
	B3u/ZSqdInPRnKGhQAlpb1cd8TOnrA8KStCsH906UMmFHyjmQHJ3tcpqvxIPVRUewYDNSLhtVcnQx
	7UCqTwF5r1g/kFlq2qsIUxnuVBMJCAiYjPzdeWWNDQxNwJ6XjtvM7OQxT+yITrTSo3FTaMyJdYkCO
	hNxLpvgPSitFhgqChzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIH-00C4Jt-03;
	Mon, 22 Jan 2024 12:20:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIE-00C4I3-08
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A97F61388;
	Mon, 22 Jan 2024 12:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B1FC433C7;
	Mon, 22 Jan 2024 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926045;
	bh=GT65QrRSZZI/JIdwPBcys6eLLwNLwpPSE/DJ6auIUks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jb3dmfnLIjra2EvCeWTQURVArpunSXQ8WZ7SvOrjHrcqnIRO5bLN1bGYZZ/fwYmsc
	 6Ir67jWsLHwz1/2EYI0irVemtunm2SMWpxgnOoA1UBRM0ane3xizfMUd1xb5sK2mZY
	 0qOheNB4lcGneWBomX5Yg7lGZOYJTGR6c0UNDDEJsCbzWckfPr14Qn8zBst4GCCB3D
	 Y9rMCRDy46UsioPfKTAUAKNTq99J2hlXSmBoDaxuVNXiLanJenqJR/AZf7Iz/5239v
	 sPNu1DBIuqjTE5ZBs7wCYyAo+5VFS1cfkS/+hy4H9VWOseqEYxwEH+vGEycXOvEREF
	 0nOuQWwkl4/+w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: microchip: add missing CAN bus clocks
Date: Mon, 22 Jan 2024 12:19:55 +0000
Message-ID: <20240122-splice-poncho-18a369c7dbc7@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pLA+R73nzpZMSjL5ZIEEpNbYsZjEzmZPe5bK/xmNjSY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlPleT5Wn+6OL38lGp3sdiX9kvjzCpZLh79GzvM5s zmRq2ByRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZS+YmRYZunivptLuErjQu/ N1lXLrlwi/XW5XCGE7N82m+Ic7Ruv83wz+SeTKeekUOK973a71eDBd/2iDnWPnL2uLo3PEXiktF WJgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042046_124462_4F35D9AA 
X-CRM114-Status: GOOD (  11.09  )
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

The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
CAN bus clock. The bus clock was omitted when the binding was written,
but is required for operation. Make up for lost time and add to the DT.

Fixes: 38a71fc04895 ("riscv: dts: microchip: add mpfs's CAN controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 266489d43912..4d70df0f908c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -416,7 +416,7 @@ i2c1: i2c@2010b000 {
 		can0: can@2010c000 {
 			compatible = "microchip,mpfs-can";
 			reg = <0x0 0x2010c000 0x0 0x1000>;
-			clocks = <&clkcfg CLK_CAN0>;
+			clocks = <&clkcfg CLK_CAN0>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <56>;
 			status = "disabled";
@@ -425,7 +425,7 @@ can0: can@2010c000 {
 		can1: can@2010d000 {
 			compatible = "microchip,mpfs-can";
 			reg = <0x0 0x2010d000 0x0 0x1000>;
-			clocks = <&clkcfg CLK_CAN1>;
+			clocks = <&clkcfg CLK_CAN1>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <57>;
 			status = "disabled";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
