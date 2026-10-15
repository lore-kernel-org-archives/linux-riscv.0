Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EDACC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w0wR4dIye85H48ermpYHwZ9GJxhFP6l52+YM/2CPpQ=; b=pbmgjuVKBvDf7L
	Iz4dxuiLLUBcna78odIV3fv8W2Dt0vtn7XVEh8f3dgQ1mlv8AIVS2jiQodjj6IZ1LeVq1bhqH+tkf
	IMRkjjna8oJK289iQ2Rv1eOoFIc0aW8NIN40vghebAmpXZw4+W4ub2o3DoD9nj2XAzeAjnzhR8Iz0
	u0FlCIB8u5RseSYxkGAbDOdouSemsf3BSh4ASGX9YjJ4b8U+Jkc9AgAGvhWfj4yHONUYI3rhOTBGn
	rZnoZabQ+bKJ5auER27LQYPmqBGmwZ7g4BWZIxoyDtTxXuE2JVZaxlKxswqszExN9iyHbZn9bw+l8
	f/a5Y7UQFbn8sn2k918A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAyA-0000000Ge9T-2G6w;
	Thu, 15 Oct 2026 02:13:23 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAy1-0000000Ge7I-1YSv
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 02:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792030388; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fmE+Ta62ZCw4xFw2n1IQJCmp7u5EmXNXXoXF3v2gT1Q=;
	b=vD0/0J66FDnfVABLLXRqe7I4corEEyoHcHMp60VVbyftKDSsJ3lzQs9UUjvh7WsV4J0f4XwaQlembW1HsISYQyHcnATO/ttWrNSfF/AzjpoNAOLl+TAhtClvLcWuy6v3+taJxtoJbeRd6PEclJY+n4dc9XFdhqzLjJ/ofYzS3Bg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XCqJ087_1792030385;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCqJ087_1792030385 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 10:13:06 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	shuah@kernel.org,
	rgbi3307@gmail.com,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/3] selftests/bpf: Enable private stack tests for riscv64
Date: Thu, 15 Oct 2026 10:12:37 +0800
Message-ID: <20261015021238.5657-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015021238.5657-1-cp0613@linux.alibaba.com>
References: <20261015021238.5657-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_191313_911609_BA07DAA0 
X-CRM114-Status: UNSURE (   7.67  )
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

The RV64 JIT now supports the private stack. Allow the existing
verifier and struct_ops private-stack tests to run on riscv64 and add
the expected RV64 JITed instruction patterns.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../bpf/prog_tests/struct_ops_private_stack.c |  3 +-
 .../bpf/progs/verifier_private_stack.c        | 41 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
index 2b3ec2b79091..103179ff8733 100644
--- a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
+++ b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
@@ -6,7 +6,8 @@
 #include "struct_ops_private_stack_recur.skel.h"
 #include "struct_ops_private_stack_large.skel.h"
 
-#if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__)
+#if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || \
+	(defined(__riscv) && __riscv_xlen == 64)
 static void test_private_stack(void)
 {
 	struct struct_ops_private_stack *skel;
diff --git a/tools/testing/selftests/bpf/progs/verifier_private_stack.c b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
index 3d9994a52464..d9cebbc7355d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_private_stack.c
+++ b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
@@ -8,7 +8,8 @@
 /* From include/linux/filter.h */
 #define MAX_BPF_STACK    512
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)
 
 struct elem {
 	struct bpf_timer t;
@@ -42,6 +43,14 @@ __jited("	mov	x0, #0x2a")
 __jited("	str	x0, [x27]")
 __jited("...")
 __jited("	ldp	x25, x27, [sp], {{.*}}")
+__arch_riscv64
+__jited("	addi	sp, sp, -0x20")
+__jited("...")
+__jited("	sd	s5, 0x10(sp)")
+__jited("...")
+__jited("	sd	a0, -0x100(s5)")
+__jited("...")
+__jited("	ld	s5, 0x10(sp)")
 __naked void private_stack_single_prog(void)
 {
 	asm volatile ("			\
@@ -60,6 +69,10 @@ __jited("	subq	$0x8, %rsp")
 __arch_arm64
 __jited("	mov	x25, sp")
 __jited("	sub	sp, sp, #0x10")
+__arch_riscv64
+__jited("	addi	sp, sp, -0x30")
+__jited("...")
+__jited("	addi	s5, sp, 0x10")
 __naked void no_private_stack_nested(void)
 {
 	asm volatile ("			\
@@ -113,6 +126,14 @@ __jited("	str	x0, [x27]")
 __jited("	bl	{{.*}}")
 __jited("...")
 __jited("	ldp	x25, x27, [sp], {{.*}}")
+__arch_riscv64
+__jited("	addi	sp, sp, -0x20")
+__jited("...")
+__jited("	sd	s5, 0x8(sp)")
+__jited("...")
+__jited("	sd	a0, -0x200(s5)")
+__jited("...")
+__jited("	ld	s5, 0x8(sp)")
 __naked void private_stack_nested_1(void)
 {
 	asm volatile ("				\
@@ -183,6 +204,16 @@ __jited("	bl	0x{{.*}}")
 __jited("	mov	x8, x0")
 __jited("	mov	x8, #0x0")
 __jited("	ldp	x25, x27, [sp], {{.*}}")
+__arch_riscv64
+__jited("func #1")
+__jited("...")
+__jited("	addi	sp, sp, -0x20")
+__jited("...")
+__jited("	sd	s5, 0x8(sp)")
+__jited("...")
+__jited("	sd	a0, -0x200(s5)")
+__jited("...")
+__jited("	ld	s5, 0x8(sp)")
 __naked void private_stack_callback(void)
 {
 	asm volatile ("			\
@@ -313,6 +344,10 @@ __arch_arm64
 __jited("	mrs	x10, TPIDR_EL{{[0-1]}}")
 __jited("	add	x27, x27, x10")
 __jited("	add	x25, x27, {{.*}}")
+__arch_riscv64
+__jited("	addi	sp, sp, -0x20")
+__jited("...")
+__jited("	sd	s5, 0x8(sp)")
 int private_stack_async_callback_1(void)
 {
 	struct bpf_timer *arr_timer;
@@ -342,6 +377,10 @@ __arch_x86_64
 __jited("	subq	$0x100, %rsp")
 __arch_arm64
 __jited("	sub	sp, sp, #0x100")
+__arch_riscv64
+__jited("	addi	sp, sp, -0x120")
+__jited("...")
+__jited("	addi	s5, sp, 0x100")
 int private_stack_async_callback_2(void)
 {
 	struct bpf_timer *arr_timer;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
