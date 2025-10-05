Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539C7CAC5B8
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Oct 2025 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QurwwBbOdYuRM1t5aFSd1S0BnePhSntZKIARO8E4Ze0=; b=RqEFZrnxoASQmn
	k70OAyrFEog2xjEnevNdQaOpwYK1TJMpmb6DcTVV76eCbWJxzVzFfgwJxcM3T5mEzM2Za/4pFpk2B
	Cefwb2hsS0xMKmc0+tqLsdscUStcmORAt7XOlRPq/+hWAzEpANa29sDvyiU9TlTqtayTeJMRkf6O2
	c7FVJga551VgT/UY3d3l4RKBN4VBULJd6OYiPvc6WH4q4t2SwochdBXo0FUBzwG4yhAI3CLPgEyom
	on9uAhhAvmxrxSXWEt2qJqqv4MfrWidbnp5AtuWrYzKK8uL/BijjL8J3dWYMFGKEtzX/Ryy+wrlLv
	YIJov6Dhv/ywEovHyItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5SoK-0000000G5kB-09XY;
	Sun, 05 Oct 2025 17:46:16 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5SoF-0000000G5hf-1M05
	for linux-riscv@lists.infradead.org;
	Sun, 05 Oct 2025 17:46:14 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A498BB220074;
	Sun,  5 Oct 2025 19:46:02 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dts: starfive: jh7110-common: split out mmc0 reset pins from common into boards
Date: Sun,  5 Oct 2025 10:44:28 -0700
Message-ID: <20251005174450.1949110-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_104611_524478_03CC9100 
X-CRM114-Status: UNSURE (   7.39  )
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

Prepare for Orange Pi RV using jh7110-common.dtsi having GPIO62 assignment
different than mmc0 reset by splitting this out into each board dts.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi     | 11 -----------
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts  | 13 +++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts  | 13 +++++++++++++
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi      | 13 +++++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts      | 13 +++++++++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi  | 13 +++++++++++++
 6 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 5dc15e48b74b..083ec80b4e44 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -444,17 +444,6 @@ GPOEN_SYS_I2C6_DATA,
 	};
 
 	mmc0_pins: mmc0-0 {
-		 rst-pins {
-			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
-					      GPOEN_ENABLE,
-					      GPI_NONE)>;
-			bias-pull-up;
-			drive-strength = <12>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
 		mmc-pins {
 			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
 				 <PINMUX(PAD_SD0_CMD, 0)>,
diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index f2857d021d68..0243e54a84ed 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,19 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&mmc0_pins {
+	 rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &pcie1 {
 	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
 	phys = <&pciephy1>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index fdaf6b4557da..5ca10597dcd9 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -22,6 +22,19 @@ &i2c0 {
 	status = "okay";
 };
 
+&mmc0_pins {
+	 rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
index 25b70af564ee..025471061d43 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
@@ -40,6 +40,19 @@ &i2c6 {
 	status = "disabled";
 };
 
+&mmc0_pins {
+	 rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065..980e24e3dbc8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -44,6 +44,19 @@ &i2c0 {
 	status = "okay";
 };
 
+&mmc0_pins {
+	 rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &pcie1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 5f14afb2c24d..574e128138c2 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -41,6 +41,19 @@ &mmc0 {
 	non-removable;
 };
 
+&mmc0_pins {
+	 rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &pcie0 {
 	status = "okay";
 };

base-commit: 6093a688a07da07808f0122f9aa2a3eed250d853
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
