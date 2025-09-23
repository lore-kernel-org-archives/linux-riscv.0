Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D469ACAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2rQYFiktdDw5fdfzwzG7hMVhhEYJm2JRJdIK6fzrv8=; b=D1Y4eGJAN4Xv29
	R9Y9ihqjTy8E0YTRgpFhLeXi9JF1I2lnfIDHB7pzz6/gmIZ/07fJ7mcSN7Q5J5eL+w22jRI13VWLP
	3G/yC/6DA4EXji06Fa9usoda8S7b5wkDyuvWGtMvrMLFlAR21vXb3hw696hhA6cWB6DC/2/sXoXHd
	5oS2V1zEY6TXNAwpzdZsmyNF6bXVGne29mc5WYgFjZEeVmrOOd3k/a3JnxIH7NMvs3DSnEnPQHR7K
	uxHd+KdWQrOOiyJ2ajNhInmTu7qZ0Cbzkr2Dv6qaziGP9cXgdez9BKY0JcMSqtVV5vldqFhfjD+FX
	81vl5LH2u2HN54IWvv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yb-0000000Eo9Y-0Lq4;
	Tue, 23 Sep 2025 20:51:05 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yU-0000000Eo7T-32mt
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 20:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mSU6j7WeHblJ1jPeNVJeuj23on20kSxgchyldp7Dd80=; b=DDVVq1fbVGMHZJWdJ/NCwT2pHs
	d9TS+kFRrKuWK6DzF7+QLeAEl8wM7xr95bKk9H1hEZqA0l+nTnleQZsjXa7nAj6jiYqeUuA0DDU1k
	Voa4eytW99e35lHl8zwZTacGXhYeSSTF0c2FOk34T9soWMKWNNWnSiFif4T6fTyfXlukmTHvz4qYk
	wE71WVREryNx8oowAcBVFiHplvWJv4q5yWCHoJi97OUt3lYrZmgCmgNP/blaUl7W4A7hGt55xjJMW
	o6F3+OoboHbSFDTxTD5DXKtEf/vTI62//IheZUt3xRx3UmJHHggO7ohzN/aTenJZbfBGO6jLxcNvf
	OJrhJ5+g==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v19yI-00CFUv-2t;
	Tue, 23 Sep 2025 22:50:46 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: [PATCH v2 1/3] riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
Date: Tue, 23 Sep 2025 21:45:41 +0200
Message-ID: <20250923205028.2355244-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250923205028.2355244-1-aurelien@aurel32.net>
References: <20250923205028.2355244-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_135100_020633_06DC1A0D 
X-CRM114-Status: GOOD (  11.12  )
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

Define properties for the I2C adapter, and enable it on the BPI-F3. It
will be used by the 24c02 eeprom.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
v2:
 - Rename i2c2-0-cfg and i2c2-0-pins into i2c2-4-cfg and i2c2-4-pins to
   match the naming convention encoding the function number in the
   second cell.

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 66375fd1e9974..7df7f2c547750 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -111,6 +111,12 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_4_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index c9e9a844d2b1c..2a5e819160df2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -92,6 +92,13 @@ gmac1-pins {
 		};
 	};
 
+	i2c2_4_cfg: i2c2-4-cfg {
+		i2c2-4-pins {
+			pinmux = <K1_PADCONF(84, 4)>,	/* I2C2_SCL */
+				 <K1_PADCONF(85, 4)>;	/* I2C2_SDA */
+		};
+	};
+
 	i2c8_cfg: i2c8-cfg {
 		i2c8-0-pins {
 			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index bc61a380baca8..d4f38ded52c93 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -497,6 +497,19 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c2: i2c@d4012000 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd4012000 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_TWSI2>,
+				 <&syscon_apbc CLK_TWSI2_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			interrupts = <38>;
+			status = "disabled";
+		};
+
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
