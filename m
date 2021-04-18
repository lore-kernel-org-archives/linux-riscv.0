Return-Path: <SRS0=IH7i=JP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE3C433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 16:35:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCA561003
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 16:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCA561003
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=868G3TpUM26UO0GLlY+nE9go8WGjt0MZNmpGQCojfUI=; b=OS/x4T4QXF5tWBB53gPtjxoD4S
	MvlzYTtfQLwLkRO7wZzUqUupr9xFd15BWVp3qqgWQksGo/WIqhlXTaN63xFuEfZUd3T7VHgXL6O6V
	JOI/7TnosYFL//7m6KOJp0OvapIE07EwGduyc5ay389WkqCaBcv8c7DcRXguNp1NIQERR54QNgIMo
	CqVHmXxUHTYxfPbL8iEYVbl8YRiXhf+U3WgPIJb4EPua/kk1+vm9TgXll+qdA0h/CjBEmaoglGMaR
	j25G1d2F+nK4EeW1NtEvB8AX1vluE4Z3M08TqRHBbUDU4UiUWKE+u9nYm24VmfmHS+C9en26nkKX6
	9mpGjVTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYANq-008JuA-6F; Sun, 18 Apr 2021 16:34:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYANn-008Jtw-Ay
 for linux-riscv@desiato.infradead.org; Sun, 18 Apr 2021 16:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=g0n2LQAUoImpmAm99p3TPUXAM9WD1a7ioxiHN336N+0=; b=PHNPQYB9Kw+fF0lyfzuqVe2VD7
 UEztCEo4VEBPmy5FNuSz47Mcl72y0r1hX38JIshjLFWCbX9tqgBEYbHeMg5enwN75KkThW8vINU1n
 hKIarr2CS3qkn0khbkqI6sWzVRg1432pOnltTk3nTK5XWsPar/yrkT50r8Eq7SZaiB8ihQVtAbaLp
 xMxdVv5bQA6VunQTGA/X9QiwD9Vmd4x2P8OAZIJ/SAS203h4G8QZKxJ8piU4Q+JhG7t6WRCAylfye
 oePFp3eCsHH+t1ZTDC1UhA5OKJVAcYb+qJFyCzOot60pu0vEwrfCFWexL2pDSbtjR6wu8G4NwRouU
 B3hB2AaA==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYANe-00AVjT-EP
 for linux-riscv@lists.infradead.org; Sun, 18 Apr 2021 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=g0n2LQAUoImpmAm99p3TPUXAM9WD1a7ioxiHN336N+0=; b=bHbLHTDZ6BXM6
 nwE57QXkmiY6OAnHyVQ+5MhjEafZQm1Cj2dRK3rm5lYSuhRe1gcDLOpi75QBX72v
 67aMRZjDp1M+32obi4sC5MVPsUfzL59kXG0uOX73ASQWBR/8/UrzmVp0uscTj0yG
 KLTt6IezJB0P/xTI9wsZuzeI4pFbZc=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3r1SUX3xgAXAFAA--.8301S2; 
 Mon, 19 Apr 2021 00:34:28 +0800 (CST)
Date: Mon, 19 Apr 2021 00:29:19 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kprobes: Remove redundant kprobe_step_ctx
Message-ID: <20210419002919.1a0a539d@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3r1SUX3xgAXAFAA--.8301S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryxXF45KrW5Cr1xZryDGFg_yoWrZw1fpF
 ZIkw13JrZ5Ja95uFyxAw4UZr1Syr48ArW7KrWUC34ftw1ayr13XF1xW3yjyr98Gr9Ygw13
 ZryUtrW8J34xAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_093442_954294_A9C16D33 
X-CRM114-Status: GOOD (  12.40  )
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

Inspired by commit ba090f9cafd5 ("arm64: kprobes: Remove redundant
kprobe_step_ctx"), the ss_pending and match_addr of kprobe_step_ctx
are redundant because those can be replaced by KPROBE_HIT_SS and
&cur_kprobe->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode)
respectively.

Remove the kprobe_step_ctx to simplify the code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/kprobes.h   |  7 ------
 arch/riscv/kernel/probes/kprobes.c | 40 +++++++-----------------------
 2 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
index 4647d38018f6..9ea9b5ec3113 100644
--- a/arch/riscv/include/asm/kprobes.h
+++ b/arch/riscv/include/asm/kprobes.h
@@ -29,18 +29,11 @@ struct prev_kprobe {
 	unsigned int status;
 };
 
-/* Single step context for kprobe */
-struct kprobe_step_ctx {
-	unsigned long ss_pending;
-	unsigned long match_addr;
-};
-
 /* per-cpu kprobe control block */
 struct kprobe_ctlblk {
 	unsigned int kprobe_status;
 	unsigned long saved_status;
 	struct prev_kprobe prev_kprobe;
-	struct kprobe_step_ctx ss_ctx;
 };
 
 void arch_remove_kprobe(struct kprobe *p);
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 8c1f7a30aeed..4c1ad5536748 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -17,7 +17,7 @@ DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
 static void __kprobes
-post_kprobe_handler(struct kprobe_ctlblk *, struct pt_regs *);
+post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
@@ -43,7 +43,7 @@ static void __kprobes arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
 		p->ainsn.api.handler((u32)p->opcode,
 					(unsigned long)p->addr, regs);
 
-	post_kprobe_handler(kcb, regs);
+	post_kprobe_handler(p, kcb, regs);
 }
 
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
@@ -149,21 +149,6 @@ static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
 	regs->status = kcb->saved_status;
 }
 
-static void __kprobes
-set_ss_context(struct kprobe_ctlblk *kcb, unsigned long addr, struct kprobe *p)
-{
-	unsigned long offset = GET_INSN_LENGTH(p->opcode);
-
-	kcb->ss_ctx.ss_pending = true;
-	kcb->ss_ctx.match_addr = addr + offset;
-}
-
-static void __kprobes clear_ss_context(struct kprobe_ctlblk *kcb)
-{
-	kcb->ss_ctx.ss_pending = false;
-	kcb->ss_ctx.match_addr = 0;
-}
-
 static void __kprobes setup_singlestep(struct kprobe *p,
 				       struct pt_regs *regs,
 				       struct kprobe_ctlblk *kcb, int reenter)
@@ -182,8 +167,6 @@ static void __kprobes setup_singlestep(struct kprobe *p,
 		/* prepare for single stepping */
 		slot = (unsigned long)p->ainsn.api.insn;
 
-		set_ss_context(kcb, slot, p);	/* mark pending ss */
-
 		/* IRQs and single stepping do not mix well. */
 		kprobes_save_local_irqflag(kcb, regs);
 
@@ -219,13 +202,8 @@ static int __kprobes reenter_kprobe(struct kprobe *p,
 }
 
 static void __kprobes
-post_kprobe_handler(struct kprobe_ctlblk *kcb, struct pt_regs *regs)
+post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_regs *regs)
 {
-	struct kprobe *cur = kprobe_running();
-
-	if (!cur)
-		return;
-
 	/* return addr restore if non-branching insn */
 	if (cur->ainsn.api.restore != 0)
 		regs->epc = cur->ainsn.api.restore;
@@ -355,16 +333,16 @@ bool __kprobes
 kprobe_single_step_handler(struct pt_regs *regs)
 {
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
+	unsigned long addr = instruction_pointer(regs);
+	struct kprobe *cur = kprobe_running();
 
-	if ((kcb->ss_ctx.ss_pending)
-	    && (kcb->ss_ctx.match_addr == instruction_pointer(regs))) {
-		clear_ss_context(kcb);	/* clear pending ss */
-
+	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
+	    ((unsigned long)&cur->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode) == addr)) {
 		kprobes_restore_local_irqflag(kcb, regs);
-
-		post_kprobe_handler(kcb, regs);
+		post_kprobe_handler(cur, kcb, regs);
 		return true;
 	}
+	/* not ours, kprobes should ignore it */
 	return false;
 }
 
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
