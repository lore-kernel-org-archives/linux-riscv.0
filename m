Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE52AC4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0hoUD2z5u4Aq4JkjYc3m0GlFrNIJa2DL93jYoompXCs=; b=HeK6aiCGCVJxrW
	MRNtOkVnh3I4x7g05WuLVgYYQPqXcc7SkFDkGZEGVuixlaG69bVYP2tOizluTaRuuiNZjvN2X1hPk
	QBbwu6ujd1WfrFhaffPlPmUno5u12OfK//uFKPj6xGkhMkWK7K1DKzWuY7swf7lL0pVFeiFo213j3
	DRXeyf0+2ZScnnnHr+DpWIP9xL6+sjj8QPFVB/f0lv3mE+ihgphztMavc4PoQ/FqwWLH6ujE1vwGr
	3KLbfa+rSeQLhl8kPpL5MgMOjY8wmfLd4MfcH/1RO15u2Z0hBuoC2ZsxzyZQHSiB9PzQZItlkFGzm
	gbF1tQJWIwC2xMD96BMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenja-00GrM2-II; Sun, 02 Oct 2022 01:25:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjX-00GrKg-6P
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00BD460C8E;
	Sun,  2 Oct 2022 01:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED39C433D7;
	Sun,  2 Oct 2022 01:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673926;
	bh=Z6znzTi+KnB8Q307455dOXkYgby6LTL4boASwYTGr+c=;
	h=From:To:Cc:Subject:Date:From;
	b=Y27Sn647PzlhzedsGTPSmG03gKB3qdJ4jmVSZBveFJQ/gvmFwfoMXS+h4+0mWq1/6
	 vTh4Wd1uBY3QevMd9LAkYOHBH7901hkL+lTsZVCMXjpSJLrnloL0Rg78Jx5c32siwf
	 TTtU45/wYxRAeoO3g5UVEattYohVIhHNvVjAZzzPFbhZt2pZXhia1/kyIvM1nPaKug
	 puvP3fRZBo6Zjmczhvr0vrEqdPkW4Hd4+qaTuozET6ePGrIa5SBqctZVf+1+Iw2Ouj
	 omNvgqxADKhOzNG6KoLj5AkE5zbOrmWpfs9nYryF/LgC/Z5Ay9v6ciL1R+LyzGdpAX
	 Cm5atNaetXjSw==
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
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 00/11] riscv: Add GENERIC_ENTRY support and related features
Date: Sat,  1 Oct 2022 21:24:40 -0400
Message-Id: <20221002012451.2351127-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182531_363733_5885BFA0 
X-CRM114-Status: GOOD (  13.04  )
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
kernel/entry/*. Additionally, add independent irq stacks (IRQ_STACKS)
for percpu to prevent kernel stack overflows. Add generic_entry based
STACKLEAK support.

You can directly try it with:
[1] https://github.com/guoren83/linux/tree/generic_entry_v6

v6:
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

Dao Lu (1):
  riscv: Add support for STACKLEAK gcc plugin

Guo Ren (8):
  riscv: elf_kexec: Fixup compile warning
  riscv: compat_syscall_table: Fixup compile warning
  riscv: ptrace: Remove duplicate operation
  riscv: traps: Add noinstr to prevent instrumentation inserted
  riscv: convert to generic entry
  riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
  riscv: Add config of thread stack size

Jisheng Zhang (1):
  riscv: remove extra level wrappers of trace_hardirqs_{on,off}

Lai Jiangshan (1):
  compiler_types.h: Add __noinstr_section() for noinstr

 arch/riscv/Kconfig                    |  21 +++
 arch/riscv/include/asm/csr.h          |   1 -
 arch/riscv/include/asm/entry-common.h |   8 +
 arch/riscv/include/asm/ptrace.h       |  10 +-
 arch/riscv/include/asm/stacktrace.h   |   5 +
 arch/riscv/include/asm/syscall.h      |   6 +
 arch/riscv/include/asm/thread_info.h  |  27 +--
 arch/riscv/include/asm/vmap_stack.h   |  28 ++++
 arch/riscv/kernel/Makefile            |   3 +-
 arch/riscv/kernel/elf_kexec.c         |   2 +-
 arch/riscv/kernel/entry.S             | 230 +++-----------------------
 arch/riscv/kernel/irq.c               | 110 ++++++++++++
 arch/riscv/kernel/ptrace.c            |  44 -----
 arch/riscv/kernel/signal.c            |  21 +--
 arch/riscv/kernel/sys_riscv.c         |  27 +++
 arch/riscv/kernel/trace_irq.c         |  27 ---
 arch/riscv/kernel/trace_irq.h         |  11 --
 arch/riscv/kernel/traps.c             |  70 ++++++--
 arch/riscv/mm/fault.c                 |  14 +-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 include/linux/compiler_types.h        |   8 +-
 21 files changed, 321 insertions(+), 354 deletions(-)
 create mode 100644 arch/riscv/include/asm/entry-common.h
 create mode 100644 arch/riscv/include/asm/vmap_stack.h
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
