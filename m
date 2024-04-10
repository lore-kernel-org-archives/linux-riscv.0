Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C54DCD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6HsjLdcyvwG/4Sl1Gam5eRrQwi4YEqutPM/cSWcb+A=; b=Q9SKbZdPMbR/vQ
	45SD0b6yvSayoIVRUDRdbzxorzpbyNdzUdugcf98VyQHldlX71HIrfk++/EKCtTi7nj534NSGQJwv
	AgI33ph0eyglwXq3+cP89NYs5PDr9Oj7FaQCfYxxeWnpYjV17ySG9R0phrpSSO+Iuex1RlNasYAYR
	XuEbLZxkkDzVpWufWnZkZAUeKWdET4YARfbnYM3JUO0gXSLWEuBd/2IjjvcBYQ6LQJIRyNPOMMeuk
	N4ayIjRFrzTOQJJDRqIXMyccom/3agZACPiZFkyOvavvBCIEtuA4lBNz4ZImC3OzDbCdO24hr6Ufj
	6s3g0YpAJRuN4z/iUlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGr-00000009Qad-2Dc4;
	Wed, 10 Apr 2024 23:22:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGj-00000009QWP-2rgI
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 23:22:19 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so4470721a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 16:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712791336; x=1713396136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+xEyOh0M1W0xL2DtBPhpQ2krZlGziuT9mNpOFxUrPI=;
        b=er2K8kREW43RX8gMintjLKg2qpNmOejSEY82Tun2teeuHWrSdmXou8wATtsKsLFDSY
         1ncE59G3MVaDxYLwod59zhLxiUoIg1kL8YAsPcEf7uxHd65kBAMzBpUCet3YEP9O5IuV
         W+AejAW8NTMqJMYj9TdI3cSTRlfGwUT8W/m+SEqrTYePRZFBInIiwwD1BjGkNtaOKP0c
         8Ob5BUtKxJrUbc9GEUag/C5zCAH+ibpT/YwVFqyI8fgk+LCZVVm3eWxGdj+4wYgnK/k+
         T73NL/tXCqsmO39CXqNydZDuqcG6DZHtn0spopvv+/62ASBzafiIGVW0ftFzn5abKDbk
         AOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712791336; x=1713396136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+xEyOh0M1W0xL2DtBPhpQ2krZlGziuT9mNpOFxUrPI=;
        b=pTH0rDUVeeOugmSM1jDN1hhCZUQiu3L3OBJ6KKTt8wXl3z88XqbAc4OEPXRzO8Dp3G
         JLA6DqH0yY8M2n4e5b+Tr6FcJQnVvGDHiQCdQhbD7korvgL+0yQmwP6PnwiM2bKcgbYb
         ERd9l21Yxk3IZY55MpNiXjR8lL4HkBqlNiTUxrhpg88O65P0GML7pfy0zWQHlPnHtA/L
         XzfcI/qW9EJl8afH2ksZjED/QCt2m0BlZHzfCh4YoVifPTcP34LPrtvUpuqJiwQBetE5
         Bvqe9aou7nf64GsVnAZaqWxuF29KzBMYdUX36fDStO0dSn1CKONLM/rqBbhcdtfZmmLZ
         73bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzx+pdrbsALpi3bPf6i4eGNM/YH2Er2TM3uDVOLxYUuk8pUXR0GP1j0hWmXP1KepinM4Rpkkum8sI7xTvpExRiYdCrwcwkVbspbAgIir2Z
X-Gm-Message-State: AOJu0Yx315zyS7tlEWvKppOWbazv4fOE9tCvA47rvPC9PGLpjFy/W7p4
	F/NfAk3IbsBg1WIu8rTBFhYUYGsmvWKAPdJ4J0Izu8ffm4eSTojcI2J6Za/8EMQ=
X-Google-Smtp-Source: AGHT+IGp4Idc2NG3pVS/vsrTy9eVQjpOytYv5hd5ONmx0POT/BGj99cAO2unYtbQ58d68y/B3rLWag==
X-Received: by 2002:a17:90b:1e42:b0:2a2:b411:81ae with SMTP id pi2-20020a17090b1e4200b002a2b41181aemr3926259pjb.4.1712791336375;
        Wed, 10 Apr 2024 16:22:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm161865pjq.40.2024.04.10.16.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:22:16 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] cache: sifive_ccache: Export base address for child drivers
Date: Wed, 10 Apr 2024 16:22:05 -0700
Message-ID: <20240410232211.438277-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_162217_835114_5F2421C7 
X-CRM114-Status: GOOD (  16.51  )
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

The SiFive Composable Cache functionality is split across multiple
drivers, including the base cache driver, the EDAC driver, and a
PMU driver. Export the MMIO base address from the main driver so the
child drivers can access the MMIO space. Since each driver uses a
different subset of registers, there are no synchronization concerns.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/sifive_ccache.c      | 44 +++++++++++++++---------------
 include/soc/sifive/sifive_ccache.h |  4 +++
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 9833e9f6f36c..42dac39c41cf 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -53,7 +53,7 @@
 #define SIFIVE_CCACHE_MAX_ECCINTR 4
 #define SIFIVE_CCACHE_LINE_SIZE 64
 
-static void __iomem *ccache_base;
+static struct sifive_ccache ccache;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
 static struct riscv_cacheinfo_ops ccache_cache_ops;
 static int level;
@@ -81,7 +81,7 @@ static ssize_t ccache_write(struct file *file, const char __user *data,
 	if (kstrtouint_from_user(data, count, 0, &val))
 		return -EINVAL;
 	if ((val < 0xFF) || (val >= 0x10000 && val < 0x100FF))
-		writel(val, ccache_base + SIFIVE_CCACHE_ECCINJECTERR);
+		writel(val, ccache.base + SIFIVE_CCACHE_ECCINJECTERR);
 	else
 		return -EINVAL;
 	return count;
@@ -106,14 +106,14 @@ static void ccache_config_read(void)
 {
 	u32 cfg;
 
-	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+	cfg = readl(ccache.base + SIFIVE_CCACHE_CONFIG);
 	pr_info("%llu banks, %llu ways, sets/bank=%llu, bytes/block=%llu\n",
 		FIELD_GET(SIFIVE_CCACHE_CONFIG_BANK_MASK, cfg),
 		FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, cfg),
 		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_SETS_MASK, cfg)),
 		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_BLKS_MASK, cfg)));
 
-	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
+	cfg = readl(ccache.base + SIFIVE_CCACHE_WAYENABLE);
 	pr_info("Index of the largest way enabled: %u\n", cfg);
 }
 
@@ -153,9 +153,9 @@ static void ccache_flush_range(phys_addr_t start, size_t len)
 	for (line = ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
 			line += SIFIVE_CCACHE_LINE_SIZE) {
 #ifdef CONFIG_32BIT
-		writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
+		writel(line >> 4, ccache.base + SIFIVE_CCACHE_FLUSH32);
 #else
-		writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
+		writeq(line, ccache.base + SIFIVE_CCACHE_FLUSH64);
 #endif
 		mb();
 	}
@@ -170,7 +170,7 @@ static const struct riscv_nonstd_cache_ops ccache_mgmt_ops __initconst = {
 
 static int ccache_largest_wayenabled(void)
 {
-	return readl(ccache_base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
+	return readl(ccache.base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
 }
 
 static ssize_t number_of_ways_enabled_show(struct device *dev,
@@ -206,41 +206,41 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	unsigned int add_h, add_l;
 
 	if (irq == g_irq[DIR_CORR]) {
-		add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
-		add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
+		add_h = readl(ccache.base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
+		add_l = readl(ccache.base + SIFIVE_CCACHE_DIRECCFIX_LOW);
 		pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DirError interrupt sig */
-		readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
+		readl(ccache.base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
 					   SIFIVE_CCACHE_ERR_TYPE_CE,
 					   "DirECCFix");
 	}
 	if (irq == g_irq[DIR_UNCORR]) {
-		add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_HIGH);
-		add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_LOW);
+		add_h = readl(ccache.base + SIFIVE_CCACHE_DIRECCFAIL_HIGH);
+		add_l = readl(ccache.base + SIFIVE_CCACHE_DIRECCFAIL_LOW);
 		/* Reading this register clears the DirFail interrupt sig */
-		readl(ccache_base + SIFIVE_CCACHE_DIRECCFAIL_COUNT);
+		readl(ccache.base + SIFIVE_CCACHE_DIRECCFAIL_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
 					   SIFIVE_CCACHE_ERR_TYPE_UE,
 					   "DirECCFail");
 		panic("CCACHE: DirFail @ 0x%08X.%08X\n", add_h, add_l);
 	}
 	if (irq == g_irq[DATA_CORR]) {
-		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
-		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
+		add_h = readl(ccache.base + SIFIVE_CCACHE_DATECCFIX_HIGH);
+		add_l = readl(ccache.base + SIFIVE_CCACHE_DATECCFIX_LOW);
 		pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataError interrupt sig */
-		readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
+		readl(ccache.base + SIFIVE_CCACHE_DATECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
 					   SIFIVE_CCACHE_ERR_TYPE_CE,
 					   "DatECCFix");
 	}
 	if (irq == g_irq[DATA_UNCORR]) {
-		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
-		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
+		add_h = readl(ccache.base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
+		add_l = readl(ccache.base + SIFIVE_CCACHE_DATECCFAIL_LOW);
 		pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataFail interrupt sig */
-		readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
+		readl(ccache.base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
 					   SIFIVE_CCACHE_ERR_TYPE_UE,
 					   "DatECCFail");
@@ -298,8 +298,8 @@ static int __init sifive_ccache_init(void)
 
 	quirks = (uintptr_t)match->data;
 
-	ccache_base = of_iomap(np, 0);
-	if (!ccache_base) {
+	ccache.base = of_iomap(np, 0);
+	if (!ccache.base) {
 		rc = -ENOMEM;
 		goto err_node_put;
 	}
@@ -335,7 +335,7 @@ static int __init sifive_ccache_init(void)
 	return 0;
 
 err_unmap:
-	iounmap(ccache_base);
+	iounmap(ccache.base);
 err_node_put:
 	of_node_put(np);
 	return rc;
diff --git a/include/soc/sifive/sifive_ccache.h b/include/soc/sifive/sifive_ccache.h
index 4d4ed49388a0..85fd1ff1355a 100644
--- a/include/soc/sifive/sifive_ccache.h
+++ b/include/soc/sifive/sifive_ccache.h
@@ -7,6 +7,10 @@
 #ifndef __SOC_SIFIVE_CCACHE_H
 #define __SOC_SIFIVE_CCACHE_H
 
+struct sifive_ccache {
+	void __iomem		*base;
+};
+
 extern int register_sifive_ccache_error_notifier(struct notifier_block *nb);
 extern int unregister_sifive_ccache_error_notifier(struct notifier_block *nb);
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
