Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8E9C001B5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mB4ADu2R0JmGqSCOR2Uz7Nkw3rwpVRmTKKxsyXVzP9k=; b=hHo+bKnKtbJKdb
	pIzk/oErE69iXAyG50kCg4yix3JNxD8CIbmQ5/0+jggNPuh1j10j+l2QJ4cThuK84dmDdN2LQGJSx
	BJ2kms0p7Dt7Bex4r50I2IDDOpovVeP4yQdh9F2hXUwxfSuDLDWC4Jl9u2zdyUQkxWtvsVd4pHAqP
	a/vD1Y0uiP5FRq9kJZ7oTPubnLHjUJ6KjkY5OdwDqoNRPcEbR6Q/QH+8GOPTkIdqENZhTM8NkIazw
	BdfNexhxu/gcKDDHXpy2mbE33SX4zJk8AKdUGaJRST/0QlFKfdMMO3jAKUng/2zJNPGZS62GjubHK
	O4dAUxwN/dgkIF3BpWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUAC2-007jkG-IF; Fri, 02 Sep 2022 17:10:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUABz-007jg7-TX
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:10:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id az27so3106125wrb.6
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=XInrryNIY9nWPw8b/rG+4EuR2jYt8oyYwco8MBZZHcc=;
        b=GIKoSOuhwiUesp8AGGvxHNe3EaUB/b+26PjY8I+VMDZantQYIYZ/M021LDJNQxFcco
         2PRg7/nBpVjT+vB6uBOwL3TGcRydnFxwckkEzyBwNhZvA6gebP8xCUfs8JYwtDxYGQPq
         otHNljJ0+EiseZUtlFCgeS7JKwlnVT8jNY4nEbLrHhp6XKX/eNLkZRFxHsld/j+Wdfb4
         opwk7xS0pZWITa2aSHYOqDMrx07eWI21ntk06W4siWM/DlnHBWhhpb4vG+dazXNi/TMB
         L2JE8KT8fcSE5nSuvtbPA9wW1ve8DroftBDtr8vTSdPMzHEzENTmXbV3pGxVqTFS6Hvx
         LSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=XInrryNIY9nWPw8b/rG+4EuR2jYt8oyYwco8MBZZHcc=;
        b=lW/ZkQubdLRKwVU3Xl3YIotdSXdlY7ed9iqQXurYTtazkjYNCcYvOAb5sKlShw0nMu
         IG8e0A6SsYsZ1JOzXEVEHZQujUW448/T1oZ2bKmIK043iCesdd80jdlH4DG8LbyvN563
         Sr20JW+rovIM3LSzTqv4Asub6/hJwLDmiEkNWg4tcGprp93aSTVqlTIhGwbOK7JOujet
         5mseqXA3Y49EX2SV/zyKfZEgzLBTC3FD3/mRzxLcxoUZKLe/sokdqSfFDWL75L3rKbyF
         QW3TpqrgYqnvdAh8fp0mesEYbxRQg6jOl9W9Klau4DLb7K6n71Ed3yjPU6qf1i10jBlA
         f7jw==
X-Gm-Message-State: ACgBeo1QVlD3USzLZXtE5x1knZp6IYBOvozp5t02FAIQkx+Tc3twpB6M
	+9By1AbfTXW4HCsgPbL1n48yfQ==
X-Google-Smtp-Source: AA6agR4uxHa2OJgeNRbbA9gbB7n+j+zIQ9GOlB1nKzHS74Bmd1PDSM3ClcIzsfGQrtRZNYj5Iv7u+g==
X-Received: by 2002:adf:db06:0:b0:220:7a57:6665 with SMTP id s6-20020adfdb06000000b002207a576665mr18463946wri.55.1662138652877;
        Fri, 02 Sep 2022 10:10:52 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d66ca000000b0020fff0ea0a3sm1950651wrw.116.2022.09.02.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:10:52 -0700 (PDT)
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
Subject: [PATCH v2] soc: sifive: ccache: reduce printing on init
Date: Fri,  2 Sep 2022 18:10:50 +0100
Message-Id: <20220902171050.257409-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_101056_041888_DEB67CBB 
X-CRM114-Status: GOOD (  10.71  )
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

The driver prints out 6 lines on startup, which can easily be redcued
to two lines without losing any information.

Note, to make the types work better, uint64_t has been replaced with
ULL to make the unsigned long long match the format in the print
statement.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
v2: use BIT_ULL() for the values.
---
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 46ce33db7d30..40d2ac7895a2 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -76,20 +76,17 @@ static void setup_sifive_debug(void)
 
 static void ccache_config_read(void)
 {
-	u32 regval, val;
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
-	val = regval & 0xFF;
-	pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
-	val = (regval & 0xFF00) >> 8;
-	pr_info("CCACHE: No. of ways per bank: %d\n", val);
-	val = (regval & 0xFF0000) >> 16;
-	pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
-	val = (regval & 0xFF000000) >> 24;
-	pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
-	pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
+	u32 cfg;
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+
+	pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
+		(cfg & 0xff), (cfg >> 8) & 0xff,
+		BIT_ULL((cfg >> 16) & 0xff),
+		BIT_ULL((cfg >> 24) & 0xff));
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
+	pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
