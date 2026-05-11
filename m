Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51450CD4844
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pekAX3SvkPkQGj+MxDU5TxS+WjVw2vV1FLolgnba8RU=; b=spXTBmGSIhec7X
	QgdHS8bXh8NE2SSbOWl5UqArAS4cgMQBLnSXTgkS0kJXXqt/norTCDUz5i9CAxXxbcXgPYMmsOq3k
	d9PJb8h8ucCAD0yE6ZhWNOXJj+4/GUgClK07pNkqhN1Ppg1NIueWbBdYgq5ecjaMM77N+I8FCNlhu
	XxP0xKwhPEzXO75tQu18tRxGbHcyQ/+N8pWlUUZQypiVhCC5dtqQJJUKrhrxkVzhU4Sf5we5eAThz
	JoKTvgAVm5G2y6wZn9u7JHJkqWSwlslY13g9u/iHdt6OxI5oCmuLgDbV8rsxuNzqwPfpSuwS1h1aV
	AEJGTi/61Mbi/cvakJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXr-0000000DF46-1B4F;
	Mon, 11 May 2026 11:11:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXn-0000000DEuN-2eQX
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b0046078so34742575e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497885; x=1779102685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=stmrvvRjD85qOOvher7OklWtdqsa1wo9EkSOGsLblTdpHelZLyskKLg6QVbTUSxUiV
         e5rdNHQ0F8oifg+69eKw89JY2uU/YxfPM/VqrTQCTes7IfNgbFkixnbhiKZ+tdeLMS7S
         qTI8o+dSzJVmyaalqIxB3KHxZGfME42IrFMUaRV9mYQ07ghQ4XzWIqDcyFJoKT9FVksJ
         uHI+1BACmoXC9SJmbFDXlKbV0FT8uwIscOXplP0Zxzy1vc8PVrRtGkS6lNKqA9vVqWrc
         5fh35bKuPytoQYtABzR51JraNhSUzcQ2BS5GDp3mS34/OVZv+peEIVRn5Hbrdf4WSmRe
         PKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497885; x=1779102685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=OXvIG8aCnJPQ/mfS1AzMOp3Y763pj1nfs7ZXorLEHeY8RFpJV9gsAyGec4PkmbjEWx
         uYUDyVqJloGHdTvmMF+Vw9UwlC0koRcBlFED6Tm2grbGt3gwbPxQeA4UrVTayvTji1n7
         z2hz5Cbuey85ieNNyzXG7sbLxV46DX5ZXBUJidoglzEMwni272LfTsOWEMqJ/5pU0BQ5
         +feoHaXWs2vnzdT1b1/mufr32vbMSn49TrOG12j3l7S4/Vd6okvWRHU2It284z5zkCbv
         4ANl4ccP8P8XPGB9WKji8xp9m0zYWc9UP5y2+rCT2Nc0frlVspRGoHB6jFFTxujYuF6v
         BvpA==
X-Forwarded-Encrypted: i=1; AFNElJ+X62DPtJ62NvRPU7TNVdU5rS8cOZzhbX/ULfXfk+Wig5vzVcz0VtLt/TB+6YKCnQbB1VsV94aWINj4iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfC4GAwk8E0elvB4HAEX05osq/KK2YjxPMZScs+HDLg62y8oNC
	cQJ8MpjCtZPISb3e7yFmSs+b4FZzZxlBbpU/PTFscp8soM1rVRtnlQkE
X-Gm-Gg: Acq92OGzu2RI5yw/pXK1BceCZUCqd+WhPKiQT6wku9rrRZTpIxDrOESLajsgacCnlPo
	91Y3ai63htgo35Utjrh/IskZZUj3wIaAhpcQ5UY37DV/MJBU6Ox7aGhKsyPetkHZUj8k5dEKq0h
	1rS7H9bjnpN9DlPH5qjvFGtzPmhPBcu0rkG/7ClWwsFgqWcKiPpAfo8mGUABQTt8JCe7y9hrhMh
	6tLT7EBICMuPlEY5os0gRGjBZ+duccsLWLq09iPEnFKed5ge4MXKqIwPtREvCniP1BI1HnYwFN4
	ZciXX/xCH1qmjMhkSBHp0xg224zRMG8tcKlHU+ZfT6cYaEZ4cNridjA0PugtzSMXy1Rx6SII1QB
	+ATPaK5EX1uSNvZGzWPCG48jDOt7qSRTO3ZnOac1wbA/+KLiE7IOq6++3PzFVHU8WWk/4BwuxQM
	xkhVdhGMw5E175D8AqpYa11ZrVq7UvoyXZkZXFl8BBXzVdS650h0MVsKXJrkguMSfPpdGqWyGyc
	rBM
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr140407925e9.11.1778497884730;
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Mon, 11 May 2026 13:11:11 +0200
Message-ID: <20260511111116.1109643-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041127_727511_19286E38 
X-CRM114-Status: UNSURE (   9.14  )
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

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 7ebace0e46edb..9c90c2817ecb7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_4v0: regulator-vcc-40v {
 		regulator-always-on;
 		vin-supply = <&reg_usb_vbus>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -66,6 +88,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -295,3 +321,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
