Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43060C3ABA3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbUaFWCbXEc+k9s6bsoFSLXSd0oHZbeA5G3bR2enppI=; b=XS0SDkauOJZUKp
	xbVy/S4I7lKbnD/3U5wbKFgimZTaVLuCdiagaz5V1H0xPwnVFvJJux2u76mtXWWeyaFCPF9asmKJi
	nUsSmZyLKsQDtPuTzpBufjUGVcn4iLyHp+sZN6BiRRYp1HRIJT29ROZcS0WL6+kEqrfO3usKt0T11
	JPdgjyMihfmFzQr3glCuuLN3eajUGuygRk6RHCjE1cnVr0rlK/4xj+oNJKSgFDR+ih5p99DfiuxVw
	9QI8QWfHdDpXUe/QXTAzKkGjaHmklH9wxlg/lt2aNQkTATc/5z+chi/KdGVT0raB3AREvGwraIKH1
	SYGruxQTscTDnnFDnblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnhg-00000001bBt-2mAh;
	Fri, 02 May 2025 10:33:12 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAngJ-00000001aeN-1HGk
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 10:31:48 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 69C78B4C2409;
	Fri,  2 May 2025 12:31:43 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 4/4] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader
Date: Fri,  2 May 2025 03:30:44 -0700
Message-ID: <20250502103101.957016-5-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_033147_496392_18030603 
X-CRM114-Status: UNSURE (   8.32  )
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

Add bootph-pre-ram hinting to jh7110-common.dtsi:
  - i2c5_pins and i2c-pins subnode for connection to eeprom
  - eeprom node
  - qspi flash configuration subnode
  - memory node
  - mmc0 for eMMC
  - mmc1 for SD Card
  - uart0 for serial console

  With this the U-Boot SPL secondary program loader may drop such overrides.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index f1dc45b98e1d..d2cdb2f276c3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -28,6 +28,7 @@ chosen {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
+		bootph-pre-ram;
 	};
 
 	gpio-restart {
@@ -249,6 +250,7 @@ emmc_vdd: aldo4 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 	};
 };
@@ -268,6 +270,7 @@ &mmc0 {
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;
+	bootph-pre-ram;
 	cap-mmc-highspeed;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
@@ -285,6 +288,7 @@ &mmc1 {
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
+	bootph-pre-ram;
 	no-sdio;
 	no-mmc;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
@@ -323,6 +327,7 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		cdns,read-delay = <2>;
 		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
@@ -402,6 +407,8 @@ GPOEN_SYS_I2C2_DATA,
 	};
 
 	i2c5_pins: i2c5-0 {
+		bootph-pre-ram;
+
 		i2c-pins {
 			pinmux = <GPIOMUX(19, GPOUT_LOW,
 					      GPOEN_SYS_I2C5_CLK,
@@ -410,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
 					      GPOEN_SYS_I2C5_DATA,
 					      GPI_SYS_I2C5_DATA)>;
 			bias-disable; /* external pull-up */
+			bootph-pre-ram;
 			input-enable;
 			input-schmitt-enable;
 		};
@@ -638,6 +646,7 @@ GPOEN_DISABLE,
 };
 
 &uart0 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
