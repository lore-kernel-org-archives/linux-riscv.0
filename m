Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AE9ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vlY4NocadgJdJWJ+vFLCMFqaBUGohC8zlHwekWPPjpE=; b=oDctaTk7KFt9OJ
	zNU1g1UgaFCOZEMSLN64xx2NGQMP2K3iFybD4mJqRiHQNP1pZitvsUMNsEiehkrH5LqkbrbwmaYSQ
	oZUxIl9Y9r95lrZ+mhBro55ryem1sw+p+BH9l9Tg4Hr7OlDbYXrLkeLPCSUsmp7i2KuyOnoStgKZ7
	CVcXlslWF0jBObu+9Q3/aooRVMaqwl4BcdkxiYdNzvVCcfN00SsTAbYU9fL7Omqb88ALqyWFP3eBc
	D0/cjyPtHA9UgVyNkXM4oKuNM/d/3PszgZ71JTT0kfhdbvWvTl9TkvRMejN/xYnYRM72ev5se0l7F
	ExBA3cYVbAbgHXF2ZPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op7qA-00GAcO-MU; Sun, 30 Oct 2022 12:55:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op7q8-00GAZS-3x
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 12:55:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9666C60DFD;
	Sun, 30 Oct 2022 12:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DECBC433D6;
	Sun, 30 Oct 2022 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667134498;
	bh=5yoWTKKzJPGZvHI5RJZ+Ao+F3Il25e1XFouqIcbN/OM=;
	h=From:To:Cc:Subject:Date:From;
	b=HxNVdgXEvFeRh1kbN198L/t6hi9jKHlgNeKv2l+40ZteX0YlwXW+eGG6VM/fFMq7w
	 31+NuSwyxTfZtVkel46cbH7T4tSLoFyxYrbZrYXniVgUImPkSKnasv1W3KVRfl5sn/
	 19AvicBwhny8xHgsgFcXmFKAu2KjdH+T+ylsvqkCNGjfC8+0KsrzAbt/UoPOzRO5QT
	 JCzSf5oYfswN0PXMmBnMv+lQhm53ydqMiaXesMm7QCYbCI+/VzqUIgTPG4LwiGdaVg
	 mtIQToo8nIiOaxlUaiuRIfvSG2FyXSpdJr1XFI3/L8NrN2iC2kZO/li7P96IyNyNbQ
	 N8RRKe1TQSujw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] riscv: fix race when vmap stack overflow
Date: Sun, 30 Oct 2022 20:45:17 +0800
Message-Id: <20221030124517.2370-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_055500_278499_E8060905 
X-CRM114-Status: GOOD (  12.97  )
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
Since v2:
 - use REG_AMOSWAP
 - add comment to the purpose of smp_store_release()

Since v1:
 - use smp_store_release directly
 - use unsigned int instead of atomic_t


 arch/riscv/include/asm/asm.h | 1 +
 arch/riscv/kernel/entry.S    | 4 ++++
 arch/riscv/kernel/traps.c    | 9 +++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 1b471ff73178..acf563072b8b 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -23,6 +23,7 @@
 #define REG_L		__REG_SEL(ld, lw)
 #define REG_S		__REG_SEL(sd, sw)
 #define REG_SC		__REG_SEL(sc.d, sc.w)
+#define REG_AMOSWAP	__REG_SEL(amoswap.d, amoswap.w)
 #define REG_ASM		__REG_SEL(.dword, .word)
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..ea6b78dac739 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -404,6 +404,10 @@ handle_syscall_trace_exit:
 
 #ifdef CONFIG_VMAP_STACK
 handle_kernel_stack_overflow:
+1:	la sp, spin_shadow_stack
+	REG_AMOSWAP sp, sp, (sp)
+	bnez sp, 1b
+
 	la sp, shadow_stack
 	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f3e96d60a2ff..dea47f329708 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -221,11 +221,20 @@ asmlinkage unsigned long get_overflow_stack(void)
 		OVERFLOW_STACK_SIZE;
 }
 
+unsigned long spin_shadow_stack;
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
 	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
 
+	/*
+	 * to ensure spin flag is set after the sp is used in entry.S:
+	 * //load per-cpu overflow stack.
+	 * REG_L sp, -8(sp)
+	 */
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
