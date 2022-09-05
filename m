Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7BECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8g22wqytaeWWApfl5Gc1g3BPiWnkutO82aHYWoCqHE=; b=Fqi9FgUXHFd3k1
	1U9elTvrB/lr2c6O4VAROqq6zn5wwtGv5cPUP7yji4cUlErq8lkTSLHuanLEqk7JqJeZpGhLlLdWI
	W3XAdpnsUQ5lcLurdohpGq3wplhWashE4nFy70rmbeYcn+BnWObwEjtcdyz4zkteUnlWFK5lwGCce
	pnFF33+bSAIZ5/LQtlKoMJEinRrpDAyI46/263FU4XSRQ6xeAykPz+KLPpPqrl533FlAiee8r1eU/
	Vw52aaRQmeN2XlA7eBoqoufCjauLhKypfGYpJcGIwkob8l6Oq8j/kOB/LC1056ZaPXlj51C6CQDLb
	iLq+1ccwJGLLADw3OuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV92S-00HOz6-PY; Mon, 05 Sep 2022 10:09:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7WG-00EhNb-A0
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id u22so7819501plq.12
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:to:from:from:to:cc
         :subject:date;
        bh=kIMP7EgZ8iiUz1BDKoIQmsGMSo/q9OgC/PJgsgpnXAM=;
        b=HCYNmSw/Rwe/rv62Parwo5Iwch03PYqWJlT/Tbova0G4i4dIuv34pCqtEQ1ToptIT6
         +FgsUAogbaJ4L4gB4r2pV8TpxW/y25nObQAH+FvzY1xnrXySldzlIb7TbRV5D+csr2FA
         Nsy0cy4RMRtefuyBt9ew7D75oTBROuLw0GSrYDslXC4HwPnLDLHv2/hN0Id7jPpdDn89
         PO9CGMGyMSkqXYL1RlwZJzuh4LXa+j02GdgR+MbbQ+z6nuDM0VjIcaAqp1+z2Whn2LPs
         FGWQEYN+nfzDcgaj9ohHouM9D55VYIJUHjfW6v9wLwpFIHxcbo8OyiptJCDCLxc8zKNO
         jjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kIMP7EgZ8iiUz1BDKoIQmsGMSo/q9OgC/PJgsgpnXAM=;
        b=RKL0dlR3T205DxXZeOJ9snXppxUfzZD49dh1zEJppYm1OGYABrntfUQT03kxsDyqw/
         846sMFJ2IclLglaA7JSTDp1oQOUOEh7+4EaICNyr0uDVYhR7tkGWi/Kp5TkgU+Ybfrhu
         Jucnxd+t7cJslHH0Ik/22HfmrL8fpCn/vBkT3CE/cgTBiMbltRVsIgpOc9QP1H4dulBO
         CGmS60BLvsSqbwlOWbQA/3aMvTVEAJvkR8gxEYtQ3dEbqF9gIoGxikR/PxDRKuFK/Sna
         PsjwtWO10Db3WADs3OosLwhZMCa59nYFvKLPnDstExwkMJLLJgq0AmhFw2BntieIil6N
         Hiig==
X-Gm-Message-State: ACgBeo0Cy2E+ljrr2W5e7/9nY8Cl3XmUdUL0eZF3ldZbxvvTQRJNUM/6
	fCk0543dV90sjE7zIUDVQvYYlg==
X-Google-Smtp-Source: AA6agR4huqam+O0d2qJ40XvTardsBwMj9RA3ypp7V6bueGYUhu7D+eSLzjGaN5v1A3eThHZzNuTk1A==
X-Received: by 2002:a17:902:7242:b0:171:398d:9e66 with SMTP id c2-20020a170902724200b00171398d9e66mr48506021pll.19.1662366707243;
        Mon, 05 Sep 2022 01:31:47 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:46 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
Date: Mon,  5 Sep 2022 08:31:24 +0000
Message-Id: <20220905083125.29426-6-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905083125.29426-1-zong.li@sifive.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ben Dooks <ben.dooks@sifive.com>

Use the pr_fmt() macro to prefix all the output with "CCACHE:"
to avoid having to write it out each time, or make a large diff
when the next change comes along.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 401c67a485e2..d749600c0bf8 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2018-2022 SiFive, Inc.
  *
  */
+
+#define pr_fmt(fmt) "CCACHE: " fmt
+
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
@@ -85,13 +88,13 @@ static void ccache_config_read(void)
 
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
@@ -154,7 +157,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DIR_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
-		pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DirError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
@@ -172,7 +175,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
-		pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
@@ -181,7 +184,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_UNCORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
-		pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataFail interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_UE,
@@ -221,7 +224,7 @@ static int __init sifive_ccache_init(void)
 		g_irq[i] = irq_of_parse_and_map(np, i);
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
 		if (rc) {
-			pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
+			pr_err("Could not request IRQ %d\n", g_irq[i]);
 			return rc;
 		}
 	}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
