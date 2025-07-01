Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE96C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLak27VACL2LzEi0Ql3c1N0N0uy39sbLpdxmcqAF9QQ=; b=Yn1NXfdwb94gs6
	0yugbvGb5czdbY9Xz/rRAKZT8JTLPCMJJgxSdAhSwPaKrmNcvhS9HKPdvlNCbjOf9X63sxsuOSJ69
	liNSkFOFvK5/mSbIZkK+UcJ+eyD8JS2x5xEEU+ZdGGkvh3ceiuGcnXQCFOlAQ+wCx2sFHlc/gKEXm
	/rLx4Ye5D0pmPvzZy2e9S0Dk/nWXGenWZK4JzA8V+H4cvSa+ZP1RYMdJDJZ+wgfEtSsaA8DU7YenQ
	ix7vPt2C1tMIRLgx5xnA8ZjldcZ4gZEhAqJQzFCvbxgstAjHFAGCVJHk1VNGdiq04wPOGvYG3tUda
	vwB2jtXdTurFuy4fv8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd4h-00000005upL-3jqX;
	Tue, 01 Jul 2025 15:39:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbTm-00000005bjw-1gN4
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 13:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9573A2ED2;
	Tue,  1 Jul 2025 06:56:42 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E923F58B;
	Tue,  1 Jul 2025 06:56:56 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 16/23] riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:09 +0100
Message-Id: <20250701135616.29630-17-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065658_477197_9BD89311 
X-CRM114-Status: GOOD (  10.35  )
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

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/ptrace.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..8e86305831ea 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -186,7 +186,7 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(elf_greg_t),
 		.align = sizeof(elf_greg_t),
@@ -195,7 +195,7 @@ static const struct user_regset riscv_user_regset[] = {
 	},
 #ifdef CONFIG_FPU
 	[REGSET_F] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = ELF_NFPREG,
 		.size = sizeof(elf_fpreg_t),
 		.align = sizeof(elf_fpreg_t),
@@ -205,7 +205,7 @@ static const struct user_regset riscv_user_regset[] = {
 #endif
 #ifdef CONFIG_RISCV_ISA_V
 	[REGSET_V] = {
-		.core_note_type = NT_RISCV_VECTOR,
+		USER_REGSET_NOTE_TYPE(RISCV_VECTOR),
 		.align = 16,
 		.n = ((32 * RISCV_MAX_VLENB) +
 		      sizeof(struct __riscv_v_regset_state)) / sizeof(__u32),
@@ -216,7 +216,7 @@ static const struct user_regset riscv_user_regset[] = {
 #endif
 #ifdef CONFIG_RISCV_ISA_SUPM
 	[REGSET_TAGGED_ADDR_CTRL] = {
-		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
+		USER_REGSET_NOTE_TYPE(RISCV_TAGGED_ADDR_CTRL),
 		.n = 1,
 		.size = sizeof(long),
 		.align = sizeof(long),
@@ -380,7 +380,7 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 
 static const struct user_regset compat_riscv_user_regset[] = {
 	[REGSET_X] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(compat_elf_greg_t),
 		.align = sizeof(compat_elf_greg_t),
@@ -389,7 +389,7 @@ static const struct user_regset compat_riscv_user_regset[] = {
 	},
 #ifdef CONFIG_FPU
 	[REGSET_F] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = ELF_NFPREG,
 		.size = sizeof(elf_fpreg_t),
 		.align = sizeof(elf_fpreg_t),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
