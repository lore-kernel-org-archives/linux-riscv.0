Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673CAE88D6E
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPoELLHvVJC277ccMDpGtn8182gEwd9uQiBRdmNG75Q=; b=wd3gONlf7jDXeN
	eIqpyJumW779iPb2/wyKRmJjKqLCoNJ8JEegRmdFNz+XpCMH3UGSx9hEFcNRLbKQkdSudJ6N/wiTF
	QhEFPo0u9NlLoK9khvFFtrg76MnHwKsgXlBa8C/ysnodpxI/V+dbp0+3bI6FTkQej32D3bAzMnDam
	foj4msKExWWZH1ZZT3AlgLSYj0NKOIJw3NYktORcZ4+vDmCQSd/YJESVUFjzQjh2y6XNcp1wgP0Il
	WXwVyVCA/BxlqmUoDXeT4FUsQtP//9q+fqPN2hvsuAW5nnIAuhIsUKYXK2nbrPLdT6K6bYd+MyzYQ
	TKQpyMgkVsTm+PX+ptWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0c-00000002oO0-45Y3;
	Sat, 04 Apr 2026 01:41:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0b-00000002oMp-0Rw7
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A57760008;
	Sat,  4 Apr 2026 01:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4BAC4CEF7;
	Sat,  4 Apr 2026 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266868;
	bh=EFgKddfp+ncgtImUksWpwtH8lRPIsJQM6H0q+JMNOVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXD4VVD+m8mwQGIzOlQUv3Fl9EZKiPsVxpWfmBsyHTQOdCpsll2u/6HLBUU2IDawN
	 ClSYS1Ngm78GYwmgVVQ5/jIZIl8884X7QJNWY7EHCYlsMxjSUOojmZusqkntQmrV/3
	 HLxeqfG7V1xwQrrnpm7V7QFvl70aMvDivLNWSOoaOTCBKf7RliQP9/6qJO9nf8kDEf
	 nzmHevvBVHsYCWMo1BZli8eomIVJCBdtoVJL10jouv/wfKsWd9ZhAVcfryhOgJVtgh
	 a4JDnXUkiDvK/6w5aHXuUbMtOGk1Gitd6zr/5LHttYtnhrsoLdlSec3P5VGn0faNIR
	 fxE+HJK9Ik68A==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 1/6] riscv: ptrace: cfi: fix "PRACE" typo in uapi header
Date: Fri,  3 Apr 2026 19:41:06 -0600
Message-ID: <177526686350.878386.7631240697695749981.stgit@seppa>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
References: <177526680875.878386.16551569883089050686.stgit@seppa>
User-Agent: StGit/0.19
MIME-Version: 1.0
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

A CFI-related macro defined in arch/riscv/uapi/asm/ptrace.h misspells
"PTRACE" as "PRACE"; fix this.

Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Cc: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/uapi/asm/ptrace.h |    2 +-
 arch/riscv/kernel/ptrace.c           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 70a74adad914..69d71443e111 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -146,7 +146,7 @@ struct __sc_riscv_cfi_state {
 #define PTRACE_CFI_SS_LOCK_STATE	_BITUL(PTRACE_CFI_SS_LOCK_BIT)
 #define PTRACE_CFI_SS_PTR_STATE		_BITUL(PTRACE_CFI_SS_PTR_BIT)
 
-#define PRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_LP_EN_STATE | \
+#define PTRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_LP_EN_STATE | \
 					  PTRACE_CFI_LP_LOCK_STATE | \
 					  PTRACE_CFI_ELP_STATE | \
 					  PTRACE_CFI_SS_EN_STATE | \
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index e592bd6b7665..2704a532e916 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -351,7 +351,7 @@ static int riscv_cfi_set(struct task_struct *target,
 	if ((user_cfi.cfi_status.cfi_state &
 	     (PTRACE_CFI_LP_EN_STATE | PTRACE_CFI_LP_LOCK_STATE |
 	      PTRACE_CFI_SS_EN_STATE | PTRACE_CFI_SS_LOCK_STATE)) ||
-	     (user_cfi.cfi_status.cfi_state & PRACE_CFI_STATE_INVALID_MASK))
+	     (user_cfi.cfi_status.cfi_state & PTRACE_CFI_STATE_INVALID_MASK))
 		return -EINVAL;
 
 	/* If lpad is enabled on target and ptrace requests to set / clear elp, do that */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
