Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E14C87FD3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WTtZ3bezoQuyxclEeq7f1RUieU1onHkDUqP3PbCLDw=; b=kurys1Piqsira7
	d+bKrMoJ0ksNB41HDB5uSeSgH4Ov3a5/w38KnwLGMv9iMx8bhmk8hKrAkxhe8UGtpLgdet4mJaDgp
	iXxvpkYEfT0DnRsL/YWYqunqgL4cfyn/jcVa6cHLOEUSAKqHGVmXfdbh1lgW0txSj7grE1mWaGzHS
	EKwdQpYkLr2GgeUI7u2TDBdhZoN4ysoghGoOhT41k2FTB3Jd+Kn735MF3QuPLUovBJsAGfZCeAheq
	Q53uY9hNcxVL7ij2uhkcOTZaNhNhl45w7sdm5hK/7Y4/Ke3z590wdLi31G9s0cc1HSYX5vGhPnpx2
	HScjhHXw0dSiSQWdkwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJfI-00000002U5D-25pe;
	Fri, 08 Aug 2025 09:45:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJfF-00000002U3t-43W6
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 09:45:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A633123CB7;
	Fri,  8 Aug 2025 11:45:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQEZZtQOrJMo; Fri,  8 Aug 2025 11:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754646328; bh=gJCswTbeSm0cfVQDYDQlFj9ENNDHXqLsDS5p8UVfsgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JuWdI/22rnTfj2+JDLe2ZFyQkwJTP7HMjmbYqFkH//AlUH3gEJbC7WqnExmM4Essq
	 UxFUpesshFjjPOcR5Mq6H1pkI3xd/GbzIrdN4sDqaZDMwuOq85mMIdKH+FE/Tptx9y
	 8zW68LQa3IynfDKWmRaT0BHQ2QIvMocS22ZqActTwLrUY1AJmaLsAp4/HWUBWM/p8y
	 xO27gMxq/Dj7JDyb4W+Sd5L4Ku1xsdvep3P87J0rKgxGqDBdOeueMhJaeil7Oje/I3
	 X0IjEMhbCU/yX3cSoOf9DekyJnke9GH9qBhZkK7bn1E92EGrVt4PuTrIfKOU2dnA1y
	 eGYyHIeZPGm0w==
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
Subject: [PATCH net v3 3/3] riscv: dts: thead: Add APB clocks for TH1520 GMACs
Date: Fri,  8 Aug 2025 09:36:56 +0000
Message-ID: <20250808093655.48074-5-ziyao@disroot.org>
In-Reply-To: <20250808093655.48074-2-ziyao@disroot.org>
References: <20250808093655.48074-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_024530_137017_371AC790 
X-CRM114-Status: UNSURE (   6.89  )
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
