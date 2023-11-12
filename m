Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F965C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVBk//SQoo+l0rS8jT2fu6FyU75YRdX1VQeK8Fst790=; b=Q6Vu8WOvd6pl0B
	kSPD6EqM1cUe5TpfQxF5AS8Ge8wS28HymqsNPVtYUPDaw3UlviGzOK2SGBQOy9wxYNZViFrsGt+hH
	eLBQtaqvpVekyDgabzwbPc7LJt+3ZI8oZz31ATWwZgLtvymBwuDfJyk0FhO+cEPBxanZuCWFvTf7b
	0EjGe1fT/sWQma98JLwGqRfFpd01FkKm66YXFZhSXDSabeURJpbrRwBo6GIafrkF2aWAgY25bWQ9j
	01HQ4j/48V3zrY0LFa5BcNW8NHC5dQYCLTYCKKLuf74eOqo+WTQgvu+O0BYXPC/bE5QIVDGIE7FHo
	AFYVLEDEbYhDBsj7b4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lv-00BjfL-14;
	Sun, 12 Nov 2023 06:16:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ls-00Bjcx-2m
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8ADD0B80A25;
	Sun, 12 Nov 2023 06:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F980C433C7;
	Sun, 12 Nov 2023 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769794;
	bh=t5MrC4fvvQc/xekSl+yR6G661NNGQj6PgtJ8W5ldz/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmZIsck3qQZ47ZtEtuPfCGlEnruD5oZdRze4VoBdVlszVX+zR+zesI8h/f8NTefwq
	 VWhnjyuIgcvNRfcyJRHmdcrLSoeVXKTKxUu6YHOA6pYGK2Al4X7XOduITVsoRh51Xy
	 YWIgiXgVwRNzjIX3F8cKKmCa/PJg3/dCzlDqt078w29bGlY12eAurMcl+H4E9Vpyb0
	 5dPifGZVFfAhrfLPx+/jDOWlknO4zCU4aBCHHHkE/Pz9pURH66T6YyPE344dZTL81u
	 wccacwGGK5aJ+vaR+VI5EM23Ux+fNTmGjWLzaiUVZJ9p8eMvZDCnEZtb51WSPw7+wf
	 GTMrhXIlKwycg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 11/38] riscv: u64ilp32: Enable user space runtime switch
Date: Sun, 12 Nov 2023 01:14:47 -0500
Message-Id: <20231112061514.2306187-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221637_175982_711AFBC1 
X-CRM114-Status: GOOD (  12.17  )
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

This patch didn't introduce any new syscall table but reused the
existing rv32 implementation to ease the maintenance of the kernel side.
Unify the UXL mode setting by ELF e_flags to support u64ilp32 &
u32ilp32.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/csr.h         | 2 --
 arch/riscv/include/asm/elf.h         | 7 ++++++-
 arch/riscv/include/asm/syscall.h     | 2 +-
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/process.c          | 4 +---
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7bac43a3176e..638b7a836acc 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -44,11 +44,9 @@
 #define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
-#ifdef CONFIG_64BIT
 #define SR_UXL		_AC(0x300000000, UL) /* XLEN mask for U-mode */
 #define SR_UXL_32	_AC(0x100000000, UL) /* XLEN = 32 for U-mode */
 #define SR_UXL_64	_AC(0x200000000, UL) /* XLEN = 64 for U-mode */
-#endif
 
 /* SATP flags */
 #ifndef CONFIG_64BIT
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index c24280774caf..5b2bf1a7cb59 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -127,18 +127,23 @@ do {							\
 		*(struct user_regs_struct *)regs;	\
 } while (0);
 
-#ifdef CONFIG_COMPAT
+#define EF_RISCV_64ILP32	0x20
 
 #define SET_PERSONALITY(ex)					\
 do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
 		set_thread_flag(TIF_32BIT);			\
 	else							\
 		clear_thread_flag(TIF_32BIT);			\
+	if ((ex).e_flags & EF_RISCV_64ILP32)			\
+		set_thread_flag(TIF_64ILP32);			\
+	else							\
+		clear_thread_flag(TIF_64ILP32);			\
 	if (personality(current->personality) != PER_LINUX32)	\
 		set_personality(PER_LINUX |			\
 			(current->personality & (~PER_MASK)));	\
 } while (0)
 
+#ifdef CONFIG_COMPAT
 #define COMPAT_ELF_ET_DYN_BASE		((TASK_SIZE_32 / 3) * 2)
 
 /* rv32 registers */
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 0148c6bd9675..a1122b88c362 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -81,7 +81,7 @@ static inline void syscall_handler(struct pt_regs *regs, ulong syscall)
 	syscall_t fn;
 
 #ifdef CONFIG_COMPAT
-	if ((regs->status & SR_UXL) == SR_UXL_32)
+	if (test_thread_flag(TIF_32BIT))
 		fn = compat_sys_call_table[syscall];
 	else
 #endif
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1833beb00489..61f7101aebb3 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -93,6 +93,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_32BIT		11	/* compat-mode 32bit process */
+#define TIF_64ILP32		12	/* 64ILP32 process */
 
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 93057ca2e2a7..87bdb0d6dbf3 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -126,14 +126,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	regs->epc = pc;
 	regs->sp = sp;
 
-#ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
 
-	if (is_compat_task())
+	if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
 		regs->status |= SR_UXL_32;
 	else
 		regs->status |= SR_UXL_64;
-#endif
 }
 
 void flush_thread(void)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
