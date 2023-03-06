Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036EDC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZDJgo+k0/8BSnl5F7Q5DvvMfjZnA2vkTyLOIoB3udg=; b=eWKCPC/Ygl5P7b
	S1X7cdcueRDDv1XRH8BYPdMz6urXrcXC2zS/qAOpOdYBr6oepMXYZFKRnlrr37sSdokqd0TYa+uIZ
	GqxINiin1/PMzsWvovKrq/p2p5HOpPN1V0REgbDKhRy04o9KF4eJMZ0/hPSPd7IdwWCDkWnFaOc39
	cEHtVeMRLgwjL9H1UeJ1RxAb45TvSxXvhcePUAkCwxnvJ+sqYZLaGElZzYepV9ZWyjWtptzn1GTJ2
	Qp2tDnYrEVIURN4pZ4tkTF89/rg9PrKNBRlvWDxbNr59ZXvdmj2JJZo3rmmFrdDnC+TMgTIgHBK/w
	t6x9zPBblZRdGw6TPPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Y1-00CBFX-S4; Mon, 06 Mar 2023 09:54:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Xy-00CBEI-B1
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 09:54:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4F44724DBBD;
	Mon,  6 Mar 2023 17:54:10 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 17:54:10 +0800
Received: from ubuntu.localdomain (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 17:54:09 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH 3/3] dts: usb: add StarFive JH7110 USB dts configuration.
Date: Mon, 6 Mar 2023 17:54:08 +0800
Message-ID: <20230306095408.26057-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_015422_782904_C07534D8 
X-CRM114-Status: UNSURE (   8.53  )
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

USB phy dts configuration. Also includes Cadence USB
subnode configuration.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         |  6 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 39 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index e8b8f4346fdd..2a9ed8b9ee25 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -244,3 +244,9 @@
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
index be180f23963e..ee665cdc3510 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -628,5 +628,44 @@
 			starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
 			status = "disabled";
 		};
+
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
+			#interrupt-cells = <1>;
+			#phy-cells = <0>;
+			ranges;
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
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
