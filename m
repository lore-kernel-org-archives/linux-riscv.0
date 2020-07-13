Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3596AC433F1
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 23:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0381321473
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 23:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHmrtM92";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf6HTW4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0381321473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRnjryRg2Bg1T5kZ8QC/c8IZm2f9Orq+VL4vUbqmHVc=; b=bHmrtM92mzPfnWWmAyVzxHynkU
	ha6rAsjoKx1KZZNZEzOPdneEfHGKo8iBj4TJOEOrX6AP/74GD1KCstp7e2iac+AP+DBMlWtrhCiSv
	H+rVGFlADomxjJTGT3VJyDhpO3vhdAETVK8aLW1nbUEZkE3z7fg/q2QeU4gCLXa64OU3yAdZBFHLq
	o2ymvXhRyQ6MQBQdP9nLqrwOvH/Xmtt20dPJeoYxVErPhps+hdDo6DFntbj6PB7ABQXf8Eq5pd7He
	Vmwb/kzWgC/2oMNn/DnRN9/j0PHN195k95JUsHa8hovn3WKEAVzFBmbBPdO2DPPctNdMO/watFmLk
	/565hfsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv83E-00081n-W6; Mon, 13 Jul 2020 23:40:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv83D-00081F-Lx
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 23:40:00 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62D63214DB;
 Mon, 13 Jul 2020 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594683599;
 bh=6rrEJJgvghk15CsdApGD/JSMn7IJrqCOSnvwvAKk4cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qf6HTW4K7qcujZ2v6bi3oLAkoq0TxMt1FVb3f7mG9FioTvcQ6X8XkEjXz7Ls9xdK/
 L5Pa1tLfB8JBCCaNgCR+PeJ1VZApS3oltMlVyX9wGKAVM/GJfstzNNtpbuTGoq0wLJ
 Klv+GnAZ1wh6fyoHrDl0oAzJn8y4EvP1MwSDFVMw=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 oleg@redhat.com
Subject: [PATCH v3 3/7] riscv: Fixup kprobes handler couldn't change pc
Date: Mon, 13 Jul 2020 23:39:18 +0000
Message-Id: <1594683562-68149-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594683562-68149-1-git-send-email-guoren@kernel.org>
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_193959_782029_C5BEBBC5 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, guoren@kernel.org,
 zong.li@sifive.com, bjorn.topel@gmail.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The "Changing Execution Path" section in the Documentation/kprobes.txt
said:

Since kprobes can probe into a running kernel code, it can change the
register set, including instruction pointer.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/mcount-dyn.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 35a6ed7..4b58b54 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -123,6 +123,7 @@ ENDPROC(ftrace_caller)
 	sd	ra, (PT_SIZE_ON_STACK+8)(sp)
 	addi	s0, sp, (PT_SIZE_ON_STACK+16)
 
+	sd ra,  PT_EPC(sp)
 	sd x1,  PT_RA(sp)
 	sd x2,  PT_SP(sp)
 	sd x3,  PT_GP(sp)
@@ -157,6 +158,7 @@ ENDPROC(ftrace_caller)
 	.endm
 
 	.macro RESTORE_ALL
+	ld ra,  PT_EPC(sp)
 	ld x1,  PT_RA(sp)
 	ld x2,  PT_SP(sp)
 	ld x3,  PT_GP(sp)
@@ -190,7 +192,6 @@ ENDPROC(ftrace_caller)
 	ld x31, PT_T6(sp)
 
 	ld	s0, (PT_SIZE_ON_STACK)(sp)
-	ld	ra, (PT_SIZE_ON_STACK+8)(sp)
 	addi	sp, sp, (PT_SIZE_ON_STACK+16)
 	.endm
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
