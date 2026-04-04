Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B075FE88D6E
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU2xis04oPOqgn4b4wKyaUDhkM2xakxO4Af5Edj948s=; b=PAwIjQJE93CGl2
	1FGPiKrLS0zU7wgeGIBxyrVXXT7uH0nEbhzZPLkewQTB0oTTeuXNBoNYIdJJlGzXCW8KmIxXyMYPx
	SywO35aORrIND9JLIAXL+vi7et3dnEmAjA7xxCMbPpRamqa7ACbslXTsUD/ofPMEGhjqPbwCCX2co
	qXSXZ9ivFZk/99lLdB7apBLyd4DsklU8aJUfw0yGQzBA+JkGvfvObzN25GyqORn0ysIY9g9wchAYv
	l0xzlLijBbk7eZkOGgjFthczQbqjeG+g3dDJliSqbNuEwmQX8WCY1idlF1l/epEtCogm9QLVaG3n0
	OxMbEE5rdeFcbgGWdIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0x-00000002ocg-2Y0i;
	Sat, 04 Apr 2026 01:41:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0v-00000002oZg-0lrF
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C0E4176A;
	Sat,  4 Apr 2026 01:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A1C2BCB2;
	Sat,  4 Apr 2026 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266887;
	bh=DMSrJshM0LEiNqrg1zKVU3zK+QScbFMR80Bf7UbRwxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q9yDEjSktFmLO+WVjdGWBMRJlyElKX+oKgnuHgkIWe2XwleOd+6pIaGPq5RUL40EH
	 XB0+x9LF+cG4i/rn2mbSC1sYVI0KKbsK5QG89B6411/07wbv3WP9MGOUhtQoIzeGgI
	 xDZsvyN82QvFv1Tgnvg5A4x1A6yeMFxJt+g1Q+teYb7OMyd/yh3/x51WV8MmJ/nA5+
	 6kHluN29YjDwGQkHzbsgOaUonJuzJhvsZnxxoQdFiT45prS3vKcTJ5ZjJBARAcS41r
	 W02Z4Jw0S1Dso1n/m12OxkqlwQOFi7aDBpJzsGxTKcGOov7UNoBDNz+agHpn1q5tpG
	 EPhE5Oj4V1ZBA==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 3/6] riscv: ptrace: expand "LP" references to "branch landing pads" in uapi headers
Date: Fri,  3 Apr 2026 19:41:26 -0600
Message-ID: <177526688403.878386.17724938405189602236.stgit@seppa>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
References: <177526680875.878386.16551569883089050686.stgit@seppa>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_184129_267095_F5CCB33E 
X-CRM114-Status: GOOD (  13.49  )
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

Per Linus' comments about the unreadability of abbreviations such as
"LP", rename the RISC-V ptrace landing pad CFI macro names to be more
explicit.  This primarily involves expanding "LP" in the names to some
variant of "branch landing pad."

Link: https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
Cc: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/uapi/asm/ptrace.h         |   20 +++++++++++---------
 arch/riscv/kernel/ptrace.c                   |   10 +++++-----
 tools/testing/selftests/riscv/cfi/cfitests.c |    5 +++--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 69d71443e111..9985bd58148e 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -132,23 +132,25 @@ struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;   /* shadow stack pointer */
 };
 
-#define PTRACE_CFI_LP_EN_BIT	0
-#define PTRACE_CFI_LP_LOCK_BIT	1
-#define PTRACE_CFI_ELP_BIT	2
+#define PTRACE_CFI_BRANCH_LANDING_PAD_EN_BIT		0
+#define PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_BIT		1
+#define PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_BIT	2
 #define PTRACE_CFI_SS_EN_BIT	3
 #define PTRACE_CFI_SS_LOCK_BIT	4
 #define PTRACE_CFI_SS_PTR_BIT	5
 
-#define PTRACE_CFI_LP_EN_STATE		_BITUL(PTRACE_CFI_LP_EN_BIT)
-#define PTRACE_CFI_LP_LOCK_STATE	_BITUL(PTRACE_CFI_LP_LOCK_BIT)
-#define PTRACE_CFI_ELP_STATE		_BITUL(PTRACE_CFI_ELP_BIT)
+#define PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE		_BITUL(PTRACE_CFI_BRANCH_LANDING_PAD_EN_BIT)
+#define PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE	\
+	_BITUL(PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_BIT)
+#define PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE	\
+	_BITUL(PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_BIT)
 #define PTRACE_CFI_SS_EN_STATE		_BITUL(PTRACE_CFI_SS_EN_BIT)
 #define PTRACE_CFI_SS_LOCK_STATE	_BITUL(PTRACE_CFI_SS_LOCK_BIT)
 #define PTRACE_CFI_SS_PTR_STATE		_BITUL(PTRACE_CFI_SS_PTR_BIT)
 
-#define PTRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_LP_EN_STATE | \
-					  PTRACE_CFI_LP_LOCK_STATE | \
-					  PTRACE_CFI_ELP_STATE | \
+#define PTRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE | \
+					  PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE | \
+					  PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE | \
 					  PTRACE_CFI_SS_EN_STATE | \
 					  PTRACE_CFI_SS_LOCK_STATE | \
 					  PTRACE_CFI_SS_PTR_STATE)
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2704a532e916..b6156625d6f8 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -303,11 +303,11 @@ static int riscv_cfi_get(struct task_struct *target,
 	regs = task_pt_regs(target);
 
 	if (is_indir_lp_enabled(target)) {
-		user_cfi.cfi_status.cfi_state |= PTRACE_CFI_LP_EN_STATE;
+		user_cfi.cfi_status.cfi_state |= PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE;
 		user_cfi.cfi_status.cfi_state |= is_indir_lp_locked(target) ?
-						 PTRACE_CFI_LP_LOCK_STATE : 0;
+						 PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE : 0;
 		user_cfi.cfi_status.cfi_state |= (regs->status & SR_ELP) ?
-						PTRACE_CFI_ELP_STATE : 0;
+						PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE : 0;
 	}
 
 	if (is_shstk_enabled(target)) {
@@ -349,7 +349,7 @@ static int riscv_cfi_set(struct task_struct *target,
 	 * rsvd field should be set to zero so that if those fields are needed in future
 	 */
 	if ((user_cfi.cfi_status.cfi_state &
-	     (PTRACE_CFI_LP_EN_STATE | PTRACE_CFI_LP_LOCK_STATE |
+	     (PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE | PTRACE_CFI_BRANCH_LANDING_PAD_LOCK_STATE |
 	      PTRACE_CFI_SS_EN_STATE | PTRACE_CFI_SS_LOCK_STATE)) ||
 	     (user_cfi.cfi_status.cfi_state & PTRACE_CFI_STATE_INVALID_MASK))
 		return -EINVAL;
@@ -357,7 +357,7 @@ static int riscv_cfi_set(struct task_struct *target,
 	/* If lpad is enabled on target and ptrace requests to set / clear elp, do that */
 	if (is_indir_lp_enabled(target)) {
 		if (user_cfi.cfi_status.cfi_state &
-		    PTRACE_CFI_ELP_STATE) /* set elp state */
+		    PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE) /* set elp state */
 			regs->status |= SR_ELP;
 		else
 			regs->status &= ~SR_ELP; /* clear elp state */
diff --git a/tools/testing/selftests/riscv/cfi/cfitests.c b/tools/testing/selftests/riscv/cfi/cfitests.c
index 298544854415..68374a27ec81 100644
--- a/tools/testing/selftests/riscv/cfi/cfitests.c
+++ b/tools/testing/selftests/riscv/cfi/cfitests.c
@@ -94,7 +94,7 @@ bool cfi_ptrace_test(void)
 		}
 
 		switch (ptrace_test_num) {
-#define CFI_ENABLE_MASK (PTRACE_CFI_LP_EN_STATE |	\
+#define CFI_ENABLE_MASK (PTRACE_CFI_BRANCH_LANDING_PAD_EN_STATE |	\
 			 PTRACE_CFI_SS_EN_STATE |	\
 			 PTRACE_CFI_SS_PTR_STATE)
 		case 0:
@@ -106,7 +106,8 @@ bool cfi_ptrace_test(void)
 						   __func__);
 			break;
 		case 1:
-			if (!(cfi_reg.cfi_status.cfi_state & PTRACE_CFI_ELP_STATE))
+			if (!(cfi_reg.cfi_status.cfi_state &
+			      PTRACE_CFI_BRANCH_EXPECTED_LANDING_PAD_STATE))
 				ksft_exit_fail_msg("%s: elp must have been set\n", __func__);
 			/* clear elp state. not interested in anything else */
 			cfi_reg.cfi_status.cfi_state = 0;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
