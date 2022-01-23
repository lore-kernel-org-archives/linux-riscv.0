Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247C9C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngBqkZWlOFRNcJYV8aKWh/gdQgfbWfj+w7eDrwqN5Co=; b=cC9gHKTIb5pawS
	FkatCwH4Mwp8VaYnPnKJSYTR3byTh0G9qloI7P8Us8Wyr2rD93bZP/hcCCSSiwR7oByuS0da85O04
	nvJ9Scl0JkOVZ11vLM5CqYagsiIv6NFVxGz15Dn7BqlBcjSsYIVpPvgMt3E2Bc6IGl1hXlWHhWkJZ
	Wp+H2h5TjjYuJRH5w54e7+FfWFZv8LvzuKTwEkxyf/qKy38ouTRni/v3eYl7zurkM1ApW42FNrwus
	1hkrIN56SX9jAZnc4Zt/HnfxPA+9TCN/arPyJ8uVi+/PR9g9Nt6Wu609ND+fgk9OZsn6guafkdVuq
	m8b2mPkYU0+InQf7lL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBQTw-0008R0-PN; Sun, 23 Jan 2022 00:11:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBQTu-0008Qg-LV
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 00:11:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3578660F9A;
 Sun, 23 Jan 2022 00:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C136C004E1;
 Sun, 23 Jan 2022 00:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642896701;
 bh=+Wq/XfukU2RuymmnC+RI32yy8McfYjimAgrLewPdj2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qctFadGJ65pAlXOZ7ChRAUpIK8tVVZI8DIQFd0avdyrie4X+n1DxeoHZluNM6v47g
 HL+MyOQRNYfxrVuR+OCfLIdqzICgl6AbQnVXEHzutq1ITcKaCtKxJX+6XaDAIama1S
 Z4jeGE+NHBDw+gWfIYfbN/Hsq2ETui3Qbcs70Xw2gVFzS/OxK9Dj/c3aymYJJlepGK
 Jj761agsRE0Hs5NvsHnv+rkCI1vnThHauYN/F8lLeJvDQybYCpFwlrjZOumadITbcM
 OUIp5CK27XfrE7gYJS3imNRFwW5guw8ar1KKM9jFkaa0wVSvwAV23tCZb4CEMe/mMd
 v9lPOLZZNSJAg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bin.meng@windriver.com, atishp@atishpatra.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 04/19] riscv: dts: microchip: mpfs: Fix reference
 clock node
Date: Sat, 22 Jan 2022 19:10:57 -0500
Message-Id: <20220123001113.2460140-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123001113.2460140-1-sashal@kernel.org>
References: <20220123001113.2460140-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_161142_805013_4F493ECD 
X-CRM114-Status: GOOD (  11.75  )
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

[ Upstream commit 9d7b3078628f591e4007210c0d5d3f94805cff55 ]

"make dtbs_check" reports:

    arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
	From schema: dtschema/schemas/simple-bus.yaml

Fix this by moving the node out of the "soc" subnode.
While at it, rename it to "msspllclk", and drop the now superfluous
"clock-output-names" property.
Move the actual clock-frequency value to the board DTS, since it is not
set until bitstream programming time.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts |  4 ++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi    | 12 +++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index fc1e5869df1b9..0c748ae1b0068 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -35,6 +35,10 @@ memory@80000000 {
 	};
 };
 
+&refclk {
+	clock-frequency = <600000000>;
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c9f6d205d2ba1..393f18cdbb346 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -142,6 +142,11 @@ cpu4_intc: interrupt-controller {
 		};
 	};
 
+	refclk: msspllclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -191,13 +196,6 @@ dma@3000000 {
 			#dma-cells = <1>;
 		};
 
-		refclk: refclk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <600000000>;
-			clock-output-names = "msspllclk";
-		};
-
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
