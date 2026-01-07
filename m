Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08FFCD583B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvgybmO7ly8oXTcq/b3JhUObSY6wSY2o8U4fJ/6OJ+c=; b=xiaKMOry1gUrBt
	b05qkCMJb9gwNHGWyJqs+tQgonNsGlc8R7A8mptGXM9AZH4/nvalrXuezeZuzTZi3WgP54CGzwQAZ
	CPql3I1wixyprlkEDu2cTolWUMVBEazPx9wWG84hfr1dyjaFUvWm2P67odlqk9fNz0f2ZvASF2eoH
	pokGuqVz8/uV6LXzr44jIHnCHhhEQGqZ/DM9TXNsXO/MhWMJPX90WQHXQh/o0NA5PaCMpYoh4AFZZ
	UUR6jqMIoeJpaZRJFq8c542/itaLWWkRACixYxHFObzUu5fXCr0rmlmqjvSz70Zp6dqAH+lOeoZM0
	s6pbiVUowWMEdKePJW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRjk-0000000EpaJ-03id;
	Wed, 07 Jan 2026 11:30:00 +0000
Received: from mail2.viabit.com ([65.246.80.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRjh-0000000EpXt-2dU3
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 11:29:58 +0000
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dmQml20MPz3wgB;
	Wed, 07 Jan 2026 06:29:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767785384; bh=OPuueHmMVj3SNcW4TnjonoWNxcWCK8kzhB9Rxd5LFmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C5daeKu4Hu/tLjIVGWDyiuNDK2ZpoVmp/x2f4NVmBcoeVzgD6oXsxzmWgDCS4wOAl
	 N9TzPa5c/+SzrD5rRhO6Blh5sJ+KQU5e9heRHvmmHwckwxceMExnlmmx4vtBVmYakg
	 1J1GiCiGf1vLKAK4ngWwuHksJlOiSX9rFj5aBPnw=
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
Subject: [PATCH v2 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer
Date: Wed,  7 Jan 2026 06:29:22 -0500
Message-ID: <20260107112922.20013-2-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107112922.20013-1-michael@orlitzky.com>
References: <20260107112922.20013-1-michael@orlitzky.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_032957_730623_F88ACD38 
X-CRM114-Status: UNSURE (   8.62  )
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

These boards have a working hardware clock if you put a CR-1220
battery in them. We enable it using information from a 6.1.x vendor
kernel.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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
