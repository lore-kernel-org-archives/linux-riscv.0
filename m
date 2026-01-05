Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1456FC79F81
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDW17gwTosgdPQf/XGPldifCOI+Y8VzU/zYkA4kSdq0=; b=2AFFxc9zumwh79
	2JnYZIE4+tpN9UNb/hQPxE2CMliyjOD6C2pzT2QVnpUoEQDwox+nCnXvzlZcoTC5nO180NCEg0EZr
	srsyI0GBbQWCWROrvjoeJ4kn8O9cuRmFXFWGrpmuF4WaEer1R02gwidxdr0ZQIAhnDLW8t+kko4dS
	u4n6BQihr05wCsZhRH+pKyuALM3YCwkJVS4toI6K69ZRkp5ZDN/1/mtBajVqOnrolB1enAjZbsyBS
	aORRi3NgHS6qupgy+GFPR4JvTmSZjfE7VffcIdmjSFt/H7E1BLSc+MAofR3OrJkSbmLeZGP8RyoU6
	3NVCu4kxOxXR5W8p/qZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjHe-0000000BErB-0F7h;
	Mon, 05 Jan 2026 12:02:02 +0000
Received: from mail2.viabit.com ([65.246.80.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjHU-0000000BEm6-0kX3
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 12:02:01 +0000
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dlCZV2JbDz3wpJ;
	Mon, 05 Jan 2026 07:01:38 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767614500; bh=wOznH8tcG4pWKmi1lvz/2d6jYX4HB03leXAPBFA1+qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PCwvHKav9UcLxTfVP+tMg2OxUMKawmog2KuOEsEuWMyfqcEjD9yneSC/3LRz58+HA
	 rh85cmWcpcfBiMBFI6wKdtuUNj2iSiGFO/sDBx4XUY2bulZbh+jFsg5UsFuuN+R06f
	 MO+XR6HsXPPLxST842C4gBi2wGjjKRIV+Wo54tzg=
From: Michael Orlitzky <michael@orlitzky.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer
Date: Mon,  5 Jan 2026 07:01:29 -0500
Message-ID: <20260105120129.58895-2-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105120129.58895-1-michael@orlitzky.com>
References: <20260105120129.58895-1-michael@orlitzky.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040152_340827_E58D561C 
X-CRM114-Status: GOOD (  12.27  )
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

These boards have a working hardware clock if you put a CR-1220
battery in them. Let's enable it:

1. Enable the (already defined) i2c0 by overriding the default
   status = "disabled" with "okay".

2. Define the rtc on &i2c0. This is more or less the example from the
   documentation (devicetree/bindings/rtc/rtc-ds1307.yaml), and it was
   present in the same form in an earlier 6.1.x vendor kernel.

3. Copy the pinctrl stuff from &i2c1 and update the PINMUX constants
   with the IIC0 values from dt-bindings/pinctrl/pinctrl-sg2042.h.

Afterwards, the new I2C and RTC can be enabled with,

  * CONFIG_I2C_DESIGNWARE_CORE=y
  * CONFIG_I2C_DESIGNWARE_PLATFORM=y
  * CONFIG_RTC_DRV_DS1307=y

The new I2C should appear under /sys/devices/platform/soc, and with
any luck you'll have a clock the next time you boot:

  [  T367] rtc-ds1307 5-0068: registered as rtc0
  [  T367] rtc-ds1307 5-0068: setting system clock to ...

Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 54d8386bf9c0..ecf8c1e29079 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -52,6 +52,17 @@ &emmc {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc: rtc@68 {
+		compatible = "dallas,ds1307";
+		reg = <0x68>;
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_cfg>;
 	pinctrl-names = "default";
@@ -89,6 +100,16 @@ sdhci-emmc-rst-pwr-pins {
 		};
 	};
 
+	i2c0_cfg: i2c0-cfg {
+		i2c0-pins {
+			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
+				 <PINMUX(PIN_IIC0_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
 	i2c1_cfg: i2c1-cfg {
 		i2c1-pins {
 			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
