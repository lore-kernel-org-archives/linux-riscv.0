Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B340E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0zpGRxxWOmMV0BziyPHdV1S4sYZwtD7Nkdjl/htmpM=; b=RZVzeT86AB8EyE
	L2zJP77Y7HlhqkKTLg35NnlutsAfPmhbQZv+2mlLCY4tcjTFUosAUxz/RhE7zCzrgHxC3TJG8Im79
	Oow/mesBygHnTBbz/xkz32FH4sOrmV5Or6I/F883+3Nl6Yk3D9oG7X8XnA5ddJ1LOL50ObIRTvOvV
	ZgozButyHxSmLu8zJT+CmJcS6vKNVLuKiibqsewqOesFYzLxK3o5KyPWYTxzLd2E6bR8tZflRLLvy
	orta9kDNdXZQWnJHc68AcRC0FYdZaLpZHDWVhOcM8MUtNG+DnZoOZjJJ//ZgosTB0rauCmnBMGmYz
	hAra6RKbpwCnkiGbnA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRAP-0000000BJXp-1UKD;
	Thu, 02 Jan 2025 19:47:37 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR9B-0000000BIz3-1feY
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 19:46:23 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id CB3CFB4B32DD;
	Thu,  2 Jan 2025 20:46:17 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 5/5] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader
Date: Thu,  2 Jan 2025 11:45:11 -0800
Message-ID: <20250102194530.418127-6-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102194530.418127-1-e@freeshell.de>
References: <20250102194530.418127-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114621_631345_C2CC4793 
X-CRM114-Status: UNSURE (   7.23  )
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
  - uart0 for serial console

  With this the U-Boot SPL secondary program loader may drop such
  overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index ad5cb85ebc59..99de0750d049 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -28,6 +28,7 @@ chosen {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
+		bootph-pre-ram;
 	};
 
 	gpio-restart {
@@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
 	};
 
 	eeprom: eeprom@50 {
+		bootph-pre-ram;
 		compatible = "atmel,24c04";
 		reg = <0x50>;
 		pagesize = <16>;
@@ -323,6 +325,7 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		cdns,read-delay = <2>;
 		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
@@ -406,6 +409,7 @@ GPOEN_SYS_I2C2_DATA,
 	};
 
 	i2c5_pins: i2c5-0 {
+		bootph-pre-ram;
 		i2c-pins {
 			pinmux = <GPIOMUX(19, GPOUT_LOW,
 					      GPOEN_SYS_I2C5_CLK,
@@ -414,6 +418,7 @@ GPI_SYS_I2C5_CLK)>,
 					      GPOEN_SYS_I2C5_DATA,
 					      GPI_SYS_I2C5_DATA)>;
 			bias-disable; /* external pull-up */
+			bootph-pre-ram;
 			input-enable;
 			input-schmitt-enable;
 		};
@@ -642,6 +647,7 @@ GPOEN_DISABLE,
 };
 
 &uart0 {
+	bootph-pre-ram;
 	clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
