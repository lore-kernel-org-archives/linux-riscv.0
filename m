Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F83EEB577
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjbwX8ilukLDgB4bHhssPmaiXpiP4HtuSb6pg+kpjdw=; b=qJWvqSs8avsV+2
	XbBicZ1Az4cLlwQ3bBdPzR82p7/ot7cuieWhhNTI0JTRsN7XM5Lfw+2XPOEXyrf+uv+j8879FsPeb
	DODZbdjEwUzQG4IP8WexRjgkRNohH+OTeeqY1jCucjto7kv+zDg4fTiOBHDol2Ih6H+Pur1pPF67g
	XcoMxyhBnOwly7UC6Ul/4HkqM0dcbS9FXzPjv1FwWc6yIqg+Pj5aIDJrEkN47q6Fde6JD++z8HiMB
	MGEJYTWD6CXI9MnR5ugMxi0MPKOPX1WeclPAy6dfxoM2qGM5HpfZwB/YvYJdKvCeXTTdo86XlfdK8
	/NVSZyaBcp5EANLpKtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dmR-000000020vw-1IM4;
	Fri, 03 Apr 2026 12:37:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dmQ-000000020v3-1AjB
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Apr 2026 12:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fk2uF04EFky65aui8l/kCthO5KnG0xGpCxWlOsBVs30=; b=SohqQgezw9I+ivWVeYBWb2KOZe
	5+iQcZgXd0HJ688oLkDUuh7ZmllG+ZWrLC8GaGwJqC4tVKaa+RWJ7SXQyoqn+Y2Cgea0LpFczzY8j
	7ly2GZCjyHk3FoJPFr87k0kXcEdVS/iWNxZ8frfTbtRz++XuU8apt5b5iqZrDraW5OuujEC2Bl3NB
	eOKoM0XX4TVmrKrBsk9cXTluw3uV5bKOwe747UPYvL/+f9k3krh+4V4y8zD9QooB+PM8jH5TfYYeL
	pthlWYV8qSQj/WQXwKthCv1cXtoZByJG9VxFezsPTuKcfR+LVhxV93KthN6c7kgb0iyP3rTOSsStr
	38/hj9qw==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8dmM-000000046ul-0D9o
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:37:41 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowACXPWmHtM9pCsgRDA--.1349S5;
	Fri, 03 Apr 2026 20:37:29 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v7 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Fri,  3 Apr 2026 20:37:25 +0800
Message-ID: <c5c899d8b0234f42c08e35660a747cd66323d673.1775219669.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775219669.git.gaohan@iscas.ac.cn>
References: <cover.1775219669.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXPWmHtM9pCsgRDA--.1349S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyDCF45tF45CF4DXw45Awb_yoW5WFy7pF
	43ursI9as3Ar1fKw43Wa4IgF43Wa1kGFZ3CwnY9r48Jr4jgas09rZayr1rAFn5Jw4kX34a
	yFyUAFyxGrnFgw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwkGDGnPrI4RTwADsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_133738_746153_9694B41D 
X-CRM114-Status: UNSURE (   7.47  )
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
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f7a1dadaa95f..3679a6cb110e 100644
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
@@ -224,8 +247,66 @@ dldo7 {
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
+	vpcie3v3-supply = <&pcie_vcc3v3>;
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
+	vdd-supply = <&vcc5v0_usb30>;
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
