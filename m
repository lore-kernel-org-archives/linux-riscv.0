Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yBc/75G9oOgVbWIyHsDT3rZ/jhRU/Cu5H7DeQcC/IdI=; b=BDPYn5dutmPe7N
	QQM2LJ3WsG3z9xOql0YzZMd2N365ooPs8uTvJ3lByrixp0G9b/fGE8KqlnhVmbWzgFI4DYdaLMJSV
	hSw5Un/8VbNggw/7nZS/7krN8EFosezcrSAX2Mt91x6glsR4aXtoh6pJAsNy+km3UPmhFbMs4TMK+
	3Vi/XccE+q4YVomLZODlUJlDk1Amz8jFQeMKaqopO44MHE7vpJ8jZ5sO72vXmeDZ0ZXp6UcMqv9/k
	fHYbJDkKA1VzwF380+TtoQQ+ZZIxG8pph6QM57qs8fOB/WoKbuvqKVb5lWB3A7nf4RvtipKAGMrgt
	BixM6fIiYiGadta9qDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CqS-00CAgc-Hx; Wed, 30 Nov 2022 02:29:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CqP-00CAd6-9c
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:29:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so565951pjd.5
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=gi2uEo4iaZLZVK/wFCJO91dGFuOd6zHilYY5g4w8jXE=;
        b=aUkhALw5FZWUswh6W0OKLKG/PwAdMiQfPz8JlPvDUwuQRWoP2iqoCnoCuaP0b6FLjd
         z9pJyDQwNTNkR2DYc/QW1TFA+STq2guziXD++tNbePuCdZzOmhhCvSdjiipRqA7Y5SbJ
         ZWiLnrXtOvxxwxQdOaIzRYEJ/FD7t+CIavlnh4p/m/GeCIU4ya5d12XiROmAxNbr8tx8
         CN1ZFNB0iFUvxDxobsRKFcYITV1e6aspAHpFu5DmT90FjB+9Yl3FvQTOMfyEWsOuVT1V
         fWvN4hRifrmQ41cyG5FlurfDj8h3JZnoTq+pnqXaVOlckim4NO8kl9pP0EAN13dZbI9F
         iPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi2uEo4iaZLZVK/wFCJO91dGFuOd6zHilYY5g4w8jXE=;
        b=FwDzqKWwLA1UOAOQKnUs1CuqjzdEQlyavdHSu8Y7CH327ZWDcHfFVzNeoZTzXlRWGx
         5oRYCoDtB4Fsmv0fefLkXQzY2Y+4eYANKppmsb/9VlE73cBCyNJY7mEySwqK7RPZQmFe
         NHP1x+fgPotKgFR+8yFfnxygX6AGctTEQuecFXXQanbU0anaWTFQnGW/2JtOM9sYIKCu
         h9cTpDhXMbeYWSeFRjYLt+anu95sHTFphTZ8IJFT5yDuzQxFdMDaH8efbjv5az8GvTLN
         VptTAO5VzIHTWsfLbO5OykDvZpGQ1LsaSUdglp0zI4Bnjsjs/ACqzORtkbd0RW7o/0Ir
         mUpQ==
X-Gm-Message-State: ANoB5pm/kzOqZshS9ouCczrWEXk3lIhqcILwE2O//PBsc7KOqa51CAG8
	zIaYN+ED610hakBWwCsilH4MTg==
X-Google-Smtp-Source: AA0mqf71uUGWF1g6dJ/2iwnyLEvslimAagc1jwlrS97pQyhcX+j/bfxmFnS1On0YvTACfZSnAX9WHw==
X-Received: by 2002:a17:902:9307:b0:189:9284:2140 with SMTP id bc7-20020a170902930700b0018992842140mr9828829plb.111.1669775342931;
        Tue, 29 Nov 2022 18:29:02 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p22-20020a170902a41600b001869b988d93sm11496627plq.187.2022.11.29.18.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 18:29:02 -0800 (PST)
Subject: [PATCH v4] riscv: fix race when vmap stack overflow
Date: Tue, 29 Nov 2022 18:24:43 -0800
Message-Id: <20221130022442.18358-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_182905_580388_F78FAE46 
X-CRM114-Status: GOOD (  18.68  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20221030124517.2370-1-jszhang@kernel.org
[Palmer: Add AQ to the swap, and also some comments.]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Sorry to just re-spin this one without any warning, but I'd read patch a
few times and every time I'd managed to convice myself there was a much
simpler way of doing this.  By the time I'd figured out why that's not
the case it seemed faster to just write the comments.

I've stashed this, right on top of the offending commit, at
palmer/riscv-fix_vmap_stack.

Since v3:
 - Add AQ to the swap.
 - Add a bunch of comments.

Since v2:
 - use REG_AMOSWAP
 - add comment to the purpose of smp_store_release()

Since v1:
 - use smp_store_release directly
 - use unsigned int instead of atomic_t
---
 arch/riscv/include/asm/asm.h |  1 +
 arch/riscv/kernel/entry.S    | 13 +++++++++++++
 arch/riscv/kernel/traps.c    | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 618d7c5af1a2..e15a1c9f1cf8 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -23,6 +23,7 @@
 #define REG_L		__REG_SEL(ld, lw)
 #define REG_S		__REG_SEL(sd, sw)
 #define REG_SC		__REG_SEL(sc.d, sc.w)
+#define REG_AMOSWAP_AQ	__REG_SEL(amoswap.d.aq, amoswap.w.aq)
 #define REG_ASM		__REG_SEL(.dword, .word)
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 98f502654edd..5fdb6ba09600 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -387,6 +387,19 @@ handle_syscall_trace_exit:
 
 #ifdef CONFIG_VMAP_STACK
 handle_kernel_stack_overflow:
+	/*
+	 * Takes the psuedo-spinlock for the shadow stack, in case multiple
+	 * harts are concurrently overflowing their kernel stacks.  We could
+	 * store any value here, but since we're overflowing the kernel stack
+	 * already we only have SP to use as a scratch register.  So we just
+	 * swap in the address of the spinlock, as that's definately non-zero.
+	 *
+	 * Pairs with a store_release in handle_bad_stack().
+	 */
+1:	la sp, spin_shadow_stack
+	REG_AMOSWAP_AQ sp, sp, (sp)
+	bnez sp, 1b
+
 	la sp, shadow_stack
 	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index bb6a450f0ecc..be54ccea8c47 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -213,11 +213,29 @@ asmlinkage unsigned long get_overflow_stack(void)
 		OVERFLOW_STACK_SIZE;
 }
 
+/*
+ * A pseudo spinlock to protect the shadow stack from being used by multiple
+ * harts concurrently.  This isn't a real spinlock because the lock side must
+ * be taken without a valid stack and only a single register, it's only taken
+ * while in the process of panicing anyway so the performance and error
+ * checking a proper spinlock gives us doesn't matter.
+ */
+unsigned long spin_shadow_stack;
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
 	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
 
+	/*
+	 * We're done with the shadow stack by this point, as we're on the
+	 * overflow stack.  Tell any other concurrent overflowing harts that
+	 * they can proceed with panicing by releasing the pseudo-spinlock.
+	 *
+	 * This pairs with an amoswap.aq in handle_kernel_stack_overflow.
+	 */
+	smp_store_release(&spin_shadow_stack, 0);
+
 	console_verbose();
 
 	pr_emerg("Insufficient stack space to handle exception!\n");
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
