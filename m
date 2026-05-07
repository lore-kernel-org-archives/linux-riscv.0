Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C7CD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqaNrTTyfqlUWqg4RHYRns7vfiFslXlvV8FSZsCJc8A=; b=1P8L0HZq0gR1EH
	nEVRq6lF+MSsf/hVROeDfA0Zr4DJfjhgoRXJa0jD10ZfRgY51dl1cClmvO2MM7oIZBPWWPEjuNG/v
	QzGmcamcctl9EdNwiCnBTBNcPsB95Hc4cdWzPwNMzRbBEjxG2luYwV5tcXOerZX5iDrz4n5/Q6XP+
	9uGALFBwZlb4nlo2gr0T1Wpxd8pXBTh4XnSANowAq93bEBSeHraV104azMRdlQ04pHcv4qqjJKSPZ
	FT3BUHgqXmd0MkHfpCEk9cK6mhkeI51DdPlJ4LQ1oPVZdYk50cS+CddNPKwcbsiOLuJ0FXrRKKf7G
	NFblteNelzpDxnest+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtwB-000000038Pq-3oGS;
	Thu, 07 May 2026 08:18:28 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtw9-000000038JN-0ern;
	Thu, 07 May 2026 08:18:26 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S14;
	Thu, 07 May 2026 16:17:42 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 12/12] riscv: dts: thead: enable USB3 ports on Lichee Pi 4A
Date: Thu,  7 May 2026 16:17:10 +0800
Message-ID: <20260507081710.4090814-13-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3m+KLSvxpI_pNEA--.42168S14
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1rWw15ZF1rXr4xWF1fXrb_yoW7Cr4Dp3
	ZxCFsY9FWrCryUKw43Zryvqa15Grs5ua4kCr15GryUA3y7XFZrK34SyFsYyF1kJF4xX3sI
	yr4DZr1Iqr17K3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
	vfC2KfnxnUUI43ZEXa7sRiHUDtUUUUU==
X-Originating-IP: [112.94.100.82]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_011825_573673_CF3D12E3 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Lichee Pi 4A board features an onboard VIA VL817 hub connected to
the SoC's USB3 as upstream and 4 USB-3.0-capable Type-A ports as
downstream.

Enable SoC USB3 and the hub on Lichee Pi 4A.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  15 ++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 231 ++++++++++++++++++
 2 files changed, 246 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 8e76b63e0100a..bfda5a6b56b8f 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -20,6 +20,16 @@ memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x00000000 0x2 0x00000000>;
 	};
+
+	/* TODO: Switch to AON regulator when it's available. */
+	avdd33_usb3: regulator-avdd33-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD33_USB3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/* Marked as always on on the schematics */
+		regulator-always-on;
+	};
 };
 
 &osc {
@@ -202,3 +212,8 @@ &sdio0 {
 	max-frequency = <198000000>;
 	status = "okay";
 };
+
+&usb_phy {
+	avdd33-usb3-supply = <&avdd33_usb3>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 354f3893aa8cf..de38f1f457e6b 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -4,6 +4,7 @@
  */
 
 #include "th1520-lichee-module-4a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Sipeed Lichee Pi 4A";
@@ -97,6 +98,141 @@ fan: pwm-fan {
 		cooling-levels = <0 66 196 255>;
 	};
 
+	hub_5v: regulator-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HUB_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&ioexp3 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vcc5v_usb: regulator-vcc5v-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V_USB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * Workaround for Linux currently being not able to power on
+		 * Vbus for USB Type-A connectors.
+		 */
+		regulator-always-on;
+	};
+
+	connector-usb-a-1 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc5v_usb>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_1_hs_ep: endpoint {
+					remote-endpoint = <&hub_hs_port1_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_1_ss_ep: endpoint {
+					remote-endpoint = <&hub_ss_port1_ep>;
+				};
+			};
+		};
+	};
+
+	connector-usb-a-2 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc5v_usb>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_2_hs_ep: endpoint {
+					remote-endpoint = <&hub_hs_port2_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_2_ss_ep: endpoint {
+					remote-endpoint = <&hub_ss_port2_ep>;
+				};
+			};
+		};
+	};
+
+	connector-usb-a-3 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc5v_usb>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_3_hs_ep: endpoint {
+					remote-endpoint = <&hub_hs_port3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_3_ss_ep: endpoint {
+					remote-endpoint = <&hub_ss_port3_ep>;
+				};
+			};
+		};
+	};
+
+	connector-usb-a-4 {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vcc5v_usb>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_4_hs_ep: endpoint {
+					remote-endpoint = <&hub_hs_port4_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_4_ss_ep: endpoint {
+					remote-endpoint = <&hub_ss_port4_ep>;
+				};
+			};
+		};
+	};
+};
+
+&aogpio {
+	/* Route USB2 to the onboard hub for normal operation */
+	sel-usb-hub-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
 };
 
 &dpu {
@@ -262,3 +398,98 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_hs: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		peer-hub = <&hub_ss>;
+		vdd-supply = <&hub_5v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				hub_hs_port1_ep: endpoint {
+					remote-endpoint = <&usb_a_1_hs_ep>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hub_hs_port2_ep: endpoint {
+					remote-endpoint = <&usb_a_2_hs_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				hub_hs_port3_ep: endpoint {
+					remote-endpoint = <&usb_a_3_hs_ep>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				hub_hs_port4_ep: endpoint {
+					remote-endpoint = <&usb_a_4_hs_ep>;
+				};
+			};
+		};
+	};
+
+	hub_ss: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		peer-hub = <&hub_hs>;
+		vdd-supply = <&hub_5v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				hub_ss_port1_ep: endpoint {
+					remote-endpoint = <&usb_a_1_ss_ep>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hub_ss_port2_ep: endpoint {
+					remote-endpoint = <&usb_a_2_ss_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				hub_ss_port3_ep: endpoint {
+					remote-endpoint = <&usb_a_3_ss_ep>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				hub_ss_port4_ep: endpoint {
+					remote-endpoint = <&usb_a_4_ss_ep>;
+				};
+			};
+		};
+	};
+};
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
