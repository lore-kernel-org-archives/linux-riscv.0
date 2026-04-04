Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D5AE88D73
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPi/qrcsopu2tMBfY/q/MI4SNSAVdSTkemp4+tI8/Sk=; b=j+EcKff8F7/Sct
	sO0v1xjZtMVGq1ieEZHKN9HtboERl2JQPOBnMHsdHR9hHpjfQ5KJjNfgUCeP1IFGav8z8M5/PWzU5
	WGfpRnj2Tqajqfhta2kLbEdQ69mC4WJO4pxpw3yZ7qUBUJh1GI7pPIfjtNLa4DIiKFHcnfGd7/KRQ
	6dMqjH5uTbwnxUN6c5yuQoe2Ym3pLk48bbuyST5wMASFIMzoszgYGflKHC2PhiIWSYfbg83HBRMqV
	NujMwUsFNQbCWk2D3L2s7ywiXmaUoDMPAU9UZdb8PIW+NvcN/T9ZODBKR4BuWmaTu8Pf15iaAns3U
	qh7rO2rj8f862hNO0eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q1K-00000002ov4-0u8Z;
	Sat, 04 Apr 2026 01:41:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q1I-00000002ot1-0y7x
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93AAC600CB;
	Sat,  4 Apr 2026 01:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920CCC4CEF7;
	Sat,  4 Apr 2026 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266911;
	bh=jYQxqVBYz/i6zRMfCPSZBd+BivxQ7PglkjcCF7LYl9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmWltwKzY9FoyjPD1ph9DhsN/O7qNGIUw6orQOaWkRk/7/5waSJuJX0UpOkM6ErlH
	 IvKpgev8zU0KJMu8Ode0pXjjv1clug4sywYHP7a1lVyCyL0y46NMgzAmUcw2x8JHFf
	 XUu9Q3UvSX+GxLTjRPru3BrlFt4hyPqOA3wp967ePS+3ppRza/cM8/GtUi+jrjh5IQ
	 oG1Zh9TmWiUb5R/doL3/1L8YFGXmd8lWqF5jF6HFpnx1tOogCcOjjmq98numFclGpF
	 nieRCJmRmFJqA4ldhM0DCHqVK3GfRb8Hl2Lg6fXcOBYc4aT9UUa0ynzZtl1F3ILsJM
	 2c2GVPjMez/jw==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 5/6] riscv: ptrace: cfi: expand "SS" references to "shadow stack" in uapi headers
Date: Fri,  3 Apr 2026 19:41:49 -0600
Message-ID: <177526690559.878386.3568474283537905257.stgit@seppa>
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

Similar to the recent change to expand "LP" to "branch landing pad",
let's expand "SS" in the ptrace uapi macros to "shadow stack" as well.
This aligns with the existing prctl() arguments, which use the
expanded "shadow stack" names, rather than just the abbreviation.

Link: https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
Cc: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/uapi/asm/ptrace.h         |   18 +++++++++---------
 arch/riscv/kernel/ptrace.c                   |   10 +++++-----
 tools/testing/selftests/riscv/cfi/cfitests.c |    4 ++--
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 9985bd58148e..3de2b7124aff 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -135,25 +135,25 @@ struct __sc_riscv_cfi_state {
 #define PTRACE_CFI_BRANCH_LANDING_PAD_EN_BIT		0
 #define PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_BIT		1
 #define PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_BIT	2
-#define PTRACE_CFI_SS_EN_BIT	3
-#define PTRACE_CFI_SS_LOCK_BIT	4
-#define PTRACE_CFI_SS_PTR_BIT	5
+#define PTRACE_CFI_SHADOW_STACK_EN_BIT			3
+#define PTRACE_CFI_SHADOW_STACK_LOCK_BIT		4
+#define PTRACE_CFI_SHADOW_STACK_PTR_BIT			5
 
 #define PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE		_BITUL(PTRACE_CFI_BRANCH_LANDING_PAD_EN_BIT)
 #define PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE	\
 	_BITUL(PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_BIT)
 #define PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE	\
 	_BITUL(PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_BIT)
-#define PTRACE_CFI_SS_EN_STATE		_BITUL(PTRACE_CFI_SS_EN_BIT)
-#define PTRACE_CFI_SS_LOCK_STATE	_BITUL(PTRACE_CFI_SS_LOCK_BIT)
-#define PTRACE_CFI_SS_PTR_STATE		_BITUL(PTRACE_CFI_SS_PTR_BIT)
+#define PTRACE_CFI_SHADOW_STACK_EN_STATE		_BITUL(PTRACE_CFI_SHADOW_STACK_EN_BIT)
+#define PTRACE_CFI_SHADOW_STACK_LOCK_STATE		_BITUL(PTRACE_CFI_SHADOW_STACK_LOCK_BIT)
+#define PTRACE_CFI_SHADOW_STACK_PTR_STATE		_BITUL(PTRACE_CFI_SHADOW_STACK_PTR_BIT)
 
 #define PTRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE | \
 					  PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE | \
 					  PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE | \
-					  PTRACE_CFI_SS_EN_STATE | \
-					  PTRACE_CFI_SS_LOCK_STATE | \
-					  PTRACE_CFI_SS_PTR_STATE)
+					  PTRACE_CFI_SHADOW_STACK_EN_STATE | \
+					  PTRACE_CFI_SHADOW_STACK_LOCK_STATE | \
+					  PTRACE_CFI_SHADOW_STACK_PTR_STATE)
 
 struct __cfi_status {
 	__u64 cfi_state;
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index b6156625d6f8..93de2e7a3074 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -311,10 +311,10 @@ static int riscv_cfi_get(struct task_struct *target,
 	}
 
 	if (is_shstk_enabled(target)) {
-		user_cfi.cfi_status.cfi_state |= (PTRACE_CFI_SS_EN_STATE |
-						  PTRACE_CFI_SS_PTR_STATE);
+		user_cfi.cfi_status.cfi_state |= (PTRACE_CFI_SHADOW_STACK_EN_STATE |
+						  PTRACE_CFI_SHADOW_STACK_PTR_STATE);
 		user_cfi.cfi_status.cfi_state |= is_shstk_locked(target) ?
-						 PTRACE_CFI_SS_LOCK_STATE : 0;
+						 PTRACE_CFI_SHADOW_STACK_LOCK_STATE : 0;
 		user_cfi.shstk_ptr = get_active_shstk(target);
 	}
 
@@ -350,7 +350,7 @@ static int riscv_cfi_set(struct task_struct *target,
 	 */
 	if ((user_cfi.cfi_status.cfi_state &
 	     (PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE | PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE |
-	      PTRACE_CFI_SS_EN_STATE | PTRACE_CFI_SS_LOCK_STATE)) ||
+	      PTRACE_CFI_SHADOW_STACK_EN_STATE | PTRACE_CFI_SHADOW_STACK_LOCK_STATE)) ||
 	     (user_cfi.cfi_status.cfi_state & PTRACE_CFI_STATE_INVALID_MASK))
 		return -EINVAL;
 
@@ -365,7 +365,7 @@ static int riscv_cfi_set(struct task_struct *target,
 
 	/* If shadow stack enabled on target, set new shadow stack pointer */
 	if (is_shstk_enabled(target) &&
-	    (user_cfi.cfi_status.cfi_state & PTRACE_CFI_SS_PTR_STATE))
+	    (user_cfi.cfi_status.cfi_state & PTRACE_CFI_SHADOW_STACK_PTR_STATE))
 		set_active_shstk(target, user_cfi.shstk_ptr);
 
 	return 0;
diff --git a/tools/testing/selftests/riscv/cfi/cfitests.c b/tools/testing/selftests/riscv/cfi/cfitests.c
index 68374a27ec81..0dac74b8553c 100644
--- a/tools/testing/selftests/riscv/cfi/cfitests.c
+++ b/tools/testing/selftests/riscv/cfi/cfitests.c
@@ -95,8 +95,8 @@ bool cfi_ptrace_test(void)
 
 		switch (ptrace_test_num) {
 #define CFI_ENABLE_MASK (PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE |	\
-			 PTRACE_CFI_SS_EN_STATE |	\
-			 PTRACE_CFI_SS_PTR_STATE)
+			 PTRACE_CFI_SHADOW_STACK_EN_STATE |		\
+			 PTRACE_CFI_SHADOW_STACK_PTR_STATE)
 		case 0:
 			if ((cfi_reg.cfi_status.cfi_state & CFI_ENABLE_MASK) != CFI_ENABLE_MASK)
 				ksft_exit_fail_msg("%s: ptrace_getregset failed, %llu\n", __func__,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
