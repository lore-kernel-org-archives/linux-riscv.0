Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4104C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 18:07:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA2761625
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 18:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA2761625
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=snm2bLn9meS8YTAvvgGmXFYNtUuwUKXmczI7nDf+YNY=; b=P2DEUMGdhaNhO/IgpqZH2Wwhg4
	86OXJXbqdJpQ9XZWOsYEMg5m4j/47AaIbnRJPoNEsZEOGEPWofndF0lMupTIsc94AgnIGHJAt6ELp
	afoODZCmV2DGNh3+MexIwTxTI3kvg4cs5CgfJaW+VyxA6DvQ65dmMfAPcl1zq0FhAgwgEVV47J+XN
	Qm61/ndcE1V1kdJw5tTAgX50EmjG47xPqSZCoSYT7vTP0hPkBp9Csh+CfE0p2yfBb0U1KzeULkE5J
	fNOG3RyJPwv5X/X8CA8J4JEMdiyjouUqH/2Pyzk6aE+Dd6ZjtRC3EdYYxsW+DAuNthU6RHZplu91N
	KVo7fbWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgWmt-000zIc-VX; Tue, 11 May 2021 18:07:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgWmr-000zIE-8c
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 18:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=qCJvGbmaZJSE3pxe4f1TSFUnqL796a3yS+C8feY6hM8=; b=0PDCM/174JWtK/g2176rk1EFA7
 LWUOGI5iwGiAZicK39Jn9X5GAzq6tHWvAupM6Io0JiacWxjQWr+WmigOJMuLOzj7GgYoZu7oHk+47
 G66xSYjr4nFKwhVihqkAgTcPeLRdAoxCkzAAPfRQDfr3YGknC5un1FHIMN33XKFh0YhYRN2J1Ceny
 Hw27dALCgFFE4F40Gk4zN2FcWlixvnrk6hIcC2ckH1Y3mlp5HbPmYl1rNNy8gpq5XopcnEc5vxedI
 weLw11EhX817i0FXl7PMnHc73JsYPLWJBsIhs/u3/BTBCTuQlJ4GQFXjmNGoZ9OIuPUbF1Av6J7/8
 FJghyl/w==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lgWmn-009pQF-Ac
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 18:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=qCJvGbmaZJSE3pxe4f1TSFUnqL796a3yS+C8feY6hM8=; b=mD2r8vvI8dsFh
 RVBova8Tffpk8OPoEgOOLNrAdDXQaL1xWdRmo3qQ5xZFyr7xTfMzHT+O1yLkDwDG
 zoPBE97HDRVltIAa0/HTSRt0nUczLEhbuwUQhJDnKcDye7bETe9B4CZ68Nxbh5jC
 35w2CNREZ88QYdhkiosvgXIKmhgN6M=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAnLUXKx5pgK5rBAA--.33170S2; 
 Wed, 12 May 2021 02:07:07 +0800 (CST)
Date: Wed, 12 May 2021 02:01:52 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Turn has_fpu into a static key if FPU
Message-ID: <20210512020152.200a182d@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAnLUXKx5pgK5rBAA--.33170S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfCF1Dtr1UWry8CFW3KFg_yoWrAF4UpF
 WqkFn3WrW5uF18Wa4ayr4kWr95twn3u3W3ur15G3WfAF45try5Jwn5Za42yry5XFyYga4S
 kFZ0kr4Syw4UJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_110713_828566_46C83D3A 
X-CRM114-Status: GOOD (  13.58  )
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

From: Jisheng Zhang <jszhang@kernel.org>

The has_fpu check sits at hot code path: switch_to(). Currently, has_fpu
is a bool variable if FPU, switch_to() checks it each time, we can
optimize out this check by turning the has_fpu into a static key.

Before the patch:
	...
	ccc7c783		lbu     a5,-820(a5) # ffffffff80cab098 <has_fpu>
	e3b5			bnez    a5,ffffffff8031a438 <__schedule+0x232>
	...

After the patch:
If FPU isn't supported:
	...
	00000013		nop
	...

If FPU is supported:
	...
	0540006f                j       ffffffff8031a418 <__schedule+0x21a>
	...

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/switch_to.h | 11 ++++++++---
 arch/riscv/kernel/cpufeature.c     |  4 ++--
 arch/riscv/kernel/process.c        |  2 +-
 arch/riscv/kernel/signal.c         |  4 ++--
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 407bcc96a710..ea25ccb7785e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_SWITCH_TO_H
 #define _ASM_RISCV_SWITCH_TO_H
 
+#include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -55,9 +56,13 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-extern bool has_fpu;
+extern struct static_key_false cpu_hwcap_fpu;
+static __always_inline bool has_fpu(void)
+{
+	return static_branch_unlikely(&cpu_hwcap_fpu);
+}
 #else
-#define has_fpu false
+static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
 #define __switch_to_aux(__prev, __next) do { } while (0)
@@ -70,7 +75,7 @@ extern struct task_struct *__switch_to(struct task_struct *,
 do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
-	if (has_fpu)					\
+	if (has_fpu())					\
 		__switch_to_aux(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ac202f44a670..a2848dc36927 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -19,7 +19,7 @@ unsigned long elf_hwcap __read_mostly;
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
 #ifdef CONFIG_FPU
-bool has_fpu __read_mostly;
+__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
 
 /**
@@ -146,6 +146,6 @@ void riscv_fill_hwcap(void)
 
 #ifdef CONFIG_FPU
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
-		has_fpu = true;
+		static_branch_enable(&cpu_hwcap_fpu);
 #endif
 }
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index f9cd57c9c67d..03ac3aa611f5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -87,7 +87,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
 	regs->status = SR_PIE;
-	if (has_fpu) {
+	if (has_fpu()) {
 		regs->status |= SR_FS_INITIAL;
 		/*
 		 * Restore the initial value to the FP register
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 65942b3748b4..c2d5ecbe5526 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -90,7 +90,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	/* Restore the floating-point state. */
-	if (has_fpu)
+	if (has_fpu())
 		err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
@@ -143,7 +143,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	if (has_fpu)
+	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
