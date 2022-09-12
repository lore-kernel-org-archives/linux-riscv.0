Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1840C6FA82
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmfnBgsI1UQs9Kp8ADaFBhi1vyLyCH8dHr0x64FyjRY=; b=4y6aihMWiDYINU
	izZllib1T4mx1xwXt9U7vce7FAEdZGmf6zNRQiN0bKLgRNhoGWQbIhWGGnQyqgHcSIrn24+smV+KN
	jpVBgcvKvnirfMXg2skKms4TJ2gBps7vzO2DAn5LsXI2ldmrtUsMWu39ekGVb2ww3Hm+uVqIGOkwG
	4108xxUyvUG1+WfMxuv1V91gNcnRZEPDxPbiTr9/mbaeF1IjvPlASY+zEG3O0Sc5+58Ewd9r9LkLy
	op5LdWL31tw6OWDCoTVjDcEvUl1c8UaohcNuiXCZO/dPG7bD6RvzuDlnwtVpJEpm3sf+SSPw3jwfW
	HeFIjJnFZqx9K4+GVkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsEZ-00F0an-EG; Mon, 12 Sep 2022 22:48:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsEV-00F0XZ-SU
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 22:48:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so8263692wms.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 15:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9KCdo9lEuUaqKqwMXjhpto5xxER15Dg2P7AblY4ZDe0=;
        b=cQaD9eD54KsMjT0fZLrz+25LvzBtE5KCcQjubrd/mdty2QdT54ynOutS3DpnJguXd1
         RYT7Zu33ADETg1FnC4tSIrz0oMCff+1qD1M6C3nt2YjBGeY1zuPLW1tDgBzazf9qGuAH
         2/VgY7r7DqOZlHQ2Us1cCgaxZMUk+tb0Y/AOwZOIpmKKQn6+5nizrSV5PwPvbA4OqEkx
         O+BGdUtdp6fKwM2Bw8AyMqMTmK9bMup9VjymS9SMegUU1bLgom6P5UggtgE0hlIgaEmB
         sV1i8LJ1tkD0LAqshEhiY0a9E7ge/ImKs0BVwOW2zxCfCYi+reOxt9Avi3G/ivlLc1Sn
         CDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9KCdo9lEuUaqKqwMXjhpto5xxER15Dg2P7AblY4ZDe0=;
        b=bOw42uszWE5w2ZV8lfv0pBE4CT+AwgCjGuqv/TzwLIhRIWw38yrZ3Phc5Rm3DNgWod
         DKwgZKKTg3+mKZfl2fnuQywQVmiOI036CZ71hJvqtuZ9RiPxqNRPqQlyiu3x3EtgJNxa
         zurESZ1m8ardiyTj9FyGtCtZ22ALp/SoUenkvBS8XZWsinTPS/jR32/wCdCmpCGZ6N2v
         aeVfsVYHcW3V6/zgk0TxwR673uwGRwoprGH93DnU5LTITiWqEtLDuVcVVIDG4udmHwoL
         9/VYwPDUS4BG5b9RJ59uM11hnwA421td42weODupZci74OlBJx6UYzxdciteaBr7iJvu
         CBZw==
X-Gm-Message-State: ACgBeo1Oeam72SZg/xijk/nEjiSEZaMpi/PusJ28s8E1B96DAMyBm7YX
	HsZW8ET3yZG2MfM5UbVTIjRmnQ==
X-Google-Smtp-Source: AA6agR6N2w1b2dEfdlAV62nft6Zg0kHrtmttCBacmNAjiXFQe1Zt6oPGKzrGkW47+GTfSvhM/Q+58A==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id f9-20020a05600c154900b003b48fd70af4mr348969wmg.100.1663022928645;
        Mon, 12 Sep 2022 15:48:48 -0700 (PDT)
Received: from henark71.. ([109.76.158.112])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003a5f3f5883dsm12596876wmg.17.2022.09.12.15.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:48:48 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: atishp@atishpatra.org
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jrtc27@jrtc27.com,
	linux-riscv@lists.infradead.org,
	lkp@intel.com,
	mchitale@ventanamicro.com,
	nathan@kernel.org,
	palmer@rivosinc.com,
	stable@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4] RISC-V: Clean up the Zicbom block size probing
Date: Mon, 12 Sep 2022 23:48:01 +0100
Message-Id: <20220912224800.998121-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_154851_966897_D5B7A1D5 
X-CRM114-Status: GOOD (  21.15  )
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

CC: stable@vger.kernel.org
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Atish Patra <atishp@rivosinc.com>
Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[Conor: fixed the redefinition errors]
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Hey Palmer,
w/ LPC etc I figure it's highly unlikely you'd have this respun
in time to have it applied this week. I dropped all the tested
and reviewed -by tags since this patch has been changed a fair
bit back and forth since the tags were left. Checked it on my
D1 to make sure nothing blew up.. if this could make this weeks
rc, that'd be great so that the clang allmodconfig builds are
working again.
Conor.
---
 arch/riscv/errata/thead/errata.c    |  1 +
 arch/riscv/include/asm/cacheflush.h |  1 +
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/dma-noncoherent.c     | 23 +++++++++++++----------
 4 files changed, 16 insertions(+), 11 deletions(-)

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
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a60acaecfeda..a89c005b4bbf 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -43,6 +43,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
+extern unsigned int riscv_cbom_block_size;
 void riscv_init_cbom_blocksize(void);
 #else
 static inline void riscv_init_cbom_blocksize(void) { }
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
index cd2225304c82..e3f9bdf47c5f 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,7 +12,7 @@
 #include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
+unsigned int riscv_cbom_block_size;
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
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
