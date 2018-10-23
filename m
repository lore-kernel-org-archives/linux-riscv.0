Return-Path: <SRS0=kxho=ND=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF87FC004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 01:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3AA420652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 01:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njnmf+R6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UZ6UEQvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3AA420652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2pKIBut+lWoN9vqwU9GL8ezuVnNYnuBLsmAcKKvnDSE=; b=njnmf+R66Xanh7
	3TIrklzh00KTwo4RIHR4SOz8IZW01bPp8Tc7QG9llbzIKYuMnQbri+yjiMQJIxyF23VJ8UzrKua8M
	cK7Pq0LEfx6ZiskkSylfbNouzmQJeGAFLxanZNIrJmtojG2N7OHHf09dRVYjv/OgIAdvmMvIZW+TE
	bdpoePkxaYhcCWeWXHUMzo6yuFOE0eeWWPQBUsJRUXqJNA3pMBnmCDYYnp/fjZVV69JNnL7VHb/hu
	Auh1gLTDB4wGBP4sLbd74DlC/Q4IJtUW2s7MFfw3kQ+gYdR7jw5MmBE24frlSmTKuBbrSxH6CX3Sr
	QJXRfeOBdrKFnrKPr1sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gElMx-0006v3-0N; Tue, 23 Oct 2018 01:20:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gElMt-0006E9-FG
 for linux-riscv@lists.infradead.org; Tue, 23 Oct 2018 01:20:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id r64-v6so20778460pfb.13
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=KdWjBufdMXaqmbcyKnElkku8kEd6E8AjHGjdvwh2Mv4=;
 b=UZ6UEQvJXMhoZ26P0+90H8dxrEgrdLyoOpCw7oyG9ILQxaOr8/A0nEg3UbfikhO1ut
 VZjhoAO8ENzWnLiLSbeQBVwVK9J6w4wiiPKJPW390yazr2YaZmgz7CfMcIkPJQMrjww9
 aeMfYLvY1KnBMfjg4AI0OoSby4YGXNWuWIVlG1PjOzHP9sdkEhwKgFRnuvcGL/KYTGMw
 kWA+FKb+uhpMAjyG+76wucepaQLX2jrQVdUgXQZs5JF0FZHTNrTy+8cYxyApEwVsgs1M
 3bp94b8mlr7u+qyAS4IdDY6RVLY/6OoNKlrhr9DiwG7NtXKcNkiKneLljXs0mw5M8ky/
 g+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=KdWjBufdMXaqmbcyKnElkku8kEd6E8AjHGjdvwh2Mv4=;
 b=eJaSCpdlN5YrD+Cma3BYaMCI/EsyiaNlgz9mxUxNV7KGkkS8BB6gO0KCfQ3QUBKXs2
 6DGkSi6xbKTfk9MoyiRaNUsaX8K/+w8dmNfE6tbwpS6s/BWD7089cOzSLd0EBeiGGCRH
 yqcJLC7BnAtEnL1sqsffTUMOV/oKuZSsr9jp3ED/tcq1KMnCd0C4gIGEOdpeOBYgZu/v
 fkOc4y/yvwRogl5RWGaVczhMThGFNhY5W0q2mLszB9DnJWBy0+ZIavjkuqHlsHLQI5tp
 H9HoRW1fqVMLXsANiQRMlCBeSi8YZQPyzx8S0v74vV0MH/7lr1Vui83a8uWsJbF4hpDS
 EDeQ==
X-Gm-Message-State: ABuFfoh5ia31BX7KREfVJWOv9/D8c57FK/zsQijmuX0K1P24LzJrtKHz
 fq8I1ZtRSvcmJaq03R6h+CDNODjHlbg=
X-Google-Smtp-Source: ACcGV63Dw0aizq3M/h2yQmtwKZH3S+uhDNFN2cgfmuFpKge3RddpyFOOeTXVIrkKiTMq9kKGN9q3PA==
X-Received: by 2002:aa7:8281:: with SMTP id
 s1-v6mr46949394pfm.63.1540257612189; 
 Mon, 22 Oct 2018 18:20:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u38-v6sm4644085pgl.57.2018.10.22.18.20.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 18:20:11 -0700 (PDT)
Date: Mon, 22 Oct 2018 18:20:11 -0700 (PDT)
X-Google-Original-Date: Mon, 22 Oct 2018 18:20:07 PDT (-0700)
Subject: [PULL RFC] RISC-V Patches for the 4.20 Merge Window, Part 1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-737b95bd-3a5b-44c7-ac14-3af4bbcca32e@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_182023_550508_5E60D925 
X-CRM114-Status: GOOD (  19.16  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181023012011.TIqKSwZGYJObr-yum4Sz_qGyA8Y3uUyqOHpDDYBdaj8@z>

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
