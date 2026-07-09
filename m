Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02750C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVh11u7kTx2loIQCCkBct7c+aqjKjNCewz+jEENmPJw=; b=R5gTP8iBOGZ1ax
	d2zPXsKSHMC6VrM5n3MQNRT/T8cGE3AkAOUjpvnz7bWNB1r1YfTjf7w/ct1i80SUKbB969kCJcW2n
	O5rvdVCt5gJ0FXFYTNz4FarKcXO8b9Tv+BfAqxPNNT7J3iUbsFHHC7IEgPW5QVbhu+8ktp85xXndL
	isRc9ptGFK2TQ7vtuqSJilVttoF1Y6cv0RGmyQjp/Bf0tuONGtt8qu7x+RJcYlJlUiKkEkJEr5vlK
	c36VUOA12XTSYOzTRQuajG8ueZmB2qt/RdIabEY1IhsSBV3ZNo9iw6Qi1tDTfvprWevAENWtMWTzy
	xMAEh8yCdTFlP9B5oRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0T-00000000y39-3bHX;
	Thu, 09 Jul 2026 04:05:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0R-00000000y26-3stR
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:05:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8482074a000so1190669b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569899; x=1784174699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=VEzXi03j9lyl+f6ZjXi0fSbnNR8dDXNThtxxooM9/O57yms8ZVt+fPwl9nDCfLZCnz
         Zit1unl09Kd7fFxxl7Cg2oAb8CMr81btKoX2FT9XqZw1O8pGY5cgA3Y+sMb2IbioWoR+
         tvccMZ26PGtfYeqgasqV1nxQ+mzSfTWG7io6ZwkItMo1kOfHiFapAGt9V7TQbXzcwU15
         j3cQ8Bk1MS+sZXchnoOmjO9YHtIfgju9mHG5rQX9yTkNDfYRPPUrD4gRHyagWzkMBUjf
         xbReT311BIZKZG9YArP8QRGFX4VYsO8bk5UOkZiPXDajaP7KHjurFrhgmDVbJhCDG3sD
         gSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569899; x=1784174699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=qul5TM0P0SH0RLQU7P7IWfcOC122KkTfn15wZJYepTJmlIpYPaOdp2VNgVAhtK9era
         yqDNxVnFYVnK8o/E6krLqrQRgPfNsWrGNR+i7FlvI2tZFbA2zFAaaRFxz/rf+xWfMrDW
         fKp0hhVC3e9Waqn8q5q5SzPcFY8cNJGqyRsBh+NYlvx22u58kabbXuKpEBdU1YpS4ToJ
         LhtZ/h/fo2hsT9khBGA7pCaGccfZypJfkM6FVPCKPHmSI3bRIyxvisFDIJJMLS9JxeeB
         UBs63u5mnoDDYUqCu+YVwjU6IIhyEAq58AhVMJXB5ICjrtZfRCvJOetyrj/EBWLtTOGe
         QTsw==
X-Forwarded-Encrypted: i=1; AHgh+RqTTuHkRRmq7Qksba/26Tc6MkZLlWv9HWYM4P7yS8dxg9vHsHjVOg+aUzwfgBeFfu7VRTECOj+Pti7lDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXZZhYMWoqP5d7vtyc6ebDAbybfPy//gTRQ5KEl2BIlr/2ut9L
	KlMF5QTiFKbBlqAEhKllIeF0vDXghzkqEdauV2EEiwjFfneIUGtmoltd
X-Gm-Gg: AfdE7cmM4Jn55k4l9Q0cUtwsat6C3MvA3kARNrG25BAUG70O//ISF5tIFGrooXR0JpW
	KzBKRi4LmO+VtvzVjtoAsebnOF21ymdjOZZGsH0yHgxKBlFNN5jKvQ41usiekuX6HAGM4OrEEMb
	+4ixs/7WWQgA62XdQPTLEjE0bZ9PljmGKsVyqC3aQIai23XjhyWoI3zWoxWm8piw0M+iItC3SVR
	NAVWD7pNQDUDkwNvKIGSZpgqx0cJ5Zn59cUqnj3Zy0/Ov3RAAPDYh1q3eAc5fL8B8bK0x2DWxor
	Tqj9Yn8g+74uRZV4ot0w4SyKhkPfVugDd6P8ZWRcfFcEG8BXn8bVD/Tp5AhOq7h5rvQvrm2ETmo
	OjOS89xQOH9aoY4a5JHrzp8hHuywcv5JI7FNSDQBUO0kNMyxzB2ntGXTbPiuIndge4zUKm1d2+z
	4=
X-Received: by 2002:a05:6a00:2912:b0:847:759e:f61c with SMTP id d2e1a72fcca58-84843433a23mr5150837b3a.47.1783569899165;
        Wed, 08 Jul 2026 21:04:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848593a591asm387242b3a.26.2026.07.08.21.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Thu,  9 Jul 2026 12:04:13 +0800
Message-ID: <20260709040415.977784-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040415.977784-1-inochiama@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210459_965437_37B2EF65 
X-CRM114-Status: UNSURE (   9.79  )
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

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..82c9e2da82e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
