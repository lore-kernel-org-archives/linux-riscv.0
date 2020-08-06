Return-Path: <SRS0=vd3C=BQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1A4C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 23:18:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9753A2075A
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 23:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUB/+ZAI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="syzHWmPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9753A2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YWTK/DmwaaGlSzHjBqa++X8puo/kB78XZZTU6PsFhAc=; b=cUB/+ZAIyz+tU8qxMBPCZ0pT9P
	wq5VE4heSSc8PMPyk7SkodiOlUKFc9wZwq+IOgaQiVJNGTsvUmd8p5J0zGmV4PCf4G99k6ZxZUsjT
	hTWxy5xJh0fMBwNP0yvdwzn+Hy9aF7B2aXJ33cJKhy94soPKTd9kU2uBBGSm3ANdfaqJTcsDrZQjk
	kuwOBwsKYuRN57uvyuseuEt8TQk+DzQl4AsxG5ShS/R+svXB31JZpg+ysKDJgZ4ddtHuMxo5C1Oow
	4YMvKimb7MYL01lMa34xcirGeLgsOfQHEFAAeQ1XPeNxE68RokEqKI5isLFTLQ2/gFOoihb9JnjJq
	xImc1Yrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3p96-0004li-JZ; Thu, 06 Aug 2020 23:18:00 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3p93-0004l8-L2
 for linux-riscv@lists.infradead.org; Thu, 06 Aug 2020 23:17:59 +0000
Received: by mail-pj1-x1043.google.com with SMTP id kr4so7644723pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2020 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=i/OwUIJf7SuJHYzeBOib/eEDsTwDweM8G7B4I7i5Bvo=;
 b=syzHWmPvTWALcrWBF18nmFt2CvSrIQYFi1YMgwYoeqCG1noUVuvEyvzppBNyxLschE
 vuX35e4wHBO2uDnVXgHHa8SUMo7ibA3GrjjlHw62UO3BE9b+AsLtvN/JyMadYkvn4cQB
 F3I6JVnvZAFkwunDEY7J34CGXmCvq6kj94LsGSGNaO1D7KmdlrfxCP8hD4QSZ+qwvGxv
 ts8MAebxt/4uuGVrn+HQQBvKWhMbRkgXVOKJQVgyyyyJ9u3Q3x7hA0FYzvwlFoa8GdGq
 UZBHbIpd73ITwUoJJrESh7jQtaxz4GsC4Q0/6nLr7QDEGJ9N+dGy5PZNv/uPqRVdFyf9
 HZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=i/OwUIJf7SuJHYzeBOib/eEDsTwDweM8G7B4I7i5Bvo=;
 b=KWwmWIdu1eLLJSoGXghxfRNerrZQOzrxpCRxJGQYiBX/rghC4bUBL9gQ86wIjkz9TX
 2zp3Cas9pMskC7YoZchDY4Q+jEPQ9ZKmgATbRSbk7IuIKJz2Tfd0EaiSjV4W6rSqppYr
 aMdCzzHyUqQPGiduryFjd7OSqNm77jYK/S1/wEcROXpE5Va5EzPcG8SCNOy0q96QlsOL
 nqFiMnuMT+H96jriypFdrsX385XeX1Sf/vrlWWiZKOHDLqZsIK0raXHw9jZqxJOGtpEi
 OYIFQaNiHFdN68WEmfi9fiRcbmj+gMuGsLk4Zw1a1a+yqqL+ptN+8az/FXFrsxp8rc35
 AP+Q==
X-Gm-Message-State: AOAM530T3J98FUai2s5dMyPIZKHR4IzpZm7vtPTEMaUpQZZUchTP77dr
 Ywl1Iq2nuQjm1hhQrzcigrOMh4mFaZk=
X-Google-Smtp-Source: ABdhPJx9PA/4CJu14d0jYRFqd7WVyGbfengXQHp8k+Q/wkU6L2M8uCVqMNWs1WC93enhL/GT20beMw==
X-Received: by 2002:a17:902:368:: with SMTP id
 95mr10201850pld.279.1596755870455; 
 Thu, 06 Aug 2020 16:17:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e9sm9761253pfh.151.2020.08.06.16.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 16:17:49 -0700 (PDT)
Date: Thu, 06 Aug 2020 16:17:49 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Aug 2020 16:17:37 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.9 Merge Window, Part 1
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-bb218bf7-4f63-48f8-95a6-67ff0d32a166@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_191757_715983_7C5A0245 
X-CRM114-Status: GOOD (  16.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-mw0

for you to fetch changes up to 40284a072c42f6177184fb1f62ba94c69e0c0277:

  riscv: disable stack-protector for vDSO (2020-08-04 15:02:49 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.9 Merge Window, Part 1

We have a lot of new kernel features for this merge window:

* ARCH_SUPPORTS_ATOMIC_RMW, to allow OSQ locks to be enabled.
* The ability to enable NO_HZ_FULL
* Support for enabling kcov, kmemleak, stack protector, and VM debugging.
* JUMP_LABEL support.

There are also a handful of cleanups.

next points out a trivial Kconfig merge conflict.  I don't see any way to have
done this better: the symbols are sorted, it just happens that
HAVE_COPY_THREAD_TLS was in the middle of two new symbols.  In case it helps
any, here's a pretty current conflict resolution:

diff --cc arch/riscv/Kconfig
index bc37241a6875,6c4bce7cad8a..7b5905529146
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -57,9 -54,6 +59,8 @@@ config RISC
        select HAVE_ARCH_SECCOMP_FILTER
        select HAVE_ARCH_TRACEHOOK
        select HAVE_ASM_MODVERSIONS
 +      select HAVE_CONTEXT_TRACKING
-       select HAVE_COPY_THREAD_TLS
 +      select HAVE_DEBUG_KMEMLEAK
        select HAVE_DMA_CONTIGUOUS if MMU
        select HAVE_EBPF_JIT if MMU
        select HAVE_FUTEX_CMPXCHG if FUTEX

----------------------------------------------------------------
Alexander A. Klimov (1):
      Replace HTTP links with HTTPS ones: RISC-V

Atish Patra (2):
      RISC-V: Setup exception vector early
      RISC-V: Fix build warning for smpboot.c

Chenxi Mao (1):
      riscv: Select ARCH_SUPPORTS_ATOMIC_RMW by default

Emil Renner Berthing (3):
      riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64 relocs
      riscv: Add jump-label implementation
      riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE

Greentime Hu (3):
      RISC-V: Use a local variable instead of smp_processor_id()
      riscv: Support irq_work via self IPIs
      riscv: Enable context tracking

Guo Ren (4):
      riscv: Fixup static_obj() fail
      riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT
      riscv: Add STACKPROTECTOR supported
      riscv: Cleanup unnecessary define in asm-offset.c

Pekka Enberg (2):
      mm: pgtable: Make generic pgprot_* macros available for no-MMU
      riscv: Use generic pgprot_* macros from <linux/pgtable.h>

Tobias Klauser (4):
      riscv: Allow building with kcov coverage
      riscv: Add kmemleak support
      riscv: Fix typo in asm/hwcap.h uapi header
      riscv: disable stack-protector for vDSO

Zong Li (4):
      riscv: Register System RAM as iomem resources
      riscv: Fixup lockdep_assert_held with wrong param cpu_running
      riscv: Fix build warning for mm/init
      riscv: fix build warning of mm/pageattr

 .../features/core/jump-labels/arch-support.txt     |  2 +-
 .../debug/debug-vm-pgtable/arch-support.txt        |  2 +-
 arch/riscv/Kconfig                                 | 12 ++++
 arch/riscv/boot/Makefile                           |  2 +
 arch/riscv/configs/defconfig                       |  1 +
 arch/riscv/configs/nommu_k210_defconfig            |  1 +
 arch/riscv/configs/nommu_virt_defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig                  |  1 +
 arch/riscv/include/asm/irq_work.h                  | 10 +++
 arch/riscv/include/asm/jump_label.h                | 60 ++++++++++++++++++
 arch/riscv/include/asm/mmio.h                      |  6 --
 arch/riscv/include/asm/smp.h                       |  3 +
 arch/riscv/include/asm/stackprotector.h            | 33 ++++++++++
 arch/riscv/include/uapi/asm/hwcap.h                |  2 +-
 arch/riscv/include/uapi/asm/unistd.h               |  2 +-
 arch/riscv/kernel/Makefile                         |  2 +
 arch/riscv/kernel/asm-offsets.c                    |  3 -
 arch/riscv/kernel/entry.S                          | 54 ++++++++++++++--
 arch/riscv/kernel/head.S                           | 10 ++-
 arch/riscv/kernel/jump_label.c                     | 53 ++++++++++++++++
 arch/riscv/kernel/module.c                         | 16 +++++
 arch/riscv/kernel/process.c                        |  6 ++
 arch/riscv/kernel/smp.c                            | 15 +++++
 arch/riscv/kernel/smpboot.c                        | 12 ++--
 arch/riscv/kernel/traps.c                          |  8 +--
 arch/riscv/kernel/vdso/Makefile                    |  3 +
 arch/riscv/kernel/vmlinux.lds.S                    |  2 +-
 arch/riscv/mm/Makefile                             |  2 +
 arch/riscv/mm/init.c                               | 27 ++++++++
 arch/riscv/mm/pageattr.c                           |  3 +-
 include/linux/pgtable.h                            | 71 +++++++++++-----------
 tools/arch/riscv/include/uapi/asm/unistd.h         |  2 +-
 32 files changed, 356 insertions(+), 71 deletions(-)
 create mode 100644 arch/riscv/include/asm/irq_work.h
 create mode 100644 arch/riscv/include/asm/jump_label.h
 create mode 100644 arch/riscv/include/asm/stackprotector.h
 create mode 100644 arch/riscv/kernel/jump_label.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
