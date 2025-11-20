Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F88CCF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKp4zj5OWhSmsl1D8wFtKyhwvuSHJ4AhR8TAwRTGCrw=; b=jzgR58ZgGPREVY
	G3gKNgwBcbCb6wXK1hplMcAHGDwubE7jo1o3c+8NgBguDw3rTf2JRNLAQqGJyIre26TNLo9UjzFF5
	7rnQM3LYiFK172yQW26diFLWMD23wCF1WCghfsUXmRKt4fVsTq0dh/Ly7d0Mfg6pUttxyx/htLvP+
	gPazEMbSq9us9FnSSDBtT+9/gBs8bPide54HRCZKn4606PXgi/0FSvz3lfDhtKyu96sWM1ih00x8p
	rtIngcEWBtgtISA8xdJjO0Yi12nmMsA1vFAEy4LSAAXhPVrmu6TxfdnI+WpM2fmfpdoScVZyuw/5c
	SxepFDdTwUiJey78A4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7UP-000000070Mc-1NZt;
	Thu, 20 Nov 2025 16:26:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7UN-000000070LP-0VUM
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 245F540D71;
	Thu, 20 Nov 2025 16:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C339AC4CEF1;
	Thu, 20 Nov 2025 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655990;
	bh=9bWXO/rkH5hXXpMBCIUifaVfnaubGBQH6NPhUvWS5Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwYdWZhJDaU1ii5P7JCnre7uCG1ODITkC1bOXYS1NAm2hgT8ql1m8TRvudhqMZDnm
	 gUyJ8m6N4a/xBuYSUmyYsdbkW9m6cMO35OwKLEUSFYZxiq66gUT96VYCbC6+1Q9ZO7
	 bOqFDe2JWtcHiAtpj8fwsoNpQymYgi6qHYHUsll0BpMxkUpVIUjpxWR7GVRyDx8or2
	 dEVymLuDjD+gnvqI+MiUb6Mnm1YqNArbVCUb6nWf90fDBCaQJvwh9XPm3QOCKTC/tL
	 qSUfRI0Ek58WJt7bZi8COoFoPQ30v01bKLWOu8jb8M40QpMaS3xjaLj3kzAKuB/a3p
	 t74jQx3T7riNA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 1/7] riscv: dts: microchip: add tsu clock to macb on mpfs
Date: Thu, 20 Nov 2025 16:26:03 +0000
Message-ID: <20251120-ahead-filth-d4d9c560d213@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3446; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=G/EjKmDyaKdtOf0TBw6CiN96scA4kHOYzQWM+SxTmwY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjlLGp6IdPmo3nMrNv7VewcYvMuKQ74F+oymWgRdWz PE/Wri7o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOZ1MLwP2VZg2P99MzedW+/ TSjexfNHo/T7Dp4qWTbBJJl6o0WLJjIyLGhm/GFovJiJlVtzDeepK/Pcy+cX/XpdKfGp6DufRFk VMwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_082631_202451_73F197F4 
X-CRM114-Status: GOOD (  12.66  )
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
 arch/riscv/boot/dts/microchip/Makefile.orig | 26 +++++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi     |  8 +++----
 2 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile.orig

diff --git a/arch/riscv/boot/dts/microchip/Makefile.orig b/arch/riscv/boot/dts/microchip/Makefile.orig
new file mode 100644
index 000000000000..e94f4096fd40
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/Makefile.orig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+<<<<<<< HEAD
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-disco-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit-prod.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+||||||| constructed fake ancestor
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
+=======
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-beaglev-fire.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-m100pfsevp.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-polarberry.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP) += mpfs-tysom-m.dtb
+>>>>>>> riscv: dts: microchip: remove POLARFIRE mention in Makefile
+dtb-$(CONFIG_ARCH_MICROCHIP) += pic64gx-curiosity-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c5..68e130550130 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -445,8 +445,8 @@ mac0: ethernet@20110000 {
 			interrupt-parent = <&plic>;
 			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&clkcfg CLK_MAC0>;
 			status = "disabled";
 		};
@@ -459,8 +459,8 @@ mac1: ethernet@20112000 {
 			interrupt-parent = <&plic>;
 			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&clkcfg CLK_MAC1>;
 			status = "disabled";
 		};
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
