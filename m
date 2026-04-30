Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E59FF8873
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zFDCtBV7UIvd61vcmwIGFL6ThhpgLY46T6SQOldLpdE=; b=S+aC5S6Dk1dTvy
	dQZqN08jC6ZeIWEqQaGqLo2JBaMv9lfueqXlIya7NHUZ+5PFmQ3uXLHutF96Qyi00pzM9nMQ57W88
	bLjbFqtrGgQGe9FG7ixsPgEZJTCUGJsbitXCG5Gr2DCdFr3dyGxyGxA7ylu6F3FhTf8TWf7vtb2Mg
	GZrBgNszU2vC2ulI26/RdszcJgt2vra3TFUr94qRbNCE1rb7rslppB6256ac17JK/ASqWbDIJuxYv
	UhVIliswxDD5cAdShbAXgr6AtNNXEx6dnQVBpw/wb+PsW9+tY5XRYwZ3/6ZJSqKmjFmKj0SSujt3D
	0mxWpYiTsxWxR4Vt8jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWA0-00000005pVG-1j0H;
	Thu, 30 Apr 2026 18:30:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIW9y-00000005pUt-1lAM
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 18:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 083C54410B;
	Thu, 30 Apr 2026 18:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B61C2BCB3;
	Thu, 30 Apr 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777573848;
	bh=rfQclrOG2+K/zyZP/OJeAgFOXwexy9LiNJGhmfYVcGE=;
	h=From:To:Cc:Subject:Date:From;
	b=oCdAiCp4joWuTw+qckuChCZC4np1SnNax/gzBvuDqMstsLiL1iexbesO98p/mUx8U
	 iGD8zFrzoFF4naNp5xS/OEAnddx96wZdwyrjxRSN1WGdNWc4LmUuVDctsSQ6S30UG+
	 i5rtYvW+LoOdaj546lS+JgJNiCOcNlR8x4X3yncZomlCrqc148VgKcw/wRsglUhPQf
	 v4cig64lhcx/w2Ow+Gd5AyIYIl8AnbTVIraanPq/1gsJzWQYPUP3ZPtytKiVD9OLiW
	 0cYQw2nwZBjT+EAkBmHc5SocYEpPkMCUybyNTrlL+/FH+vbhK6Wb9OQBYOJXLQ2Asj
	 VO1PBOdV6g1Jw==
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: microchip: mpfs-ccc: fix peripheral driver registration failures after oob fix
Date: Thu, 30 Apr 2026 19:30:28 +0100
Message-ID: <20260430-unmade-overpay-28d175fd09a3@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VaF+6olKctVzAKmjWOmn2I1XWd1Ql4MMeD+3Nxkkz6I=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmf5x+WuHo6g19+2TSeWpn1wq/FJk8/f32X+CGPR5Ps9 MuP5m9q6yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEEvQYGZbOPzD3NGeHyVeh cwd6kwskv39SXF0vvedIR1ehhfcmue8M/2s9n3+e/NY9Xf8J84baP5sffd+SVy939KDkKS3b9vf OlewA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_113050_523827_CC82B73F 
X-CRM114-Status: GOOD (  12.13  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Commit 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds
access during output registration") fixed the out of bounds access, but
it did so by packing sparse indices into a linear space. When
peripheral drivers request clocks, they obviously don't care for this
compression and use the sparse indices, and therefore try to request the
wrong clocks or clocks that don't exist.

The most straightforward fix here seems to stop being clever with the
packing and just overallocate the array.

Fixes: 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds access during output registration")
Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-mpfs-ccc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
index 0a76a1aaa50f7..40c17593e5941 100644
--- a/drivers/clk/microchip/clk-mpfs-ccc.c
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -32,6 +32,7 @@
 #define MPFS_CCC_FIXED_DIV		4
 #define MPFS_CCC_OUTPUTS_PER_PLL	4
 #define MPFS_CCC_REFS_PER_PLL		2
+#define MPFS_CCC_NUM_CLKS		16
 
 struct mpfs_ccc_data {
 	void __iomem **pll_base;
@@ -178,7 +179,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     out_hw->id);
 
-		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
+		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
 	}
 
 	return 0;
@@ -231,17 +232,9 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
 {
 	struct mpfs_ccc_data *clk_data;
 	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
-	unsigned int num_clks;
 	int ret;
 
-	/*
-	 * If DLLs get added here, mpfs_ccc_register_outputs() currently packs
-	 * sparse clock IDs in the hws array
-	 */
-	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks) +
-		   ARRAY_SIZE(mpfs_ccc_pll1out_clks);
-
-	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, MPFS_CCC_NUM_CLKS),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
@@ -255,7 +248,7 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
 		return PTR_ERR(pll_base[1]);
 
 	clk_data->pll_base = pll_base;
-	clk_data->hw_data.num = num_clks;
+	clk_data->hw_data.num = MPFS_CCC_NUM_CLKS;
 	clk_data->dev = &pdev->dev;
 
 	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
