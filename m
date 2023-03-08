Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC25AC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7Kg5Lf5dPvhYX+EcMBm9oh1qE8M5Zcz0KEELeAoscs=; b=l7+bhVBwHSZ6tc
	b1fK4id3uXhfKKUJ/5hUNHqhHu6o25NiIYB6KLq39NXVH6LsV5QEB7d/AoEw5k2NxvtX3Ck8JEWZZ
	IMY2ATyaSZC/4eXKXG60Ov57aL1k/1Rmc8KRnCLv9+w10PWSBbGlYlVziO7q7uVt9SifTT3C47DZq
	h6nAYJY0TubvLotrvzLV9dNGoWGW1CXo2l5Mh7OVxvbLkQxSwAuu+OXeqsUcD7f+kweQaWxpaJnyp
	1G0i3vEfjKE/LLOdqqqhBVhc4FYj6dLgj4G9ILtFLvbJlRclq1/oohzFC+X7Lh+omjNlvbIgKKvHO
	Sq+Ji4n/crpG+IgCSsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpAA-003ySe-7F; Wed, 08 Mar 2023 08:28:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpA6-003yLB-TS; Wed, 08 Mar 2023 08:28:40 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B295A24DBE8;
	Wed,  8 Mar 2023 16:28:05 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:05 +0800
Received: from ubuntu.localdomain (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:04 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 3/3] dts: usb: add StarFive JH7110 USB dts configuration.
Date: Wed, 8 Mar 2023 16:28:00 +0800
Message-ID: <20230308082800.3008-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308082800.3008-1-minda.chen@starfivetech.com>
References: <20230308082800.3008-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002839_270323_20283AC7 
X-CRM114-Status: GOOD (  10.36  )
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

USB phy dts configuration. Also includes Cadence USB
subnode configuration.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         |  6 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index f144c3254213..933750ce753d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -236,3 +236,9 @@
 		};
 	};
 };
+
+&usb0 {
+	starfive,usb2-only;
+	dr_mode = "peripheral";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c29f8dd9e557..fa622e18dc0e 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -362,6 +362,44 @@
 			status = "disabled";
 		};
 
+		usb0: usbphy@10200000 {
+			compatible = "starfive,jh7110-usb";
+			reg = <0x0 0x10210000 0x0 0x1000>,
+			      <0x0 0x10200000 0x0 0x1000>;
+			reg-names = "usb3", "usb2";
+			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
+				 <&stgcrg JH7110_STGCLK_USB0_APP_125>,
+				 <&stgcrg JH7110_STGCLK_USB0_LPM>,
+				 <&stgcrg JH7110_STGCLK_USB0_STB>,
+				 <&stgcrg JH7110_STGCLK_USB0_APB>,
+				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
+				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
+			clock-names = "usb_125m", "usb0_app_125", "usb0_lpm",
+				"usb0_stb", "usb0_apb", "usb0_axi", "usb0_utmi_apb";
+			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
+				 <&stgcrg JH7110_STGRST_USB0_APB>,
+				 <&stgcrg JH7110_STGRST_USB0_AXI>,
+				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
+			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
+			starfive,sys-syscon = <&sys_syscon 0x18>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			usbdrd_cdns3: usb@10100000 {
+				compatible = "cdns,usb3";
+				reg = <0x0 0x10100000 0x0 0x10000>,
+				      <0x0 0x10110000 0x0 0x10000>,
+				      <0x0 0x10120000 0x0 0x10000>;
+				reg-names = "otg", "xhci", "dev";
+				interrupts = <100>, <108>, <110>;
+				interrupt-names = "host", "peripheral", "otg";
+				phy-names = "cdns3,usb3-phy", "cnds3,usb2-phy";
+				maximum-speed = "super-speed";
+			};
+		};
+
 		stgcrg: clock-controller@10230000 {
 			compatible = "starfive,jh7110-stgcrg";
 			reg = <0x0 0x10230000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
