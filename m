Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A286C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rmAsfmXkK92MD7h2RgXzuVVgcCPynMRT/jHDhZ0eE8g=; b=1XoUjWq2OuBsDk
	YVaKwb3+aBHl9fP+oUfxGDQnWk81K4/RgtVVf+Z2L1hCsHJROCT+bSsXc/g5+sn9IN01ODvfWI5kk
	3gF+2wJm374xunwU45WT2ldZbC9Wwe5Mypx3Is533ckd3uYSJtrxUVro+bN58M/6mkoTH98csoB3m
	DQJzFYT6K2RZfgDh8UrL9pF5noLMMzxCPMkcvZ4SnHPi5/sIyheb30PxZmpIluWSLfzjsXpGYaBOM
	oXnm8jWfK9opg2w+jm+N7J4h7VltGwsLnx2IPWZbSdqpSAOjdGh+9G2VqBqJ86/xsaB81GEse9tr9
	cb434yEktHwSz02CGCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBcg-003jv5-Vw; Wed, 19 Oct 2022 16:08:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBRK-003Zgj-Pw
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 15:57:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 795C06194D;
	Wed, 19 Oct 2022 15:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF9FC433C1;
	Wed, 19 Oct 2022 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666195024;
	bh=tl/t0JSFx6B/W7U7U+lCNfIdDELRIvrRpnIkdxf7UO8=;
	h=From:To:Cc:Subject:Date:From;
	b=LXQ3DBXykd8cxJe+nDeTMuzZh2SioIauX440gB0kLifBqT436A3SwZ8AqZAu0d5Ks
	 QaH7PcJ7Zc5hE1yZ2imldpdk31TSsBPmyqtqIUmi/FDTM7tlChYsG3UdkuAm43zcOZ
	 RAvDnZZCtCzMzQWa2vGzAFjZlg84MC1gKhu9nK2YdtXDm2qiYt7ZuDVhgD6so4+eab
	 ItBZ4nypwK6bA1YqZxImaHz4C5ugTj8o4tT4JXmFk+xq+iKF2uoHw9fPykRoMDNju8
	 p4Ah1KhNSiZSfM7VwAmm6T8F5k5PTyhH7sfIJdBw4ZMGoCPp3RMnU1QXuOVwaKr0tn
	 j/GdetFOTgQsA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] riscv: fix race when vmap stack overflow
Date: Wed, 19 Oct 2022 23:47:27 +0800
Message-Id: <20221019154727.2395-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_085707_008426_14FE1D76 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Currently, when detecting vmap stack overflow, riscv firstly switches
to the so called shadow stack, then use this shadow stack to call the
get_overflow_stack() to get the overflow stack. However, there's
a race here if two or more harts use the same shadow stack at the same
time.

To solve this race, we introduce spin_shadow_stack atomic var, which
will make the shadow stack usage serialized.

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/entry.S | 4 ++++
 arch/riscv/kernel/traps.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..7b924b16792b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -404,6 +404,10 @@ handle_syscall_trace_exit:
 
 #ifdef CONFIG_VMAP_STACK
 handle_kernel_stack_overflow:
+1:	la sp, spin_shadow_stack
+	amoswap.w sp, sp, (sp)
+	bnez sp, 1b
+
 	la sp, shadow_stack
 	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f3e96d60a2ff..88a54947dffb 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
 		OVERFLOW_STACK_SIZE;
 }
 
+atomic_t spin_shadow_stack;
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
 	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
 
+	atomic_set_release(&spin_shadow_stack, 0);
+
 	console_verbose();
 
 	pr_emerg("Insufficient stack space to handle exception!\n");
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
