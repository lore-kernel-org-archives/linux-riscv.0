Return-Path: <SRS0=meFw=TR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D40C04AB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 May 2019 22:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250CA2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 May 2019 22:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mK7fesfo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 250CA2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+W3utkVtRdCSURegvMbP8m9o1EMqm30Ufzmnmn78DAs=; b=mK7fesfoMYsy+6
	JLDHMhbOV6l/AmZRINZslEzS8dBG7t0axXNgvkbNQdlyvGPoyauZ3VRkwC1XUhMnFBFLNAgE8PmdP
	VI2IcxtnepEMiEfdKTz836b8dTSOMKF8n0g4hyK6SxFUEUVasMQDYdmyXjWo7/zA03SFTWgC0lP4r
	rZ9GzmUustV4FzZARVVMaDHx2w6sOvBu72hXUm7G2bfD0ud5h3hQ/1vXXEqVRss8YIBGCJBVCGnQp
	dLyni/NK2tQzRejenpuoBnbT5iZ95MFb6u9HPg7d1zIxdN94lBiQlQdDzEYJ2MYrRHZ3vBy+yvkQx
	O7GJ8OJF63Sv1YrJy2kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRlkN-0004A2-6O; Fri, 17 May 2019 22:54:39 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRlkK-00049K-0K
 for linux-riscv@lists.infradead.org; Fri, 17 May 2019 22:54:37 +0000
Received: by mail-pg1-f196.google.com with SMTP id c13so3962243pgt.1
 for <linux-riscv@lists.infradead.org>; Fri, 17 May 2019 15:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=Ahm5be5NUrtm3hWZIve+b7Dd18MEVe3dLCxTom5Yo+E=;
 b=H1ZirEWHtQWy/b4aWSPQYlELV8Xhq3fbcjw5qGsmgWlDy1v1YV4hiMMkMj9VDS81FR
 aZ2ooBEX2Ttu5DY+D+MjZStCsfjJd4IGgcstlThqVTRORcfXgm15bPdn7CJsxW/MbifH
 aqvkaCj70Cl0cpsHY6Z4BUdx2O1RCO5Sw6T8cjFuaaGpCQNpUkexyTRCVjv/+7/VK7AG
 VSYGSKB/tq0Y8ZBzHTp6r6smNlaHMqFlqc8rM0tDkY2jXrrcmawYbao6uKERWj5Kjw6N
 o+N34GcERH5Xq2ulusCbZqoh3eDaUyFfyqMB2wkd7qdQywkTAcis/N8pgwKgJm8cPCPn
 xarA==
X-Gm-Message-State: APjAAAXi3x05AJyR6VTSBIhsnZMmFAroJ0veU6DyPgskVD9xWJCLk9go
 +nGfdnWFN3jk38TQoNhZLcsxVk2oX8E=
X-Google-Smtp-Source: APXvYqyGA5aGu7mD7Gr+WhJw0g/JgPlJbonC43rGpNdAHAc/eMs5YcBYA2c6YaxOMxMuVTYwMlbWfA==
X-Received: by 2002:a63:7989:: with SMTP id
 u131mr51047071pgc.180.1558133674240; 
 Fri, 17 May 2019 15:54:34 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b16sm17757544pfd.12.2019.05.17.15.54.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 15:54:33 -0700 (PDT)
Date: Fri, 17 May 2019 15:54:33 -0700 (PDT)
X-Google-Original-Date: Fri, 17 May 2019 15:53:24 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.2 Merge Window, Part 1 v3
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-2cfcab49-74d1-4656-9913-36853a5be29d@palmer-si-x1e>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_155436_049957_90EF3BB4 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 085b7755808aa11f78ab9377257e1dad2e6fa4bb:

  Linux 5.1-rc6 (2019-04-21 10:45:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.2-mw2

for you to fetch changes up to 8fef9900d43feb9d5017c72840966733085e3e82:

  riscv: fix locking violation in page fault handler (2019-05-16 20:42:13 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.2 Merge Window, Part 1 v3

This patch set contains an assortment of RISC-V related patches that I'd
like to target for the 5.2 merge window.  Most of the patches are
cleanups, but there are a handful of user-visible changes:

* The nosmp and nr_cpus command-line arguments are now supported, which
  work like normal.
* The SBI console no longer installs itself as a preferred console, we
  rely on standard mechanisms (/chosen, command-line, hueristics)
  instead.
* sfence_remove_sfence_vma{,_asid} now pass their arguments along to the
  SBI call.
* Modules now support BUG().
* A missing sfence.vma during boot has been added.  This bug only
  manifests during boot.
* The arch/riscv support for SiFive's L2 cache controller has been
  merged, which should un-block the EDAC framework work.

I've only tested this on QEMU again, as I didn't have time to get things
running on the Unleashed.  The latest master from this morning merges in
cleanly and passes the tests as well.

This patch set rebased my "5.2 MW, Part 1" patch set which includes an
erronous empty file.  It's also a rebase of my "5.2 MW, Part 2" patch
set, in which I managed to create another file while attempting to
remove the empty file.

Sorry for all the noise!

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: fix locking violation in page fault handler

Anup Patel (4):
      RISC-V: Use tabs to align macro values in asm/csr.h
      RISC-V: Add interrupt related SCAUSE defines in asm/csr.h
      RISC-V: Access CSRs using CSR numbers
      tty: Don't force RISCV SBI console as preferred console

Atish Patra (4):
      RISC-V: Add RISC-V specific arch_match_cpu_phys_id
      RISC-V: Implement nosmp commandline option.
      RISC-V: Support nr_cpus command line option.
      RISC-V: Fix minor checkpatch issues.

Christoph Hellwig (11):
      riscv: use asm-generic/extable.h
      riscv: turn mm_segment_t into a struct
      riscv: remove unreachable big endian code
      riscv: remove CONFIG_RISCV_ISA_A
      riscv: clear all pending interrupts when booting
      riscv: simplify the stack pointer setup in head.S
      riscv: cleanup the parse_dtb calling conventions
      riscv: remove unreachable !HAVE_FUNCTION_GRAPH_RET_ADDR_PTR code
      riscv: remove duplicate macros from ptrace.h
      riscv: print the unexpected interrupt cause
      riscv: call pm_power_off from machine_halt / machine_power_off

Gary Guo (3):
      riscv: move flush_icache_{all,mm} to cacheflush.c
      riscv: move switch_mm to its own file
      riscv: fix sbi_remote_sfence_vma{,_asid}.

Guo Ren (1):
      riscv/signal: Fixup additional syscall restarting

Nick Desaulniers (1):
      riscv: vdso: drop unnecessary cc-ldoption

Palmer Dabbelt (1):
      RISC-V: Avoid using invalid intermediate translations

Vincent Chen (3):
      riscv: support trap-based WARN()
      riscv: Add the support for c.ebreak check in is_valid_bugaddr()
      riscv: Support BUG() in kernel module

Yash Shah (2):
      RISC-V: Add DT documentation for SiFive L2 Cache Controller
      RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  |  51 ++++++
 arch/riscv/Kconfig                                 |   6 +-
 arch/riscv/Makefile                                |   5 +-
 arch/riscv/include/asm/Kbuild                      |   1 +
 arch/riscv/include/asm/bug.h                       |  35 +++--
 arch/riscv/include/asm/cacheflush.h                |   2 +-
 arch/riscv/include/asm/csr.h                       | 123 +++++++++------
 arch/riscv/include/asm/elf.h                       |   6 -
 arch/riscv/include/asm/futex.h                     |  13 --
 arch/riscv/include/asm/irqflags.h                  |  10 +-
 arch/riscv/include/asm/mmu_context.h               |  59 +------
 arch/riscv/include/asm/ptrace.h                    |  21 +--
 arch/riscv/include/asm/sbi.h                       |  19 ++-
 arch/riscv/include/asm/sifive_l2_cache.h           |  16 ++
 arch/riscv/include/asm/thread_info.h               |   4 +-
 arch/riscv/include/asm/uaccess.h                   |  28 ++--
 arch/riscv/kernel/asm-offsets.c                    |   3 -
 arch/riscv/kernel/cpu.c                            |   3 +-
 arch/riscv/kernel/entry.S                          |  22 +--
 arch/riscv/kernel/head.S                           |  33 ++--
 arch/riscv/kernel/irq.c                            |  19 +--
 arch/riscv/kernel/perf_event.c                     |   4 +-
 arch/riscv/kernel/reset.c                          |  15 +-
 arch/riscv/kernel/setup.c                          |   6 +-
 arch/riscv/kernel/signal.c                         |   6 +
 arch/riscv/kernel/smp.c                            |  61 ++-----
 arch/riscv/kernel/smpboot.c                        |  22 ++-
 arch/riscv/kernel/stacktrace.c                     |  14 +-
 arch/riscv/kernel/traps.c                          |  30 +++-
 arch/riscv/kernel/vdso/Makefile                    |   2 +-
 arch/riscv/mm/Makefile                             |   2 +
 arch/riscv/mm/cacheflush.c                         |  61 +++++++
 arch/riscv/mm/context.c                            |  69 ++++++++
 arch/riscv/mm/fault.c                              |   9 +-
 arch/riscv/mm/sifive_l2_cache.c                    | 175 +++++++++++++++++++++
 drivers/tty/hvc/hvc_riscv_sbi.c                    |   1 -
 36 files changed, 635 insertions(+), 321 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 arch/riscv/include/asm/sifive_l2_cache.h
 create mode 100644 arch/riscv/mm/context.c
 create mode 100644 arch/riscv/mm/sifive_l2_cache.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
