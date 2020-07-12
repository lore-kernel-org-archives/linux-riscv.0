Return-Path: <SRS0=qDH1=AX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826BCC433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 13:42:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBF920702
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 13:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XPFsnqTT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPA3mDcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBF920702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V0DpA+JngRdZFF1udNs4s1KJGITzt0b28/3/z9oVBsM=; b=XPFsnqTT6pNew0NUWNIPPd7p8Y
	YSMh60bKM86WPdHnRFCAJPih0tDm4XJ3YQjACH+WEkI2d2nPMDRhQUeCSy9y9YlcboxPt6IPZKRE7
	So9wHnaFUtpyQ97ceOAHZaA1pK7jJk6dDNgel9ObCtqK8lzb0Tev/0YWwiDAznz0nW/SSK/sWkclN
	OWmoGeWxlCAJEVcFpZESJ5zw0AzKAJlOUHbl9DchGV1YtD4nIIMhoi8fHe3H/RquqJufkJ54kR3LB
	55TqHNPXHZmrAGueQtFUBvH4BZFKmYGYyg46KI5j32HGSVuWTrkQFpCJSovAngPxLjr3E2UVsWwM9
	JiIlEu3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jucFi-00040M-HS; Sun, 12 Jul 2020 13:42:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jucFf-0003zx-RN
 for linux-riscv@lists.infradead.org; Sun, 12 Jul 2020 13:42:44 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19863206D9;
 Sun, 12 Jul 2020 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594561362;
 bh=YyUE0OgeiZ7J5J4saaGtSuMP8qRods8NoQGoTEHtQLE=;
 h=From:To:Cc:Subject:Date:From;
 b=kPA3mDcvzWK5v+v/ghGmHhI0L8gAaoajPv/wGe+BISoCIra9xIyqHZkekkL+Ty2Zm
 1uzimxMYhsh0PrcIrJ2opbeNejrlKmQGLlzijCvelQ/2+2dd94EBUTAbRtXS00qxXp
 w8rX7wg1t7DHp43uicS+xMBAGvAnYcWADHQsMsb8=
From: guoren@kernel.org
To: palmerdabbelt@google.com
Subject: [PATCH] riscv: Cleanup unnecessary define in asm-offset.c
Date: Sun, 12 Jul 2020 13:41:49 +0000
Message-Id: <1594561309-65026-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_094243_961336_5B018239 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

 - TASK_THREAD_SP is duplicated define
 - TASK_STACK is no use at all
 - Don't worry about thread_info's offset in task_struct, have
   a look on comment in include/linux/sched.h:

struct task_struct {
	/*
	 * For reasons of header soup (see current_thread_info()), this
	 * must be the first element of task_struct.
	 */
	struct thread_info		thread_info;

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/asm-offsets.c | 3 ---
 arch/riscv/kernel/entry.S       | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 07cb9c1..db20344 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -27,9 +27,6 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
-	OFFSET(TASK_THREAD_SP, task_struct, thread.sp);
-	OFFSET(TASK_STACK, task_struct, stack);
-	OFFSET(TASK_TI, task_struct, thread_info);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index cae7e6d..3e8707e 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -389,12 +389,7 @@ ENTRY(__switch_to)
 	lw a4, TASK_TI_CPU(a1)
 	sw a3, TASK_TI_CPU(a1)
 	sw a4, TASK_TI_CPU(a0)
-#if TASK_TI != 0
-#error "TASK_TI != 0: tp will contain a 'struct thread_info', not a 'struct task_struct' so get_current() won't work."
-	addi tp, a1, TASK_TI
-#else
 	move tp, a1
-#endif
 	ret
 ENDPROC(__switch_to)
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
