Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA0AC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WTtZ3bezoQuyxclEeq7f1RUieU1onHkDUqP3PbCLDw=; b=HCtalolQ5X+R22
	n9YCLoA/P1TE32uNqBiZT2cwOD2zulzXDwD6bNyxzpwBRGaDyILgvTvGoYHepR8IHSXWV9H59Ro+E
	Q7nNX4ygU/k0P48r7zu/YPMRH5NVsLQinE2z5RySYeXIjW5t+cIj8UH9FzlmFWWN2bdG2oKdPATPw
	FMBGu5KTEj8PHzruXorW0sxKLcIQehFaMj+JgzTJYybuEirA9lRXcvBizBLuzI/KXrtWxDwf45Ju+
	ePepAG2hAfTzN8iKvEh9yXa67mK/ATtbyTi5Yzpn0+vwNO1FDLdIIxHdVDVWlVbh/Ldq1bhYY+J9D
	OUrkduCWYa3d0G8dL0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlqC-00000005Klz-0B16;
	Fri, 01 Aug 2025 09:14:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlqA-00000005Kkh-1y8t
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 09:14:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3516520E2E;
	Fri,  1 Aug 2025 11:14:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMBKehoM4TjO; Fri,  1 Aug 2025 11:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754039652; bh=gJCswTbeSm0cfVQDYDQlFj9ENNDHXqLsDS5p8UVfsgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kHneXBoV4+3z2CKrLnBMl2/wPm8HQG+g/FZ79WqnWUyBdRcVgEQJ7/1pL4HC25Tk8
	 sTQC63MV4YROaCJTJgkBaiF7GHg+rR5IwXNg7rBSjd8leon5qvE4ZZLdd2kZVvo+gC
	 Miqqv49cvTIs3Dlz0gnW2wYK+typqmE/TvxoZi4w+15bTnk8zfWZq11Z/NPD3uNkUE
	 ECGGSD3gGiDKnUlRhWMyb1PHsyQB25j4DeJr+GkP3BN55b/jfRU4hlQAWYkWoetxhN
	 T5YxIIYPXTJ7TRcJAzculAzZmEhPPjT95yqbazpkLwEgwQF0aBa1lU2CwjPk3dPD/k
	 o9+BYsI2k72FQ==
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
Subject: [PATCH net v2 3/3] riscv: dts: thead: Add APB clocks for TH1520 GMACs
Date: Fri,  1 Aug 2025 09:12:40 +0000
Message-ID: <20250801091240.46114-4-ziyao@disroot.org>
In-Reply-To: <20250801091240.46114-1-ziyao@disroot.org>
References: <20250801091240.46114-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_021414_637799_CD8C42FB 
X-CRM114-Status: UNSURE (   7.45  )
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
Reviewed-by: Drew Fustini <fustini@kernel.org>
Tested-by: Drew Fustini <fustini@kernel.org>
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
