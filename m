Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07ACC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QtFq+5WFGzW3ZJF/Rtr/jQeQonTzQxBeXqd3sdiKo0=; b=i3NL7HMS1OFmLr
	57rGYCfKYKJc9LyRWfegQuugbaHM6K6PxomRQ+YpgeKN+9CTZeHPGaL0qkakNEIRqRB2lLuYhWfbp
	WF1UWOnTVQQwj4DR/dEebajrd4LpkYLt0KSBNCMdIiU/h/ymBCFbTj2lhIq/0tWGOxWiNegXf3bis
	xfV5JamhHyaGZCN+z+PBCETL00DT1XefK3A9QEvEV+odkq1nfca/22iDGQedya8se1NV3Uf2VJzy3
	kxevS65zBRriKgHZOYjt8F97SlKbmGrI87MqD9xlv8HnwfH0bFZ+h60/lF8m+gCUHdz0ZnJYuiYMF
	fgWrZY2TsyTTndl6raUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23np-00Bl1X-0H;
	Sun, 12 Nov 2023 06:18:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nl-00Bkx4-1S
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74976CE0E8B;
	Sun, 12 Nov 2023 06:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EF7C4339A;
	Sun, 12 Nov 2023 06:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769910;
	bh=OjrCcl0rfmfc64pY2XcaTipAjTIetFz7lqlGwLAdI1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUqY1I7x2IBpSxSUqW/7Q6OGxQiYKOlhpkgEMuIXaegTBhYxQabZ9nWdjM3gZ1HA9
	 PlNm0fMrqtlmHvJ+jn4V8Ren7NlYCmwAiTI8y5M/k9k/16h+Ii0SRuzEgvYc1u3EJq
	 whpJwHxfxSih6gKdXEktmiq5plDVz7/YlAQzH8C7aBOT3HiqHjulOxuCgkBg7WPlH/
	 f0NmXgtgbDRUMTm9HiQr8f4uKme+8Sdo5Sh8zYj+XRX1VD270xGtNAxCrjmwn0v60m
	 rOVTaDeFOqKNkyQ/yEOWKFz2Qc0ijC27b9+L+CfEBAR0obCEuxoEuHL9jnL5Tdj5S6
	 BYGwuFwOZw69Q==
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
Subject: [RFC PATCH V2 30/38] riscv: s64ilp32: Add u32ilp32 ptrace support
Date: Sun, 12 Nov 2023 01:15:06 -0500
Message-Id: <20231112061514.2306187-31-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221833_830523_6C2A2D4E 
X-CRM114-Status: GOOD (  10.01  )
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

The s64ilp32 supports both u64ilp32 and u32ilp32 ABIs, and their pt_regs
differ. So introduce the compat feature to help u32ilp32 ABI. Now
u64ilp32 and u32ilp32 applications could work with the s64ilp32 Linux
ptrace concurrently.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/elf.h | 2 +-
 arch/riscv/kernel/ptrace.c   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 5b2bf1a7cb59..58c2e5ef2b7a 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -143,13 +143,13 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
 			(current->personality & (~PER_MASK)));	\
 } while (0)
 
-#ifdef CONFIG_COMPAT
 #define COMPAT_ELF_ET_DYN_BASE		((TASK_SIZE_32 / 3) * 2)
 
 /* rv32 registers */
 typedef compat_ulong_t			compat_elf_greg_t;
 typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
 
+#ifdef CONFIG_COMPAT
 extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
 					      int uses_interp);
 #define compat_arch_setup_additional_pages \
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 5471b12127da..1078c0f454c1 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -295,7 +295,7 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-#ifdef CONFIG_COMPAT
+#if IS_ENABLED(CONFIG_COMPAT) || IS_ENABLED(CONFIG_ARCH_RV64ILP32)
 static int compat_riscv_gpr_get(struct task_struct *target,
 				const struct user_regset *regset,
 				struct membuf to)
@@ -350,7 +350,9 @@ static const struct user_regset_view compat_riscv_user_native_view = {
 	.regsets = compat_riscv_user_regset,
 	.n = ARRAY_SIZE(compat_riscv_user_regset),
 };
+#endif
 
+#ifdef CONFIG_COMPAT
 long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			compat_ulong_t caddr, compat_ulong_t cdata)
 {
@@ -368,7 +370,7 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 
 const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 {
-#ifdef CONFIG_COMPAT
+#if IS_ENABLED(CONFIG_COMPAT) || IS_ENABLED(CONFIG_ARCH_RV64ILP32)
 	if (test_tsk_thread_flag(task, TIF_32BIT) &&
 	   !test_tsk_thread_flag(task, TIF_64ILP32))
 		return &compat_riscv_user_native_view;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
