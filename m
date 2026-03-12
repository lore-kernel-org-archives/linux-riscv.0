Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BAAFED2F9
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG9ncmYht9o3rC1SrCZU+vzrjM26zcSRu/w1N8YPLPU=; b=wGBryXAEpjXmBc
	+OXbIscf+96aywQU73BtjuJKZYoXXJYSiLYlrzfi65d2ceiMZMwX8CC/Tp9W1Xu03yOf/vDrpOfiL
	znxv8oOKvCUXvwWavUcsZ2U1LlDwnzUEtHShGc8SDrsf6UADW+RHmNri1WNowl1u1HGoktrXLfWxD
	ZWy4unLSfmcXI7hN7VN0J1P1wBlJaOxgS/5CD3tABhzat1ZUx1jWj/8fILuASqYxR8CQc6j2RnBLy
	s2YLU9WPe3cyJ/NGVb7KPtVX0x4Wa+IlSZyywq5/tVbdx3RF2ZgBIWPoi/UvFLhcSp7rZhL1OZZfu
	rXyzBaRCUKLWJqiqZBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cNM-0000000DkSl-03sr;
	Thu, 12 Mar 2026 09:30:40 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cMI-0000000DizO-2QsD;
	Thu, 12 Mar 2026 09:29:36 +0000
X-UUID: f6fd25581df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9c0fef49-add6-4c75-9ae7-2a9d04d96b5b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:5ee666ed7089e2336e82d381e74c08d2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6fd25581df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 260563749; Thu, 12 Mar 2026 17:29:27 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 17/17] spi: zynqmp-gqspi: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 17:29:09 +0800
Message-Id: <00142ccb5415bab9b13cba74138d579e72d3313d.1773306858.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773306858.git.xiaopei01@kylinos.cn>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_022935_510770_17472631 
X-CRM114-Status: UNSURE (   9.16  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-zynqmp-gqspi.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 502fd5eccc83..a88b07956c33 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1244,26 +1244,16 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(xqspi->regs))
 		return PTR_ERR(xqspi->regs);
 
-	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xqspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xqspi->pclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->pclk),
 				     "pclk clock not found.\n");
 
-	xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
+	xqspi->refclk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
 	if (IS_ERR(xqspi->refclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->refclk),
 				     "ref_clk clock not found.\n");
 
-	ret = clk_prepare_enable(xqspi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Unable to enable APB clock.\n");
-
-	ret = clk_prepare_enable(xqspi->refclk);
-	if (ret) {
-		dev_err(dev, "Unable to enable device clock.\n");
-		goto clk_dis_pclk;
-	}
-
 	init_completion(&xqspi->data_completion);
 
 	mutex_init(&xqspi->op_lock);
@@ -1339,9 +1329,6 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	clk_disable_unprepare(xqspi->refclk);
-clk_dis_pclk:
-	clk_disable_unprepare(xqspi->pclk);
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
