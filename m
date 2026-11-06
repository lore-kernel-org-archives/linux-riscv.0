Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B95606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KpMtrbP9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PQme+YYh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=T8bVa0HA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4SPb8o5orTPBMI9Sp4deb0KkLRupXoDEZ2fd/hY1Wr8=; b=KpMtrbP9wq+AtuDmUfUkdQtXl+
	RXKdUdGv57oLFF+Hy9YuKlgGDd4dRMsCMC7fPB41iXj+VkmUBQbHUQSwtCvC3ny3pLBOxWjiMSuL6
	DQJXq0HcvXMJkVO7Li2ECxOCvEk+91XyJaobZb+/Cw7cYWs/w+F4+dBFEaUGU0fr8RLphQse70o55
	ZdaoGIQ1QsDQ9r0t4Zz8ecvNn2dUtgXVd9li75bQzzDQafTFdsmqUkLT8ItOwYi1ysku2B1SFrLKC
	EBRLLSND4eJefgDCEuJnJu1jEmA/FpOvWk9AtPKelFzJNizdKCpBXfcN0I2F9qDEqZ5c7jWVlQXPU
	mj2xiyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUH-0000000DMzz-3wq2;
	Fri, 06 Nov 2026 18:16:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUH-0000000DMz6-04zR
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Nov 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oj7yyLGXka6snyLwwPDV89YPr2tF7hbTbrbYfPXXDNc=; b=PQme+YYhaJ/oE+HkphJimeXPx3
	ylsaSjnI/kW9ziOQ6Ai6gQ9WAp4/LJ2QFUJils6S0sl55YQHCF/IWM67ahMoeZO1QI+UMnZtBfyDD
	2sKY7PJSPUIxbiTRs+OHXYmmz86SjWW+t+ZNrAPwYUB45BKT1MLCnBvCtkaxUP1OFZyv7QreizIQn
	cY2P2XyW1a0fM+H2u7FBxkMjQ+dza0oR4Z8wttB0tNCPpwj3AVv6DOb3gOIUQee695zIQF0mT7vvo
	L1ZrN51TIA1kZDhzBMeMjml6LCV2u9w7o24ZSgN50l3uPEJHJUzCumKT57uFaglN/bp9WRsLhzeYF
	Gc3f0/ew==;
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUD-00000004ZAz-0uU8
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793988972; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oj7yyLGXka6snyLwwPDV89YPr2tF7hbTbrbYfPXXDNc=;
	b=T8bVa0HANS3Twz08sAhyHtzokmQQYzTA/JpbpY/Sn0yZ6Se9G7MIIuQS1JUsaT7A9RYMLoq8RZjUxMjKL2Lb2rVhQE9aPy3n2DMfmetNZpiypB5a+pfuqNMxrUgof2z7hr9Qbv3H6ldhL8aH7aWOue7Sq9iWOBRa/g0MsLBXoHY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XECMC2V_1793988969;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XECMC2V_1793988969 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 02:16:10 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org,
	alexei.starovoitov@gmail.com
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
Subject: [PATCH v3 bpf-next 2/3] selftests/bpf: Enable private stack tests for riscv64
Date: Sat,  7 Nov 2026 02:15:57 +0800
Message-ID: <20261106181558.1564-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106181558.1564-1-cp0613@linux.alibaba.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_181625_395876_DCEF21C0 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -15.7 (---------------)
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
Reviewed-by: Pu Lehui <pulehui@huawei.com>
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
index aa15361bcca5..3cde7b1af126 100644
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
@@ -153,6 +166,14 @@ __jited("	str	x0, [x27]")
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
@@ -223,6 +244,16 @@ __jited("	bl	0x{{.*}}")
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
@@ -452,6 +483,10 @@ __arch_arm64
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
@@ -481,6 +516,10 @@ __arch_x86_64
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
