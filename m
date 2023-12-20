Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B114C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 00:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS8JNho0pUipStUi3z6MjDFb0epiCBH9boCusXTXKvA=; b=pcNIYyEmmDM2S/
	vXwQUpP79otuBJImUUH+i7Dh7NWoaCjLaHPBUVp8ayb35i8Hha/kuvKrRW7SGz8nYLw8cxZtOjTHB
	HI/SN6Vklt6rO30i+oAz+uc6tcU4QtzeJR/iVpehPyHp3+6384bNfM8pts/DDz4XErXyop0VvhShe
	docFVhn9GvC035uskT7j8I7uCINAg7/3wvV10DTVA1StRzLkZz2lYlMfnw2kaqkJFbQHd2l157su6
	YOKcn+JQ3xQbUi9WnK6WsY2WSj1b0Hm2YyE3TsclQ1gvB3zp1dFwjfRqjfURg/qTAtt+qSxw/C0Y5
	AfK3xFc3PZj8LfPmqiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFkjW-00FpO0-1w;
	Wed, 20 Dec 2023 00:46:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFkjT-00FpMp-37
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 00:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703033202;
	bh=N62km21T/WA812DJZg7FAQPI49dJTRMBzG/fnA558jA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbIau3HtZbeRZBr5Vf1Zb72VHkCnINx+MrGugKr2VTNaVsDRHipT8iIqG1tdwl5ls
	 LQn29iO85YEK0n96K9eoOLOLDnBB5DVnlA4p6r4Mdqu6qJ7dkBRvC5R13rQWEzUDs2
	 niwPS9cFeWRmOHw0wMfbPy+Hp1e9vuMuW75ycwdyyHscADQGVCNgtQANhjrpLL1P0v
	 6BPLDmLFzZ2z3gj1CTZ4vJHy6vGn4KPBfvY/F+1/L4aGNT/8cZS3Z62e9NdRre/syo
	 jdXftp89glLg7yZp7g0Xt5CzwJLemjTVW19nHFrIBMnmUwuUnzDAtPiu3e4U+nJ508
	 kjH5IKhnYsWXg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C3CB3781F86;
	Wed, 20 Dec 2023 00:46:42 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v5 1/4] riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
Date: Wed, 20 Dec 2023 02:46:34 +0200
Message-ID: <20231220004638.2463643-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_164644_133559_86DE893E 
X-CRM114-Status: UNSURE (   7.60  )
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

Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index c216aaecac53..2ebdebe6a81c 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -204,6 +204,37 @@ sdio1: mmc@10010000 {
 			status = "disabled";
 		};
 
+		gmac: ethernet@10020000 {
+			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
+			reg = <0x0 0x10020000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
+				 <&clkgen JH7100_CLK_GMAC_AHB>,
+				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
+				 <&clkgen JH7100_CLK_GMAC_TX_INV>,
+				 <&clkgen JH7100_CLK_GMAC_GTX>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "gtx";
+			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
+			reset-names = "ahb";
+			interrupts = <6>, <7>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			max-frame-size = <9000>;
+			snps,multicast-filter-bins = <32>;
+			snps,perfect-filter-entries = <128>;
+			starfive,syscon = <&sysmain 0x70 0>;
+			rx-fifo-depth = <32768>;
+			tx-fifo-depth = <16384>;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,fixed-burst;
+			snps,force_thresh_dma_mode;
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <16>;
+				snps,rd_osr_lmt = <16>;
+				snps,blen = <256 128 64 32 0 0 0>;
+			};
+		};
+
 		clkgen: clock-controller@11800000 {
 			compatible = "starfive,jh7100-clkgen";
 			reg = <0x0 0x11800000 0x0 0x10000>;
@@ -218,6 +249,11 @@ rstgen: reset-controller@11840000 {
 			#reset-cells = <1>;
 		};
 
+		sysmain: syscon@11850000 {
+			compatible = "starfive,jh7100-sysmain", "syscon";
+			reg = <0x0 0x11850000 0x0 0x10000>;
+		};
+
 		i2c0: i2c@118b0000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x118b0000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
