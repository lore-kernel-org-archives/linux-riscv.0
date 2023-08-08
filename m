Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15545C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UXeHtXW18mBfyF4qovDvXFF2vQyLrMWLev+0pQXfeHA=; b=G5N
	NXGMeJuGpSQmR6aO6G7YlNDbIaOPcsAAUaF3MEcgYM4z9CRw71e3aeCiBxQbI5SV1TnsBFUNMoDgU
	4axuXRujNh99KjdBxHFiuYI0g25H5wqKWtWvSPizIdXHE0ic54IUE7Cb4Lui3WRHotYueIu8LU5pf
	ls/2F8LZ3/NMpgWmF2K+rjEqRcrJ2g46VSBqOdK0Z61I0KjJmd6OzOrpcFFGz754K4bbazW0jimlX
	AygHMjY3ihiqD7rc3Ml5VxiZsNyn+lw1XlbAYQZNkoYcwEcBhl2KbxszElScrRD0DagXqB5y9YuzZ
	os5zPHKGHdvNWsiVDtYZWHfxLktZYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPft-002zTK-2D;
	Tue, 08 Aug 2023 16:35:13 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPfr-002zRq-0W
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:35:12 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583fe0f84a5so69094177b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691512507; x=1692117307;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nTM81EZMZbsGROKqkK+2bQm1mxf+detNdwYuQiVhiKI=;
        b=NLhu0LP53J4D4l9J4feCfPU5/l3uqoArpZHJ0ECEL6xFUd0tcpgZfboT0p/kOcrv1i
         XurwyVIyJVvh9OLoEaf6pP9EgBzqx+ayApgGh3mgBpvOf8w6olcj27SbvaSxITbSMqMN
         CgZIpuMxyfhJyCSjXwTvGkaVdAxYLJF3xZxoaQMDQ1UZxjr4Q22jzvvMcQCFf6tLqeH7
         1dEKTsxQeURWUr5SVN0EFpwesJP3bx+hG1gUlPCXdsSwapIam0tuneLG1tBKmOCqJyjW
         1Y55eWM+4i5zr9j8RJ8Sbzv34OO4Vxei1vpJY8o02jLQT9JQrGXhAGl7FUdxFgOn6p1t
         BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512507; x=1692117307;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTM81EZMZbsGROKqkK+2bQm1mxf+detNdwYuQiVhiKI=;
        b=cLRdVUwX4q7Z68zAS1Ma2VSp2ypnA+S9wT1LNm21T+Gi0QhnGOsesMG5gDBv7ZUyNy
         QhQx+HA/0dkqbjdQOv/9UAlkwdDWqHkjhxqDB3sEItGvmovJmHhuJGn6yFZ93PPT9r2G
         pmIpeNKm92aAOZOABEtu2gTW6+aHxjl1rpzr6B2Eoxmy3597yRRw545G5MQsWawGpl7G
         PNgFK52SGkxxpaFCfr44nRZ0fbgeg02JlaA13kHQM3O/nkJhHYr+ug86B0/KeqZBfGag
         7+OOXbtDQWV29kWAmaFdMIhTWeIW28DGNsSKuD72MSsQfF8YKl6VyFsfdXpL6XL+z9ws
         eubg==
X-Gm-Message-State: AOJu0Yza+x+Z0s2jUmVVtk5Yq4vgGs3U2rIKoLhG+KPBrXGAi55DKM24
	RQL+0Z5BJCFzrA4Gfpwwzg0t91rIJ+fPsx2YpxA=
X-Google-Smtp-Source: AGHT+IGra8Wwc+HhL5o0pTOnXN44VrV3kTC7GbKyzGjGnaN9IQv8EY6FCqvWavWJO404OgNolWFZn+285BMePOXRcxo=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a81:764a:0:b0:586:b4e9:753 with SMTP
 id j10-20020a81764a000000b00586b4e90753mr2137ywk.4.1691512507357; Tue, 08 Aug
 2023 09:35:07 -0700 (PDT)
Date: Tue, 08 Aug 2023 09:35:00 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALNu0mQC/3XMwQoCIRSF4VcZ7jrD0Sht1XvEEKJX50KNg4oUg
 ++ezb7lf+B8G2RMhBmuwwYJK2WKSw9xGMDOZgnIyPUGwYXkiiuWKNv6yMUUskyeFJdndNbgBfp lTejpvXP3qfdMucT02fU6/tY/UB3ZyLSXzmrtjEd1CzGGJx5tfMHUWvsClxODhakAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691512501; l=3558;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=0g7k5Ub/PaWtkHDnipVyOF/RYqCFfg6Kly4NdhVJ1+4=; b=Ug/yXmBRV7rjndULD++FZYy1jLinoPsNkkAK8t9L3JV7U5XhMf8DHNpIh7iNPIn8X5mPxvKoJ
 dRaQj3ShdkZADTxwuBmiZkSOcXfBMna7SC6UFCfavkMC+GX9BFqJcFd
X-Mailer: b4 0.12.3
Message-ID: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
Subject: [PATCH v2] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_093511_198873_FF822E72 
X-CRM114-Status: GOOD (  13.51  )
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
Changes in v2:
- Forward declare early_pg_dir, too.
- Remove declaration of early_pg_dir from arch/riscv/mm/kasan_init.c.
- Link to v1: https://lore.kernel.org/r/20230808-riscv_static-v1-1-9f3dc99dafe8@google.com
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 arch/riscv/mm/init.c             | 9 +++++----
 arch/riscv/mm/kasan_init.c       | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..b5680c940c1e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -188,6 +188,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
+extern pgd_t trampoline_pg_dir[];
+extern pgd_t early_pg_dir[];
 
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
 
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 8fc0efcf905c..a01bc15dce24 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -22,7 +22,6 @@
  * region is not and then we have to go down to the PUD level.
  */
 
-extern pgd_t early_pg_dir[PTRS_PER_PGD];
 pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
 pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;

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
