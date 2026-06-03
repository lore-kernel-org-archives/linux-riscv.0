Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1B0CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 03:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Mime-Version:Date:Message-Id:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3c32Vwpg6hM/JRXqZO/2maa7a9rF3gsl2f5gRk+jaD8=; b=ti5wOGBdnv404Z
	yWaC694coUsRgDQKArID5WZSvMhNClHlHS0OYw3fDHkQXMN74FAUTST1c+TlDm9Xw+JarvAV4EEWk
	oBBeXq6bznVa2gVDvK3b4FFhjisyNozGMjyqutyPxykiS5hFgMn8D+0n40FkBg4Tvw4vCE8mbTIDV
	IDfl+5QoPTGCSMhKa5TBFFq9X2pfe8o7wFnh9RaqfYkknBUcAOVcFYXiXsJpYL38JaJqUXmhPoBeB
	ELqsNMFP4DzRa7fiv9cbUzbduNN35v+cjzmTJH2PtR9zDOsJJ7Bt8tOnDx9GD5Te75q886yfk17hj
	JWODX/mjmyK0XaXW+uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcfd-0000000EDUg-1Dmk;
	Wed, 03 Jun 2026 03:53:33 +0000
Received: from va-2-115.ptr.blmpb.com ([209.127.231.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcfa-0000000EDTt-2YGv
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 03:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780458799; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MFxN0eDM0EQaQEYZXyVgMg7gWvqW/BKj9d9daCeXaw0=;
 b=m/4apiLh1GrGhafkU21bbWjkzvF8qCRLwW7pZmNI28uGTSmn5exS/IZHZfJjsj2HaI0ObU
 6MHg/1O/coMf4mUYJw3U1unMQpq01+aZsoDiD2im7ELL+jzT9CqWexwXW/5PIG2SgxajTt
 rcKYjWWl53pCv4Ko0HDIEifcZhbes7DmB7xBXRBR5ELzY2Ej5QKjPmp3MeTDJqNyOiXF3C
 hiUictbg59u6pbnh0d6P3BBXmbZW4SFH3EXdRUuX2c83Pm3RtVe8gV0XfYVgcSyoaMrF1Q
 lMWT7oz9emTXuKXbJT7LSsF4Jyy81m1jekA/FIcuGzGwQWSWFVSi1jPDJCXqUA==
Cc: "Rui Qi" <qirui.001@bytedance.com>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv: fix frame pointer in call_on_irq_stack for RV32
Message-Id: <20260603035305.564823-1-qirui.001@bytedance.com>
Date: Wed,  3 Jun 2026 11:53:05 +0800
Mime-Version: 1.0
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a1fa52d+20f5c9+lists.infradead.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_205330_727840_631A6531 
X-CRM114-Status: GOOD (  10.31  )
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

The frame pointer (s0/fp) in call_on_irq_stack is set using
STACKFRAME_SIZE_ON_STACK, which equals ALIGN(sizeof(struct stackframe),
STACK_ALIGN). On RV64, sizeof(struct stackframe) is 16 and the aligned
size is also 16, so there is no difference. However, on RV32,
sizeof(struct stackframe) is 8 while STACKFRAME_SIZE_ON_STACK is 16 due
to 8 bytes of alignment padding.

The stack unwinder does 'frame = (struct stackframe *)fp - 1', which
reads from 'fp - sizeof(struct stackframe)'. On RV32, with fp set to
sp + STACKFRAME_SIZE_ON_STACK (sp + 16), the unwinder reads from
sp + 8, which falls in the alignment padding rather than where the
saved fp/ra are actually stored (sp + 0 and sp + 4).

Fix this by introducing STACKFRAME_SIZE (the unaligned sizeof) and using
it for frame pointer setup and restoration, while keeping
STACKFRAME_SIZE_ON_STACK for the stack pointer allocation/deallocation
which must remain 16-byte aligned.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/asm-offsets.c | 1 +
 arch/riscv/kernel/entry.S       | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index af827448a609..c1b5f7eb03fd 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -500,6 +500,7 @@ void asm_offsets(void)
 	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
 	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
 
+	DEFINE(STACKFRAME_SIZE, sizeof(struct stackframe));
 	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
 	OFFSET(STACKFRAME_FP, stackframe, fp);
 	OFFSET(STACKFRAME_RA, stackframe, ra);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d011fb51c59a..e8b654e2b7b5 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -383,7 +383,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
 	REG_S	ra, STACKFRAME_RA(sp)
 	REG_S	s0, STACKFRAME_FP(sp)
-	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
+	addi	s0, sp, STACKFRAME_SIZE
 
 	/* Switch to the per-CPU shadow call stack */
 	scs_save_current
@@ -399,7 +399,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	scs_load_current
 
 	/* Switch back to the thread stack and restore ra and s0 */
-	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
+	addi	sp, s0, -STACKFRAME_SIZE
 	REG_L	ra, STACKFRAME_RA(sp)
 	REG_L	s0, STACKFRAME_FP(sp)
 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
