Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FECC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nBS6qa0AYfp02DCsegqZBsF4MHBEYRM6HvbP14yjnQo=; b=LeYivwb6dVmiV3
	Y6gNMkRxyFgL6u4XKxkCl7ObHYoWBLHPyfFEp4RqFz7GfQZz6gRAZjYVFqHy8LCxFL4hSTcxZzkWR
	N4VGC8wuxFqDXc2Q9LGGuYDKh4h3wjD8PCyU40suNUAMt/NjmfpxnH+L+nyq+uduKJNgURrRXZnBv
	D+/OGbNrF7ZgTjSs5nX8kF7HVpdvy7y08fsANDb3eDuRHqFpcMdhTO2OPpgK9mXceS7Z1gzr3JOCd
	xQwRf8hZo+TUIewSKdcJI08Y6jUL9TGT6e0YRR7mLs0LGtiAOyQfbaKDiqMqB+RtSAGjHQKwF1EKh
	M16nKrNe5Ls7LwnxrKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWlP-00GL1o-JE; Thu, 20 Oct 2022 14:43:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWlI-00GKxR-Tn
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 14:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CFA7B8267E;
	Thu, 20 Oct 2022 14:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9F1C433C1;
	Thu, 20 Oct 2022 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666276986;
	bh=1mkLwMduon6mFlXdZ1go1kC/+lZJsRhnP5cXjU0CP9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=Se7BLwYGeyBpaIOaeMvTnpIfQPcLMy/HG8PNLOANqEHWjQO00EEcU/9jHx1e4NEcE
	 Jrau7ya8nIOCwPX2I7qExozEfboSDqcOn/awK3TURUhTT2f2APsBtlkLkdvqmDKULG
	 K8nwJidULg8IeFaF35l1ft1sh4gh/z4m8wFDlhPCz2zGNIq3pU3+PhEp7rainQg7Hr
	 urKMdQLW61oxmVeixPwxqNTKEHGKvekeyHEZUzCTm5mity78SeuRqwM9TbbJbX8ghh
	 6gixtq4lXPVK8ApMSpbFxhJihlKxt412Cp6TsnaNX6NlkVanE1KXYkJUE6ryLVqbwV
	 XcYIjkGmKMpFw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2] riscv: fix race when vmap stack overflow
Date: Thu, 20 Oct 2022 22:33:29 +0800
Message-Id: <20221020143329.3276-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_074309_148955_CEF275B4 
X-CRM114-Status: GOOD (  10.48  )
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
will be swap between its own address and 0 in atomic way, when the
var is set, it means the shadow_stack is being used; when the var
is cleared, it means the shadow_stack isn't being used.

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Guo Ren <guoren@kernel.org>
---
Since v1:
 - use smp_store_release directly
 - use unsigned int instead of atomic_t

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
index f3e96d60a2ff..f1f57c1241b6 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
 		OVERFLOW_STACK_SIZE;
 }
 
+unsigned int spin_shadow_stack;
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
 	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
 
+	smp_store_release(&spin_shadow_stack, 0);
+
 	console_verbose();
 
 	pr_emerg("Insufficient stack space to handle exception!\n");
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
