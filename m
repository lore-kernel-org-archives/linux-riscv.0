Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC15C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgITlj5F+M+wWEpeZbvUKh0SHqAYo+ZRplg9s+QyN7Q=; b=40e03HY9KqZDO0
	XWRv9AoBd4rPGRuc87UcWKR+LiVYRtcdLy+uP/+IGYXwdzZXbNb6kYGTCun+3NHZKWBuVY6EytcX6
	AzhRk45QJMJ3V4GeYg6s5YX4WG6EZhhveSpHskV3eO0o1KoLNSRGVo4iTZxWWwm/omeYaUAyvLlrB
	YADeZGK9ndo/6vrdnRjaEbblqEwKdBzg4duwGzUyUDGFnH8m60aL4tbwp1AFxfqpcGvdCqmb304A1
	+TvteBp9I0fA1H9RhSapJFcjwWSO/xX7xrh2q+3utsEA88/NO2wMwFaRebdRoA7TX5LayEBIKLi+O
	pcjWxKWLOmsgTrjA0vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgfx-008ZOi-P9; Sat, 11 Feb 2023 03:35:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPq-008Rzm-6l; Sat, 11 Feb 2023 03:19:08 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B15676602112;
	Sat, 11 Feb 2023 03:19:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085544;
	bh=giBLXfHgd+nXmXgHpm08kBXy7O346waFR5TnsQQNUJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c4QNRDT72f7rGgDkbpsH5cio8u1cyWic15TpkDUfoubuBgE5U6mjkH2uwqQJsEuck
	 /zvq5XfWc3sECoa1uHGMUfMgw5BxNfXqKQVL9+J0nimoYf58szUQrILkSxUDqvtW08
	 B2ovKjfoji0bZP+v2SsEywo2OiyB+wXv29mrqZVM2DBeRaC/YLhDUkP+F15oQPq5fh
	 ch5CR2oIk/P8nfnsHGCF+yyvyg+j/E1hpz/o2U5lJkRK1Mkts/8dfttRgJ1kTqVGxL
	 yZeCyn8WW4dI2kWbdLtXmggsRq7SKHm2GLZ0HacPogzx/P3o3jfS4w7S2JwSAe/fGz
	 NwN72WtsW7yTw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 11/12] riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
Date: Sat, 11 Feb 2023 05:18:20 +0200
Message-Id: <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191906_444956_7E038539 
X-CRM114-Status: UNSURE (   8.48  )
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

Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
StarFive JH7100 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 88f91bc5753b..0918af7b6eb0 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -164,6 +164,44 @@ rstgen: reset-controller@11840000 {
 			#reset-cells = <1>;
 		};
 
+		sysmain: syscon@11850000 {
+			compatible = "starfive,jh7100-sysmain", "syscon";
+			reg = <0x0 0x11850000 0x0 0x10000>;
+		};
+
+		gmac: ethernet@10020000 {
+			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
+			reg = <0x0 0x10020000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
+				 <&clkgen JH7100_CLK_GMAC_AHB>,
+				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
+				 <&clkgen JH7100_CLK_GMAC_GTX>,
+				 <&clkgen JH7100_CLK_GMAC_TX_INV>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
+			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
+			reset-names = "ahb";
+			interrupts = <6>, <7>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			max-frame-size = <9000>;
+			phy-mode = "rgmii-txid";
+			snps,multicast-filter-bins = <32>;
+			snps,perfect-filter-entries = <128>;
+			starfive,syscon = <&sysmain>;
+			rx-fifo-depth = <32768>;
+			tx-fifo-depth = <16384>;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,fixed-burst;
+			snps,force_thresh_dma_mode;
+			snps,no-pbl-x8;
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				snps,blen = <256 128 64 32 0 0 0>;
+			};
+		};
+
 		i2c0: i2c@118b0000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x118b0000 0x0 0x10000>;
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
