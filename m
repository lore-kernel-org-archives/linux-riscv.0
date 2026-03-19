Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0DA109022E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLRnDwLnoLZLYewp1RtuUh/OXlvLAWLJCMmX2yo0NZM=; b=LTXa2OlKjTkiCO
	mgNFJu+DIlzs6JpVOGEG+ZRSs2QhiDUx6KPa+nZzJ5Xs9lV31zhfpczoM4NWVuC61xz3vfwwAh8rj
	fw0ZZGykAB7U1WgJhWUDoXEfMQ08oW/e8h139LUvE51lTS5cMiMYgIL15iy+hT7CF3jAFRdvYWi8s
	nyJiMB1IbHJXEnQGuhv623FH5H5quhP8lrn00GfNIgJdtfiSnwb/FNhBe0f9TwoTpVHupWxAZ/jaf
	MYW1aqauPLzvuIJwScFvyaODI4D+qAykTC3I5P8h5O/YLpoZtil8TmpmD24om6EhuhnSzyLijSwli
	DLxuvjq8Zp1ekYsTv6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E2M-0000000Ajp8-0lYi;
	Thu, 19 Mar 2026 14:07:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E2E-0000000Ajll-2fFy
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 14:07:41 +0000
Received: from duge-virtual-machine (unknown [183.192.222.244])
	by APP-03 (Coremail) with SMTP id rQCowABnieAaA7xpRC4mCw--.14810S5;
	Thu, 19 Mar 2026 22:07:26 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: krzk@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc,
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v5 3/3] riscv: dts: canaan: Add mmc nodes for K230
Date: Thu, 19 Mar 2026 22:07:05 +0800
Message-ID: <20260319140705.123502-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnieAaA7xpRC4mCw--.14810S5
X-Coremail-Antispam: 1UD129KBjvJXoWxJw48Jw4UZw15uryUur13CFg_yoWrXFykp3
	9rCFZ3Kas2gr1S9ay2kry09rs3CF4kKr1FgwnIv347Kr4jqFWvkwn5Aw48XF1UXa1UA3y2
	g3yrJryI9r4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [183.192.222.244]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_070739_040660_A9AE2591 
X-CRM114-Status: UNSURE (   8.34  )
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

Add MMC nodes to K230, including eMMC and SDIO. Enable HS200 eMMC
on the SoM and SDIO high-speed on the board.

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 57 +++++++++++++++++++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi |  7 +++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 28 +++++++++
 3 files changed, 92 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
index 55197cfc25b4..21df4e01aca2 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
@@ -15,6 +15,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		mmc0 = &emmc;
+		mmc1 = &sdio;
 	};
 
 	chosen {
@@ -73,6 +75,61 @@ uart0-rxd-cfg {
 			input-schmitt-enable;
 		};
 	};
+
+	mmc1_pins: mmc1-pins {
+		mmc1-cmd-cfg {
+			pinmux = <K230_PINMUX(54, 2)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+
+		mmc1-clk-cfg {
+			pinmux = <K230_PINMUX(55, 2)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+
+		mmc1-data-cfg {
+			pinmux = <K230_PINMUX(56, 2)>, /* mmc1 data0 */
+				 <K230_PINMUX(57, 2)>, /* mmc1 data1 */
+				 <K230_PINMUX(58, 2)>, /* mmc1 data2 */
+				 <K230_PINMUX(59, 2)>; /* mmc1 data3 */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+};
+
+&emmc {
+	vmmc-supply = <&vdd_3v3>;
+	vqmmc-supply = <&vdd_1v8>;
+};
+
+&sdio {
+	bus-width = <4>;
+	max-frequency = <50000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&vdd_3v3>;
+	vqmmc-supply = <&vdd_3v3>;
+	broken-cd;
+	cap-sd-highspeed;
+	no-1-8-v;
+	status = "okay";
 };
 
 &uart0 {
diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi b/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
index 566665d39239..1db7569253fe 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
@@ -24,3 +24,10 @@ &sysclk {
 	clocks = <&osc24m>, <&timerx_pulse_in>;
 	clock-names = "osc24m", "timer-pulse-in";
 };
+
+&emmc {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index e1ec3e1f40a7..e3c6926dbadc 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -192,6 +192,34 @@ usb1: usb@91540000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@91580000 {
+			compatible = "canaan,k230-emmc";
+			reg = <0x0 0x91580000 0x0 0x1000>;
+			clocks = <&sysclk K230_HS_SD0_CARD_GATE>,
+				 <&sysclk K230_HS_SD0_AHB_GATE>,
+				 <&sysclk K230_HS_SD0_AXI_GATE>,
+				 <&sysclk K230_HS_SD0_BASE_GATE>,
+				 <&sysclk K230_HS_SD0_TIMER_GATE>;
+			clock-names = "core", "bus", "axi", "block", "timer";
+			interrupts = <142 IRQ_TYPE_LEVEL_HIGH>;
+			canaan,usb-phy = <&usbphy>;
+			status = "disabled";
+		};
+
+		sdio: mmc@91581000 {
+			compatible = "canaan,k230-sdio";
+			reg = <0x0 0x91581000 0x0 0x1000>;
+			clocks = <&sysclk K230_HS_SD1_CARD_GATE>,
+				 <&sysclk K230_HS_SD1_AHB_GATE>,
+				 <&sysclk K230_HS_SD1_AXI_GATE>,
+				 <&sysclk K230_HS_SD1_BASE_GATE>,
+				 <&sysclk K230_HS_SD1_TIMER_GATE>;
+			clock-names = "core", "bus", "axi", "block", "timer";
+			interrupts = <144 IRQ_TYPE_LEVEL_HIGH>;
+			canaan,usb-phy = <&usbphy>;
+			status = "disabled";
+		};
+
 		usbphy: usb-phy@91585000 {
 			compatible = "canaan,k230-usb-phy";
 			reg = <0x0 0x91585000 0x0 0x400>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
