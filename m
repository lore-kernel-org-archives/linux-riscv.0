Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDACA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCVOsDPzHlilMIvP0+Bh1S87pQIPX/B/m+J0duyAD8c=; b=KzuqBY9rEoTub2
	8lMM3GmcM7qDCyr5nDbuTzrMtmH8G1ABfmsm7Z2PRs63Yalq4Is2v0gbjcMBOh2FOIyUpiFq6xKhm
	E3p4M7ADqUt9OE8igiNRHHA9WK5yAjg4BDEdewaIwM/YXzs6am2z+/ORMGxwzJ6bcZyRUdT8a4PhO
	mRWO5nFypdykXVSReF3wFRUz9ICPbcwP9y0gl6j33pSodgCr0i2LqZ33f9ij4rm0BYCqNsOzM+Dwo
	ujCUDm2XjsW/U/aYot1KLp84bKtVM2R4Y22TPuD6gVvS81o9Mhvaf6g5C4Vxp7zthjubqxpgO+7Ne
	Sg2GyL1RNirllE5tjkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUzp-000000038qh-2azd;
	Tue, 29 Sep 2026 10:23:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUzl-000000038oE-2QYK
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WvgJ48+flKsthVHZJ6xX2VEDe68WuRHfNQO5WceT81k=; b=h6kE2Ehl1Srqq2mTTRCCKKaEKK
	PO09cVQyROiW0Zc7f3EylhxYUTGyHTKeKdRSPIGdU1A+PRgYaGx3EUiDdtqQ7kz+crTk+cPA0yeD9
	dEXaOErrjVdPFlKJzRtBkXYm9tanhdBHgn3BG6QrQv+BlXvgSp5ERg3dKsyyexc2IMH3IP7HZ7woV
	yArbu0PIGUB+1EVQoCXkiULFRoN3unG0nBJOIg2YhiPIZVnX2ylZArcneQg6yTaRX29cf6WO1WVVh
	VMBbcnZq/C0uMlA7X7thlBzMBaGSjZBqwCto0eoOdFwpD54Xgjxl+oK/zSuhWXEUyOQzw5orKKsWc
	YwZX+jOw==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUzg-00000002TOq-0cnd
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 10:23:32 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAD3kPR2kbtqxsxdCQ--.22338S5;
	Tue, 29 Sep 2026 18:23:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 29 Sep 2026 18:22:47 +0800
Subject: [PATCH 3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
MIME-Version: 1.0
Message-Id: <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
In-Reply-To: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAD3kPR2kbtqxsxdCQ--.22338S5
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1ftrW8Zr1UtFW5uF45ZFb_yoWrGrWfpa
	ySkrs3XF93uFWfKwsIvF4I9F15Wr48Jas2krn5Wry8uFWjgasrZr1Fkr1rZFyqgFW5Zw4a
	vrWrAry2yr12k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgQFDGq7hl0qPQABsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112329_473707_FE501C85 
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

Connect AP6256 to SDIO1 with its fixed supplies and PMIC LPO clock.
Use GPIO0_20 for WL_REG_ON and GPIO0_21 for the host-wake interrupt.
Keep GPIO1_24 low to select the external antenna by default.

Use the existing BCM43456 binding and the 198 MHz board limit.
Keep module power during suspend and assign mmc2 to SDIO1.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index 3714047190789bfccd8ff6810342d7ff865e74e4..92b44cb90f57f4830efd29145744c005afa73119 100644
--- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
+++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "th1520.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Milk-V Meles";
@@ -22,6 +23,7 @@ aliases {
 		gpio5 = &aogpio;
 		mmc0 = &emmc;
 		mmc1 = &sdio0;
+		mmc2 = &sdio1;
 		serial0 = &uart0;
 	};
 
@@ -29,6 +31,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	wifi_32k: clock-wifi-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		/* The module LPO input is supplied by PMIC_32K_OUT. */
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x2 0x0>;
@@ -42,6 +51,30 @@ fan: pwm-fan {
 		cooling-levels = <0 64 192 255>;
 		#cooling-cells = <2>;
 	};
+
+	wifi_vbat: regulator-wifi-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "WIFI_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi_vddio: regulator-wifi-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "WIFI_VDDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_pins>;
+		reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <50>;
+	};
 };
 
 /* Names follow the 40-pin header signal labels. */
@@ -77,6 +110,16 @@ &gpio0 {
 			  "", "GPIO0_16", "GPIO0_17";
 };
 
+&gpio1 {
+	/* GPIO1_24 low selects the external antenna through U39. */
+	wifi-antenna-select-hog {
+		gpio-hog;
+		gpios = <24 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "wifi-external-antenna";
+	};
+};
+
 &gpio2 {
 	gpio-line-names = "GPIO2_0", "GPIO2_1", "", "", "", "", "", "",
 			  "", "", "", "GPIO2_11", "GPIO2_12", "",
@@ -206,6 +249,26 @@ rx-pins {
 	};
 };
 
+&padctrl1_apsys {
+	wifi_enable_pins: wifi-enable-0 {
+		gpio-pins {
+			pins = "GPIO0_20";
+			bias-disable;
+			drive-strength = <7>;
+			input-disable;
+		};
+	};
+
+	wifi_host_wake_pins: wifi-host-wake-0 {
+		gpio-pins {
+			pins = "GPIO0_21";
+			bias-disable;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+};
+
 &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_pins>;
@@ -219,6 +282,36 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	non-removable;
+	no-sd;
+	no-mmc;
+	keep-power-in-suspend;
+	vmmc-supply = <&wifi_vbat>;
+	vqmmc-supply = <&wifi_vddio>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		clocks = <&wifi_32k>;
+		clock-names = "lpo";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_pins>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
