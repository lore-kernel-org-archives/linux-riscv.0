Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6E6C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdfiV3uci/BcW8vzjsmLHuUEMbZySLnNQWC1w2qaO3k=; b=SmJIEKyNAVSaEk
	oOeMWB6447YDrXQWiqQvr46o5fFydqgUmuV4DmTgPcq1VEY2hB7t/Ed5z5KbwkQJxcyaFX88gPmLM
	OTiUfLT7wGOmZ3t3cgaLl9bYqjtB5N14UEtKnEezyA0g1ilHNbrcaDhlIfI7NWWRzyC6Aui9qmg+O
	h7/zlj/wft79nR2Ay1G7ylTY7jQ50Yidrpko5d44g45v6eFy3tumc76TF50jBbxI0SRnjD6CHZqwW
	iCg+r9u+HSXxYWK0EN5HeXUf8Y3jIN0YvwR3P6vHmTSaThrnSh1tKWFPUlw3PJMkuLrrek/Xc4pqD
	9fAhYcWDHeOG2fGpSEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG97-0000000Gc3f-1KmE;
	Thu, 16 Jul 2026 07:04:37 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG94-0000000Gc2j-2SWs
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 07:04:36 +0000
X-UUID: 93267c4e80e411f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0ae7e942-b482-4ff1-a06c-e927528614e2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:917364be80770ce4303355b53af277ab,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93267c4e80e411f1aa26b74ffac11d73-20260716
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1791035787; Thu, 16 Jul 2026 15:04:23 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: shuwei.wu@mailbox.org,
	troy.mitchell@linux.spacemit.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dlan@kernel.org,
	daniel.lezcano@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2] thermal: spacemit: k1: add shutdown action and reorder registration order
Date: Thu, 16 Jul 2026 15:04:19 +0800
Message-Id: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_000434_925513_F9A038F1 
X-CRM114-Status: GOOD (  15.97  )
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

Add a devm action to clean hardware interrupts, sampling, and control
registers on driver unbind, mirroring what k1_tsensor_init() sets up.

Reorder the registration order within probe(): register the thermal
zones first, then request the IRQ, and register the shutdown action
last.  On removal, the hardware interrupt is disabled first, then the
IRQ is released, and finally the thermal zones are released.  This
avoids the IRQ thread accessing an already unregistered thermal zone
during devres cleanup.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changlog in v2:
1.Disable all regs mirroring what k1_tsensor_init() sets up
2.reorder registration order
3.rename devm_k1_tsensor_shutdown to k1_tsensor_shutdown_action
4.modify git commit log 
---
 drivers/thermal/spacemit/k1_tsensor.c | 73 ++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
index 79222d233129..ab12e2ec8ae4 100644
--- a/drivers/thermal/spacemit/k1_tsensor.c
+++ b/drivers/thermal/spacemit/k1_tsensor.c
@@ -199,6 +199,39 @@ static irqreturn_t k1_tsensor_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void k1_tsensor_shutdown(struct k1_tsensor *ts)
+{
+	u32 val;
+
+	/* Disable all interrupts */
+	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
+
+	/* Disable all sensors */
+	val = readl(ts->base + K1_TSENSOR_EN_REG);
+	val &= ~K1_TSENSOR_EN_ALL;
+	writel(val, ts->base + K1_TSENSOR_EN_REG);
+
+	/* Clear the sampling configuration set by k1_tsensor_init() */
+	val = readl(ts->base + K1_TSENSOR_TIME_REG);
+	val &= ~(K1_TSENSOR_TIME_FILTER_PERIOD |
+		 K1_TSENSOR_TIME_ADC_CNT_RST |
+		 K1_TSENSOR_TIME_WAIT_REF_CNT);
+	writel(val, ts->base + K1_TSENSOR_TIME_REG);
+
+	/* Clear the control bits configured by k1_tsensor_init() */
+	val = readl(ts->base + K1_TSENSOR_PCTRL_REG);
+	val &= ~(K1_TSENSOR_PCTRL_RAW_SEL |
+		 K1_TSENSOR_PCTRL_TEMP_MODE |
+		 K1_TSENSOR_PCTRL_HW_AUTO_MODE |
+		 K1_TSENSOR_PCTRL_ENABLE);
+	writel(val, ts->base + K1_TSENSOR_PCTRL_REG);
+}
+
+static void k1_tsensor_shutdown_action(void *data)
+{
+	k1_tsensor_shutdown(data);
+}
+
 static int k1_tsensor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -229,34 +262,48 @@ static int k1_tsensor_probe(struct platform_device *pdev)
 
 	k1_tsensor_init(ts);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_threaded_irq(dev, irq, NULL,
-					k1_tsensor_irq_thread,
-					IRQF_ONESHOT, "k1_tsensor", ts);
-	if (ret < 0)
-		return ret;
-
 	for (i = 0; i < MAX_SENSOR_NUMBER; ++i) {
 		ts->ch[i].id = i;
 		ts->ch[i].ts = ts;
 		ts->ch[i].tzd = devm_thermal_of_zone_register(dev, i, ts->ch + i, &k1_tsensor_ops);
-		if (IS_ERR(ts->ch[i].tzd))
-			return PTR_ERR(ts->ch[i].tzd);
+		if (IS_ERR(ts->ch[i].tzd)) {
+			ret = PTR_ERR(ts->ch[i].tzd);
+			goto err_shutdown;
+		}
 
 		/* Attach sysfs hwmon attributes for userspace monitoring */
 		ret = devm_thermal_add_hwmon_sysfs(dev, ts->ch[i].tzd);
 		if (ret)
 			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
+	}
 
-		k1_tsensor_enable_irq(ts->ch + i);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto err_shutdown;
 	}
 
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					k1_tsensor_irq_thread,
+					IRQF_ONESHOT, "k1_tsensor", ts);
+	if (ret < 0)
+		goto err_shutdown;
+
+	ret = devm_add_action_or_reset(dev, k1_tsensor_shutdown_action, ts);
+	if (ret)
+		return ret;
+
+	/* Enable interrupts only after all zones and the handler are ready */
+	for (i = 0; i < MAX_SENSOR_NUMBER; ++i)
+		k1_tsensor_enable_irq(ts->ch + i);
+
 	platform_set_drvdata(pdev, ts);
 
 	return 0;
+
+err_shutdown:
+	k1_tsensor_shutdown(ts);
+	return ret;
 }
 
 static const struct of_device_id k1_tsensor_dt_ids[] = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
