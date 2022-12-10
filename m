Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B9C10F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ze3/k0iak38IXXtpT1gMl+eH431B9TngYtZDMDbbNLY=; b=MqpP1wS80gXWT1
	WUV05RSQYFVFX6IWWZlLUARqfuFmXqmdY4TCMebepBSowcvumqVEgKqYp760LepIahAt3+pt85Lib
	m1uOUJylpZTn6xElA9gqqEKERygK8lEBFkOlXQv9V6kR3lbiHhSpk3nfmfugLQYoiaKH5qd39gAlG
	kjT/k6Q+Os2fDQNl3nwIHZ1POpH61/t/5JZDiP3JsS0nNEHXK5JTDyZI+UGW22S42H3E/mkvkkb1/
	Gsa9Mt9x6zo6jGiDp9rIjJ7fpuqVrPEQGWi2TMumI9HSjKo8CJk+N9Gn3ztFSSGZUQCg5VEWIqf5/
	Z7je36XDUcw6NOonjbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43Ol-0031fs-Ae; Sat, 10 Dec 2022 17:12:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43Of-0031ZU-IP
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 17:12:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B62CF601D4;
	Sat, 10 Dec 2022 17:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2B3C433EF;
	Sat, 10 Dec 2022 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670692340;
	bh=JkuMnpyvpDgmLbRKf6NYs0jOELdsWfwSNqEpAY5kch0=;
	h=From:To:Cc:Subject:Date:From;
	b=YPsbUiWIBRJHsyrXewa5Tggk2EBv8iohwX9IizvP7bD5R5sSQrTk5dKxEhAEjXLBV
	 OiGjUfPPTKvqDjpBnCu6ou8lD83Z9s7QWT+5QO+NA2LHr4Vbc2z0xT/51wo6fivPHK
	 cwI+V16jYTZd8+9wq+C8cwBQ7PeaMbp7GgSYvDeISp7vQnHv3hKTk7d9YslCKbCE5W
	 t8VoW2biDIAzK/QZBSf7UcPa4M4SkCHKJFL9vqu+lwwrg3jilg5qmANjstiJLmF7ZQ
	 FJxrqjByWh1znSM38j9YRtyC9G5J1ReFn1WpkQnss69uSjdUktiEiqdY6h/5ns3tvf
	 EvQ1qfKKBR5TQ==
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
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V11 0/7] riscv: Add GENERIC_ENTRY support
Date: Sat, 10 Dec 2022 12:11:34 -0500
Message-Id: <20221210171141.1120123-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_091223_619040_A4C82B46 
X-CRM114-Status: GOOD (  14.14  )
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
kernel/entry/*. Some optimization for entry.S with new .macro and merge
ret_from_kernel_thread into ret_from_fork.

The 1,2 are the preparation of generic entry. 3~7 are the main part
of generic entry.

All tested with rv64, rv32, rv64 + 32rootfs, all are passed.

You can directly try it with:
[1] https://github.com/guoren83/linux/tree/generic_entry_v11

Any reviews and tests are helpful.

v11:
 - Rebase on newest for-next-20221211
 - Remove stack optimization patch series
 - Optimize comments
 - Replace ENTRY with SYM_CODE/FUNC_START in entry.S

v10:
https://lore.kernel.org/linux-riscv/20221208025816.138712-1-guoren@kernel.org/
 - Rebase on palmer/for-next branch (20221208)
 - Remove unrelated patches from the series (Suggested-by: Bjorn)
 - Fixup Typos. 

v9:
https://lore.kernel.org/linux-riscv/20221130034059.826599-1-guoren@kernel.org/
 - Fixup NR_syscalls check (by Ben Hutchings)
 - Add Tested-by: Jisheng Zhang

v8:
https://lore.kernel.org/linux-riscv/20221103075047.1634923-1-guoren@kernel.org/
 - Rebase on palmer/for-next branch (20221102)
 - Add save/restore_from_x5_to_x31 .macro (JishengZhang)
 - Consolidate ret_from_kernel_thread into ret_from_fork (JishengZhang)
 - Optimize __noinstr_section comment (JiangshanLai)

v7:
https://lore.kernel.org/linux-riscv/20221015114702.3489989-1-guoren@kernel.org/
 - Fixup regs_irqs_disabled with SR_PIE
 - Optimize stackleak_erase -> stackleak_erase_on_task_stack (Thx Mark
   Rutland)
 - Add BUG_ON(!irqs_disabled()) in trap handlers
 - Using regs_irqs_disabled in __do_page_fault
 - Remove unnecessary irq disable in ret_from_exception and add comment

v6:
https://lore.kernel.org/linux-riscv/20221002012451.2351127-1-guoren@kernel.org/
 - Use THEAD_SIZE_ORDER for thread size adjustment in kconfig (Thx Arnd)
 - Move call_on_stack to inline style (Thx Peter Zijlstra)
 - Fixup fp chain broken (Thx Chen Zhongjin)
 - Remove common entry modification, and fixup page_fault entry (Thx
   Peter Zijlstra)
 - Treat some traps as nmi entry (Thx Peter Zijlstra)

v5:
https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/
 - Add riscv own stackleak patch instead of generic entry modification
   (by Mark Rutland)
 - Add EXPERT dependency for THREAD_SIZE (by Arnd)
 - Add EXPERT dependency for IRQ_STACK (by Sebastian, David Laight)
 - Corrected __trap_section (by Peter Zijlstra)
 - Add Tested-by (Yipeng Zou)
 - Use CONFIG_SOFTIRQ_ON_OWN_STACK replace "#ifndef CONFIG_PREEMPT_RT"
 - Fixup systrace_enter compile error
 - Fixup exit_to_user_mode_prepare preempt_disable warning

V4:
https://lore.kernel.org/linux-riscv/20220908022506.1275799-1-guoren@kernel.org/
 - Fixup entry.S with "la" bug (by Conor.Dooley)
 - Fixup missing noinstr bug (by Peter Zijlstra)

V3:
https://lore.kernel.org/linux-riscv/20220906035423.634617-1-guoren@kernel.org/
 - Fixup CONFIG_COMPAT=n compile error
 - Add THREAD_SIZE_ORDER config
 - Optimize elf_kexec.c warning fixup
 - Add static to irq_stack_ptr definition

V2:
https://lore.kernel.org/linux-riscv/20220904072637.8619-1-guoren@kernel.org/
 - Fixup compile error by include "riscv: ptrace: Remove duplicate
   operation"
 - Fixup compile warning
   Reported-by: kernel test robot <lkp@intel.com>
 - Add test repo link in cover letter

V1:
https://lore.kernel.org/linux-riscv/20220903163808.1954131-1-guoren@kernel.org/

Guo Ren (3):
  riscv: ptrace: Remove duplicate operation
  riscv: entry: Add noinstr to prevent instrumentation inserted
  riscv: entry: Convert to generic entry

Jisheng Zhang (3):
  riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
  riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork
  riscv: entry: Consolidate general regs saving/restoring

Lai Jiangshan (1):
  compiler_types.h: Add __noinstr_section() for noinstr

 arch/riscv/Kconfig                    |   1 +
 arch/riscv/include/asm/asm.h          |  63 +++++
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   6 +
 arch/riscv/include/asm/thread_info.h  |  13 +-
 arch/riscv/kernel/Makefile            |   2 -
 arch/riscv/kernel/entry.S             | 334 +++-----------------------
 arch/riscv/kernel/irq.c               |  15 ++
 arch/riscv/kernel/mcount-dyn.S        |  56 +----
 arch/riscv/kernel/process.c           |   5 +-
 arch/riscv/kernel/ptrace.c            |  44 ----
 arch/riscv/kernel/signal.c            |  29 +--
 arch/riscv/kernel/sys_riscv.c         |  31 +++
 arch/riscv/kernel/trace_irq.c         |  27 ---
 arch/riscv/kernel/trace_irq.h         |  11 -
 arch/riscv/kernel/traps.c             |  86 +++++--
 arch/riscv/mm/fault.c                 |  16 +-
 include/linux/compiler_types.h        |  15 +-
 21 files changed, 279 insertions(+), 499 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
