Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00166C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bREf81JUyKATI9M0BCCrcWUZ6Qdclv6a6mGeL9Y9qqI=; b=fCTxxTk3rLcyg8
	z6V4M0mc3dcUejPb8+VJ+KxL7wWNyc6i6dGrzM4YKZfO0E9JWyenrK/0vlD4lqKTg+0zn/t7w+GfZ
	cqd5uZ0M4IOYh2eRr1uaSy4/tAw6jn27CHQM1dVz17Wt867HGTrTIMIMOGhI6PdNapt7nyIb3XnhS
	etfN4CLc2KprEfGLN4g4DczUm21CoNosw2iOHAPh3MtbC48M4+e446y0goU0hAUA3wzIaL2Peo2lk
	uH+siLcw0ah1x1sQNczKZFTEUln89PoYNudXlwSedrWNPWTtxEpDYq5U0cL6+vfyE29uJNBv06glR
	3swmQgSS+uze+FK9Chbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tJ-00AF7w-Ij; Tue, 14 Jun 2022 15:55:41 +0000
Received: from mail.efficios.com ([167.114.26.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tG-00AF4K-2Q
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 15:55:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id EF5283C7953;
	Tue, 14 Jun 2022 11:55:30 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fkm3KVBSAbbc; Tue, 14 Jun 2022 11:55:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id AB8603C7951;
	Tue, 14 Jun 2022 11:55:30 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com AB8603C7951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655222130;
	bh=BI6uR+MrhnoRZ8ZYS3QE+wHIMBYha/H2WzTYFRyoAU8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EwUPPfYX/MXDdf9Gg5H6PFjc4JG4cTv42LqVXL/P5MB1ySIgwWbqn2J2KncBGEdGw
	 vm0VQF0gSnGor1V6OC7xmFmPtFiN2nDk04fII00aCdvlizumFHEQAtJbEOiMfp7y7E
	 FZCUWPCgG4oVgcGQU38paRH7bDO1LHIyS68AVfNtmfnfwdvuLor0RE1LjA2swxEHBn
	 old4/hJsZs30/1K522XGABJZ7bM0t4JGwfS6ncaVwAim4M18U93ramWMaKsjQZHp1a
	 rtai5O4aOiyJO3L+kt8ELJhnQZ3pvALFHsR6Wm6W4ACGpEoMXb3KL3x7AK3ZzhCKTo
	 YAULGNxAbDBeg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id B_Y5V8vMHad0; Tue, 14 Jun 2022 11:55:30 -0400 (EDT)
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by mail.efficios.com (Postfix) with ESMTPSA id 6DE463C7AB8;
	Tue, 14 Jun 2022 11:55:30 -0400 (EDT)
From: Michael Jeanson <mjeanson@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [PATCH 2/3] selftests/rseq: riscv: fix 'literal-suffix' warning
Date: Tue, 14 Jun 2022 11:48:29 -0400
Message-Id: <20220614154830.1367382-3-mjeanson@efficios.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614154830.1367382-1-mjeanson@efficios.com>
References: <20220614154830.1367382-1-mjeanson@efficios.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_085538_222899_912AC9A8 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
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

This header is also used in librseq where it can be included in C++
code, add a space between literals and string macros.

Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
---
 tools/testing/selftests/rseq/rseq-riscv.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 6f8a605b75c0..3a391c9bf468 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -86,7 +86,7 @@ do {									\
 
 #define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs)		\
 	RSEQ_INJECT_ASM(1)						\
-	"la	"RSEQ_ASM_TMP_REG_1 ", " __rseq_str(cs_label) "\n"	\
+	"la	" RSEQ_ASM_TMP_REG_1 ", " __rseq_str(cs_label) "\n"	\
 	REG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]\n"	\
 	__rseq_str(label) ":\n"
 
@@ -103,17 +103,17 @@ do {									\
 
 #define RSEQ_ASM_OP_CMPEQ(var, expect, label)				\
 	REG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
-	"bne	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+	"bne	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
 		  __rseq_str(label) "\n"
 
 #define RSEQ_ASM_OP_CMPEQ32(var, expect, label)				\
-	"lw	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"	\
-	"bne	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+	"lw	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"	\
+	"bne	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
 		  __rseq_str(label) "\n"
 
 #define RSEQ_ASM_OP_CMPNE(var, expect, label)				\
 	REG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
-	"beq	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+	"beq	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
 		  __rseq_str(label) "\n"
 
 #define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label)		\
@@ -127,12 +127,12 @@ do {									\
 	REG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
 
 #define RSEQ_ASM_OP_R_LOAD_OFF(offset)					\
-	"add	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "	\
+	"add	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "	\
 		 RSEQ_ASM_TMP_REG_1 "\n"				\
 	REG_L	RSEQ_ASM_TMP_REG_1 ", (" RSEQ_ASM_TMP_REG_1 ")\n"
 
 #define RSEQ_ASM_OP_R_ADD(count)					\
-	"add	"RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1		\
+	"add	" RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1		\
 		", %[" __rseq_str(count) "]\n"
 
 #define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
