Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26447C6FA83
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F03DoqSsMGcxNVNqxYT3BttgTEjVKT1WRgD10F4SYBA=; b=vKz+2QB2Jrz9eW
	i+fZCcdriEHswdECb4liZpFQZNZ/3a3UWF6aIJxnMTWtsxO2uriHOSMBrRWPwK8THAnsAoAYsxP/4
	G1gPhEB38Jpu50dzjlDaRbA3x9cqYBU2/sgeSKLyubKf+mCnef4dyZkIcAqcny5UksZtd0DGkBJ08
	9sR/NlrIRdC3JXeqPbKEHmF46J5BLCLfH/HRqVN9lHZ7x1MpdJowdTHryXHBsWfWXIotnWjhRMbF3
	5z9c/1J903RlRVI7p9x30j3M15WmdsdxYMooN+kz8VPdSwIXyaXt1iUVU+Gr1JkzuuQLMmTACtKLg
	6WHDaDm9zL6ckjJTLy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7EP-00Ef8O-N2; Thu, 08 Sep 2022 02:25:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7EL-00Ef0T-As
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:25:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3300B81E73;
	Thu,  8 Sep 2022 02:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC622C433C1;
	Thu,  8 Sep 2022 02:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662603919;
	bh=PWwh/YXG9dx0dtWtHG3/yHBED6i5hSGCgtNE2Z2JIEw=;
	h=From:To:Cc:Subject:Date:From;
	b=IIACQOWpPN4boCxf86cEOuTjUAmlBp3ujxTTDa72QX6A6qpHmsr9l7Vrs2mZqcFiB
	 2bSH/iR5Uba+LM9ltYToBi1SNZSQrcgsjcDlOtDbOcL9/pveePKU0iKQxH6msIqVG0
	 55D+rm0/tOW01PHBX9dRVxNZCnemoDMYhEVlD3589yAPlM1kSV0IbKKtf8QTe2aguM
	 4o2ugbD6hcPcOKJ7GgkGG7T5N0tDY2WpmMB7qP2MEqoROoEMnMk/R8MM7xC9uSbs6j
	 uHEnP3wdFEheXflnL+3E1J9JSfXI/lgwXKAQe4P7pQFTpGIN0tHkNlgLD0v2bRPYTU
	 ZKAzi4usP643Q==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/9] riscv: Add GENERIC_ENTRY, irq stack support
Date: Wed,  7 Sep 2022 22:24:58 -0400
Message-Id: <20220908022506.1275799-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_192525_705430_042D386B 
X-CRM114-Status: GOOD (  12.32  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The patches convert riscv to use the generic entry infrastructure from
kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
feature for the IRQ_STACKS config. You can try it directly with [1].

[1] https://github.com/guoren83/linux/tree/generic_entry_v4

V4:
 - Fixup entry.S with "la" bug (by Conor.Dooley)
 - Fixup missing noinstr bug (by Peter Ziji)

V3: https://lore.kernel.org/linux-riscv/20220906035423.634617-1-guoren@kernel.org/
 - Fixup CONFIG_COMPAT=n compile error
 - Add THREAD_SIZE_ORDER config
 - Optimize elf_kexec.c warning fixup
 - Add static to irq_stack_ptr definition

V2: https://lore.kernel.org/linux-riscv/20220904072637.8619-1-guoren@kernel.org/
 - Fixup compile error by include "riscv: ptrace: Remove duplicate
   operation"
 - Fixup compile warning
   Reported-by: kernel test robot <lkp@intel.com>
 - Add test repo link in cover letter

V1: https://lore.kernel.org/linux-riscv/20220903163808.1954131-1-guoren@kernel.org/

Guo Ren (8):
  riscv: elf_kexec: Fixup compile warning
  riscv: compat_syscall_table: Fixup compile warning
  riscv: ptrace: Remove duplicate operation
  riscv: traps: Add noinstr to prevent instrumentation inserted
  riscv: convert to generic entry
  riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
  riscv: Add config of thread stack size

 arch/riscv/Kconfig                    |  19 ++
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/irq.h          |   3 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   6 +
 arch/riscv/include/asm/thread_info.h  |  19 +-
 arch/riscv/include/asm/vmap_stack.h   |  28 +++
 arch/riscv/kernel/Makefile            |   1 +
 arch/riscv/kernel/elf_kexec.c         |   2 +-
 arch/riscv/kernel/entry.S             | 255 +++++---------------------
 arch/riscv/kernel/irq.c               |  75 ++++++++
 arch/riscv/kernel/ptrace.c            |  41 -----
 arch/riscv/kernel/signal.c            |  21 +--
 arch/riscv/kernel/sys_riscv.c         |  27 +++
 arch/riscv/kernel/traps.c             |  19 +-
 arch/riscv/mm/fault.c                 |  12 +-
 18 files changed, 263 insertions(+), 289 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 create mode 100644 arch/riscv/include/asm/vmap_stack.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
