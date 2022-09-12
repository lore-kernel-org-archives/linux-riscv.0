Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24962ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETVQ6K+E0MeJ6oe+pMNDxriWOu00SMWDc9v50o4Bzzk=; b=abnyr8P8mgIyeM
	0hQgNcmq/RrFmulQShMcTxfay5TniBLxq7PsNNesV96Dpzy4CO9f9hiIkfk6aKMp0hrS0aC1zEY9q
	Rrl6oI1vNkAmXrRmpaap0xwwNBUhwvPdFa8h+1408VvVcl3GSZ/9DMrBxVIIcy98+8/LXB2RnfYLu
	/CVVMFzW/Aysn2q0l5Qig4CEbL23p/cQIuJx7k6bZh/F1Lh6LP5EwQ8j8ALf5hJPIRckrlp8+jcK/
	pc00qRRSNgYIWadRzo8qMlNScGBXKZHv8t2OM7X7uxmzu7Wb+5eIMIMpsFNzUbMdKo1oFwijUPR27
	33SMZKo6bbX2z9ONXEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXeMw-007etE-GM; Mon, 12 Sep 2022 08:00:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHQ-007Jqw-Ey
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:50:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso7227683pjd.4
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=KI8GGOYVJ30lpXYNmzlWaq92ei+up8qB7deF01pAkE4=;
        b=GMSuU6wrb4gbfYf/Vc0tM7RnsBejNC2gtIIk2Qqm496IkB0U2XSIRA7/Jc4ugHnvJs
         OjneuLH3F3Tt6TL+fqiz9ZTMfWhaKcV8kS+Ks+EnFKBo9g/JouaqfyJYIgRBbtNcARKx
         TSXTQUnz4KJ0Ot9xsMK5tE25NnaQ5FR1FKCBlzmQEkAi7CY6TUQqxkaP1cuwrKiuK8gO
         WvbVra2LCBBnXAph5GtB+6dwcB9ZESeRqDMp90+XJi4IXC3bjqUICagf5lSjyhQxXrix
         +DVTC69T1Ux9AQNu1LPgcguNE5wRhBuCY30SLbS4F05NmeRNLvqBYo0Da8WUeWCnllaa
         ixmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KI8GGOYVJ30lpXYNmzlWaq92ei+up8qB7deF01pAkE4=;
        b=mWyL+UcFB44cPzKoT1emcQ55sUTRe/FLtjrVpb1+Yh1vhMHWLNlCXyHUvezNv/PYHq
         pgbfLRLkSiwLgUvg7svp9pUguPF4flPNyWycZ+6d8JVXX6vtXaMaIQckiOpY8Tovfx2B
         aAzJDg0xVdPxXYeVTs3tPRhqShLQrY8Sd9HnRkXyyoUgCqdEMXOilB+ZAgQTqJJDUGfw
         z+Fy97dpzySwrDxTASKEfY+7vkxcrYYjKxCFvoMm0lNPwQlrlVlWmEEddGCNG4I5pOP7
         9XnSxQjdboCJLVigqbOiaFhAIz/4Wtqp/cF7cvaxQOaJJfwyz7QS2tlDEoG0JBJVReIt
         Fgdg==
X-Gm-Message-State: ACgBeo06BGtur7CFF2eQivsZereubiHRgm0z3GdwzG25WZbo2aB8/pgE
	BY77K9K1Q/cluUmNVGlBNP2JQQ==
X-Google-Smtp-Source: AA6agR6nGrzvFOlvlGJ8qouQVgLOiB7yFHWl4qEw+wEQhb08Q+u4R9GUJDn3p2gGJylOnOwQcAnDDQ==
X-Received: by 2002:a17:90a:6a83:b0:200:9da5:d0e7 with SMTP id u3-20020a17090a6a8300b002009da5d0e7mr21960464pjj.187.1662965451415;
        Sun, 11 Sep 2022 23:50:51 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm4705716pgv.84.2022.09.11.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:50:50 -0700 (PDT)
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
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 5/6] soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
Date: Mon, 12 Sep 2022 06:50:28 +0000
Message-Id: <20220912065029.1793-6-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912065029.1793-1-zong.li@sifive.com>
References: <20220912065029.1793-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_235052_563443_B37874FF 
X-CRM114-Status: GOOD (  12.59  )
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
Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 17080af7dfa0..91f0c2b32ea2 100644
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
-	pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
+	pr_info("Index of the largest way enabled: %u\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
@@ -155,7 +158,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DIR_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
-		pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DirError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
@@ -175,7 +178,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_CORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
-		pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataError interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
@@ -185,7 +188,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	if (irq == g_irq[DATA_UNCORR]) {
 		add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
 		add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
-		pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
+		pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
 		/* Reading this register clears the DataFail interrupt sig */
 		readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
 		atomic_notifier_call_chain(&ccache_err_chain,
@@ -218,7 +221,7 @@ static int __init sifive_ccache_init(void)
 
 	intr_num = of_property_count_u32_elems(np, "interrupts");
 	if (!intr_num) {
-		pr_err("CCACHE: no interrupts property\n");
+		pr_err("No interrupts property\n");
 		return -ENODEV;
 	}
 
@@ -227,7 +230,7 @@ static int __init sifive_ccache_init(void)
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
 				 NULL);
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
