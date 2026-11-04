Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B2606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IIR4nDUY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qKnSeZVU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mksm00Opo6swc6P+o8ctEPUcdoZ3hFQOjspkZ5NkLu8=; b=IIR4nDUYpUvauWYMx1RqYk22pz
	Gy3JSYBI2+h6ZaoI6Bd+Su4ybKyrRavyG6UGp+1oLuvlNUjaM360MHsaHt6VC8wF1/GKyiPtswu66
	809wUczTx/4yyBaqUs9TmWFA5fknp2dNSwm9LeS3CW/5h9fwMLQNb5rC9E+Gr/ruhTOr1iQjmCccC
	5DO/QzVGVXTCXR1hosnvCa+y6R4SZN8jOGtAyUjACIIkeRGa5XkHTcP9br3uuxhGrQshlDTYueFUs
	x3RwWIAbt+M4xn1Ue6Rx0WlKyuRVgug1gcX54ykiDIxaH4Z43vIwbcMXnLDkSQcqmJ/P09nLOOLvy
	tS2Bnhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXr1-00000004x2t-1Sch;
	Wed, 04 Nov 2026 10:04:27 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXqy-00000004x1t-3vbI
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 10:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793786662; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jNWu/FMu/ZOeLzuawdzDc54EHAyrvHLDYv++bvN7s3Q=;
	b=qKnSeZVUMxO5Nki72D26Y2XO+TmiUlbyzY1t0r2msOOXrCzNNPWdcFPfFMHWA0kKxRO79eU8KHuFhEZda66k15c6wbSfCD4vdl1SWQhxzjv5+0+cOVe3xvo9Hi2VbS2+iMfDGmZUMAtIg4kz2SnLZuilHyyu3rHYpPuHiH0H9YA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XE5Saa._1793786659;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE5Saa._1793786659 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 18:04:20 +0800
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
Subject: [PATCH v2 bpf-next 2/3] selftests/bpf: Enable private stack tests for riscv64
Date: Wed,  4 Nov 2026 18:04:10 +0800
Message-ID: <20261104100411.997-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104100411.997-1-cp0613@linux.alibaba.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_020425_149952_CF493C7F 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index bbc09f516d92..4df06a82dd04 100644
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
@@ -412,6 +443,10 @@ __arch_arm64
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
@@ -441,6 +476,10 @@ __arch_x86_64
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
