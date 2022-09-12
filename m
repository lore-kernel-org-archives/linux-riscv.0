Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80935ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 06:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sf66vtAr42uf9eGnRNvLS1zvlb6omLbxagZOj3WyBQ=; b=2uZ5qQ+NfqcofH
	lz0Ak0Gt8UCUFNWpmYcLuOKVS36lqMiutsf1NjlA+SYg81LqxR5KXXvttAMryCRiJZWs4gCFSulZW
	sfo5hLEQKyFvyogy+u7pUoB3P+QuSPCX00irrj30BricT2s7Se3MbWiYNzGE0bliVrn8HaUWCw70n
	h1h4Gjp0M0E3mpqbaOKuD+NpbBan02d0F7feXTcZRlh/ByzYI6FHWYnZFyNZIRHGZwjMIs3LFLTMX
	Q6nBqDNTuvkXTcLwAB+R2nfwMdFOzo+Pj3KdAqYBFAqOoutZoa06KZIz+hyIO6NyGiONaEDw9DypS
	fTXx2NjZkh+qSEC58UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHm-007K2F-9z; Mon, 12 Sep 2022 06:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHk-007K0x-Ba
	for linux-riscv@bombadil.infradead.org; Mon, 12 Sep 2022 06:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5bvvWd4WtFmP4+rZD5AyV+ZxO3T7wivPuDP2w82MTho=; b=EmI88BsEDKUzLrN9kfPlcROLKe
	nT+p5LWRyhUJ4HKLhNpBLqhLVny4JKdG3YsthUBgOgXmjO/QvJBB5+C2XrW2CjKKfe+c24xWBaa5T
	0ERujrU/TOCyaHMG45TynrGTa4/f69KZIuwXNv2jVZnlfgagm1inVMwml5sDI2Y+yQX9AuDYVng45
	WK5EzKm92Tf5qaPWNHVl4AzLn20v/TYpHPSXS7nHj7FwAqZ4i7Smr5UHBfibXmGy6BuqfEaPNcX/J
	7m58r7kUq/JENNVFNPxhoyXa1+S/5pTz/N1tVwmsb1nYmOIvk7ItszMizEQTAlSH87uWGV5v0wq4Y
	hyyp87pw==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHe-00Bk57-R3
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:51:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so7262214pjl.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=5bvvWd4WtFmP4+rZD5AyV+ZxO3T7wivPuDP2w82MTho=;
        b=FP9hdz+N9C/PONsacP63b61e/uNXZATGo+NRzmt/BylcfobvcSASL5nQQa+6oOb5Lr
         kr2XyLjdEHilcKvSzSLUxyBIcjObULVXS/DfpXb/7o6LceKQ8DB6C4wrtcy/ENLG+vJA
         meM+ZRxMdNkP6sTTqADSPH1FbB1BVgiDr3uIo/3ll7E2emaSZBVOI2uSk2CcfPPYkk2p
         qSj3IhyOy5mkICecsju6GUnSQfRrn5p1FG5nOa0Pv5WIHeZmLE63bSuRv4YDHOG3bm0J
         a1vCeDqnNmQLzulII4+Bnf8jHTPrXjspXTg3Q7nIPkfHs1FSmeykmodRycRazcm7AOFc
         gG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5bvvWd4WtFmP4+rZD5AyV+ZxO3T7wivPuDP2w82MTho=;
        b=Gr7M3bL0iBem7qyiEqWKRD4XuraGwg3yAUQJXI1e52rZCxBSM/fhHyP0hsF1xW41Z7
         /r7+/r1b+MroFTFH46QQkY+N9eQz0BkgwYHR03sX06oS1gItjUL+pIjwBk477sP34R9Y
         8PvzyA9+gNTKaTazc+ywUjqyLS9XQdv81E1HWWyqjAoh6BNqvNkIlUyJz80mnqqINTaL
         6uk76au3FzGxkcY+SinFra3OLh61RP9HE/SIj7ve+YXbYUuYYDOzqP+pZN5yJmEhTDPA
         5L6t4rlShwPDNLX1MYQje2iVI/7xOLf2Rsu2M+WObW5D5u/s0WnGjqSFs5Kw99XHgiXZ
         HJhw==
X-Gm-Message-State: ACgBeo3v6K9gCkK1xbz/k/uJnyhc2MoFJxImYV+NacYi8C0BjGExYPcL
	yYTmEQRQF/Z2uJNtmMi88xaQlg==
X-Google-Smtp-Source: AA6agR7768wxpg0BWBnut+gOBLkDMgBOyzVmCR1vQg/Yp6BRsdW/kl+DoZcjtTlnwkyxI6fdXHU8tA==
X-Received: by 2002:a17:903:22cc:b0:178:18a1:d16c with SMTP id y12-20020a17090322cc00b0017818a1d16cmr11282283plg.155.1662965454516;
        Sun, 11 Sep 2022 23:50:54 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm4705716pgv.84.2022.09.11.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:50:53 -0700 (PDT)
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
Subject: [PATCH v4 6/6] soc: sifive: ccache: define the macro for the register shifts
Date: Mon, 12 Sep 2022 06:50:29 +0000
Message-Id: <20220912065029.1793-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912065029.1793-1-zong.li@sifive.com>
References: <20220912065029.1793-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_075107_257863_3E254696 
X-CRM114-Status: GOOD (  10.06  )
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

Define the macro for the register shifts, it could make the code be
more readable

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 91f0c2b32ea2..1c171150e878 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -13,6 +13,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/device.h>
+#include <linux/bitfield.h>
 #include <asm/cacheinfo.h>
 #include <soc/sifive/sifive_ccache.h>
 
@@ -33,6 +34,11 @@
 #define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
 
 #define SIFIVE_CCACHE_CONFIG 0x00
+#define SIFIVE_CCACHE_CONFIG_BANK_MASK GENMASK_ULL(7, 0)
+#define SIFIVE_CCACHE_CONFIG_WAYS_MASK GENMASK_ULL(15, 8)
+#define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
+#define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
+
 #define SIFIVE_CCACHE_WAYENABLE 0x08
 #define SIFIVE_CCACHE_ECCINJECTERR 0x40
 
@@ -87,11 +93,11 @@ static void ccache_config_read(void)
 	u32 cfg;
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
-
-	pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
-		(cfg & 0xff), (cfg >> 8) & 0xff,
-		BIT_ULL((cfg >> 16) & 0xff),
-		BIT_ULL((cfg >> 24) & 0xff));
+	pr_info("%llu banks, %llu ways, sets/bank=%llu, bytes/block=%llu\n",
+		FIELD_GET(SIFIVE_CCACHE_CONFIG_BANK_MASK, cfg),
+		FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, cfg),
+		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_SETS_MASK, cfg)),
+		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_BLKS_MASK, cfg)));
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
 	pr_info("Index of the largest way enabled: %u\n", cfg);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
