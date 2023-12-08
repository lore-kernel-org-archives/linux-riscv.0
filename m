Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F748C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvbMefZqpQPyiZjoNJPtCkrc/NBlKYQUyZq4vTnS17w=; b=GgdiOURdFootIc
	b6WoVEhfJoMll/0WkwZzNfTDVmFDrxoZdu9//d545qGQuA8G77jcLa1/vfvDNj+ZzMq/5qgOQPOQF
	fxQNQONO3nTBB/h/28A8y59We1JgxLgJSqE69z12URVn6X7XAUKkaVhBlPO4jHiINWAGXOSxVICln
	PlAaEhaQQzXLt2hdLag8JXaB0h7kLjWWLeZXQmLREIDGUQ1WIUG89rVdFOFdiEreDoOzME81N9BJY
	R05hqjr7jZY7d+DtzHU7K4MiHCvmR1ws1tHg19fKIKamXCMDQE3XwbIFkoMiqPlFkocgSpvaPg3dW
	Wqvfp+2xF7i95D2ga0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePe-00G8cf-1N;
	Fri, 08 Dec 2023 17:13:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePc-00G8bQ-0m
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B532F62526;
	Fri,  8 Dec 2023 17:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0285CC433CC;
	Fri,  8 Dec 2023 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055595;
	bh=cvHj0CJs3ephVaZuvj3Ux2wXR9Tblc/RuJQlfKnG8ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gve4KbqHqOssmkDZ0lw8ymDKMQGoo2hi5IvNvbBdYPjCb3N0MKm0HtT5z2J0Xec+V
	 jsldg0umkd1P0PGCydELajMD+g11QVTmT+ZCKGU1DqS7lfq4bMiNkeYNJydojFQnrX
	 fbLZ+llObV7Hnw1r+l/J9tKCfCiYjgC6Fp9tzo73Z/Bih3EUYKkxfCAEEWV16yC8XI
	 cOFdDJuAje5S8gzRjZR4QUgOnjDk6ZuDGOX6liDYgXjKW/BoD3641OscVp+RdukCxe
	 x3HB/TZMI8RmAs2tDvDKdCv15mYB8hpeSj3ZgtozHUx9XcaZn1f1ZuIwyaX3e65mZe
	 g/gUPqUGqWKHw==
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
Subject: [PATCH RESEND v1 5/7] clk: microchip: mpfs: add missing MSSPLL outputs
Date: Fri,  8 Dec 2023 17:12:27 +0000
Message-Id: <20231208-amends-thus-6d7963f33357@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208-reenter-ajar-b6223e5134b3@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3gU1OSn3YxaVElJ8X4nK41xe7sOdS/RS/naYsgWnvQ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnFfhVMKVsmuZetDbTUDZL5e2sNq1ATU89FrqKJ5d1Sv 880r+TpKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESunWdkmH8shfl5/ZHcvAzX 0P8n5nlE2v7NeDtL/dW0+waXXMreL2T4p9EuZOO/6pfdAu8zClO0ba7Ibjx9zeIBx5SIXRP392o W8AEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091316_360111_4C689727 
X-CRM114-Status: UNSURE (   9.82  )
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
index 9edd0333e693..f62269320b2a 100644
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
 	CLK_PLL_OUT(CLK_MSSPLL, "clk_msspll", "clk_msspll_internal", 0,
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
