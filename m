Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B113CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4toUDXY2rPujF+ro+yKW0igwJowdwxnN7znTrY3szmM=; b=PSNOhpYiWYeyqQ
	dnQ2cApcvHqDUYlsxwLGQCYb3fIDelT5k4JHCA3c4WbwQqyUhV1VDc5JERHrBlzPP0XZy+5CNz0WY
	t5Nd/xdLzQ+vAqD+aGEUhZS0rrh7SpJdbBOmxO8/JTs0q0iOK18cNCvM4ch/7iWNR8uY5g+dyn75l
	bhV5Hr0AEVDL5UsCji1nMLh3PinEUt36Qqy05tET/ffApcwsfK3EbhMiP5U7i3D8z7h5hbwDhTtMm
	aKjnCQBTWH2QLh+uAoWwhiNVZ7Bzen3Xct1jgdrdvNjDAngugBr9gf+/azpR1hJ0Vs3BtFx7jpBPT
	Dbf1WBHe8s6hGGFm5x2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0N-00000005IlF-082r;
	Mon, 10 Nov 2025 11:24:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0L-00000005Ikk-31Ai
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26B4C601A5;
	Mon, 10 Nov 2025 11:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D160DC2BC87;
	Mon, 10 Nov 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773852;
	bh=o06pwj8GQhduMpl8X9PMCjFDAGlLMLElJucB88tSCYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Galcd/L10+CvJOyC2hB+L/6sEPakTPxv6oq5pEbYX100syMbpTcxaQKXxF4UIFfpw
	 Nqn8Mfe5bWKVI5e0PiGO+ZId+qQQx71UAaiP/4nIqTTENORb4bWFk7taghyyQgtpYM
	 QNrqj0tS6a9BK5IXgUnoBFQEZ0QYGFojppOHr0uMJ1Klyvb4D5KY57odrVfHHeRVbg
	 7ESqQ7kKyO+a4i2JMC8vHMLvxO3BwihzlLBpKPjAAzGcC0/A+Ex5bFDWBCI2a1+gzn
	 wfan6ikC5Qg8xo9uZDGWRl6wLXf/V/oNwYrI8jOJdmZiz72YZJtXbvMtA6/zKGV5c3
	 s9OYl5W7IlkJQ==
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
Subject: [PATCH v7 3/5] riscv: dts: microchip: convert clock and reset to use syscon
Date: Mon, 10 Nov 2025 11:23:52 +0000
Message-ID: <20251110-vicinity-stream-b6954d17e01c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110-zookeeper-femur-68a0ae346397@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+zR8fbMXO9YW4YzwKnjp5SrmA8iRht4FGjwYBRXJ6yY=; b=kA0DAAoWeLQxh6CCYtIByyZiAGkRy0ei3kWAlDeH5mIUl4g8elSv50NtiF0eZr8sfY+ix+Wzx Yh1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmkRy0cACgkQeLQxh6CCYtJ/tgD9FM5J TeDenWu0gbF67ZshvF6KSC/NO3RzRieteMYGyzoBAMmQ9BwHCizv+5ziMGu8PtoqmynJl+SVbnc awI51JWYD
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
