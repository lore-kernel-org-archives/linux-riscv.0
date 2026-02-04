Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A1E83EED
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rYO/vrvBQ2gf22+YpVTFAsLM0PqNoVaBSABacmV9aQ=; b=yit+DyWxIhbnrS
	hEk91JnPBiFLF1nw23SWIdrKE58NAYOzUe8XAc5vmkO3P8NHsIeDIVKO/n6Jj/+T/cgtFY4EgkRbW
	sx8oboB2iBmHBAT+VQ1zkKgKYE3WCgT6qmDq3YO6leKEWGIVvi+DOcP98V0VNwe3yO0f4YnRI8G4M
	lIVqKzBCBMO9g3CUlqyqsXc7srU2LdswhSEhIC/CN1vsN4Hs917J003Gbq/ZAwf7pZPAKdVnGuNcA
	5MzpHEeQmXF2vfHuih1XsFGeyK5CqD7516SyvgPBGJCjHdloWJnIfEwSHmM6kir21etLATitByHyb
	L3REgefiIh6amDr3XpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYGX-000000086g3-2X3X;
	Wed, 04 Feb 2026 08:29:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYGU-000000086eE-3Z7U
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 08:29:36 +0000
Received: from duge-virtual-machine (unknown [223.160.207.2])
	by APP-01 (Coremail) with SMTP id qwCowADnjWlcA4NpYqgfBw--.6098S5;
	Wed, 04 Feb 2026 16:29:22 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: ulf.hansson@linaro.org,
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
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Subject: [PATCH 3/3] riscv: dts: canaan: Add mmc nodes for K230
Date: Wed,  4 Feb 2026 16:29:08 +0800
Message-ID: <20260204082908.27501-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnjWlcA4NpYqgfBw--.6098S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy8KF1xKFW8ury7XrW7XFb_yoW5Aw1kp3
	9rCFZxGF9agr1S9a42kryv9rs3CF4vkF4Fgw1av34Utr4jqrWqkw1rJ3y8XF1UXa18Z392
	934rJryxCr4Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [223.160.207.2]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_002935_263218_21A8B45C 
X-CRM114-Status: UNSURE (   7.54  )
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

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 17 ++++++++++++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi |  7 +++++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 26 +++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
index 55197cfc25b4..fdf6524db09b 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
@@ -15,6 +15,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		mmc0 = &emmc;
+		mmc1 = &sdio;
 	};
 
 	chosen {
@@ -75,6 +77,21 @@ uart0-rxd-cfg {
 	};
 };
 
+&emmc {
+	vmmc-supply = <&vdd_3v3>;
+	vqmmc-supply = <&vdd_1v8>;
+};
+
+&sdio {
+	bus-width = <4>;
+	max-frequency = <50000000>;
+	vmmc-supply = <&vdd_3v3>;
+	vqmmc-supply = <&vdd_3v3>;
+	cap-sd-highspeed;
+	no-1-8-v;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
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
index b369b7d8dc83..296bf448403d 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -177,6 +177,32 @@ usb1: usb@91540000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@91580000 {
+			compatible = "canaan,k230-emmc";
+			reg = <0x0 0x91580000 0x0 0x1000>;
+			clocks = <&sysclk K230_HS_SD0_AXI_GATE>,
+				 <&sysclk K230_HS_SD0_CARD_GATE>,
+				 <&sysclk K230_HS_SD0_BASE_GATE>,
+				 <&sysclk K230_HS_SD0_TIMER_GATE>,
+				 <&sysclk K230_HS_SD0_AHB_GATE>;
+			clock-names = "bus", "core", "base", "timer", "ahb";
+			interrupts = <142 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		sdio: mmc@91581000 {
+			compatible = "canaan,k230-sdio";
+			reg = <0x0 0x91581000 0x0 0x1000>;
+			clocks = <&sysclk K230_HS_SD1_AXI_GATE>,
+				 <&sysclk K230_HS_SD1_CARD_GATE>,
+				 <&sysclk K230_HS_SD1_BASE_GATE>,
+				 <&sysclk K230_HS_SD1_TIMER_GATE>,
+				 <&sysclk K230_HS_SD1_AHB_GATE>;
+			clock-names = "bus", "core", "base", "timer", "ahb";
+			interrupts = <144 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		usbphy: usb-phy@91585000 {
 			compatible = "canaan,k230-usb-phy";
 			reg = <0x0 0x91585000 0x0 0x400>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
