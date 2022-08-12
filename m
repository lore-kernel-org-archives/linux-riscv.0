Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC35C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/e1If6lPQC7TI5McqrlMiokuCNOxUgo8zgIHmvY/1CU=; b=xzXkM7fQ/JyPIL
	OBBpthc0+Lvpt11NspZxOkGsgDnac/Hu42ZzCAdaAPntn/aCXOfBVMQuSjh7mq+ncgAGBVmwgkUk7
	gCcPDbIUgnC8v/UYY85QsZtUArqTmiif6HFNzAO2DYST2Y/6HmSnmP/XprhIs0YwjzFj1aW4xLxjr
	HCG36HgBXlDL43UGBDHIPATjpnAuYYFLWYTCataLCsdFb9hGGEkI67rchgWpDbwsaDNvBylfsyZvU
	EeDZULDvvzQRCtv9+Kr6S+owaIkC4XKO4rD81F+oMpxPNSRKydpbO3vNhxErSltmwxuLO6dOfwrwa
	mwFhqtQF5cqQBGxDyjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAw-00AbBU-B1; Fri, 12 Aug 2022 16:06:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAj-00AarD-LO
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id f30so1320147pfq.4
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc;
        bh=oNXiDLHTBB5QduEbvFFUeqs6kzWdDjN4SFk2oG8QZBY=;
        b=YkgykW5RMROSQu2C814oWdj6LP6ik9TKGYCOR5hbkvRRbYHKAHdppMXJrFJMd17Ks1
         1I/bpV52AuVtIJxFf/XAhONPz9SQIRkyTMnKPZt5rEBv3Z+3KEJvE3e7eAYzHOuy1jnJ
         LZTpn5r3REwegf+CAPuFOSApJmBzxO85QniMGfKZSgiJk+m4nqaIVln0MJONJMOvOFUv
         XqpaKFOQYqTs4LhmCSzXPXS9i4jLwgp+w39pFl5XxUEsNTEt0HuLhTkC5RCYVfvfsCOt
         JlvDD57SkWuaOazvRUYD5OfqNWUQD22GFlem34ki4SZ2F2myqFfvDn/gNLFjl+gHAMcK
         MdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc;
        bh=oNXiDLHTBB5QduEbvFFUeqs6kzWdDjN4SFk2oG8QZBY=;
        b=0076rZx+X33Q9ziMvyTbW4Dgt6ZPdh82sWOXndEOW3ZvtIl7SivuF6+8xln09eQRUF
         kZCNsqE4FP0qWHmt1hILQ82jg6IFYhReTmDDZmbim4MozLvUkvQ/FpMBwW/AR7yrUP34
         02GYfwHEDQY6Fnd/iK1alF+RzMqnLFYj/enGPho/MZ5Qpuimg3kJCjzsgW5XfiIwwzU+
         3lCThFe6hz8tiOSMfgRXPh+s+DI3T8nE65SquAkPE+k/Wju1zGS4yOYGLIVI0+7BFy4s
         nCIm19+8UF7XXiY9LaeTWnxQ3b5HZxfy5qZ2W1R7kzGC5mcmaixTYZ/uXEhEEkZR5dBU
         7j7A==
X-Gm-Message-State: ACgBeo3Y18qA7nlcXetahMR6WLqt2DY4Xf/YNgztWULqruf+rpnBRVeQ
	QZ8cqP8owv7gNdKlT2Qeu9V7Pw==
X-Google-Smtp-Source: AA6agR6AXssukNsbM91L5aHilnxykah3JECwx2NXEPxSK5bcZgbopLoA48C+g2lK4yIf0YpMNKw/bg==
X-Received: by 2002:a05:6a00:1513:b0:52f:8070:ee23 with SMTP id q19-20020a056a00151300b0052f8070ee23mr4562555pfu.44.1660320352102;
        Fri, 12 Aug 2022 09:05:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id g15-20020a63fa4f000000b0041c1965dd96sm1499186pgk.27.2022.08.12.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:51 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Date: Fri, 12 Aug 2022 08:40:10 -0700
Message-Id: <20220812154010.18280-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090605_834633_72243B11 
X-CRM114-Status: GOOD (  16.52  )
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

---

Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:

* Everything but the unsigned long cbom_hartid.
---
 arch/riscv/kernel/setup.c       |  2 +-
 arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 11 deletions(-)

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
index cd2225304c82..3aa3572715d6 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,7 +12,7 @@
 #include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
+static unsigned int riscv_cbom_block_size;
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
 {
 	struct device_node *node;
 	int ret;
-	u32 val;
+	u32 val, probed_block_size;
 
+	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-		int cbom_hartid;
+		unsigned long hartid, cbom_hartid;
 
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
+			if (probed_block_size != val)
 				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
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
+	WARN_ON(!riscv_cbom_block_size,
+	        "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
