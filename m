Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ABBCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YeayoRukUY73Xwmx1tPFUrXemYcPONems1B78iulfew=; b=mNFQChCE/7FXwj
	VVUconLlmidw9yD9MmsrmObjbTp2COfLu24JEsdTDbbi7dugZ3aJQ7+KhtcoFxWrClUniG16gEO0J
	Qo1XTmc1Xjw5nFdU/UI+PnWDDCt3v78cNEQpuyeE5l+IXBUDXGzX2YGlzl5+J/FIwKANKl9mpHoJZ
	nHTy+/kIyNogkskNIj19lQyVCry6tlSEoVmOiFhZyIXZsxp04tHyBCDFXQtNfA0Z61SGljyTH3o3d
	BYF9+hmXQCCLKsZ6X3KC7kE2VJwQiC9PYnWONJZNEcRBXxX/0+iu7LKiuiRpje7kxIqIDWQ7fffdb
	pE/n0u5m3J63feEiN6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaj8-0000000DT5k-0BxP;
	Wed, 05 Nov 2025 10:26:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaj5-0000000DT58-2ElT
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762338411; x=1793874411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eRRdklshI7mD/jKpP/+UY9Ouf/OPJc0IOGMFoHTVdHA=;
  b=i6wiBcXuFLTnpllMQA88Am4iOhe/SxYV7yTkLk6CahzmTc0vsJ3tTTIT
   on1dN6B0iPa3H+XG6+VOC/MsRgePqqVhczTBe+s5/U4Mg3pavn+ZC4FlD
   UFctHRxc1TtgyndNsZ5MYgs6ve0lfbMUCSLpYh7RlJxhIszcqtS06X+I7
   q6EJFi1P9mkA7G99CoqScs/Qdrr8NR3+zk8sBDW5jokefE21mEq5BULpy
   VUtgGEBLNrzhbFr//DupIoCiO0dAFU7/pitLO92QPl/F6nGKKQ6iEwxsl
   bBND7lN64+OXgsRiPzm7richbvKqvw7KLAlB2VqvD1Px3Ju+lRatv7tc8
   g==;
X-CSE-ConnectionGUID: OcFlDweQSNGA3u0TNJi5vQ==
X-CSE-MsgGUID: 4B/jomYMRXmUwg7fOqOGBQ==
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="48709554"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:26:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 5 Nov 2025 03:26:10 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 5 Nov 2025 03:26:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [[PATCH RESEND] v1] riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
Date: Wed, 5 Nov 2025 10:24:24 +0000
Message-ID: <20251105-unrobed-agility-c9c242a5b344@wendy>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eRRdklshI7mD/jKpP/+UY9Ouf/OPJc0IOGMFoHTVdHA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJncqjf2qklP935wTaBKfOLd0+nxzKnHGWx+nH98yj6VrYR3 wZmfHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIIn1Ghp7ABXXsv2o2PeqrfHrk8D 67m7XzX0VumvImz6NSfMZxxWsMPxkLz4T9+hpldPN4dra47tGEKtXCLEf3GSkNx6cLBO+RZwIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_022651_621571_A645632A 
X-CRM114-Status: UNSURE (   9.09  )
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

The BeagleV Fire has an SD card slot and an ADC connected to the QSPI
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

I believe this got sent a long time ago, but somehow I lost it.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../boot/dts/microchip/mpfs-beaglev-fire.dts  | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 55e30f3636df..f44ad8e6f4e4 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -79,6 +79,26 @@ imx219_vddl: fixedregulator-2 {
 
 };
 
+&gpio0 {
+	interrupts = <13>, <14>, <15>, <16>,
+		     <17>, <18>, <19>, <20>,
+		     <21>, <22>, <23>, <24>,
+		     <25>, <26>;
+	ngpios = <14>;
+	status = "okay";
+};
+
+&gpio1 {
+	interrupts = <27>, <28>, <29>, <30>,
+		     <31>, <32>, <33>, <34>,
+		     <35>, <36>, <37>, <38>,
+		     <39>, <40>, <41>, <42>,
+		     <43>, <44>, <45>, <46>,
+		     <47>, <48>, <49>, <50>;
+	ngpios = <24>;
+	status = "okay";
+};
+
 &gpio2 {
 	interrupts = <53>, <53>, <53>, <53>,
 		     <53>, <53>, <53>, <53>,
@@ -199,6 +219,82 @@ &spi1 {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+	cs-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>, <&gpio0 12 GPIO_ACTIVE_LOW>;
+	num-cs = <2>;
+
+	adc@0 {
+		compatible = "microchip,mcp3464r";
+		reg = <0>; /* CE0 */
+		spi-cpol;
+		spi-cpha;
+		spi-max-frequency = <5000000>;
+		microchip,hw-device-address = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@0 {
+			/* CH0 to AGND */
+			reg = <0>;
+			label = "CH0";
+		};
+
+		channel@1 {
+			/* CH1 to AGND */
+			reg = <1>;
+			label = "CH1";
+		};
+
+		channel@2 {
+			/* CH2 to AGND */
+			reg = <2>;
+			label = "CH2";
+		};
+
+		channel@3 {
+			/* CH3 to AGND */
+			reg = <3>;
+			label = "CH3";
+		};
+
+		channel@4 {
+			/* CH4 to AGND */
+			reg = <4>;
+			label = "CH4";
+		};
+
+		channel@5 {
+			/* CH5 to AGND */
+			reg = <5>;
+			label = "CH5";
+		};
+
+		channel@6 {
+			/* CH6 to AGND */
+			reg = <6>;
+			label = "CH6";
+		};
+
+		channel@7 {
+			/* CH7 is connected to AGND */
+			reg = <7>;
+			label = "CH7";
+		};
+	};
+
+	mmc@1 {
+		compatible = "mmc-spi-slot";
+		reg = <1>;
+		gpios = <&gpio2 31 1>;
+		voltage-ranges = <3300 3300>;
+		spi-max-frequency = <5000000>;
+		disable-wp;
+	};
+};
+
+
 &syscontroller {
 	microchip,bitstream-flash = <&sys_ctrl_flash>;
 	status = "okay";
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
