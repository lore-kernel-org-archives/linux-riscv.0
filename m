Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F91ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LkyVTh0Jtu9nwh5SwlPLVom/liS+610/S+cMlgTQgMY=; b=XHWFy4fo+y8+hv
	BsB8DgWofIEWQlMttvPnOg2v3ARcobP8vme8EcxCFaDHXKxgPqPs/fWGm3X1+b4xdJXQOZ9j7OdLk
	TshAtN+wYYzv4auo0MQzr5KefhWr7lSdUqzBaabPSkxaSnX+lu4n9YJM///qqeZRotdHpAbEhBnY3
	z74KW6MtAm/jDjsa4UWGkTjX/Ew5sD6iu8Sej8ttsFdHfSlkn7oXlUCWBDnbs/CQV+BIXbsnpReCF
	QuzgB+LpHGBdxCGNhxPBWOiRcFLlsAxV+Hi1EAaz7sLG1IEFnoe7eV26uib1+U84IICo00wMUN+Ai
	Suh1L+fGbS3WSwTAV3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVS37-00AOYx-4A; Tue, 06 Sep 2022 06:27:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVS34-00AOUr-V1
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 06:27:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id gb36so20865806ejc.10
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=S7NYuJuSZz4c9OjciPf2mX3WUCq5qW8tN9PsE+atSMo=;
        b=Ufsam4TJjVtjdj8V/gAljMS+pEQzUmI/wEx8X0AVLTw1zgR0poqFc+enUWfTMV02Ek
         j/Iu99hCIkHDFJMkjlcHh5BHm5AzlgvSNvvYkWNOlJUgF5/vjc/toWsO5YhHMGqnTtiW
         CSDIv7e0ZPOWqfZQEKYKPkf8rhZWEE74g/zfOPnHO/MT+XT+/4jDB6426qVkGWHeCgir
         oEzPzbFiOGvTG4TJ28HK7o00V01gqebIDCiiMzPggWeztBcAy9dZn0z/EtKPmOsrMdz1
         aepo6ZQYGy5P9m6tCjmtR+d46rQP05E9bqIbFcAVfU1l+YfsPVAfZsPWJuqLB2HPc/GY
         /U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=S7NYuJuSZz4c9OjciPf2mX3WUCq5qW8tN9PsE+atSMo=;
        b=t2qBrofeDOa+IpgndbfYY86xT+tznsZ6sHCB9zutRx/QgKQbcaZR1TD+XncURn9bS8
         T5S5EyKGOZe2qZ4Cs+OSbsrFBXNe7XtPSJDY9VvUCgykXn+nWd03L7KzLEumfKtoJ9s9
         2EqbQuLBdKqqTYUD5gOm8pBWzlejNN93/Fg6YZnRbCaZlOY18OWTe5y2d24CMI3UXerF
         ZnHpauFufu88g/dd6xOjtaYCo4j/+ohtb915ojIZoTNaUYNbBdD94GBk6U8+18ovFPxW
         3UydwVvF/E9anUidjBRI9kQU4nK3eGdT95nzv3+hbC8DIcPlWemk8CMnod45BbHf2s2E
         dJgw==
X-Gm-Message-State: ACgBeo2JpR2/ewoLzOTyFPQfg13xDMAr2RJXAWoRrp96sS4519c6WRFz
	EtdoneX3eyF64oWpFCq45NTae2x0KwKVWw==
X-Google-Smtp-Source: AA6agR4A2T1lEA7MzS4HXJsIJugeoUqf3Wk9N20lJEc9iH2rHmRQgWEVZ7GbhCh26reRRxIBtxzWHQ==
X-Received: by 2002:a17:907:6e29:b0:73d:6894:e668 with SMTP id sd41-20020a1709076e2900b0073d6894e668mr37858761ejc.453.1662445618783;
        Mon, 05 Sep 2022 23:26:58 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id y13-20020a50eb0d000000b00443d657d8a4sm7692018edp.61.2022.09.05.23.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:26:58 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor.Dooley@microchip.com,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] RISC-V: Clean up the Zicbom block size probing
Date: Tue,  6 Sep 2022 08:26:57 +0200
Message-Id: <20220906062657.924852-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_232703_047635_D3762BB3 
X-CRM114-Status: GOOD (  16.24  )
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
[Applied Conor Dooley's and Heiko Stuebner's changes.]
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/errata/thead/errata.c |  1 +
 arch/riscv/kernel/setup.c        |  2 +-
 arch/riscv/mm/dma-noncoherent.c  | 23 +++++++++++++----------
 3 files changed, 15 insertions(+), 11 deletions(-)

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
 
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cd2225304c82..8a49ea5ba01d 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,7 +12,7 @@
 #include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
+static unsigned int riscv_cbom_block_size;
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -79,38 +79,41 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
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
