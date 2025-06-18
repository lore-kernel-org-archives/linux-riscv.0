Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD9CC7115E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxaGvgXw0rVSFNAGWnJNGm41abnFHSUID7wK1NX/YWI=; b=ajXiTnfiAjkcHJ
	lc/Jd5t2SM12UR4oeVJTCvxavKspmsYgxdgU6Zyyl0b+oxm6LH1gbjWp/ZHBDWvVkzA+DrIYWUj8S
	/iOlScxp0bfaWZcOII79VXtIF2CueiUTPCirNeLBdf48oQUKpd6O6JJAlAcAtwPP9rOD8/nHAIPdy
	Am4jYDpO9epIlHXr70iZKobkeHojKCsXuJtObJfdX6085vF7GyAbX3tT+D/erF5ACWV3d6fnVb/6g
	Nzd4JBgsg5t9Fp3EGGvgWBQJMKm+gAiRZgwth5i8vc6WcS4g40+f75XnnDcEPHBJhZjQU82+bMrlX
	GoJUmdPwHJjgYKIqA73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjiA-00000008vbz-2jGI;
	Wed, 18 Jun 2025 03:43:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjgG-00000008vFa-0Hxw
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:41:47 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowABnFtVpNVJoV95NBw--.6548S7;
	Wed, 18 Jun 2025 11:41:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 18 Jun 2025 11:40:50 +0800
Subject: [PATCH net-next v2 5/6] riscv: dts: spacemit: Add Ethernet support
 for BPI-F3
MIME-Version: 1.0
Message-Id: <20250618-net-k1-emac-v2-5-94f5f07227a8@iscas.ac.cn>
References: <20250618-net-k1-emac-v2-0-94f5f07227a8@iscas.ac.cn>
In-Reply-To: <20250618-net-k1-emac-v2-0-94f5f07227a8@iscas.ac.cn>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABnFtVpNVJoV95NBw--.6548S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary5JF47JFyxWw1UGrW7Arb_yoW8Wr1Dpr
	WYkFs3urWDGr1Syw43Zryq9r4fGan5XrZ5G343uF1rJ3yqvF90vw15Kwn7tr1DWrW5X345
	Wr4xtFWUur1qkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
	6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRrsqJUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_204144_514167_468AF9A3 
X-CRM114-Status: UNSURE (   7.50  )
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

Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
reset.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec490aff184d5915d680dbd9f00cb..6b841dacb61ec6592339f174267f4936c0579597 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -35,3 +35,49 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
