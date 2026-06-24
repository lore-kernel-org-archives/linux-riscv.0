Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCF7CDB471
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Date:Subject:From:Message-Id:To:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x6AEYmlUWj4DBhND2YTEMIY8ZosgWiIfb4P9rUE7VC8=; b=RcrzujMSbvmPD2
	ZVgfo631t6B4kXAlMz3eUG8CaT8f60DzLS4fh30N/KS8WYZeksLBeFohyYHnbPar334Nn2z+NEVtm
	dWhLk7uWzpSrvrDWOY78cuZ4XmRN0emZKRNQNrg3ywdw8lKZRCwlyGe1y9KAjBMwj/brqltY83BVq
	CivlUXXG1wI/fxZnr/SzTvlsOBjVsr3esGy02aARtz9lOtHGEZDItRbBPosFv1GBzAoS1zyEFftpm
	KMv7mlFJVrwmPFH+5yduzFfoWiA+3whSl76bRPj6bQ6WSLHWezdegqrkNSd+/9IZ4yft0lqJOR+GP
	zPS65RFdFrUINE/xtHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLrR-00000007gl3-2YWN;
	Wed, 24 Jun 2026 11:33:41 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLqv-00000007giM-2bzr
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 11:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782300783; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=TKit7H7CPM4EWDUbyyzTYgig1VFMfeRKsIMYndF29EI=;
 b=gQVbZdy1+/uSJFksnX5DSgzScy2pJN2knb9s0cTYqTn3yDFFGrSBVkNWGzc3nR5vcqlw5Q
 oZG1VnR0oVoBJe+i3AVqdAxvMNNYybtXRzd2hLxzq+M5wb9YkJdfByCOpiDLbbzaH0546p
 JR5wSL+SrY779e4UxmHrockqHGsPOaZCnnz8P3CUhydOAtgHl5PTnsgMcvO6dX+uROatZ1
 KRa45D5PTMG+vtKw3uGGhl2YT3smobFab0VvW3QGBuV9FxkLjXwgtAKp8eelXB5YDq8jX9
 cUWF2gTsOcg3PgkN8ZNpKrcidZB5SGDoyREeSpDroSdM/6apFF4nOuqD2qTqUQ==
Mime-Version: 1.0
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <conor@kernel.org>
Message-Id: <20260624113148.3723541-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a3bc06e+ece662+lists.infradead.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
Date: Wed, 24 Jun 2026 19:31:48 +0800
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<samuel.holland@sifive.com>, <namcao@linutronix.de>, 
	"Rui Qi" <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_043310_110785_D58DFAF8 
X-CRM114-Status: GOOD (  10.08  )
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

From: Samuel Holland <samuel.holland@sifive.com>

call_on_irq_stack() uses struct member offsets to set up its link in the
frame record list. On riscv32, struct stackframe is the wrong size to
maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
padding. However, the ABI requires the frame record to be placed
immediately below the address stored in s0, so the padding must come
before the struct members.

Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
offsets from s0, instead of the positive offsets from sp.

Fixes: 82982fdd5133 ("riscv: Deduplicate IRQ stack switching")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
Link: https://lore.kernel.org/all/20240530001733.1407654-2-samuel.holland@sifive.com/
This is a resubmission of Samuel Holland's patch [1] which was
posted in May 2024 but never merged. The bug still exists in the
current tree.

[1] https://lore.kernel.org/all/20240530001733.1407654-2-samuel.holland@sifive.com/
---
 arch/riscv/kernel/asm-offsets.c | 4 ++--
 arch/riscv/kernel/entry.S       | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index af827448a609..a75f0cfea1e9 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -501,8 +501,8 @@ void asm_offsets(void)
 	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
 
 	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
-	OFFSET(STACKFRAME_FP, stackframe, fp);
-	OFFSET(STACKFRAME_RA, stackframe, ra);
+	DEFINE(STACKFRAME_FP, offsetof(struct stackframe, fp) - sizeof(struct stackframe));
+	DEFINE(STACKFRAME_RA, offsetof(struct stackframe, ra) - sizeof(struct stackframe));
 #ifdef CONFIG_FUNCTION_TRACER
 	DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c6988983cdf7..08df724e13b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -386,8 +386,8 @@ SYM_CODE_END(ret_from_fork_user_asm)
 SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save ra and s0 (fp) */
 	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
-	REG_S	ra, STACKFRAME_RA(sp)
-	REG_S	s0, STACKFRAME_FP(sp)
+	REG_S	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
+	REG_S	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
@@ -405,8 +405,8 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
-	REG_L	ra, STACKFRAME_RA(sp)
-	REG_L	s0, STACKFRAME_FP(sp)
+	REG_L	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
+	REG_L	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
 
 	ret
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
