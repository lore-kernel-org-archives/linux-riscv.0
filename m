Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56586C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5u/JfhBNPq6PKhE0pHy6ORasOObJycMVrMIBCwyPo2k=; b=waT1Pmm3YxdRAL
	CyxjNOg9112GKzFoOVUAotC+gertuySpzlECeuv0fChyjgnBYJXlAfBeGUna0K987DG8yX1nrGosm
	aPVwBRou4neFONSwsqDRkYMrrwyZmfO2F/3dbb5qbUGfo9zdKRZxVUY8lWnPfrjveqZmlWnUOaPaC
	1ASVMaSeqNu2kT/ARChwowecydsN0fy/kdYvD4a1IZLlVp5Cnzj3mymchLWuFtDlc4oroD1thOVvM
	aEDQfHP3Ie/wwCcoL/ZnXgg5qODGB65klcv6Y0ZyD+q0LXKnXvXGHJcakYWxLxl66OV4TBXnp5Kft
	Nr+eKC0PNUKCnVhZP/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC5n-00000008b3G-4Buu;
	Mon, 13 Jul 2026 08:32:48 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC5k-00000008b2J-1Dqo
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:32:46 +0000
X-UUID: 62a517ac7e9511f1aa26b74ffac11d73-20260713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e7d23ba5-70c5-47a7-8204-3c656e401106,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:41abb22e5d5eb5801cbab6e2ec05fd27,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62a517ac7e9511f1aa26b74ffac11d73-20260713
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 178118124; Mon, 13 Jul 2026 16:32:29 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: dlan@kernel.org,
	rafael@kernel.org,
	troy.mitchell@linux.spacemit.com,
	shuwei.wu@mailbox.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] thermal: spacemit: k1: disable hardware on driver remove
Date: Mon, 13 Jul 2026 16:32:23 +0800
Message-Id: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_013244_638977_FD35B177 
X-CRM114-Status: GOOD (  10.35  )
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

The driver uses devm_request_threaded_irq() but never disables the
hardware interrupt enable, sensor enable, or sensor power bits when
the driver is unbound.

Add a devm action that clears K1_TSENSOR_INT_EN_REG,
K1_TSENSOR_EN_ALL, and K1_TSENSOR_PCTRL_ENABLE on remove, mirroring
what k1_tsensor_init() sets up.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/thermal/spacemit/k1_tsensor.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
index 79222d233129..cf79dc7d403f 100644
--- a/drivers/thermal/spacemit/k1_tsensor.c
+++ b/drivers/thermal/spacemit/k1_tsensor.c
@@ -199,6 +199,29 @@ static irqreturn_t k1_tsensor_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void k1_tsensor_shutdown(struct k1_tsensor *ts)
+{
+	u32 val;
+
+	/* Disable all interrupts */
+	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
+
+	/* Disable all sensor */
+	val = readl(ts->base + K1_TSENSOR_EN_REG);
+	val &= ~K1_TSENSOR_EN_ALL;
+	writel(val, ts->base + K1_TSENSOR_EN_REG);
+
+	/* Power down the sensor module */
+	val = readl(ts->base + K1_TSENSOR_PCTRL_REG);
+	val &= ~K1_TSENSOR_PCTRL_ENABLE;
+	writel(val, ts->base + K1_TSENSOR_PCTRL_REG);
+}
+
+static void devm_k1_tsensor_shutdown(void *data)
+{
+	k1_tsensor_shutdown(data);
+}
+
 static int k1_tsensor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -229,6 +252,10 @@ static int k1_tsensor_probe(struct platform_device *pdev)
 
 	k1_tsensor_init(ts);
 
+	ret = devm_add_action_or_reset(dev, devm_k1_tsensor_shutdown, ts);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
