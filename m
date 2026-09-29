Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C08BCA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMtNChzOg7eCeHSp3wLmxYDomgklo6b85bR6UYYTwWE=; b=iRr2DyJw3Hbieh
	T2yJcTzDFh7cJ5MAMjTJxM9lqg+lsKVLxKVeMuYUiNsXi90Lq5Gfg15wLdMVxtIL527D6MLgoyG1g
	AluJnx2V59sb7MIKBav0YTrcnUZk76/tScRJ4VC742GJJfqNK/hRXi3Sli33ceififhIAlFBQlMOQ
	8Lgb3NUl6wXf+7MFHvnxyQOKWgd0aJgSDAu/czcxcS71ebSMf2xwhfy3C4r3VOSgxCWv00c+MRvtN
	4HzikeLa/5N9aSHeLG8l4JimsLxsqbCQm8oI76WWKXohnM6xD+/l05y05z8vSBaf/P88oqApv2Cam
	DApqCwogDvblTWDVr7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTYJ-00000002ru0-0IXd;
	Tue, 29 Sep 2026 08:51:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTYH-00000002rsg-0HoZ
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 08:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c2WZbgYbdnyGWYGcFcIFetI/8QnTlo7EqFb+Eu8Kvaw=; b=n1V/mGmQP438oveWxmOgfru0kL
	5Bz5755/xUsWRl/T+sJsUckd5zNv73fLLxxjburek8hN/RubU2BU094mg+gIAJZE9zKmYZnycKp/I
	2wssTHv+BORK6LVY9p+kJ9ByqMhrjlEp6Bbw5icNre5iqmH40R7vlVmGiyruuY1/ootsgcpL4kMiy
	zvUIh0UUQ9Vz++qAJI1xTMXMZ5EDaMugGsQmc2UkRtHqoiOyAlOSUfajFDSwCCZ8ScF0U9lBT4x5F
	voU29GNvkPmpNQYtiI8gMKL3zKcQd3Xmz7bjyNataOrkBrQwCQKNqjL7i7BwRo9kFy5OJBKgzjBGI
	9Dsl8/Hg==;
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBTY9-00000002NgP-3veS
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:51:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hvBhH4ZLczKHMdg
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:50:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0C82940A7B
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:50:43 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDn_iHie7tqgXJpCA--.48809S4;
	Tue, 29 Sep 2026 16:50:42 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 2/2] selftests/bpf: Enable callx related testcases for RV64
Date: Tue, 29 Sep 2026 08:54:50 +0000
Message-Id: <20260929085450.1852617-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929085450.1852617-1-pulehui@huaweicloud.com>
References: <20260929085450.1852617-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgDn_iHie7tqgXJpCA--.48809S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGr15Cw4kJF18uFWxCFykKrg_yoW5uw4xpa
	1kZ34vyw1SkF1akF1xJF4jvrZ3GF4kZryUAFW8ZrW5uFnrJrWxXrs3KFZ8Jrn0g39Yvr4r
	Zw1xt3s3ur48Aw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRREfO5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_095058_670798_EA0CDA8E 
X-CRM114-Status: GOOD (  10.49  )
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

From: Pu Lehui <pulehui@huawei.com>

Enable callx bpf selftests for RV64 now that the RV64 JIT supports
indirect calls to subprogs.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c | 3 ++-
 tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c | 3 ++-
 tools/testing/selftests/bpf/progs/verifier_callx.c          | 3 ++-
 tools/testing/selftests/bpf/progs/verifier_callx_rodata.c   | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c b/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
index 42b33d5876b1..cc63b84e4d94 100644
--- a/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
+++ b/tools/testing/selftests/bpf/prog_tests/callx_func_ptr_map.c
@@ -8,7 +8,8 @@
 #include <linux/filter.h>
 #include <bpf/btf.h>
 
-#if defined(__x86_64__) || defined(__aarch64__)
+#if defined(__x86_64__) || defined(__aarch64__) || \
+    (defined(__riscv) && __riscv_xlen == 64)
 
 #define CALLEE_INSN	6
 #define DATA		0x1234
diff --git a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
index fc5181c5b5ba..f6ef67c3141e 100644
--- a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
+++ b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
@@ -3,7 +3,8 @@
 
 #include "callx_rodata.lskel.h"
 
-#if defined(__x86_64__) || defined(__aarch64__)
+#if defined(__x86_64__) || defined(__aarch64__) || \
+    (defined(__riscv) && __riscv_xlen == 64)
 
 static void run(int prog_fd, int expected, const char *name)
 {
diff --git a/tools/testing/selftests/bpf/progs/verifier_callx.c b/tools/testing/selftests/bpf/progs/verifier_callx.c
index bc31d0221f6a..7e59188d9fca 100644
--- a/tools/testing/selftests/bpf/progs/verifier_callx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_callx.c
@@ -7,7 +7,8 @@
 #include "../../../include/linux/filter.h"
 
 /* gcc doesn't support indirect calls */
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && defined(__clang__)
+#if defined(__clang__) && (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+    (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 #define CALLX_INSN(DST, SRC, OFF, IMM) \
 	BPF_RAW_INSN(BPF_JMP | BPF_CALL | BPF_X, DST, SRC, OFF, IMM)
diff --git a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
index db3169a1ddf6..3ebd50f9c4b6 100644
--- a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
+++ b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
@@ -7,7 +7,8 @@
 #include "../../../include/linux/filter.h"
 
 /* gcc doesn't support indirect calls */
-#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && defined(__clang__)
+#if defined(__clang__) && (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+    (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 /*
  * Read-only data with pointers to functions, where the compiler puts tables
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
