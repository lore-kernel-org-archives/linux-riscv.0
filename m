Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D63ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZOpuPBGSFWP6GAmh/biTfbGOgPG1pdAhQTfB2enGyVA=; b=1QtuXkPVHWdZfB
	ZNcwOgYcawJ7CP3DQ38N4sGEbOg1i7umPHlr3FXM19YASd7eOcMEnCZ7IPjHliUMvOZLRgaBX2lni
	GSAzrCxNsCQtziAYEfqyr0sOtTGW7ryqAG1nzpX1NdGyJZqv4bbYdQ0qubBrUrF8ZEQyB5v0T5OLv
	Vb2Ht9maZk5PjKIINxcw198Aq4ClZwmxYxMXUQvpwMC2xrBr7t23rWjVmqJBSvyY4Y7wXwxtY1Qal
	MF45jPalb9vwn3B36/3BB+4mkN4u5YcVM4Bs5ZiVmiCdo2D6GDJvAAXDg7SWNrdK6a/GOUPotyE43
	Zl2AYj972ILPjaXYPALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUACG-007jxB-Ed; Fri, 02 Sep 2022 17:11:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUACD-007ju1-AL
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:11:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id u18so3093961wrq.10
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=DuTa3saognZzf1yEXBtMWHdD/K4d13DqN4oEB+KjK0E=;
        b=ihnBlXqBkFfnIS849/CkMDtR/8d9hjln5YIoMyz8vCmy1vYdUeVFYuyizmnHulg+3W
         0PUT/iwKWo58JsYTdAWffHQfSbO6Ny6a8paLY7Az4TCtJTFJSCTMsvCtE+GCvojikA6M
         OysTwEjSRUvhwZfEWwdqVHYRvwOPKbR6bEYEvpWIPMDCk3xa8BLdxL1VfMULp5gFts9B
         PUScEO+GSyc4hpQFcciwc7Kr1KQfHME5U2tuqoSO9A6AiwYvu0B0Rek7JyOxI5+oyxgn
         8N1vvDGLm11PGr9x8+YRsb4/Ejt9jlrO/GTjtx7D1+M+ExYswjQgu1RqOBl4tagm60dN
         v58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=DuTa3saognZzf1yEXBtMWHdD/K4d13DqN4oEB+KjK0E=;
        b=egqZyNC+YE7sbom8A3kV/ofpLummwW+gUWSvG+RDser1XzON72glotZVRyX3FOT14B
         17NOs/jWTtCZ44yCQbFeNGb5rI+Jst4ZvnOotfQ6+V2zoJCo/8ttwNQYuxM4xsUiUYMA
         ceR6YB059WeDyudSkj1vTxMwFtGqtbh7SlFupYVJsWjLTzIS40h9seJpr9uNZbPBGZoz
         etMkNsPm6YeDBOqlvE8cshZcV8Mm4BrEhzuQviBA4x4+TkJ+vlcrGg9GxfSM7kEpe1E/
         hAaJiMg+K2vFX/2LcacUJVTD+Tbk5/R0oTUeNMDpPknx6TWsVwdWFZlnsdJ55xE8uWrA
         rteA==
X-Gm-Message-State: ACgBeo1GujHsSIewP1IQEpu7OlAOyLOtO/iKgBPnJwSy8/t4FGycqhyr
	5aoWCntreKJFrRDaIaungJjsYQ==
X-Google-Smtp-Source: AA6agR73+iSdTpIx7bgU9NEjn1+QjWWazigQwpl7fLbia/ZWg+GsIUOp3JFCgqLypKKVHx5IQ3i+2Q==
X-Received: by 2002:a05:6000:1ac9:b0:220:7f40:49e3 with SMTP id i9-20020a0560001ac900b002207f4049e3mr18048393wry.40.1662138667541;
        Fri, 02 Sep 2022 10:11:07 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id bt24-20020a056000081800b0022377df817fsm2066869wrb.58.2022.09.02.10.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:11:07 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	zong.li@sifive.com
Cc: Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
Date: Fri,  2 Sep 2022 18:11:05 +0100
Message-Id: <20220902171105.257436-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_101109_388693_D1F42622 
X-CRM114-Status: GOOD (  12.95  )
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

Use the pr_fmt() macro to prefix all the output with "CCACHE:"
to avoid having to write it out each time, or make a large diff
when the next change comes along.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 40d2ac7895a2..90d21a1a4aae 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2018-2019 SiFive, Inc.
  *
  */
+
+#define pr_fmt(fmt) "CCACHE: " fmt
+
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
@@ -80,13 +83,13 @@ static void ccache_config_read(void)
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
 
-	pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
+	pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
 		(cfg & 0xff), (cfg >> 8) & 0xff,
 		BIT_ULL((cfg >> 16) & 0xff),
 		BIT_ULL((cfg >> 24) & 0xff));
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
-	pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
+	pr_info("Index of the largest way enabled: %d\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
@@ -148,7 +151,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DIR_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
-		pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DirError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
@@ -157,7 +160,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
-		pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
@@ -166,7 +169,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_UNCORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
-		pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataFail interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_UE,
@@ -200,7 +203,7 @@ static int __init sifive_ccache_init(void)
 		g_irq[i] = irq_of_parse_and_map(np, i);
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
 		if (rc) {
-			pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
+			pr_err("Could not request IRQ %d\n", g_irq[i]);
 			return rc;
 		}
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
