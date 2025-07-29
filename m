Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F8DC87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AL4VlMjCYC3t0QivAl8xVvQsDCZCjYEu3wPk+KSeUvQ=; b=Ts9tcc/UInEtJJ
	NzIbbC6LsAD/IMBn229s21iIO1Hg57K56T1g2ctY2H7KEhq1vgBxlm+R2nMycsyLhEqwLQJ5vpu1P
	1IncCQiXALtD3sLJAvyqLU5+XF7Mg5gKZQU+YMj4BPjkkr878Zay4E19kWFE6aORJ3tUdXK2rjOVp
	bAweK9Ktx0mBcSmpnXXBV7dZ46z5I0WbpE8yCwCPVZvKDVIQ2pkZJjiL/P3c/6hRjxYpIfwrA0Dy8
	JCF09Zr5TmCMgsjgy/nVjW6WZM0PdsjkrsSatLmcDOIOE+1r71K/BnaXg33IjHy/yYl0r+wBo/rDP
	7r+yiGTdaEYoAA+RBpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh35-0000000GS8l-2g0E;
	Tue, 29 Jul 2025 09:55:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggqA-0000000GQQo-3Q3T
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 09:41:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 70F4925A96;
	Tue, 29 Jul 2025 11:41:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riiRElZg150v; Tue, 29 Jul 2025 11:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753782104; bh=/DRfirf/6tX1d3cecrOUoT/ylGXL16bxkleWN8hcOpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W/GF8vNkmIErBK6sNeP1dkzNGNz1GXJ8rYaze11Iva9WDsfxpW0VE+1kVfhtV/od9
	 bFK4e1+SVowr9gbTsPvOWatMDY2TASbql5gRmaEOj3B3gzLGgMpWgkBxqvu0Uo+Afn
	 H1PWUWpt3RL//shv3FdAq5J62l4yw4VdJpaPAfBr8VjMu5Y05lxnH+vIFvyRskCgQz
	 C83oz2ZSB4O6rFJ4lpz4iweHwdjP20efmRXcTj2+XaDBHKqN+UoN/Ti9N/a2B4om3C
	 M9eAZMyVlvDouPSsMeZZuTRSiL1Z+Yz1wUNZmPe5CYaiB3Nett3VHYdN+ahzJm/fps
	 gw/td2DGWSM5A==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH net 3/3] riscv: dts: thead: Add APB clocks for TH1520 GMACs
Date: Tue, 29 Jul 2025 09:37:34 +0000
Message-ID: <20250729093734.40132-4-ziyao@disroot.org>
In-Reply-To: <20250729093734.40132-1-ziyao@disroot.org>
References: <20250729093734.40132-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_024146_986527_740EC08C 
X-CRM114-Status: UNSURE (   7.21  )
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

Describe perisys-apb4-hclk as the APB clock for TH1520 SoC, which is
essential for accessing GMAC glue registers.

Fixes: 7e756671a664 ("riscv: dts: thead: Add TH1520 ethernet nodes")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e..03f1d7319049 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -297,8 +297,9 @@ gmac1: ethernet@ffe7060000 {
 			reg-names = "dwmac", "apb";
 			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
-			clock-names = "stmmaceth", "pclk";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>,
+				 <&clk CLK_PERISYS_APB4_HCLK>;
+			clock-names = "stmmaceth", "pclk", "apb";
 			snps,pbl = <32>;
 			snps,fixed-burst;
 			snps,multicast-filter-bins = <64>;
@@ -319,8 +320,9 @@ gmac0: ethernet@ffe7070000 {
 			reg-names = "dwmac", "apb";
 			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
-			clock-names = "stmmaceth", "pclk";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>,
+				 <&clk CLK_PERISYS_APB4_HCLK>;
+			clock-names = "stmmaceth", "pclk", "apb";
 			snps,pbl = <32>;
 			snps,fixed-burst;
 			snps,multicast-filter-bins = <64>;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
