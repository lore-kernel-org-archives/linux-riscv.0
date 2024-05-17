Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEBCC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5T4eyl+RtN3jYMKRVvFUZCsmmRGUhhTOz6yPNsFDnU=; b=VZdfWFJGwwI6cb
	KFvkZehOPr2DXOeTeLE1B2MThWk+OmJBV2b8w7cnqboFZUCzwAUZwe0eRmylgGAh30ZiZZYYSQgK3
	t8y/RyCD+mUuMJfN0mPXXt8I09xJ3mYsWa3FDHXyBE1xbityXfNMyBwMq7Pf5bLqPm01Ji17BPshR
	mNkja98V5+nWNCjtrtlkwu/b59FaLfpSZ5ihcBe7w+TdeB+xeTlg2RNMV3+/R+mZsnsAspDsVvJKy
	NGSiomUX17OQlPwwozwLg8HgqlWiM3Fv6TnUA6jplRuyVHPI7NITnIzVRXJ/PKBPOASpuaZxcQpB3
	nQpdPJ9d5VJb8mQSgfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbd-00000007Idc-1Eev;
	Fri, 17 May 2024 09:10:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbX-00000007Ibo-3I5t
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 09:10:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCD142000E;
	Fri, 17 May 2024 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFbldK+YrNkPHEp7U+iGoJtDTLbUW/U0B2C/LsdOF6E=;
	b=klGl0Tyc1SJDCTEgSMqT8gslZT1WoMIsRul91Fj6KHTBRJAkMGueFNTsdogwc9TTIuKN1+
	q7MjMuwS4DRHn+A+7S93UAu0hDz7p60u9KHYUu4C+CjzctkD7KJTabkjw+07ZaR7IsMYee
	IQ8irHYV5w9J6dpkCjfXIDwwmKfPp7xT4Xd/oeA+5FXtbzeV6q2VGsqdvUqIFA3PhMk4ZU
	mFE1jtlJWKqLHOU7tYAliU5uHyctDNJZZzcUkIeEar5nTNNM7U4vNUV8jVs1E9x2VqOgjj
	qke6aaFRTiGT27xsBgU8+f48uqusnMcjyFeBQ0uLuXNsYFleQ6awAvYkBr7vfw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 17 May 2024 11:09:55 +0200
Subject: [PATCH v2 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
MIME-Version: 1.0
Message-Id: <20240517-i2c-th1520-v2-3-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
In-Reply-To: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_021020_120952_9CACDB8C 
X-CRM114-Status: UNSURE (   8.54  )
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
index 57a2578123eb..aeb04f5159d5 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -121,6 +121,47 @@ led-pins {
 	};
 };
 
+&padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SDA",
+			       "I2C0_SCL";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_pins: i2c4-0 {
+		i2c-pins {
+			pins = "GPIO0_19", /*I2C4_SDA*/
+			       "GPIO0_18"; /*I2C4_SCL*/
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		i2c-pins {
+			pins = "QSPI1_D0_MOSI", /*I2C5_SDA*/
+			       "QSPI1_CSN0";    /*I2C5_SCL*/
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	uart0_pins: uart0-0 {
 		tx-pins {
@@ -143,6 +184,19 @@ rx-pins {
 			slew-rate = <0>;
 		};
 	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pins = "I2C2_SDA",
+			       "I2C2_SCL";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &uart0 {
@@ -150,3 +204,33 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+};
+
+&i2c5 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+};

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
