Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D79FECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9M6rCEV9XHXIZ3ZOX4045+9llfifs9+QvFwA9ddxVY=; b=cFx98TDm4yuXOh
	tEDUIE6xLxsvOhXgUZr2B56f1DkTcE6ycKCNe/bqu7GKcSLA9lgihm6ey4UAJ63L85gfWKSIAcvzB
	uqSfTlHUgi77G4vhnWb2pJGiEB76myAAw4RWwNRLbgDLd3SBsdgnwBwL3Gx6xObyeDOSfzZ3dabMV
	KHJqhKsPeufpTxvBB83/q3+V6KksZtPLTy2mScUa8j/WTPiRXmVW9OcCcb3Ze4qhCRqGBwVThv6ye
	4Livx469nm9wajVZyoMqOFsg9tzdL2KgKF0A+f7wfGpVWop/mSVW3z8WlQL2Yf8NKKIWG6BabK2oY
	lzRAGXpQdhII5JC9SawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwZs-00FCOB-9r; Tue, 30 Aug 2022 08:26:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwZl-00FCJ3-3C
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 08:26:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso9497181wmc.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XM3hePWi4RDkuttssXrZ5VE24lNRdsy0rflErqQPY28=;
        b=bzJhyUUM5uZv8zprUMiOXaBrBVZ/UgJq0b0zOl6DqnXHgQojf+yPBZ5c8Z9vFqh5q0
         2nQC93flygBxrmVG+ODrSWT/eSkSNRTcX2Y6vLp6UMgN3/WzkLhiHTMdoy6o6HA73hUW
         7zxAcvoE2q3BvvO1sPktBzvhptHkN6EO0boN3qDwA5hFxGEbpZPabuYASBL9G8gR0zxJ
         YUfIkQ9wY2Dy2pgy+A+lXXGd5UaZkvFVPTtexArM1iN/Tpw8y+A3cUa1v1LaizfnEZDR
         Lq0pD5DIkVkFPgjzUP/wcrekf2b9g/c6OrRoDafImhR/ymh1Zr1j9JhaxlCfkVmB8cve
         YtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XM3hePWi4RDkuttssXrZ5VE24lNRdsy0rflErqQPY28=;
        b=UzbNwJm4g94QcH/uV5Lu1DoWmd9z2zdj5f/bT03Dwhe8heuUAlyvCEO6I9Nn9klaUj
         JOzAAMPbirNAbPJGLGhw8MFyij9aiebOakKjGPlT8O9uKSjZHycMCnEvunl5UhoxleUW
         UEPghA6Z43FudlVMTpn1T02MMTrpIg3rDaKKSkKKo0KZi/ec56w/JdWbohb3H5QSEXOr
         g5XgMbN4ctIK9pW3+M1iSVg9s6wYZCMk85mQLJzSRnRrdE0LsCDAPFuAkF/yjh9NUb58
         F4pvg4owrJsKm54+1SQLhbpuv18rxVx9F8fnW3N8N6qgmMb4gCZWexH5c0PURb9sPcmg
         7vAA==
X-Gm-Message-State: ACgBeo3Lz05PlNTBfQcOyVuK16pR0GyyPaCFDG6hI1yqicI8Py23/wem
	P4zZz4L84+fu8lXqfOuFPJqYow==
X-Google-Smtp-Source: AA6agR4t9yPdMnXaYpamc2su/lpj35tI/2NDGR0soqyjuxgixE2p5bvOVagi7BoSRqbqQcAVKeZZmA==
X-Received: by 2002:a05:600c:1e05:b0:3a5:b441:e9c with SMTP id ay5-20020a05600c1e0500b003a5b4410e9cmr8915891wmb.24.1661847983138;
        Tue, 30 Aug 2022 01:26:23 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b003a5ea1cc63csm11051643wmb.39.2022.08.30.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 01:26:22 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: zong.li@sifive.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] soc: sifive: ccache: reduce printing on init
Date: Tue, 30 Aug 2022 09:26:20 +0100
Message-Id: <20220830082620.1680602-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_012625_238968_D41A6406 
X-CRM114-Status: GOOD (  10.16  )
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
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 46ce33db7d30..65a10a6ee211 100644
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
+		1ULL << ((cfg >> 16) & 0xff),
+		1ULL << ((cfg >> 24) & 0xff));
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
