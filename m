Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE582CCA47F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxndzJjS5eNmUMfe3i55hBMS9LZDrAP8FjRM1UXdV6E=; b=2isA9VQ3ra8VMq
	AP8VUr6jrso5RwLHmHAdMFx22DUsfQ2OBB5rsWd6jX8kp6yiHjDFjYMG8+sS3Ad+cMcxp50THWlEb
	u8TQBsQoEtCNwPUY5c/WgkYwbelz2bgMJ9iPVeUSqy3vZxmbex229MA/uw49gUTcBck9T29Smh4n0
	8jhN09yT+es03BsIt1Vp9bLfGL6gKg5i9lPBRC3aaNm1C+BuO1VSPW7oSfvmSgjYpVikhwgzhPawT
	CJchLJVMpSBP3GMbnV0OkfUvuBBkGPia5X/XICOprE/tHnx7KgbCWYUBPqW0ftlfiG8tykA5CUAAd
	jr7DrHd1sbSgjXvrEz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tO-00AF9m-6W; Tue, 14 Jun 2022 15:55:46 +0000
Received: from mail.efficios.com ([167.114.26.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tG-00AF4E-5I
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 15:55:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id CC4263C7CB1;
	Tue, 14 Jun 2022 11:55:29 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id itYXXXpvbikj; Tue, 14 Jun 2022 11:55:29 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 723133C7CA9;
	Tue, 14 Jun 2022 11:55:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 723133C7CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655222129;
	bh=t5335dZt0Ctnir3GGVeElwVHByKBAKwMNFazlIbWBVk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZZnmYUgrX8qQBwriee8Q3kK0XkccqDUizHR39SZd03oqQ7PZCIx6guG9kBAGQ106o
	 LUt32oJkl4gPIjMJslhzbrhP3Xql6pZxIv/2sxd8LB/tObMO/k+z2r6il54XToJw68
	 Tt7EwyCMiJGq21OhZ93ZNdAN/yPPhb0U93N2UsPwteOocsvoMJThS+ztWoCpcyw0KZ
	 ZAnEk4bl5c2MpBsA/Kj2FkC7iz9tHWPLRpS4kT3bSGCQE5o6OQycMCuri0oaELMRMh
	 +9wNieJxzVZC2eU5mW3eKzznT0aJnlK4MRExjBAnx04/B65ZNI0Uf+6xW7IL32aH+J
	 xIHp8XZwfTg+Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tSXQ_yREM2T4; Tue, 14 Jun 2022 11:55:29 -0400 (EDT)
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by mail.efficios.com (Postfix) with ESMTPSA id 473AF3C7BAF;
	Tue, 14 Jun 2022 11:55:29 -0400 (EDT)
From: Michael Jeanson <mjeanson@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [PATCH 1/3] selftests/rseq: riscv: use rseq_get_abi() helper
Date: Tue, 14 Jun 2022 11:48:28 -0400
Message-Id: <20220614154830.1367382-2-mjeanson@efficios.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614154830.1367382-1-mjeanson@efficios.com>
References: <20220614154830.1367382-1-mjeanson@efficios.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_085538_390872_D2777295 
X-CRM114-Status: UNSURE (   4.87  )
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

Make the RISC-V rseq selftests compatible with glibc-2.35 by using the
rseq_get_abi() helper.

Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
---
 tools/testing/selftests/rseq/rseq-riscv.h | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index b86642f90d7f..6f8a605b75c0 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -194,8 +194,8 @@ int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [v]			"m" (*v),
 				    [expect]		"r" (expect),
 				    [newv]		"r" (newv)
@@ -251,8 +251,8 @@ int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [v]			"m" (*v),
 				    [expectnot]		"r" (expectnot),
 				    [load]		"m" (*load),
@@ -301,8 +301,8 @@ int rseq_addv(intptr_t *v, intptr_t count, int cpu)
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [v]			"m" (*v),
 				    [count]		"r" (count)
 				    RSEQ_INJECT_INPUT
@@ -352,8 +352,8 @@ int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [expect]		"r" (expect),
 				    [v]			"m" (*v),
 				    [newv]		"r" (newv),
@@ -411,8 +411,8 @@ int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [expect]		"r" (expect),
 				    [v]			"m" (*v),
 				    [newv]		"r" (newv),
@@ -472,8 +472,8 @@ int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [v]			"m" (*v),
 				    [expect]		"r" (expect),
 				    [v2]			"m" (*v2),
@@ -532,8 +532,8 @@ int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [expect]		"r" (expect),
 				    [v]			"m" (*v),
 				    [newv]		"r" (newv),
@@ -593,8 +593,8 @@ int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]	"m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [expect]		"r" (expect),
 				    [v]			"m" (*v),
 				    [newv]		"r" (newv),
@@ -651,8 +651,8 @@ int rseq_offset_deref_addv(intptr_t *ptr, off_t off, intptr_t inc, int cpu)
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
 				  : [cpu_id]		"r" (cpu),
-				    [current_cpu_id]      "m" (__rseq_abi.cpu_id),
-				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [current_cpu_id]      "m" (rseq_get_abi()->cpu_id),
+				    [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [ptr]			"r" (ptr),
 				    [off]			"er" (off),
 				    [inc]			"er" (inc)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
