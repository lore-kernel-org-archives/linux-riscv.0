Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3DDCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqhwrTulyNJ2TkzCuzFQmGqzqSo3PBDdKXZqSeB5ueQ=; b=iBNlsFbt69QMgA
	v1q1dOJmP27JCFaej5jJEWs7nMKxcqmPDCak9r0/+SS6/2HeF884bbdn8xvyhD+pHLq5hdeVCfuNd
	n7FAzzcM+AuuNbETSWTm9iTzRxPyZc8erHKjM2jZr7n8EbCACez70xdzPO6DstAnLOybCIT7WdQ5O
	WPbxpbtP3UM/jZFeFRtOH2KD7v1iUVhcu7yTEUgmjTi7s6P6tJ6glwQPKRTuAYzu0C5hs3Sh1aRdb
	WCT1aSHd+6q1qrgmOfK9GfdezNPbQa4yCvxYqeeVE7WnFc1O8yofpiDwhIG+h1ob1sq1B2OUb/1P4
	Ygh2n80Ebh6AyFr6L72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t5-00000001XnI-0Kxt;
	Wed, 13 May 2026 07:20:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t2-00000001Xl2-2C1U
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48909558b3aso64076365e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656807; x=1779261607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=bz4l4V95PvTCEKAxiYCydSTISBFSVet3lCBnBUNaLEJtw/DwE1gtgE5GwA65jJFjO5
         KBI9yDjfi7ipn/WdF6OXxK/dY71+NVxd30gLwHPCj0qglARRri2I4hZWwXyQ+SJyun3t
         2WLNVmOsI40IWlcQpF32mkBe+3KebcrwpZl9GTLLexdvAPDtqYXq7cjUInEGHXL+Tbwg
         06Gu7gcZizyutwSJsvnbaBYqKiuCSmZOLVniubEYLUgI6acXZ+bUuQkSDLRIZQgp3NUb
         yYOQUh99QNdTHyjegcwKFOIM0SvH8QGoqvR/iCmjb4zEy+eXLNki77sr+LefHTtQq/zE
         JJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656807; x=1779261607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=iP0zNz5Y8hKS9axe57+74qhPOOp1ksC9CRZysB/kiJlScHRdut3unn9n4fzUyfbR8A
         NuY/Rsg1DlA+mWg97mTyZAGpIVpiqCq2J4Dr2J0n/5eqcsAbNb92ASSAR4sOSNLhUSOy
         1m6HOGSMaqOcPmyMRFzOxtcHz7KcPup5urleRGOuygSZYjuzGyk7PZyKDOO1UOBSzGJk
         0xO0YBhRUu37CG/1TpOKk+GSQSd5LQat4dA2/v/WsHNdAfjJXMq3B44sUHHBmOd4+Q52
         DxCTTT3x6AQTmSX+6/L1WTHyr4llGhpbaLJVo+w4muV96KA9758XXX0f8LY2cd6fjvn7
         X5SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dmDtGZkucIhYFfFNjKJhDBtsHx6S878Q/UlXn7khiY74tXwCPExJAQ5p9My/x4ZmQ4sfCyUkrf+y4wg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4NNq6VA7ee5qgN7g/+pWJvuJJse8krozqlFrMD5uKc+QBgPB
	BEpFIs35wFtcRPjN4vufAi4HrklHP+IGFpDpa3vXHn0DJfBGydAFMYv70WLLyxRq
X-Gm-Gg: Acq92OG02Lpu3D+8JubAqxXmC5pESER/A/aX254vGXyCNF10D3gcegNgAcBF8BjfOMF
	Wsqa3/waWWrHr7DAvCLp0FX88mZedDHItE2cIivnYadiuwMxhyY2883mGZOt64giWWqdQLIBhME
	hTZ6WicXtNW/QI2U7HSia/0udDUNOsmFcgiU9VY4C3nN/OWFKk7ydgv6MVIBYDOcnD/Rv6Rt4Fq
	08bP4JXcOHd2FCko6b049RK2gDUvwAkOxqN3Xo76JkzMgdM/CcLbAtXrSnq1RiQsG8oNzHT+6h8
	DA5KjC61mcWzT1muiNaVoDDl+YZNbqabkMVna7XUjAmB9ohtpwsPBeYLGpOdp+Y5N7mi2fUDsX8
	DiG4OoRXRPrVwLtGYqDymNU96Rsovyg+vx0WSXGUiM4TIdyavqid96xeWMigqyNBU5IbPOk5nGU
	SzvRwZVmmTe7J71pYh6wS36wwqwPmO0LCbZuvGLimTbiN63fZVga7msuHh4c4FNBsKeg==
X-Received: by 2002:a05:600c:8b86:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48fcea207f4mr20153515e9.28.1778656806489;
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Wed, 13 May 2026 09:19:52 +0200
Message-ID: <20260513071958.29574-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002008_583849_3A75EE7E 
X-CRM114-Status: UNSURE (   9.01  )
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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b0f66f49db4b7..b24b378b1b220 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -53,6 +53,26 @@ reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
 		regulator-always-on;
 		vin-supply = <&buck4_3v3>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
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
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -65,6 +85,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -294,3 +318,31 @@ &uart0 {
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
