Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D9C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HjWKo+vRj8hafDL0JzDTsRTw7Wrah/jPpuzWtNFmTM=; b=UdABCOK3T8l3dR
	WSMpu035vezfuqC3JDMz7+apaEIWVuZKSAkiif1zaRpTedxxkC5xfxBdMv0NlJlUvKFXZCyOhLZG8
	x5sq2M552q+czJGFFPCbl7r/DrZEDIezk5suO3/r6quGLL0CRuPZSzpCTFhjmimxZX/RxxCykPqHT
	avZPVTIn8UIImVJ02BpXuN8sldvv5u6fMGdZfabGKE1fVGEQzrXiBt5YY+jOD2JVu185xmtXNx4rO
	NVXoBkabiwJF6Ml657oil2SUr7MDtYrPxAUA1N0pDUI2M1pwvrJlvm45c7ToeyhxBh2LRyd0ho0Mx
	oACM77rdk6pIdoII8tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWInH-004rbw-J5; Thu, 08 Sep 2022 14:46:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIlq-004qMO-5e
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:44:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id fv3so11899062pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=/LYqlihFtMiIWz1JCFoOXwhnLs+6cX2BR50CFJfoD+E=;
        b=Ol0XOB9U8HsPE9InPTNP76q2kVkHaeDTLX7ySkjLA7fblhmynlxJK/umD98dF93OWO
         gSfZtwB/7mOTHX1+zi5xYWXRJUUsp5aFAzLxu/1FoO3SodUZwdj16cAeDOncHZ01Hr4i
         vhGEXA1dBrQ0e7/WrTzsYbveg2em4IQ6NJke9OVQ+9WELP+vmmM6stxg+QyG8hEmbN9B
         BSt7P2H2W/f2F0DJBVEsk2WbmH/bOmkdLOsrI0QlZX2ciio6Spo8SSYyEfyqgBQrjRlX
         +g1BxAexU5XmTEFTFWYpf2ApYtrUX+94jT2npHbQYDAvZn6joROjgtPfAD1tGri9djNi
         Ya5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/LYqlihFtMiIWz1JCFoOXwhnLs+6cX2BR50CFJfoD+E=;
        b=pjpV7M9xcU6F6VNXvlUUQ1haI/Fvy7pUtf3oQXPzwLyBVMEMSnTYMKFyTr1x7stEBn
         ZV5cshh2bAx4T6Q7/HnXAAWp1pXZuA4uidZWRgWWKSsFJBuZv686RWLPaGBCdhYXY8kL
         5nlQEIw/A/xmCFTflyVlumLDbFBALcQmPbgz2H5r51PId9q+uaAUtOti4Iop4vfXLxYZ
         Lwl5dZykPpprbKjpsp8AkGYwOTkEd7SGKK2dg3vRtKe+2bxsO5FIMPM9D4bV8QWqrUW7
         y9AYRUyxNUpS3DIQ8QYcArEfhHuj8aY0hCp6KkDro6Lxc7z3wOidOpt+WVIhb3/lFfBI
         tb/A==
X-Gm-Message-State: ACgBeo0t2pCUPfIMcPzbSdFPfpMm4kgkP0pT35kQUR75V6AziDL1UM6V
	mk198OUdZfgGtbsvNO0t+mIJmw==
X-Google-Smtp-Source: AA6agR5MoBM6Nh6NRv9LGoE95XEgih+Iu0/v2HU4oT6nYhN+8muWh796COOMMkr0kmLxVfQjEs5RRw==
X-Received: by 2002:a17:902:ce82:b0:16f:9697:1d94 with SMTP id f2-20020a170902ce8200b0016f96971d94mr9325306plg.12.1662648283072;
        Thu, 08 Sep 2022 07:44:43 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d40400b001750361f430sm4484728ple.155.2022.09.08.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:44:42 -0700 (PDT)
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
Subject: [PATCH v3 4/6] soc: sifive: ccache: reduce printing on init
Date: Thu,  8 Sep 2022 14:44:22 +0000
Message-Id: <20220908144424.4232-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908144424.4232-1-zong.li@sifive.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074446_234586_0259F95E 
X-CRM114-Status: GOOD (  11.04  )
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

The driver prints out 6 lines on startup, which can easily be redcued
to two lines without losing any information.

Note, to make the types work better, uint64_t has been replaced with
ULL to make the unsigned long long match the format in the print
statement.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 690c19489317..58d14f11a63a 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -81,20 +81,17 @@ static void setup_sifive_debug(void)
 
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
+	pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
