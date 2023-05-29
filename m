Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8AC7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M/77jTvFBXpBHCZ1ZvuG+0MfnEbAy0prYgcPV9o1R3I=; b=A7MZfoVU6lzQv4
	3mbdwR1sob5RYP5E5HQRSrPdyGiv8UZmoCHHHmDJQc3Krc7bi8brDG8ExlsZprTPJ/R4g7Mz7P5rh
	VV6/62UsXhQuImXwYFFOAp6pLXJl9chu6J0/UtjHeTR4SL4kShd4ZWeS3d9MSH1rw1LCWdAdxvvxV
	cCcDaLAczOqRLodu43JCoxsCYBkoK+CpJq4FyMaCKdZQxRCst3ETy4TmPMi0XkSucEgrETWhX1w97
	8Wg9IymOQnM4nvRVh8l/3TfV+yKZ+6TS+WTVDWgeenFABXri4HCcy7FB6ckCPTpXNuC4l4FAWwZGs
	PdDh5ZEAHGDRYLMueHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWG-009kr3-2x;
	Mon, 29 May 2023 08:46:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWE-009kq5-0e
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 08:46:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C30CE622B8;
	Mon, 29 May 2023 08:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5181C4339B;
	Mon, 29 May 2023 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685349980;
	bh=/V+SLKdvaHtCYTQwLxo45gaPakkF4D8ubWUXjKcsgvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LrQixWfnMt+yEPDB9h2XI2CwlaOtVIZySVDvok3CKpeqKtBzv6elnzL5duj96HIua
	 mvZnNhHyQcL04IG5J2uPpotmvNzNG2+FO0wnTiPCE54cXMKT89v6cQgZ3DSJo1Skyq
	 QV5+oqtMW88EAq6jQulWdWC75VvFm+bcrmg7FPPkNuXw+6iwt7cpS+cp+nLYYLzhv8
	 ESHZILORDrFboBFuQhYb2GlrC4DRV6miEsSFFpALvXNjkWWB361dchGm9qmOWEDgpA
	 Ukfx+DRTC8qoC/ep9/s/FV3RhvxsrIyPIg3EJn+eSytM3Hbj6+NqyZG+TQ9co+F+Ud
	 H6vfmhpteK2fg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V12 0/3] riscv: Add independent irq/softirq stacks
Date: Mon, 29 May 2023 04:45:57 -0400
Message-Id: <20230529084600.2878130-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014622_313020_176346F8 
X-CRM114-Status: GOOD (  11.57  )
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

This patch series adds independent irq/softirq stacks to decrease the
press of the thread stack. Also, add a thread STACK_SIZE config for
users to adjust the proper size during compile time.

This patch series belonged to the generic entry, which has been merged
to for-next now.

v12:
 - Rebase on palmer/for-next (20230529)
 - Move DECLARE_PER_CPU(ulong *, irq_stack_ptr) into irq_stack.h (Thx Conor)
 - Optimize commit msg

v11:
https://lore.kernel.org/linux-riscv/20230324071239.151677-1-guoren@kernel.org/
 - Rebase on palmer/for-next (20230324)
 - Separate from generic entry patch series.

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
  riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
  riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
  riscv: stack: Add config of thread stack size

 arch/riscv/Kconfig                   | 19 ++++++++
 arch/riscv/include/asm/irq_stack.h   | 32 +++++++++++++
 arch/riscv/include/asm/thread_info.h | 14 ++----
 arch/riscv/kernel/irq.c              | 68 ++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c            | 35 +++++++++++++-
 5 files changed, 155 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/irq_stack.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
