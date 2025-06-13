Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B22C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dKfL22UUuTFMxQAZeWPO/aez4+GrCedwm1VlN3IIMY=; b=tcGm4hWa6T9fNo
	nDZw+145s9tv0LkRwyNQdNIoB5tQkcv2+Ye0EOlLOiB+t54w9iy5wq5Kh6X/BN5D/KiXIcYLXFJ45
	gZ4dNKLUJaKeO9dfHwgu4w63JmngTxDzVv8ecYOJntAz9sPNNg7SOZnHwv2zfFF4//xX187H+oNEk
	n05SSnVtKIUEzcdWUOOUHtZlf3+E/PJWgl8i+Q2ZCGmdjqonFY/mnj2QxKWqRmFLGM2A+y/8dl0bp
	0IZGsZaLlRvVSRcmUWm31/CFoXWIJTZ1NV2taWxwYrSSO8Cpw19XyUvXITlMD6vxkm18vkX6jrdw0
	qA0JE4YivBmvAD6wLWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPu1J-0000000F86J-1yZb;
	Fri, 13 Jun 2025 02:19:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPu1G-0000000F84T-2GtR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 02:19:52 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowABXB9aviktoIvMtBg--.44541S5;
	Fri, 13 Jun 2025 10:19:28 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 13 Jun 2025 10:15:09 +0800
Subject: [PATCH net-next 3/4] riscv: dts: spacemit: Add Ethernet support
 for K1
MIME-Version: 1.0
Message-Id: <20250613-net-k1-emac-v1-3-cc6f9e510667@iscas.ac.cn>
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
In-Reply-To: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Vivian Wang <uwu@dram.page>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABXB9aviktoIvMtBg--.44541S5
X-Coremail-Antispam: 1UD129KBjvJXoWxurW7tw43KF47XFW7GFWrAFb_yoW5tr1fpa
	y7AFs3Cr1xCw1rCw1S9F9ruFs5G3WFkFyrGr9rCFWxGF4rtFy2yFn0yFy5Xw48Zws8ArW8
	Gr48XrWxKFnrtw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
	xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4UMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRMxRhDUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_191950_959896_2093ACAA 
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

Add nodes for each of the two Ethernet MACs on K1 with generic
properties. Also add "gmac" pins to pinctrl config.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 48 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 22 +++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86ff137917ced8bfe79a129c86342a..4a7fbb40858dc1e7d2a55d4bb8547d5472ec4fc3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,52 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	gmac0_cfg: gmac0-cfg {
+		gmac0-pins {
+			pinmux = <K1_PADCONF(0, 1)>,	/* gmac0_rxdv */
+				 <K1_PADCONF(1, 1)>,	/* gmac0_rx_d0 */
+				 <K1_PADCONF(2, 1)>,	/* gmac0_rx_d1 */
+				 <K1_PADCONF(3, 1)>,	/* gmac0_rx_clk */
+				 <K1_PADCONF(4, 1)>,	/* gmac0_rx_d2 */
+				 <K1_PADCONF(5, 1)>,	/* gmac0_rx_d3 */
+				 <K1_PADCONF(6, 1)>,	/* gmac0_tx_d0 */
+				 <K1_PADCONF(7, 1)>,	/* gmac0_tx_d1 */
+				 <K1_PADCONF(8, 1)>,	/* gmac0_tx */
+				 <K1_PADCONF(9, 1)>,	/* gmac0_tx_d2 */
+				 <K1_PADCONF(10, 1)>,	/* gmac0_tx_d3 */
+				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
+				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
+				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
+				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
+				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	gmac1_cfg: gmac1-cfg {
+		gmac1-pins {
+			pinmux = <K1_PADCONF(29, 1)>,	/* gmac1_rxdv */
+				 <K1_PADCONF(30, 1)>,	/* gmac1_rx_d0 */
+				 <K1_PADCONF(31, 1)>,	/* gmac1_rx_d1 */
+				 <K1_PADCONF(32, 1)>,	/* gmac1_rx_clk */
+				 <K1_PADCONF(33, 1)>,	/* gmac1_rx_d2 */
+				 <K1_PADCONF(34, 1)>,	/* gmac1_rx_d3 */
+				 <K1_PADCONF(35, 1)>,	/* gmac1_tx_d0 */
+				 <K1_PADCONF(36, 1)>,	/* gmac1_tx_d1 */
+				 <K1_PADCONF(37, 1)>,	/* gmac1_tx */
+				 <K1_PADCONF(38, 1)>,	/* gmac1_tx_d2 */
+				 <K1_PADCONF(39, 1)>,	/* gmac1_tx_d3 */
+				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
+				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
+				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
+				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
+				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index de403bda2b878c60d9eb5b4d8d336e5c52498159..61c804d3a3791127b5fee7ae78dd5be44dd33318 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -580,5 +580,27 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k1-emac";
+			reg = <0x0 0xcac80000 0x0 0x420>;
+			clocks = <&syscon_apmu CLK_EMAC0_BUS>;
+			interrupts = <131>;
+			mac-address = [ 00 00 00 00 00 00 ];
+			resets = <&syscon_apmu RESET_EMAC0>;
+			spacemit,apmu = <&syscon_apmu 0x3e4>;
+			status = "disabled";
+		};
+
+		eth1: ethernet@cac81000 {
+			compatible = "spacemit,k1-emac";
+			reg = <0x0 0xcac81000 0x0 0x420>;
+			clocks = <&syscon_apmu CLK_EMAC1_BUS>;
+			interrupts = <133>;
+			mac-address = [ 00 00 00 00 00 00 ];
+			resets = <&syscon_apmu RESET_EMAC1>;
+			spacemit,apmu = <&syscon_apmu 0x3ec>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
