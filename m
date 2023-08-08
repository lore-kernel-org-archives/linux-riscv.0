Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE05C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NzDV9OCwrmhwmQ+RWrmkRuO0rMv3wEFX/Sld3CMvegg=; b=Elb
	aIT+EqvR/JxF0ZYebRxN2naByliNzXxUqiyhnB7H5Z1vkslk4aiFVieCwwn5KbTJCJFZd/CUh03C/
	GdOQ/AVH7QEmZwZMnXvRvzrpMP4CL9+lxrXNItSMuNXbYuyCa9pdx/hjN/oxYZG6s3d2bWAp9GGVU
	HCPWJhLlNIan2xKZxAXppnYkm2k+gk0EulrWwYE50+077uBAAoEmRzZ/PynwMH0cpwf90A6onYdvO
	L/WKqMKtfowNAc5Ia7mnvrjT9NQAH5s+XuIwXEu3cjsjx08Nk1BkAodq41l6eFtSvIJQIbUNbsHB5
	XoSwUhATxInGkPp5zahhXVnj3c/mYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPN8-002vYM-2I;
	Tue, 08 Aug 2023 16:15:50 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPN6-002vX7-2l
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:15:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d5869d96657so1520689276.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691511346; x=1692116146;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TnSrdQhDNrVuprB4dmCAsDjMsMYddVJX219Lp3rcDA4=;
        b=lGb2f/YOrRiylaHa5jpIHSBS+5gA5f9jpHu3Fs4EZiccyfbMg/CaCeE8DhUynu/rGT
         VmYeHn49llYsaiyBEQqQe1dUMWxGuFckQm3kWv4vkbsrJGQsMz3Ckdy2t8B0Dh/pRS43
         fgbcCCuWrmqm9uSfgb1zVZnFO7ngzgx5nghrRNrw/wDWXnwzuX/V11XAG0oL81XBChlS
         G544+98xi7aoiiJ9ERzUMnbOLMoKHWJxE6Wkp9O9EvLLGzNPrSAOCAef1/OkHzzokV3m
         JEmo3u28Mb16KgtXBmMVtSfYOj0kq5TWmKNz3I0fGc6qdVkeueXO1Dg9P+ZoF0WTHQQp
         aWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511346; x=1692116146;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnSrdQhDNrVuprB4dmCAsDjMsMYddVJX219Lp3rcDA4=;
        b=RCa34kD4xxQxUSrB8WZoHNeOShMwJdBLQvR/5KQ5/NvQ3yzEDGoPGR886P5qTicqYx
         242ZcT8bNUo6G7YXYXTOJ++ulaSzPysUxBRiKu997bB+pPa0cywFZWAQ9uVUjko3axp3
         gcWmEfNF2/ApVW0rkCc8oQ3K08bVPTaC+jtLTfPJCu5UkjaRXukX3mIVvPjBYM2zwZq0
         T5kimld0YkBp8QdATeUDTKwXiWdqbCHWPiCxUHHV+he0EDq19+nWxkOanOQo0sp1rbDv
         z0ulAQT+Szk6KLcuThvk+fXJK4CZKyU+BAotS6ZZ1dDL7z94/5CBmjRc6zyKIDynPMQY
         oXCg==
X-Gm-Message-State: AOJu0YxDn7k/6AQM5BkAT0uELJNtqBA8LW1RSUVkjA4VthGDJ0qSfc1D
	BSm1NBQx55TxFY8CbKTEl53unNvEcq9F6uD4OGw=
X-Google-Smtp-Source: AGHT+IFzw3XfVup6/Nd5arFwnbPOQFKanM9ycSejCqWWghCoNzZ/FVOGcmzxLFgWJCmUx1XSz2nnLAETGykiQrk7mo8=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ad22:0:b0:d47:5cc3:9917 with SMTP
 id y34-20020a25ad22000000b00d475cc39917mr583ybi.9.1691511346524; Tue, 08 Aug
 2023 09:15:46 -0700 (PDT)
Date: Tue, 08 Aug 2023 09:15:41 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACxq0mQC/x3MQQqAIBBA0avIrBMso6SrRIToVLOxcEQC8e5Jy
 7f4vwBjJGRYRIGImZju0NB3Atxlw4mSfDMMatDKKCMjscs7J5vIST0apSf0zuIMLXkiHvT+u3W r9QNYoC3/XgAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691511345; l=2795;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=OcqNn5LCQ+EeTr3I1uAMbj9TNMj6ZOz+MyHLIDJSuyg=; b=2dRkXEmD8MwFmG9EeCYKF4DvAZZlYRfD+3DQ4f7W/a7WckgZ1aqSRxlVlqw5pfqOnsKxPKS2t
 TioJDco+hDfD3CACC3aD1jROlwVSW5FX65NkMx9sSTL+J3KoJQpam3O
X-Mailer: b4 0.12.3
Message-ID: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com>
Subject: [PATCH] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_091548_895327_5BB5E1E7 
X-CRM114-Status: GOOD (  11.68  )
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

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance in ARCH=riscv builds:

  arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
  for non-static variable 'trampoline_pg_dir'
  [-Wmissing-variable-declarations]
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      |       ^
  arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      | ^
  arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
  for non-static variable 'early_pg_dir'
  [-Wmissing-variable-declarations]
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      |       ^
  arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      | ^

These symbols are referenced by more than one translation unit, so make
sure they're both declared and include the correct header for their
declarations. Finally, sort the list of includes to help keep them tidy.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/mm/init.c             | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..4c8c0f83a974 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -188,6 +188,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
+extern pgd_t trampoline_pg_dir[];
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9ce504737d18..cc0e06b4f223 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -26,12 +26,13 @@
 #include <linux/kfence.h>
 
 #include <asm/fixmap.h>
-#include <asm/tlbflush.h>
-#include <asm/sections.h>
-#include <asm/soc.h>
 #include <asm/io.h>
-#include <asm/ptdump.h>
 #include <asm/numa.h>
+#include <asm/pgtable.h>
+#include <asm/ptdump.h>
+#include <asm/sections.h>
+#include <asm/soc.h>
+#include <asm/tlbflush.h>
 
 #include "../kernel/head.h"
 

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-riscv_static-348036edcae7

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
