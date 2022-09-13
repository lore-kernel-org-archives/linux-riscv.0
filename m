Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F477C6FA8B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umcYFFw+WWy6r1OSwM+Liivra1kOWdHw6ZTZfIkWX4c=; b=mXaLG2DblfFILs
	6RDhJRL0ddzS1e1ePhwTNXjV1Yf3GqRY1iZ4t/R7ieHBvMo8i2EyEdvInlvVleNptsNBFZ+zvUuVw
	8zoE8Jc0rLTdvm1Cj/RM1/ojAq6bkEy2vVSysUybK0rylCp2rDCh0LCINHMfzsen7I4IWU42d9bVS
	VJ4jOgZntwzH35/WScEbViTKidJNG6FLVsmzOVWI1/ogLDnOcnqdpl1yK4I/rJJYvmm412cMi3jX6
	Ok6DgFIQJJpKAG7t/olVSFqmFs7e0+4kv1q0W/op6wo5b4fUwO58FGjToPjvPhVp4fUcTgXJ/+9J5
	46SBqMELlHwDhdViLmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFo-002saW-N3; Tue, 13 Sep 2022 06:18:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFk-002sXL-U0
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q63so10379216pga.9
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=6Xe3R/apOfj9yPTgHstXk1duLFBJjDM/Rtwt0f9H5Eo=;
        b=IgoMd+u3Sm/bJS7kCMLfQkYbB0LDum24SEmPzf81Dli83n/7DWclAijuMnc2ag70Dj
         C8p4BqoBvQuAuLEz6gUs8vSbA5gGTEafAglSpKreyZuFw2ZX63tqtZ8U/dHkSyygD5fG
         Yfo0PXzP7PvU5CVP8Ddfrlgksld0VirTSAP30glA91Q7ZhFXwsMMUkR+d+JY/qB5+GQL
         qIYUs5FVpgRIWY72xdriOzcJKiXQ4/I12hNhcpWveBIPHQRhS/psJkE7lT/37q9dZy0R
         fmI1kyNum/HPtVCrJwaXU+M8o9K8EWxGWltQfz24RbeL/+YS/FYNF9qYVxz9lESgCbWr
         yu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6Xe3R/apOfj9yPTgHstXk1duLFBJjDM/Rtwt0f9H5Eo=;
        b=u981qASwsdpCJlrI8boQD08mMSsPOT914bwjYDXNWF3lyby+MZRgfajkN71gyI+B+K
         pkvNdk2WUvNjmXdXQniILXCd89Zza+sM2JKBfPMV0dkW0Nr11oL6eYeJeE7xqrdXrcYQ
         NXPdpXoFmQGwL1ZPc5X7RievOWAoVwpjYmcZiwBxM5BjZHnvX2BOsDesP40M93HBH9oE
         t7sqAMwfXTxZZuXjkUT8GDjoxlEqqmtiRKr57WmN2WdXE+zxriJnomPL/TKZq3s7T1Lj
         ofwe/rF+6/Mvfl0bCHxvOf2337a+u6UsQM01fQp4X0mc4Qa/sN4JH65NjT+2Nirhdu1s
         A/wQ==
X-Gm-Message-State: ACgBeo3pidyIeb6MCv2OfkcIea7fHasCcpujfR+RF5oUY4/6oDUbyfWW
	bMVBem8d7XUCd2ZT0vQoy1FPQg==
X-Google-Smtp-Source: AA6agR4wJMWC1gO3gMaes8hVyStuNQfqovIqF+q7yPPAeBfyztWmRp9gIz2JfroB/V12MFPD76hGfQ==
X-Received: by 2002:a05:6a00:2181:b0:51b:560b:dd30 with SMTP id h1-20020a056a00218100b0051b560bdd30mr31748430pfi.44.1663049916137;
        Mon, 12 Sep 2022 23:18:36 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:35 -0700 (PDT)
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
Subject: [PATCH v5 4/7] soc: sifive: ccache: reduce printing on init
Date: Tue, 13 Sep 2022 06:18:14 +0000
Message-Id: <20220913061817.22564-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231836_991899_6FB3B7A7 
X-CRM114-Status: GOOD (  10.93  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index b361b661ea09..17080af7dfa0 100644
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
