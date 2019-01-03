Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6212CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 03:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114EA20883
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 03:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JFyFZmEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 114EA20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ECvEb1fnD9IRZV3amk0nv6aNqDPIGia3n5T89tEWeQ=; b=JFyFZmEZVEoAf2
	/4Wrzj0+mlXJ29B1JtRUcNnTkQLNjyHBfP1Ef9XTwMEfNu5jhGBgVwFhu1xPz4ifMW7/vcWrv91L8
	GnOOwJMoeGJB5O8PR1V9glXwonLuKL6u6YKLbaC0NuIjkdry3QY4snSTlEgpspPIPR/wpluGHMwTZ
	28fqeQB049z6qZZRNpMf8yQc6KqGrYyWe2rTHc49zptoaMuBS6qMfOJaYnHozEF2/iWjoGTSeuq+j
	Eqqf1gpBYJHDrqG8UZ5+AVLNEgTsVfunRSu7Nh28bHGxVk7lj09eAsPZxKKLxhLLxErGfKHXftznz
	5+MFOzGO8hPZWv/k30dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1getkj-0007uB-H8; Thu, 03 Jan 2019 03:33:01 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1getkf-0007tc-MV
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 03:32:59 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x033aQWw020403;
 Thu, 3 Jan 2019 11:36:26 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 3 Jan 2019
 11:32:40 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <arnd@arndb.de>, <linux-arch@vger.kernel.org>
Subject: [PATCH] RISC-V: Add _TIF_NEED_RESCHED check for kernel thread when
 CONFIG_PREEMPT=y
Date: Thu, 3 Jan 2019 11:32:33 +0800
Message-ID: <1546486353-23115-1-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x033aQWw020403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_193257_994301_A032F365 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincentc@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The cond_resched() can be used to yield the CPU resource if
CONFIG_PREEMPT is not defined. Otherwise, cond_resched() is a dummy
function. In order to avoid kernel thread occupying entire CPU,
when CONFIG_PREEMPT=y, the kernel thread needs to follow the
rescheduling mechanism like a user thread.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/kernel/asm-offsets.c |    1 +
 arch/riscv/kernel/entry.S       |   18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 6a92a2f..dac9834 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,7 @@ void asm_offsets(void)
 	OFFSET(TASK_STACK, task_struct, stack);
 	OFFSET(TASK_TI, task_struct, thread_info);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
+	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 13d4826..728b72d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -144,6 +144,10 @@ _save_context:
 	REG_L x2,  PT_SP(sp)
 	.endm
 
+#if !IS_ENABLED(CONFIG_PREEMPT)
+#define resume_kernel restore_all
+#endif
+
 ENTRY(handle_exception)
 	SAVE_ALL
 
@@ -228,7 +232,7 @@ ret_from_exception:
 	REG_L s0, PT_SSTATUS(sp)
 	csrc sstatus, SR_SIE
 	andi s0, s0, SR_SPP
-	bnez s0, restore_all
+	bnez s0, resume_kernel
 
 resume_userspace:
 	/* Interrupts must be disabled here so flags are checked atomically */
@@ -250,6 +254,18 @@ restore_all:
 	RESTORE_ALL
 	sret
 
+#if IS_ENABLED(CONFIG_PREEMPT)
+resume_kernel:
+	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
+	bnez s0, restore_all
+need_resched:
+	REG_L s0, TASK_TI_FLAGS(tp)
+	andi s0, s0, _TIF_NEED_RESCHED
+	beqz s0, restore_all
+	call preempt_schedule_irq
+	j need_resched
+#endif
+
 work_pending:
 	/* Enter slow path for supplementary processing */
 	la ra, ret_from_exception
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
