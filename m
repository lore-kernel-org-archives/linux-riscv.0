Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F830E9D812
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdrGJCLYHZxVi6nipRRer6Hv4DjB58LtXizXPMEoGrc=; b=Mc8HoW6BzOQt71
	GPcQKuqaIPrZ5wKrD9BfaNSuwV0iqvwzjea0mHsssMAkT7yjuHjSGxlU/SOB/yTaifEXSjDwOKxlh
	4hO2JwMustd+IcFyX2O96Xn+CyqX0X040TIlxacAqhnUcMY6NUEuH4eczO6psbOSJKy1HuGOw0Cvo
	ZOhCRg5BWW8at0d2MR5gMF2bzwNGq8+T2Bh6I6VKasXw86cGSbsyD19AmgQFv8jh915VRgQ1SUZSV
	Dd2KN4SzHOZkg9jrHKYeoHEZ5ZzkrI7qDInmHEdEAgIACu4BOGdASvGh4h8jWx9+toqd1R+LypTIr
	gcAK5sA8bm8Kayq6lYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TBp-00000004QCD-3qVl;
	Sun, 05 Apr 2026 19:31:21 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TBj-00000004Q93-0Ukg
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:31:18 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-05 (Coremail) with SMTP id zQCowADnfBB3uNJpOkKeDA--.25923S5;
	Mon, 06 Apr 2026 03:31:06 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Vincent Legoll <legoll@online.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v9 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Mon,  6 Apr 2026 03:30:43 +0800
Message-ID: <dba1428ac649dbc6d3fe4c58f0c6d24bb7432b9f.1775417019.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775417019.git.gaohan@iscas.ac.cn>
References: <cover.1775417019.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnfBB3uNJpOkKeDA--.25923S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyDCF45tF45CF4DXw45Awb_yoW5Ww1fpF
	47ursI9as3Ar1fKw45Wa4IgF43Ga1kGFZ3CwnY9r48Jr4DWas09rZayr1rAFn5Jw4vq34a
	yFyUAFyxGFsFgw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwkIDGnSel8yaQABsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_123115_533225_ACBFDCFC 
X-CRM114-Status: UNSURE (   7.42  )
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

Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
OrangePi RV2 board.

The board utilizes a Genesys Logic GL3523 USB3.0 hub.

Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
PHY-related Device Tree nodes for the OrangePi RV2.

Co-developed-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f7a1dadaa95f..157bbb39c268 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -23,6 +23,15 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
+		regulator-name = "pcie_vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vcc_5v0: regulator-vcc-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_5v0";
@@ -42,6 +51,16 @@ vcc4v0: regulator-vcc4v0 {
 		vin-supply = <&vcc_5v0>;
 	};
 
+	vcc5v0_usb30: regulator-vcc5v0-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -54,6 +73,10 @@ led1 {
 	};
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -224,8 +247,65 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc3v3>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
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
+	vbus-supply = <&vcc5v0_usb30>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <0x1>;
+		peer-hub = <&hub_3_0>;
+		vdd-supply = <&vcc_5v0>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb5e3,620";
+		reg = <0x2>;
+		peer-hub = <&hub_2_0>;
+		vdd-supply = <&vcc_5v0>;
+	};
+};
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
