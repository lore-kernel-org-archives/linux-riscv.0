Return-Path: <SRS0=59R2=IS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F48C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 05:40:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347FA6193E
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347FA6193E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2DjIcbYIBIePBTJHJ6Sc0CdO78aRIfd50pjTjYfE2wc=; b=Auny0jtBcYMm6FmfEtl6/akWrF
	8AH31OxFSP8337WRJVVEGs6HdNL6j/2pZKFjOsfNmfKtw/6sHYrXdfNXY3d5+oa7BSQQsF4E8C0ER
	usX3BsZruDyuIRKLzDqz8ER1BqaFd3W3X6ecwF6CsuMTq7dEqk/w4zBbtLFN5Cy9Du9TMen0icDfj
	z2VuEvxpjTKyrsdeoJjINg1aTYtetplo3NFbMUsH9iMGs0YRxPaTC2zbBRYYRBnx1AjXLlD6a3Pzn
	hq2ID8WV7Rfbl6etLIBwtzVOW82zvxIIIsjQXhCAQtmp2MJQfICtJfVcwKYofWwKBUHGLW47En99z
	ykrGR92g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNUKh-008YKI-Ty; Sat, 20 Mar 2021 05:39:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNUKc-008YJu-QN
 for linux-riscv@lists.infradead.org; Sat, 20 Mar 2021 05:39:29 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so5838808pjg.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 22:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=L37xP3um01dwHIo65VZFBsa9BPBQ2JNMQtwm2HUTIik=;
 b=TUFcxdwg2+t6j+XKWHK3UYxpi1TPPa6mcq+x57RJzmUenb8enpq3izvSr0rrqzW4IM
 Z/Y9u/8OsH0yfTlOL8CVI2qF/zgjc6h9VCxQGv51TyREKU3atRYkfdTEGz0y1sVZIFA+
 h/3krxJScR07hFJMJ0yzLcrBbOh18KnnqJ3FC4R13yAPNm2voBcKuVI5RGYdXN4WkHSc
 jaHCF99QImeJueHPNSnONZ6pcXXeoW0ez6jt/gXvIs3Xq0LXWwXsU9lBQFgDLy45nS3Y
 qQZAjTsiV92BGKjmSICf7PCBgMquwymsX8PXa8tDYuBD2o86fYx0QPwfgifnPN9ljgxr
 2M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=L37xP3um01dwHIo65VZFBsa9BPBQ2JNMQtwm2HUTIik=;
 b=CU/aYGJRkd76fY6lyT4tzY8fGV1yN7/7RMf7Cfz+Ozl334A6KMHyKujUUNCkQrES8a
 Jyid1jVVnzQQuYoQBSx0Tk/Ya+D/j+pSCmk74EForZwR49vPMMTlO+KSKPCHe4fvmuo4
 sEmqMGoGHCaFZL9+KFXGpFnQSed47OO4IKCkId/mSxAOmOhalzs3z2meCgx0fPLgRsyI
 fjM0Q21K5Q5/h6P4d3qWNgWhRN9XMEk3Mha0+9mvjvdhjKSM80AKkyeTrSwnXpAjsAFd
 bRg1AWdod09w0DrTcTtGBh/ax0tMITbqnhJOnh3E2j4efDNrI/+ZBIhT3+xtf9dbQ+WM
 3zlQ==
X-Gm-Message-State: AOAM533IbafwwoVQgGDZhkfBJj8dKyNMonJb0sZXmU6aw4RR0UNnU82s
 VMUdWNCWyedWrR4Hqr9Lf1hBiVpSIpvqfg==
X-Google-Smtp-Source: ABdhPJx3Ff/bFFZPlfljpGK3Xz2ePwTTmTeJI56jcdGCJGWEGH37XQxVRxyfOJjmUAacRMiXCRNBAA==
X-Received: by 2002:a17:902:e8d5:b029:e6:cabb:d07 with SMTP id
 v21-20020a170902e8d5b02900e6cabb0d07mr14687671plg.3.1616218763813; 
 Fri, 19 Mar 2021 22:39:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g12sm7145995pfh.153.2021.03.19.22.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 22:39:23 -0700 (PDT)
Date: Fri, 19 Mar 2021 22:39:23 -0700 (PDT)
X-Google-Original-Date: Fri, 19 Mar 2021 22:39:17 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.12-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b3197f76-bb8d-4834-810e-3b255c26a5fd@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_053927_028666_1C1724BD 
X-CRM114-Status: GOOD (  11.65  )
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

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc4

for you to fetch changes up to a5406a7ff56e63376c210b06072aa0ef23473366:

  riscv: Correct SPARSEMEM configuration (2021-03-16 22:15:21 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.12-rc4

I have handful of fixes for 5.12:

* A fix to the SBI remote fence numbers for hypervisor fences, which had
  been transcribed in the wrong order in Linux.  These fences are only
  used with the KVM patches applied.
* A whole host of build warnings have been fixed, these should have no
  functional change.
* A fix to init_resources() that prevents an off-by-one error from
  causing an out-of-bounds array reference.  This is manifesting during
  boot on vexriscv.
* A fix to ensure the KASAN mappings are visible before proceeding to
  use them.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Ensure page table writes are flushed when initializing KASAN vmalloc

Colin Ian King (1):
      ftrace: Fix spelling mistake "disabed" -> "disabled"

Damien Le Moal (1):
      riscv: Fix compilation error with Canaan SoC

Geert Uytterhoeven (1):
      RISC-V: Fix out-of-bounds accesses in init_resources()

Heinrich Schuchardt (1):
      RISC-V: correct enum sbi_ext_rfence_fid

Kefeng Wang (1):
      riscv: Correct SPARSEMEM configuration

Nanyong Sun (9):
      riscv: traps: Fix no prototype warnings
      riscv: irq: Fix no prototype warning
      riscv: sbi: Fix comment of __sbi_set_timer_v01
      riscv: ptrace: Fix no prototype warnings
      riscv: time: Fix no prototype for time_init
      riscv: syscall_table: Reduce W=1 compilation warnings noise
      riscv: process: Fix no prototype for show_regs
      riscv: ftrace: Use ftrace_get_regs helper
      riscv: process: Fix no prototype for arch_dup_task_struct

Palmer Dabbelt (1):
      RISC-V: kasan: Declare kasan_shallow_populate() static

kernel test robot (1):
      riscv: fix bugon.cocci warnings

 arch/csky/kernel/probes/ftrace.c        |  2 +-
 arch/riscv/Kconfig                      |  4 ++--
 arch/riscv/Kconfig.socs                 |  2 ++
 arch/riscv/include/asm/asm-prototypes.h | 16 ++++++++++++++++
 arch/riscv/include/asm/irq.h            |  2 ++
 arch/riscv/include/asm/processor.h      |  1 +
 arch/riscv/include/asm/ptrace.h         |  5 +++++
 arch/riscv/include/asm/sbi.h            |  4 ++--
 arch/riscv/include/asm/timex.h          |  2 ++
 arch/riscv/kernel/Makefile              |  1 +
 arch/riscv/kernel/probes/ftrace.c       | 18 ++++++++++--------
 arch/riscv/kernel/probes/kprobes.c      |  3 +--
 arch/riscv/kernel/process.c             |  1 +
 arch/riscv/kernel/sbi.c                 |  2 +-
 arch/riscv/kernel/setup.c               |  3 ++-
 arch/riscv/kernel/time.c                |  1 +
 arch/riscv/kernel/traps.c               |  1 +
 arch/riscv/mm/kasan_init.c              |  4 +++-
 arch/x86/kernel/kprobes/ftrace.c        |  2 +-
 19 files changed, 55 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
