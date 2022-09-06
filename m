Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED23C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUIz9oZbZyfOm55DPdI/Fwj4t/Tn01AqtxWZU1FdOVc=; b=xg0L9+ftNd0Tmy
	wEFGbqvVvj3978Z28m5ajdVm0UsH/rFEwo8NR/IZCM+UtljF8dzz2lYMVPOx3aqBf6B2+9SwAF9lu
	NoGRI7OSWndl6lmW+bqTBWOqGiiibhJO1t2kDSC7EGOjLLVBUNLfDgJ0k0Dq8SlRuoRCw2QlZJ6hw
	lQ7A3aJJp65fYZggJ2L4vNkSYXPweNA190+LmkBuMLYdP4xpj8tOBypmSFT4on41NL6s29ExocbSQ
	Uq1b22o0hJkBPfh3PyVpjnebjFxyPpeLBfx9PG6Ttq323utIxN0BZunGm4YgnGoF4ac3+/0w2wzgX
	xKpZTGPutzRg5e2q0z7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGp-00Atvw-Vl; Tue, 06 Sep 2022 07:45:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGl-00Atsa-Re
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:45:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id bj12so21186935ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 00:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mhBofRhEQfaM4zK8XoWIAoEh34rHGCriV1bJK/DZnko=;
        b=N9Zu09b7Q/LFgadDQbna9iL/mPWTxN46stA23VQEh1DfwU8YIwTcVrmH1XupSuji0S
         FRaA1n/rtd0LIW33N4hycgHw4FS6HIvvE3Gf5WDhtwenwflXJITxueN9/eovae23iOe/
         y9tRnF+tQ2oEfmiiNnxdzOiJ7OHdeUWwBZiR/e0ouC+unt2Ls04DUXJ+XXrUmtXLFn7L
         rJqbLjYTB/YxdRw9TN67uSmvM0MZdd0eVxdDxijk8jsp6gT0eSE5WsE7NtiGIZ0VO4HR
         RHtb0RFmCFcQSrFqoSyP+f1U6M3S728qecFb7vwrXZtGPjXBGrgcDHBa1ZrqwXqmHymq
         /gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mhBofRhEQfaM4zK8XoWIAoEh34rHGCriV1bJK/DZnko=;
        b=EduqH5X562Gulr0QGs+zi+thxRGKVB9RrIGud5P7RA5A7NY9sJbZxsm/6fDC+Z2bb7
         c2oUEhXeGwAm633tvYWt+hf7Av1jrt1fEuYF9TP5pahbPmC3SJ63GKePxvvSxCjC1UWa
         TTrh+gsUH7QpBFVS14+y98grx0oTAHKHHrsMqE+ok394iLge4NXoLGBRE9MQvYZEyY0g
         S5bZIaWdK9oo2yBkKoyl+0+u5M999ljYLQnQsuEHTz1ozxjnXBVlE+UDLtbXfNwLxPuV
         DJ9LZFJFQ0W7uO9JyM6GuKcqCRpo5md+cPW+Sq5vcNeAtC+hmnZXcag37r/jZoS4wnI0
         sWcA==
X-Gm-Message-State: ACgBeo2NxLT84FhNuRE/jB3x7Uh9YKd16VDjvLb/lUyfeXm6QUHbr8K4
	cPI84DSoqQHThTDVy70LSjfmoLLYthl9UQ==
X-Google-Smtp-Source: AA6agR71a63c8JggF2InkDoHedzXJ4TcRd3yDAifj26hIKpOSD3g+sGM9KrCNi2k28QBOJf7z6S24g==
X-Received: by 2002:a17:907:d91:b0:741:771f:1d11 with SMTP id go17-20020a1709070d9100b00741771f1d11mr30039207ejc.588.1662450314523;
        Tue, 06 Sep 2022 00:45:14 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id ck7-20020a170906c44700b00722e603c39asm6214230ejb.31.2022.09.06.00.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:45:14 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Date: Tue,  6 Sep 2022 09:45:09 +0200
Message-Id: <20220906074509.928865-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906074509.928865-1-ajones@ventanamicro.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_004515_944090_D226616C 
X-CRM114-Status: GOOD (  17.90  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This fixes two issues: I truncated the warning's hart ID when porting to
the 64-bit hart ID code, and the original code's warning handling could
fire on an uninitialized hart ID.

The biggest change here is that riscv_cbom_block_size is no longer
initialized, as IMO the default isn't sane: there's nothing in the ISA
that mandates any specific cache block size, so falling back to one will
just silently produce the wrong answer on some systems.  This also
changes the probing order so the cache block size is known before
enabling Zicbom support.

Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
[Rebased on Anup's move patch and applied Conor Dooley's and Heiko
 Stuebner's changes.]
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/errata/thead/errata.c |  1 +
 arch/riscv/kernel/setup.c        |  2 +-
 arch/riscv/mm/cacheflush.c       | 21 +++++++++++----------
 arch/riscv/mm/dma-noncoherent.c  |  2 ++
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 202c83f677b2..96648c176f37 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
+	riscv_cbom_block_size = L1_CACHE_BYTES;
 	riscv_noncoherent_supported();
 	return true;
 #else
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 95ef6e2bf45c..2dfc463b86bb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
-	riscv_fill_hwcap();
 	riscv_init_cbom_blocksize();
+	riscv_fill_hwcap();
 	apply_boot_alternatives();
 }
 
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 336c5deea870..e5b087be1577 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -89,39 +89,40 @@ void flush_icache_pte(pte_t pte)
 }
 #endif /* CONFIG_MMU */
 
-unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
+unsigned int riscv_cbom_block_size;
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void)
 {
 	struct device_node *node;
+	unsigned long cbom_hartid;
+	u32 val, probed_block_size;
 	int ret;
-	u32 val;
 
+	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
 		unsigned long hartid;
-		int cbom_hartid;
 
 		ret = riscv_of_processor_hartid(node, &hartid);
 		if (ret)
 			continue;
 
-		if (hartid < 0)
-			continue;
-
 		/* set block-size for cbom extension if available */
 		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
 		if (ret)
 			continue;
 
-		if (!riscv_cbom_block_size) {
-			riscv_cbom_block_size = val;
+		if (!probed_block_size) {
+			probed_block_size = val;
 			cbom_hartid = hartid;
 		} else {
-			if (riscv_cbom_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
+			if (probed_block_size != val)
+				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
 					cbom_hartid, hartid);
 		}
 	}
+
+	if (probed_block_size)
+		riscv_cbom_block_size = probed_block_size;
 }
 #endif
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 3f502a1a68b1..d919efab6eba 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -74,5 +74,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 void riscv_noncoherent_supported(void)
 {
+	WARN(!riscv_cbom_block_size,
+	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
