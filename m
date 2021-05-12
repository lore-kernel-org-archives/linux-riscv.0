Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBF6C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:01:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A570361964
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A570361964
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fpBqbnVqee9Z8mWL0SoXGV9a3PgwbZTsthLpK3Z6hY=; b=fuA5l8wF3DrpZWlEkVwOYe+2rs
	hRHyLckXpxXXQ5WESvdylI9zsglnAyed4FTCI71cP6XzLYEor+ucaSC4aPwpOk6jx/R3zjLNrp5Mc
	JX8mO9nRNqF0DMWWoUkHyvSL+3jOEHPZJW61DWI5ewkQ8TTIdlHxFFf3el0Z+D5qYQaefXMBBy0g6
	ToBoujTKztkPV15SBtByg5x6cUGDD5pUq27hVkypLYaEND4oKmt9eB0nEAR09SPiD1DlU7fuAfKNV
	9gX0K2PRt0x8+Ibz2Kh1Ie3j+9XNYyIJ/nRcO+ViVV9VHhIxms0BQd7agiG2n4sGWVzPdARKfji7h
	dyGaf1eQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqMw-0036Dr-MP; Wed, 12 May 2021 15:01:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqMb-0036BH-GO
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 15:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yrThomVATZlhiw7LdZRsW7ycaoiGotBjuA2IuQE8xR0=; b=mkE4HRqCzK8umPdJfGgKO9wmNr
 stwZI2cwD12o+QwmFieRTi/NadivhwBngGuZh9VllImHwa9pLaSMA3DC7a7x+AUPNWPYjdie6GSKr
 bVvieklV2xpig1YL6AGvRZ3Jww8Fuz87Odqlman2Yckh+KlxGxvGuSBdZQ8/atsKgAQDAfM4YwOD6
 uoNbcBLZyxsK+w0zy8LPgrV7kTvKFg67V6u8vzgO3JvijrwcdqfkfOY7vwRq7D8J8a+gjku6UJeSz
 4OXkCCKHGkOAOMHuj8ppgOTaVBXZBFzkqMD90A7ZanOEMz522M/1/K38okSE5M3BfgMdeVbW+6aPV
 HIgwF2AA==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqMQ-00ATc0-Tl
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 15:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=yrThomVATZlhiw7LdZRsW7ycaoiGotBjuA2IuQE8xR0=; b=KxgdF1YCDn8wI
 IrL2NtLMasvQsfQbm2n3BkKIBiBQWL5KV6IY4gsOrgz8aLwhrFzb3YN76Tt7SI/l
 cXqvDWNDyNPAwv1obKSZsgbdCIgsxzcOnBB8zWPvwlqro8LBQFz8GJBb8Ms+Pfap
 y9+YMKIHMFoyBcdEaCuhnDjY4dPz08=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3cFWw7ZtgKCvJAA--.12206S2; 
 Wed, 12 May 2021 23:01:04 +0800 (CST)
Date: Wed, 12 May 2021 22:55:45 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Turn has_fpu into a static key if FPU=y
Message-ID: <20210512225545.6c23d51f@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3cFWw7ZtgKCvJAA--.12206S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfCF1Duw1fuF1rtFWkZwb_yoWrXFWrpF
 WqkFn3WrW5uF18Wa43Ar4kWr95twn5W3Wa9r1DG3WfAF4Yqry3X3s5Za4jvry5XFyFg39a
 9FZIkrySkw4UXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_080120_003033_171BB1D9 
X-CRM114-Status: GOOD (  14.18  )
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
is a bool variable if FPU=y, switch_to() checks it each time, we can
optimize out this check by turning the has_fpu into a static key.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Since v1:
 - use static_branch_likely()
 - Improve the commit msg

 arch/riscv/include/asm/switch_to.h | 11 ++++++++---
 arch/riscv/kernel/cpufeature.c     |  4 ++--
 arch/riscv/kernel/process.c        |  2 +-
 arch/riscv/kernel/signal.c         |  4 ++--
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 407bcc96a710..0a3f4f95c555 100644
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
+	return static_branch_likely(&cpu_hwcap_fpu);
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
