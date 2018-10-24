Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D617ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DED7205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/KDlFp4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dkeQQOqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DED7205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKGK2p497ok4KLwUu5l/7ktjKfSIE9rDcO+SdJPwM90=; b=R/KDlFp4vxpmlO
	+EwEotw8h2KI2dEALaF4YHf3dBZaQq1idDCgE9VJVm81qG6oVfPwgM6cmRmzBm4fnbxUEFD/qncUb
	E8NqBDphQqibT85Xd1Mty3UFatUweDNQdxwNkmjHLQlUNSET/1DBQJHZgeBfuYHoyeIfIxtA1JQPi
	xdWseKLViG5bLJf6owcfmAObi+SiLL8Widetp6Sj0HM7RYWuyNGYMo3Gogb7q/y1NR3uWHh/6CJxU
	ktxdRaL8yoU14Q8PhMxpknwyh+OehC2g9QhmYs/MmqNepBAKcvKAcJgYp9sNA9nVUb+mr5A8gpHvB
	L2QGe0lgzLOYcosaFfcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFPzY-0002pA-De; Wed, 24 Oct 2018 20:43:00 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFPzV-0002oC-FM
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 20:42:59 +0000
Received: by mail-pl1-x642.google.com with SMTP id y11-v6so2782014plt.3
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=u+L9yf9/Y7ofV0Ltg8w8rbxFYwiPiZARCf3fIbFgSgQ=;
 b=dkeQQOqH4bzgfTbLQwLqkhtpU4BM9c4Ce3X65cwo8C1rBgLAt6YROEFE0MX77T8fef
 P5PaB7LEA4nFYjRrjWCsNYDAuEqF5k4Zr+7bm+GHt9SQ6HZlw+h1mlVKJqy8j9h9bIrx
 vcbPCvu6bNzH3+NuAbEMJcIduS7PznRzVUitNO3t0NaAwa/+BTfzJpxv46i6whD30EfE
 Rd5C7W4Cffgpuw7umHGbEEstGqb4PCJ+OZWX/xtszNZGBjA4UsVxnkF0aqC0bnTNgZVk
 YPBdr0NVfdQQT2OgK44ctrXFgoQYWQpfLilaHg1e/Tb13QsYYgob8I6+mK7NOy49pU7W
 4HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=u+L9yf9/Y7ofV0Ltg8w8rbxFYwiPiZARCf3fIbFgSgQ=;
 b=HYtMxbLhMzC6rCbCnGWVEChjIAMNfnx9CuZ0k7GU8a9Q1K9WqnY82MsrYz65exfwWm
 sENGxF2Y2FKBcZ/H7RWCcISyRQsm+qSGaEVSkOcIyUnn9meyUYxasa9xMrueXNPecz3C
 3ec41hMazStOr6xOR5zbQHkt40ENwrlVwJ78zTMcLcysKaHfXWZq7MVTVtLAkrGSJL2y
 4gZbViBc8iv7fBfzzaWKnkhRFTPYbIhCu15hPlPWaHVLIz8+CUlIWVe5tTE/IHOzSCnh
 5wa1BiEwU2zcY8y3D8ZTxq9SF44B6ymxsaJCj5mO4Rwvk0Sl+XXY5yJXkONB0AuypFox
 YmJQ==
X-Gm-Message-State: AGRZ1gIL8tb4YcOSxXafER6W8fhIO9fILhrZMnqpXNzxwgUeBMBGBxiU
 gA7UXqTRe44RWtIsVdgX4Pnvl24cYSM=
X-Google-Smtp-Source: AJdET5ciL7y6HxfXeHOe2FoXrvK8TL80mLe65YIn1gn+XHG1ryRx1MP6E1+zOmDKWMfBspNcvdNq0Q==
X-Received: by 2002:a17:902:bd4a:: with SMTP id
 b10-v6mr3797948plx.171.1540413766505; 
 Wed, 24 Oct 2018 13:42:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f25-v6sm5986278pfn.177.2018.10.24.13.42.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 13:42:45 -0700 (PDT)
Date: Wed, 24 Oct 2018 13:42:45 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Oct 2018 13:42:39 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_134257_518001_CA02066B 
X-CRM114-Status: GOOD (  19.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024204245.94JItQbLOPrQ6Ut1wsLn4901eXInQOzpjt-nLdz0C0U@z>

The following changes since commit 84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d:

  Linux 4.19 (2018-10-22 07:37:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw0

for you to fetch changes up to d26c4bbf992463c043fdee4b3e5efa3f08990862:

  RISC-V: SMP cleanup and new features (2018-10-22 17:41:43 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 1

This patch set contains a lot (at least, for me) of improvements to the
RISC-V kernel port:

* The removal of some cacheinfo values that were bogus.
* On systems with F but without D the kernel will not show the F
  extension to userspace, as it isn't actually supported.
* Support for futexes.
* Removal of some unused code.
* Cleanup of some menuconfig entries.
* Support for systems without a floating-point unit, and for building
  kernels that will never use the floating-point unit.
* More fixes to the RV32I port, which regressed again.  It's really time
  to get this into a regression test somewhere so I stop breaking it.
  Thanks to Zong for resurrecting it again!
* Various fixes that resulted from a year old review of our original
  patch set that I finally got around to.
* Various improvements to SMP support, largely based around having
  switched to logical hart numbering, as well as some interrupt
  improvements.  This one is in the same patch set as above, thanks to
  Atish for sheparding everything though as my patch set was a bit of a
  mess.

I'm pretty sure this is our largest patch set since the original kernel
contribution, and it's certainly the one with the most contributors.
While I don't have anything else I know I'm going to submit for the
merge window, I would be somewhat surprised if I didn't screw anything
up.

[Since writing this I've found at least one more patch set for next week.]

Thanks for the help, everyone!

----------------------------------------------------------------
Alan Kao (5):
      Extract FPU context operations from entry.S
      Refactor FPU code in signal setup/return procedures
      Cleanup ISA string setting
      Allow to disable FPU support
      Auto-detect whether a FPU exists

Anup Patel (3):
      RISC-V: No need to pass scause as arg to do_IRQ()
      RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
      RISC-V: Show IPI stats

Atish Patra (4):
      RISC-V: Disable preemption before enabling interrupts
      RISC-V: Use WRITE_ONCE instead of direct access
      RISC-V: Add logical CPU indexing for RISC-V
      RISC-V: Use Linux logical CPU number instead of hartid

Christoph Hellwig (1):
      RISC-V: remove the unused return_to_handler export

Jim Wilson (2):
      RISC-V: Add FP register ptrace support for gdb.
      RISC-V: Add futex support.

Masahiro Yamada (1):
      riscv: move GCC version check for ARCH_SUPPORTS_INT128 to Kconfig

Nick Kossifidis (1):
      RISC-V: Cosmetic menuconfig changes

Palmer Dabbelt (12):
      RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
      RISC-V: Filter ISA and MMU values in cpuinfo
      RISC-V: Comment on the TLB flush in smp_callin()
      RISC-V: Provide a cleaner raw_smp_processor_id()
      RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
      RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
      RISC-V: Use mmgrab()
      RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
      RISC-V: Mask out the F extension on systems without D
      riscv: Add support to no-FPU systems
      RISC-V: Fix some RV32 bugs and build failures
      RISC-V: SMP cleanup and new features

Vincent Chen (1):
      RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
      RISC-V: Build tishift only on 64-bit
      RISC-V: Use swiotlb on RV64 only
      lib: Add umoddi3 and udivmoddi4 of GCC library routines
      RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig                 |  52 ++++++-
 arch/riscv/Kconfig.debug           |  35 -----
 arch/riscv/Makefile                |  21 +--
 arch/riscv/include/asm/Kbuild      |   1 -
 arch/riscv/include/asm/futex.h     | 128 +++++++++++++++
 arch/riscv/include/asm/processor.h |   2 +-
 arch/riscv/include/asm/smp.h       |  47 ++++--
 arch/riscv/include/asm/switch_to.h |  12 +-
 arch/riscv/include/asm/tlbflush.h  |  16 +-
 arch/riscv/include/uapi/asm/elf.h  |   3 +
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/cacheinfo.c      |   7 -
 arch/riscv/kernel/cpu.c            |  87 +++++++++--
 arch/riscv/kernel/cpufeature.c     |  15 ++
 arch/riscv/kernel/entry.S          |  88 -----------
 arch/riscv/kernel/fpu.S            | 106 +++++++++++++
 arch/riscv/kernel/head.S           |   4 +-
 arch/riscv/kernel/irq.c            |  12 +-
 arch/riscv/kernel/mcount.S         |   1 -
 arch/riscv/kernel/process.c        |   6 +-
 arch/riscv/kernel/ptrace.c         |  52 +++++++
 arch/riscv/kernel/setup.c          |  13 ++
 arch/riscv/kernel/signal.c         |  75 +++++----
 arch/riscv/kernel/smp.c            |  82 ++++++++--
 arch/riscv/kernel/smpboot.c        |  46 ++++--
 arch/riscv/lib/Makefile            |   3 +-
 arch/riscv/mm/ioremap.c            |   2 +-
 drivers/clocksource/riscv_timer.c  |  12 +-
 drivers/irqchip/irq-sifive-plic.c  |  10 +-
 lib/Kconfig                        |   3 +
 lib/Makefile                       |   1 +
 lib/udivmoddi4.c                   | 310 +++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c                      |  32 ++++
 33 files changed, 1039 insertions(+), 246 deletions(-)
 create mode 100644 arch/riscv/include/asm/futex.h
 create mode 100644 arch/riscv/kernel/fpu.S
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
