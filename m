Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC3C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5koV1EuWs4D4jnE+f9YCxilrGPmiuyjBdXwsenpcYc=; b=0qZCRbr4rOTEeO
	Y909he9Dkj0Mi28om48E257uQ+BTVMPLBlJ22OdOiqQPsNF8vzIMFq3fLxQAusgraCIzYlax23Kgz
	klO6YhTPhatn7YKs+mzqJxJ8BeFXDPsAyqA8gflWXVzIOAGNaxkIPpupURHiKikJdicXDzC1M7JSb
	K8eUXl9wSGKPMvKR0hOTyTG3BOs59Cybr7OyUdIvMOlkEqyhVChhmy3qSeKoL4KuU5ZDY4s+Fb/CB
	cDVSN01xcT2UpQ7vaTZVs003hAubBeKOUR1rZaMDlkgt7H2XjsdXC4ITK75qIlfc2zxmzUHGATMv0
	ZfeEzdkv7/q+08dhMQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtI7-00C4Em-1E;
	Mon, 22 Jan 2024 12:20:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtI4-00C4D3-12
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFF7661381;
	Mon, 22 Jan 2024 12:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD11C43390;
	Mon, 22 Jan 2024 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926035;
	bh=tebc2epqBPqi3q6nwRuHzvgjiwhDevUi+LtXh9FShW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d39xi6db5ggCp+RmilEG82Cw9t3JzSuihoMmextnDsrpiac5WF2FYM9xtMbYTsZhd
	 gg1TVEJIxBuI8dWXqC5YyD0NLvgJ83BNRytMIc2Y58yxFN/pGdyHfqp4vGl1KHECBO
	 xQcVeiqpy69wAC2PQiGYY0+wpiUB/YXFmE9ggje4IyR9ctb+m/DnDYp7+g87pnagRt
	 YiM7BPGhsWm6acnIecy+zNOjgpEx1021GKPKDAYz56NJUiclVhIf6SnlYLN1pp7F/z
	 qHrAD6Xz0r+Dkby7a+xFW+0piYlfl5eLWNxXjgCU7M3hUo8Bc5isbLaDkHRROab0mO
	 7I/2++UtIizFQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/7] clk: microchip: mpfs: add missing MSSPLL outputs
Date: Mon, 22 Jan 2024 12:19:53 +0000
Message-ID: <20240122-scarring-auction-b13c25a422bd@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1OkhpL0+t001V44z+z0voVrWBZYio2gp1txLGSVnNbo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlP3b48MMc7LmOpeONVl+ZN3Wi3azvNyyuOFVm489 4R5HbNZRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbypIGRYdWbLRoPHrc907lS dppBYWmKnll0tqplgMev0M8egmvWJDMyPLe/2pW153XCpOTFKn36lx/WV5atsZE2FPtYEjevevs 3VgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042036_449111_FBD8E6D0 
X-CRM114-Status: GOOD (  11.01  )
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

The MSSPLL has 4 outputs, of which only the cpu/axi/ahb clock parent is
currently implemented.
Add the CAN clock too, as that'll be needed by the driver for the CAN
controller and uses output 3.
While we are here, the other two missing clocks, used by the eMMC/SD
controller and by the "user crypto".

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 911905d0433d..bed6adbb8a70 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -28,6 +28,7 @@
 #define MSSPLL_REFDIV_SHIFT	0x08u
 #define MSSPLL_REFDIV_WIDTH	0x06u
 #define MSSPLL_POSTDIV02_SHIFT	0x08u
+#define MSSPLL_POSTDIV13_SHIFT	0x18u
 #define MSSPLL_POSTDIV_WIDTH	0x07u
 #define MSSPLL_FIXED_DIV	4u
 
@@ -240,6 +241,12 @@ static const struct clk_ops mpfs_clk_msspll_out_ops = {
 static struct mpfs_msspll_out_hw_clock mpfs_msspll_out_clks[] = {
 	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", 0,
 		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
+	CLK_PLL_OUT(CLK_MSSPLL1, "clk_msspll1", "clk_msspll_internal", 0,
+		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
+	CLK_PLL_OUT(CLK_MSSPLL2, "clk_msspll2", "clk_msspll_internal", 0,
+		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
+	CLK_PLL_OUT(CLK_MSSPLL3, "clk_msspll3", "clk_msspll_internal", 0,
+		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
 };
 
 static int mpfs_clk_register_msspll_outs(struct device *dev,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
