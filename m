Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B822EC433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 19:49:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1FA61981
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 19:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1FA61981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7YtnazjoWIP6/zvKDD4kV6ZhjEeoiaVOYlLArYLNOtc=; b=QpPgoL5zhRtW2ZI9Et7N15HM2N
	G8q7EA5fDvAX15aPscqBdhY2c7qTu4ntD0RkNESVHGqJlyzJYrfPVKdq2mf71m5UiyydmK3RVM9SL
	PQuIVp9FAg5jBHkoQ9wCiLUVljq8Mu2ulmZBQoE8MkZc+qJ0iUkDCz98aN6FPWS4zDpGl4nLin4Da
	PiDP3gLfC98JoEuumOomA1OV6Q+sC25rBtnnDxPW3VM/JkK/fBMcA7qVrsXCBSvw2ZH5IfIY+wxTM
	NvW+L1lCKM06SJNjt9qUP2a+MUoSIBvizPgsKfFTX4Uw0B6dagsROVPLXymVf8fUecty3aILWV1f6
	hURt1F5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQEwO-005T6m-NA; Sat, 27 Mar 2021 19:49:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQEwK-005T6M-16
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 19:49:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z2so8866164wrl.5
 for <linux-riscv@lists.infradead.org>; Sat, 27 Mar 2021 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H97BsKqR23hJqrIfD56EXndKt8w/9T/UAs7wjOz5pxo=;
 b=pcwSshlSPC6XkTRT6YGjiWxwTF5UXe6Au8j4KZp3+sAvhcqqcKNT/qzsjl4w8DwYqO
 09EERJr4ohxE6coa3FfH2LDA+fbXA20/kY4F0Zho2kXXsMnWnrjunvO1iFaLeLofPtPB
 P9/Hz1ZNN9hWoyPy6ctQEey1LjTMnioDHzCr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H97BsKqR23hJqrIfD56EXndKt8w/9T/UAs7wjOz5pxo=;
 b=kKkM778unL0MxtfjeR9SgqZmQbUVC4RHVb9OSgoaDDigexkq7DjKzWIXwVl2m/Rip4
 ytth24XfUhd/jbZXFN642biGqrE6SR4u1cX+A8xvS6yOgBUTF9J1kWycrNZJ7KB33bEA
 x9z/4TSBMpUA6hoS3/ewXzyAJtWBCeXqo6TCZd5IWA+CQR0tySdXA4wynUbnyty9/4Uo
 65TQMAvosYWOCQ9+EXrwaoSuuABPxanDcwK/bjAoDx2ES37SS3+5dZahores6j93y/s7
 6C90UmaeXLdd2D1uEg++i9HMtDuTmsfktD997wPZ3m2cf0m9RHObobidZPr0RDLvwSf8
 2HaQ==
X-Gm-Message-State: AOAM531SK4bbQpdf59gK6Fd0fnm5cHrgib1RWARpnprchY8Tk7FphVvM
 D1gdysQWE7/jCu93hoWQvMCD6tZPi4xcTg==
X-Google-Smtp-Source: ABdhPJweHQ6okCQBrxq52NokylJeoCMpMHHUl8ucAl8Olj3qSRGGFdvGNgGsOtm5QERq3r9t1959hw==
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr19809748wrn.177.1616874582438; 
 Sat, 27 Mar 2021 12:49:42 -0700 (PDT)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id s83sm18410151wms.16.2021.03.27.12.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 12:49:42 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: XIP: fix build for rv32
Date: Sat, 27 Mar 2021 21:48:01 +0200
Message-Id: <20210327194800.23622-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_194944_174561_3BE76167 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

32-bit RISC-V uses folded page tables by default, so we should
follow that in the XIP-specific part of init too.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/mm/init.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fe583c2aa5a2..8c0eeaae67a3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -481,6 +481,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
+#ifndef __PAGETABLE_PMD_FOLDED
 	create_pgd_mapping(trampoline_pg_dir, XIP_VIRT_ADDR_START,
 			   (uintptr_t)xip_pmd, PGDIR_SIZE, PAGE_TABLE);
 	for (va = XIP_VIRT_ADDR_START;
@@ -493,7 +494,16 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	create_pgd_mapping(early_pg_dir, XIP_VIRT_ADDR_START,
 			   (uintptr_t)xip_pmd, PGDIR_SIZE, PAGE_TABLE);
-#endif
+#else
+	for (va = XIP_VIRT_ADDR_START;
+	     va < XIP_VIRT_ADDR_START + xiprom_sz;
+	     va += map_size) {
+		create_pgd_mapping(early_pg_dir, va,
+				   xiprom + (va - XIP_VIRT_ADDR_START),
+				   map_size, PAGE_KERNEL_EXEC);
+	}
+#endif /* __PAGETABLE_PMD_FOLDED */
+#endif /* CONFIG_XIP_KERNEL */
 
 	/*
 	 * Setup early PGD covering entire kernel which will allows
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
