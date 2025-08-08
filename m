Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA2C87FD3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFiBbH7PJGwJ4QirCDxRkFti5pIPpcUqiFfPKUjvDu0=; b=piM+IiOAOpibCe
	Nlepg7IH1+19gm3r6d5e59fS9gdkaocD/bGc+yrN1lnmHm+d/gJFjKadhugAu36jcAuHd4TgHTmCG
	cs5L+ZXFoA7CtxYZeLqWwQl+HsoeCwnwWp83P0uDEnivQQKevbe8gP3m/waD73Qk7Iwv1O5WOav4V
	2OJQXTVa/sGwtl68l+0jpABRWJYnAgqmrnRJdtOM43rOAJoWmK9tlGMFiRDr92/t8Xx4yDqNTYrK9
	ADTD2ICX3T/2vZcEA2uuMjnMPjFIDsXkySkYrrsrrUDfIMVTwL8nBbzDbTuSPWxVwXaBeo6HY0jr2
	XrI2Vr6f9T7XYwlaxCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJeO-00000002TkR-3g18;
	Fri, 08 Aug 2025 09:44:36 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJeM-00000002Tic-0Dbf
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 09:44:35 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C5AD22093B;
	Fri,  8 Aug 2025 11:44:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSeEIdqlRFtF; Fri,  8 Aug 2025 11:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754646272; bh=ajJkn2rR1tM7L+hlXIfE6Ac5tEpM02G6+RdV1+gRsGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JybmdVylgPRleVDjovbA2Dctq0OezgzR/rAOTF3LYY4tUfpDcdZz7e/VNyoQI0YdV
	 ftwpNXkUC2/xOcLhGTCi/9Otu3cS4fLdd7QXBF+L5kgeQHaxpKOUrxdZRjNoFHxm0n
	 KJfeYKEloOAkMrFkB+s2kTf8QoMCxEZm7IJLd037ypam2RZLHPvvNmaCBZcyBVgUW8
	 1SgAZVXuUdR4RiNkPtAFH8Isw9EEt5uaxt3rNJypLtxBjnrTnWJojOQqtCv5+/2OMs
	 XfNq+/YMrpzwhz+P0fKIO2MIIzkM4yjLfPsVThzUR+ZH0RqGO2xztKv4YubZCpLAKS
	 1MWau214tA2dw==
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
Subject: [PATCH net v3 2/3] net: stmmac: thead: Get and enable APB clock on initialization
Date: Fri,  8 Aug 2025 09:36:55 +0000
Message-ID: <20250808093655.48074-4-ziyao@disroot.org>
In-Reply-To: <20250808093655.48074-2-ziyao@disroot.org>
References: <20250808093655.48074-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_024434_220065_04A16FCD 
X-CRM114-Status: GOOD (  12.24  )
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

It's necessary to adjust the MAC TX clock when the linkspeed changes,
but it's noted such adjustment always fails on TH1520 SoC, and reading
back from APB glue registers that control clock generation results in
garbage, causing broken link.

With some testing, it's found a clock must be ungated for access to APB
glue registers. Without any consumer, the clock is automatically
disabled during late kernel startup. Let's get and enable it if it's
described in devicetree.

For backward compatibility with older devicetrees, probing won't fail if
the APB clock isn't found. In this case, we emit a warning since the
link will break if the speed changes.

Fixes: 33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")
Signed-off-by: Yao Zi <ziyao@disroot.org>
Tested-by: Drew Fustini <fustini@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index c72ee759aae5..f2946bea0bc2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -211,6 +211,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct plat_stmmacenet_data *plat;
 	struct thead_dwmac *dwmac;
+	struct clk *apb_clk;
 	void __iomem *apb;
 	int ret;
 
@@ -224,6 +225,19 @@ static int thead_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
 				     "dt configuration failed\n");
 
+	/*
+	 * The APB clock is essential for accessing glue registers. However,
+	 * old devicetrees don't describe it correctly. We continue to probe
+	 * and emit a warning if it isn't present.
+	 */
+	apb_clk = devm_clk_get_enabled(&pdev->dev, "apb");
+	if (PTR_ERR(apb_clk) == -ENOENT)
+		dev_warn(&pdev->dev,
+			 "cannot get apb clock, link may break after speed changes\n");
+	else if (IS_ERR(apb_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(apb_clk),
+				     "failed to get apb clock\n");
+
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
 	if (!dwmac)
 		return -ENOMEM;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
