Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF48BC2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm7R+fLAxlb5hdk5KiS+v2ShlL1U6gn8knNS3/75wOw=; b=aTFJIg3HzmUPUU
	QFqxv7FDg80U5RGivSmlOQM7o8b9iz0ta/MR0ORc9H/QjVE/X8gfpFZOZrJcFQtDTpcRehlCTvPVd
	Z68qyYhlHPFSrEo9WD9oFaxDiGisyKuyU2woE+FfPsNaX1kImMnD7cK0chP21quRBWKq2JVCp0ph6
	+q7X4IxcGXHhEQUgfk2Y94Hw7kh8BBYkjUFaaVc3NrPT7z7yPr2SM5sCa/KhlBkrTVxeVrNaxcmw5
	8o53G/AcG/4pFyqWOqT2sKoyiqkP/WzKvtq43OYxMDAi+SVe9/IR1vFyZCgtiRckPC1uODiKh0tc9
	4Jm+wNIESBlQuMgosnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTUV-0000000DzHX-1oMy;
	Tue, 18 Jun 2024 07:42:55 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTUP-0000000DzET-2A4k
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 07:42:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2364FC0006;
	Tue, 18 Jun 2024 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDrhgwuXd70Ld1fOjbKx/CsMOE1aQz4gBxg+9d7X2Fs=;
	b=cC4g8M+R9T8xiB4utbsDsV9ioGrkhXazt/uGvvcMQmw4m7NojFcB9lR1Jwj7y6jQ4msh7E
	NyqAM+DHkmqHFp3GI/ZlbAiyiXymwhgjuX+Xv/QVCYj/MRI4gmV96PRgN3OL5sKFnfaGQX
	ExDB2qQEGjDmJYou1w3mSF9p0wkJzSy8AXu4bqdDF46eeYqLRqiIG2GYL5nD/dG0CGXGQs
	zibKo7DGPqAdBD5A+lv2iVIg6XTyr57TLc49sx3KUS7bzqXU6bI9Bt5joUHUF9LL9ygYSr
	QbA1v4J2xhVzdCZQyQUwKCrWuQ9ERUVKkZlgAL0z1suwtB/ueGEL/FCh1l4taA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 18 Jun 2024 09:42:40 +0200
Subject: [PATCH v3 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
MIME-Version: 1.0
Message-Id: <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_004249_870630_89AFF5B5 
X-CRM114-Status: UNSURE (   9.20  )
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

This commit enables the I2C0 controller of the TH1520, together with
the FT24C32A EEPROM that is connected to it.
In addition, this commit also enables the I2C controllers I2C2, I2C4
and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).
It also defined the required pinctrl nodes.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 57a2578123eb..b5c4f1811955 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -122,6 +122,19 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pins = "I2C2_SDA",
+			       "I2C2_SCL";
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
@@ -145,8 +158,79 @@ rx-pins {
 	};
 };
 
+&padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SDA",
+			       "I2C0_SCL";
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_pins: i2c4-0 {
+		i2c-pins {
+			pins = "GPIO0_19", /* I2C4_SDA */
+			       "GPIO0_18"; /* I2C4_SCL */
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		i2c-pins {
+			pins = "QSPI1_D0_MOSI", /* I2C5_SDA */
+			       "QSPI1_CSN0";    /* I2C5_SCL */
+			function = "i2c";
+			bias-pull-up = <48000>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+	status = "okay";
+};

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
