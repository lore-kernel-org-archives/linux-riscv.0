Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72555C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNMs98nOjNAdbVNpt1hAUN9eN8m8GLXgTFlO7Z4jnEo=; b=Os8QFNFQ2Dh673
	wrUijgvooZzMf0SX0TC3n2zIqNOyKsdUmHVyc8bsme2oTWa9R4nOFLE4VxElCBzYFqpYa6PVrq+jH
	8Vr/UfB7ADdjPlYk8wEnQJ0NS5aGXSHptZY5DyJ/Ar9UYmVe3e/yu2NWxAMSuzT0xNb1k8wpKamRR
	/IPgwelQqxiT2XmC7C/wJBLrQYs02/wrsMm75/H9MTgpWRx1jmvmI2uJ9Zz7xr3xyf+a8QkEHGxnW
	fN571Pud6AvKYLHvPWNHIJuC3F/l3eNu/oWVEVW6IRspOTPQCN1SSxJIrbb6Nda5xxm4WpNdc0Yjw
	QjHXwKd0qYETRShpB+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUUGi-00AzDm-00;
	Fri, 11 Aug 2023 15:41:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUUGe-00AzCv-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 15:41:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-564b326185bso1327426a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691768495; x=1692373295;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw4ftXJ2pD7gGLErYxHz998AQHL6xNQLBAu5oya+NvU=;
        b=zEbwdSS2wkrwP9mGKV3WnaUubqdQt4lApqBzeDZvdb1WIialm9Qinnm3K5L2Kt4/pr
         DT+hmna9gc1Uvonk1/bx1hVTnDcnIgsjpfdpLcPEU7RMC71eif7uRnd0Y+0fhpsZd1Lc
         XzLukiIjjMmaS1mgr3JwENTQ9pgnJocazao/ITdIfNbEvkXnJgEyt4Mb+WTR3locYR/X
         0OxW1P4+U/lO1aDL4gJua1z8YxkwVNJeeq/scIc14ZJqggZ1gjgrza452lpRBr02Xt2H
         u4W4Ool+rsv8VVn/l8wdIu9Bun+lYjk918px7x1tg+V5yunUD6DWqtZtXgWt1ACKTBPs
         x/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691768495; x=1692373295;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw4ftXJ2pD7gGLErYxHz998AQHL6xNQLBAu5oya+NvU=;
        b=PgD2rqfl+0bttcqlBGZ838kLiAt2eJOcRQXbgqjvu5qaFJMmUclaQ9zTEP+GIQOdB2
         SY6jdLDQlNNPh9qoEY73YLLmx3fcSm7z9EsCFoRcPkeYFo6j5PFyz/G1RQIwZRv9k1iy
         2iBdr2dXyO9P2RUXZ8Gu4BTZo7UC0YC7hWZjiiDinhnCjESLut6gq7QL0D1HVsmuKOJ5
         JRXC+VBgq+v005Iv1Hu6YCcOK1S2kDax/IpJDoL2XUwrgNI6Sp9584X/Uy/tv8NKd/IC
         J09MQGVbF7xnl+TUzAIWYqezR0dYynGrOXQfGXrCiRqiWBnOXLPTyh9x03xRl2ZLZ7vd
         0FQw==
X-Gm-Message-State: AOJu0Yw+ewLHAQ0n94p9OaQHM9LsGi8wKRB710dTUgLKuML7ay4MOP2b
	1v/KLkAQcqlVgaNBS1Un0xx6nQ==
X-Google-Smtp-Source: AGHT+IGW4jFihxb0fTb7T8n3ayIUPSgjpWAAmhdQNEVhbqIMTs/GW9ehVF3dqhnGNQJksoSVtD4xMw==
X-Received: by 2002:a17:90b:1982:b0:268:ac99:4bb4 with SMTP id mv2-20020a17090b198200b00268ac994bb4mr1524803pjb.46.1691768494664;
        Fri, 11 Aug 2023 08:41:34 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090a005100b002609cadc56esm3705787pjb.11.2023.08.11.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:41:34 -0700 (PDT)
Date: Fri, 11 Aug 2023 08:41:34 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Aug 2023 08:41:25 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.5-rc6
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c2fd272b-44d6-4174-9b97-3a253656e4ce@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_084136_869782_4EA9A8B1 
X-CRM114-Status: GOOD (  10.03  )
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

The following changes since commit 640c503d7dbd7d34a62099c933f4db0ed77ccbec:

  Documentation: kdump: Add va_kernel_pa_offset for RISCV64 (2023-08-02 13:50:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc6

for you to fetch changes up to 7e3811521dc3934e2ecae8458676fc4a1f62bf9f:

  riscv: Implement flush_cache_vmap() (2023-08-10 08:54:29 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.5-rc6

* Fixes for a pair of kexec_file_load() failures.
* A fix to ensure the direct mapping is PMD-aligned.
* A fix for CPU feature detection on SMP=n
* The MMIO ordering fences have been strengthened to ensure ordering
  WRT delay().
* Fixes for a pair of -Wmissing-variable-declarations warnings.
* A fix to avoid PUD mappings in vmap on sv39.
* flush_cache_vmap() now flushes the TLB to avoid issues on systems that
  cache invalid mappings.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
      riscv: Do not allow vmap pud mappings for 3-level page table
      riscv: Implement flush_cache_vmap()

Andrea Parri (1):
      riscv,mmio: Fix readX()-to-delay() ordering

Nick Desaulniers (1):
      riscv: mm: fix 2 instances of -Wmissing-variable-declarations

Palmer Dabbelt (1):
      Merge patch series "RISC-V: Fix a few kexec_file_load(2) failures"

Samuel Holland (1):
      riscv: Fix CPU feature detection with SMP disabled

Torsten Duwe (2):
      riscv/kexec: handle R_RISCV_CALL_PLT relocation type
      riscv/kexec: load initrd high in available memory

 arch/riscv/include/asm/cacheflush.h |  4 ++++
 arch/riscv/include/asm/mmio.h       | 16 ++++++++--------
 arch/riscv/include/asm/pgtable.h    |  2 ++
 arch/riscv/include/asm/vmalloc.h    |  4 +++-
 arch/riscv/kernel/cpu.c             |  5 +++++
 arch/riscv/kernel/elf_kexec.c       |  3 ++-
 arch/riscv/kernel/smp.c             |  5 -----
 arch/riscv/mm/init.c                | 16 +++++++++++-----
 arch/riscv/mm/kasan_init.c          |  1 -
 9 files changed, 35 insertions(+), 21 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
