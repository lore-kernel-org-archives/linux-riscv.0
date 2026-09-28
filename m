Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC80CA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsqMGALfczBy8QrTJeCjaqK0TaAmrmEsbPdBQYy63SY=; b=zCy9I+nJTP6Z2k
	xK9QP9E15UGFOhEfHarvFnmNaeiFYVaj23Y0DevmE86fX1iJnCP7ahRJRq2Mt4jxEgxMnakvmKdax
	oNL7X492In0TAMyxZ8KgGs01XrgxNdVGcFckEUj/x99OP7C/92QtLZmRr8VdjMFax4Cn3ZWO3aTS9
	otF/KriCmko761RjeVYAyTU8zi0ShxdYjyAaX8UfY1Ummcf22pWv3gY4Y/TFo+w0EPlhnWAg92ogC
	CapDVliLU4yS0mF6teP9EaPorIRZ3AAfYygowRDRcI0meIMkkOGxtDfsIVqk6nhvgWJ2rJBowgGzI
	PN/cIcetuw8VXnCfktQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKmf-00000001sTe-3ksO;
	Mon, 28 Sep 2026 23:29:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKmc-00000001sST-2ZuC
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790638157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
	b=JC3DEkYeVbFVnvzKDgn5H8mK+8o+2xLFdv7kYDDl+XORCBNvyYca6mEoUHEpQCURJq7H7h
	pHQW4IqZy0nqk4QLRpIdfOcHCQ42iw48nlRLYxhKsop2drEamJ2RCf8Klji7d59x6QE+PZ
	hyrdeywnkuNi/J/LcJPjyMXYIkRVhWY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-w8Ch7KOPOvaO_Yn2FGgURg-1; Mon, 28 Sep 2026 19:19:37 -0400
X-MC-Unique: w8Ch7KOPOvaO_Yn2FGgURg-1
X-Mimecast-MFC-AGG-ID: w8Ch7KOPOvaO_Yn2FGgURg_1790637577
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-892af0d1bcbso8133377b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637577; x=1791242377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=08zuQmAKuYcY9ut1Xq47/NhVGDZOS5kO1xn6SB2dTvY2tGkvrsrzu9u76JVKS5GqXc
         LiYdz7caFyXXaa0puXuXN9YhAF2Ehm5wBVPRDb+6EOyOdxfq00Welv7cctNa/El0ktJ/
         frvubP5LKRKbQp1V8a0oFrmhr8bAeKLRathNRFUE2PLf49oXV2O3XOWovUgqWU3au6jS
         kn+iK5yIowCtN2Kva5/xfXfxtz+eRKrlS8s3M77Q2z8JFynM00HakxmYjCge299G1Pnb
         ePFV/DcKryX3k4vV5ssSFDEaNJcu+hmBisb2LpX2VbOZjp4lZ6Hh7FbGk9sw/IHCspkZ
         sOEg==
X-Forwarded-Encrypted: i=1; AKwUvBxWV741lOD6fGF+Tol81xiFz0gevP7GY/5AbEsUZHMRMRWku6ZJXS+3A37vjtCIhWc45aAnr+yjQYd/ZA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLdSzgus0GQCvo+8WWXFX2tMCt7M/oQucSdTiZ5LhPhz928Yd5J
	X9w+sS5St+cZ70/3nPDcVT8Y08XRGXKy/jv0ZB73yiA14UdmWGoELmnRuZHO+L5YYoe+7go/M1E
	XeOUpLkO+JbV4EvKeJeUM8BeX1eBtXVtj3Ex2tYbdnY0DrkqITC2aCDrE8ZqsJqSd4jenGg==
X-Gm-Gg: AYBFou2h7gjDBA5EkLQtUo88W4W+dgyOaNRl8AqUVD5bOvyWzNLC7Oh7IKBC9EM6LFV
	VCmNpkPyPo3BRTcWVCXypx0uBRD80vtstcf7/QlZYvStFLSS9twtn+ABW53PCw24NXLRo/a8AUu
	sJNlV8VZ+vDmXWZKR0cBywfEQbltArqZfwnkyc/jJQtE/ieA3YZdvcCYxWshzPYTRtdObtFVeIR
	igw9rm+ARaRWPCNucDoWA68/fwzmEyqzNUQPDX55W/XuefGgfywWlhVIDvJGVs1r6KXx14eWsxR
	FoVTLJOZl/AZdXqjT2ynxS0cl0fzH3mjeRANvkm2KJXexS2pZtxMsg==
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40056017b3.50.1790637576902;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40055957b3.50.1790637576516;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
Date: Mon, 28 Sep 2026 19:18:05 -0400
Message-ID: <20260928231807.1757995-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1w4mOPjz4tpr7-0GtGgHQ1MByB_1LLcoixBQf0oqjiE_1790637577
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162918_739111_BA6848BD 
X-CRM114-Status: UNSURE (   9.81  )
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

K3 CoM260 IFX uses usb3b for a VL817 hub providing 4x USB 3.0 ports and
usb2_host for Bluetooth through the M.2 E-Key slot.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a5c08a7a781a9..a4dfa25c837fe 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
  */
+#include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
 
@@ -18,6 +19,31 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_5v_sys>;
+	};
+
+	reg_vbus_5v: regulator-usb3-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_5v_sys>;
+		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x14>;
+	status = "okay";
 };
 
 &i2c1 {
@@ -35,6 +61,43 @@ eeprom@50 {
 	};
 };
 
+&usb2_host {
+	status = "okay";
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+	vbus-supply = <&reg_vbus_5v>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
