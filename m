Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE09C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVq+I//uhRsbIV1kNlpmb1ZjyehQOeWx1+FgnhNQbHg=; b=jq6ZgzC0ETRerE
	zc4O6h16vvg9xd9KAdb76mDDrDhvbbsVsduQjWlKeAzaoeYqmgE6ol+j2sY75JN4ak9zfSQ7A1MRS
	zQ9h+epe3YyLhiBqnDQT+8QlPatJdOqyqb14SI/jAbDizxyc0HiKImyNQKGimTnvKP5wgCMeWB51Z
	21zCI3KmKcP+zOWAyQ8XLJjO5xghpH0kiY9fHtUA6cmBmFXQOt9csEi+H8RAH2FZoBIzGTfxh9S/f
	npBoa3d2yXF/RIoSl7TuHDii1KWlkwOih7PW5Gn8TlwxIljrw6vlNghCGm8MpUr4ySMmRmH5sBj49
	IBwB7qLj0pwvsEgs+rIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXEp-00000009Itx-0HXj;
	Fri, 24 May 2024 15:53:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXEl-00000009ItK-3Nqu
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:53:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f6765226d0so3309304b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716566021; x=1717170821; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXoRyhGs+xAWpk5PhLe4MnaVpkrSqxHV2dZ2NlYdnoI=;
        b=pNwxy2rukJjTN3J44dOjun0MGNfkd8F6dZqkQBeID9ogVeUH17zyJ1rP0e34fLVgD8
         3jeYwm1Z/8axSx95o60yQ5+JLy7o175Y3AipFEaEMFS3mArInw77RDVtwPZEDnvrax3d
         wVqTJ4nahpKPS+AZ+b3F8iPDZkS0JNRXaYh0QGuQyCjsf4vPKg8MvhEMiq03BS+T5cNY
         0NJYqrWWnfayShnDB0wQC7O8QN9VROhDAyrFEvhruLrjbLNsCbNHFH00uj2oaF1hAUSu
         ApEVRv1LoL6iVGRoRPviefrViCQ+mCV9/eENQvOUABSQDxeq5HnpM5JmmBNuXBQ8TRay
         ymUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716566021; x=1717170821;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXoRyhGs+xAWpk5PhLe4MnaVpkrSqxHV2dZ2NlYdnoI=;
        b=NkRe3mBBG0nTmHkeoztG0QZdg1tmnxmiqxmpjh8MU/sBcbyb4LitgX3xUyK+0kgIm1
         7hDb/5b1UXt/xOQrJ1YgxsrI+/yuUMSoSIT+7HXomTCOgnmmdUkFMfSiAbJB4L+7sXVq
         Xhk2Hb0vg3BzpKjPbFks9CiPvWpoZkg2dZkYmdJTL1y82C+DtyXmX3a9CMDywcQQ8wN6
         Ta1tE6KRzhxlvnJIhR8KEBIK2Hxh/VCxJjZaM+LOAVIgGwhwUiveAuMMkkZk0RCcVRq9
         SJIDc7X5eykjoMrzT8RVZHHYqU4vQF9r5weOcB2gRrV89szBOZh1Gkz/ePEz/G9tbvbd
         8XiA==
X-Gm-Message-State: AOJu0YzS5VjS2x6BTlGRn59a9Ii+oipMGGnoa6PSzjGF1ck+/sn7r1C9
	3ieKNV65Yn3gAuu6TEBsVyVxuP1EQumar4z8yuGnedZ1isCP0m+RWu8vQIkAqL8gp/WIJp30K3g
	B
X-Google-Smtp-Source: AGHT+IFsCm8hm+Rw/1DIRrNjQGtEYVqvgzlxmlteyPsodv/2TpCnJYSn5uByhISEk9LsfiApIjXaPg==
X-Received: by 2002:a05:6a20:4324:b0:1af:9ec6:afb8 with SMTP id adf61e73a8af0-1b212d0fc4fmr3416115637.23.1716566020686;
        Fri, 24 May 2024 08:53:40 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc05a3d2sm1267260b3a.50.2024.05.24.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:53:40 -0700 (PDT)
Date: Fri, 24 May 2024 08:53:40 -0700 (PDT)
X-Google-Original-Date: Fri, 24 May 2024 08:53:34 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_085343_969449_851156A3 
X-CRM114-Status: GOOD (  10.52  )
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

merged tag 'riscv-for-linus-6.10-mw1'
The following changes since commit 0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0:

  Merge tag 'riscv-for-linus-6.10-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2024-05-22 09:56:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw2

for you to fetch changes up to 6ca445d8af0ed5950ebf899415fd6bfcd7d9d7a3:

  riscv: Fix early ftrace nop patching (2024-05-23 08:22:17 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.10 Merge Window, Part 2

* The compression format used for boot images is now configurable at
  build time, and these formats are shown in `make help`.
* access_ok() has been optimized.
* A pair of performance bugs have been fixed in the uaccess handlers.
* Various fixes and cleanups, including one for the IMSIC build failure
  and one for the early-boot ftrace illegal NOPs bug.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix early ftrace nop patching

Charlie Jenkins (4):
      riscv: cpufeature: Fix thead vector hwcap removal
      riscv: cpufeature: Fix extension subset checking
      riscv: selftests: Add hwprobe binaries to .gitignore
      riscv: selftests: Add signal handling vector tests

Emil Renner Berthing (2):
      riscv: make image compression configurable
      riscv: show help string for riscv-specific targets

Kefeng Wang (1):
      riscv: mm: accelerate pagefault when badaccess

Matthew Bystrin (1):
      riscv: stacktrace: fixed walk_stackframe()

Nam Cao (2):
      riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
      riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context

Palmer Dabbelt (4):
      Merge patch series "riscv: access_ok() optimization"
      Merge patch series "riscv: fix debug_pagealloc"
      Merge patch series "riscv: Extension parsing fixes"
      irqchip: riscv-imsic: Fixup riscv_ipi_set_virq_range() conflict

Puranjay Mohan (1):
      ftrace: riscv: move from REGS to ARGS

Qingfang Deng (1):
      riscv: do not select MODULE_SECTIONS by default

Samuel Holland (2):
      riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
      riscv: Define TASK_SIZE_MAX for __access_ok()

Xiao Wang (2):
      riscv: uaccess: Allow the last potential unrolled copy
      riscv: uaccess: Relax the threshold for fast path

Xingyou Chen (1):
      riscv: typo in comment for get_f64_reg

Zhao Ke (1):
      Use bool value in set_cpu_online()

 arch/riscv/Kconfig                                 |  11 +-
 arch/riscv/Makefile                                |  44 +++++-
 arch/riscv/boot/install.sh                         |   9 +-
 arch/riscv/include/asm/cacheflush.h                |   6 +
 arch/riscv/include/asm/ftrace.h                    |  76 ++++++++-
 arch/riscv/include/asm/pgtable-64.h                |   2 -
 arch/riscv/include/asm/pgtable.h                   |   3 +-
 arch/riscv/include/asm/sbi.h                       |   2 +
 arch/riscv/kernel/asm-offsets.c                    |  18 +++
 arch/riscv/kernel/cpu.c                            |  40 ++++-
 arch/riscv/kernel/cpufeature.c                     |  10 +-
 arch/riscv/kernel/fpu.S                            |   2 +-
 arch/riscv/kernel/ftrace.c                         |  20 +--
 arch/riscv/kernel/mcount-dyn.S                     | 171 ++++++---------------
 arch/riscv/kernel/smpboot.c                        |   2 +-
 arch/riscv/kernel/stacktrace.c                     |  20 ++-
 arch/riscv/lib/uaccess.S                           |   4 +-
 arch/riscv/mm/fault.c                              |   4 +-
 arch/riscv/mm/init.c                               |   3 +
 arch/riscv/mm/pageattr.c                           |  28 +++-
 drivers/irqchip/irq-riscv-imsic-early.c            |   2 +-
 include/linux/ftrace.h                             |   3 +-
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/hwprobe/.gitignore   |   2 +
 tools/testing/selftests/riscv/sigreturn/.gitignore |   1 +
 tools/testing/selftests/riscv/sigreturn/Makefile   |  12 ++
 .../testing/selftests/riscv/sigreturn/sigreturn.c  |  82 ++++++++++
 27 files changed, 395 insertions(+), 184 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/.gitignore
 create mode 100644 tools/testing/selftests/riscv/sigreturn/Makefile
 create mode 100644 tools/testing/selftests/riscv/sigreturn/sigreturn.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
