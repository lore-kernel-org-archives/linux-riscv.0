Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AD4C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bupTRmZ9HB2lYXUMZk/X1WB/95JUNUOw0ByPtdaui84=; b=vS69S+1+zLxRHB
	otp3JKpAjLiTWjNdzcqJouhtV9tmXI1Nv9ZmZX8j5a2wFRSNUgp3TTrEpQx/VciI9VTvCQ2Rc7Z7a
	pJZX5HoHtsvs61CWSpV2Zb9TyXrZ3Xnd4YADgP8ZkeQcHfPjpIVEp6SR0kzNikzeAvK2O2gH8XmHO
	GT9e/GRba8Qp+Y6Mp86dkd6teDkbFNM7P8fL92avgBB9J3b+dmTeW5cPUIWN0xP21GZcUL+5+snNc
	/XPW58VeW2vY1p+zHHYTnQJMD8ChbEgtRiwMlq2UgQissBGcBJJhOrbODfJB8xfc/ChTn2I86/lEL
	YYHiM0GeJNfBtyl3672g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPie-0000000HaEI-0itr;
	Thu, 13 Aug 2026 07:19:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPia-0000000HaAP-2fNe
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 07:19:14 +0000
X-UUID: 447f0eb296e711f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:95322ea6-7878-4845-8c38-0209cc6e8cdb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:59b30b4614b8c76a0be7e304c058fcd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 447f0eb296e711f1aa26b74ffac11d73-20260813
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1220298982; Thu, 13 Aug 2026 15:19:05 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Thu, 13 Aug 2026 07:18:43 +0000
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Enable stack argument tests
 for RV64
MIME-Version: 1.0
Message-Id: <20260813-bpf-riscv-stack-args-v2-2-efea8f9b3fe1@kylinos.cn>
References: <20260813-bpf-riscv-stack-args-v2-0-efea8f9b3fe1@kylinos.cn>
In-Reply-To: <20260813-bpf-riscv-stack-args-v2-0-efea8f9b3fe1@kylinos.cn>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 llvm@lists.linux.dev, Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_001913_493675_D394F69B 
X-CRM114-Status: UNSURE (   8.41  )
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

Enable the stack argument selftests for RV64. The riscv guard is
restricted to __riscv_xlen == 64 since stack arguments are only
supported by the RV64 JIT.

Keep the __BPF_FEATURE_STACK_ARGUMENT gate, defined by clang with
BPF stack argument support [1].

[1] https://github.com/llvm/llvm-project/pull/189060

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c      | 3 ++-
 tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c | 3 ++-
 tools/testing/selftests/bpf/progs/exceptions.c                    | 5 +++--
 tools/testing/selftests/bpf/progs/stack_arg.c                     | 3 ++-
 tools/testing/selftests/bpf/progs/stack_arg_kfunc.c               | 3 ++-
 tools/testing/selftests/bpf/progs/stack_arg_precision.c           | 3 ++-
 tools/testing/selftests/bpf/progs/verifier_stack_arg.c            | 3 ++-
 tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c      | 3 ++-
 8 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c b/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
index 8d38aafe66a2..ab12397a9b52 100644
--- a/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
+++ b/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
@@ -4,7 +4,8 @@
 #include <bpf/bpf_helpers.h>
 #include "../test_kmods/bpf_testmod_kfunc.h"
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 long subprog_call_mem_kfunc(long a, long b, long c, long d, long e, long size)
diff --git a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
index 99bc115f8380..a980a3a399d3 100644
--- a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
@@ -3,7 +3,8 @@
 #include <vmlinux.h>
 #include <bpf/bpf_helpers.h>
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 int subprog_bad_order_6args(int a, int b, int c, int d, int e, int f)
diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
index c8d716fbd419..bae20f0f247e 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -379,8 +379,9 @@ int exception_bad_assert_range_with(struct __sk_buff *ctx)
 	return 1;
 }
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) \
-	&& defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
 
diff --git a/tools/testing/selftests/bpf/progs/stack_arg.c b/tools/testing/selftests/bpf/progs/stack_arg.c
index 944e3bb603e7..3e9ed37c57bb 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg.c
@@ -21,7 +21,8 @@ struct {
 
 int timer_result;
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
diff --git a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
index 345f2da2e361..b6b1a8aa7f44 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
@@ -6,7 +6,8 @@
 #include "bpf_kfuncs.h"
 #include "../test_kmods/bpf_testmod_kfunc.h"
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
diff --git a/tools/testing/selftests/bpf/progs/stack_arg_precision.c b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
index bee2eeec021d..6eebafe7f2f8 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg_precision.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
@@ -6,7 +6,8 @@
 #include "../test_kmods/bpf_testmod_kfunc.h"
 #include "bpf_misc.h"
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 /* Force kfunc extern BTF generation for inline asm call below.
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index 7e0ce5db28a0..e8cd296fe763 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -12,7 +12,8 @@ struct {
 	__type(value, long long);
 } map_hash_8b SEC(".maps");
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 __noinline __used
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
index c9fe4857da3f..562e8319ffc2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
@@ -5,7 +5,8 @@
 #include <bpf/bpf_helpers.h>
 #include "bpf_misc.h"
 
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 __noinline __used __naked

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
