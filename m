Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3E9C9830E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMtNChzOg7eCeHSp3wLmxYDomgklo6b85bR6UYYTwWE=; b=O1BR5dM1AG1olT
	3pO8EVtI6Gz4k8mQOMeivhGjfWKGTTiYVBu9YTnr7nVxZ1nMDjINzSP0RSs+GLxKGSEz/ixkjBfVH
	GDjJ3393y6aMlnNC18CfNJ/8mAfanGzn3+/EYFYhPBn30HgVvEe2w2VyVb+Cvo6xjH3YaE856Ccae
	XafUVZmK9V0i86ytrI35lhUWgt1AW64qaef8hwDPERjRleh+K2Gp3tC+oLgLvbFHb599R78J8LsxV
	eUhlEofZtWB2C+iEfliI8R9aNkNQpCSOviLCrnA/fBt8Ul6bJ6PCjTNQWoMqn6gdBY/xBKmyu/gYO
	E2/jkzDB8lZbMKUJdgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo4b-00000005Bgo-4AfF;
	Wed, 30 Sep 2026 06:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo4a-00000005Bg8-3oYL
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c2WZbgYbdnyGWYGcFcIFetI/8QnTlo7EqFb+Eu8Kvaw=; b=rEdP2N6O0k8Fi1CkJKvWkPgPLC
	9YjHzZ7cskIPJEOirVYFLYWe3vESbXBfzh3Na3MZro79b5ucaA2OqabzA5wt90DYyLsfDibzdBcaV
	KTAQSZq8l57kf2dIInrNvD505GCTe5qf6GQe93o9wOaOef1Qws5lFKxjcbZEGnFKIFV7eeRpkLI/E
	JiDpEu1H/suUK8z+62Gf83bs40LgBCpCgwKdcmYGZtAAPOzBA10v1egcZOGlP602T1Bk5q3Rvqjh7
	CX4wpdGpJOGLq4maIX2aF+56PRrabZFlvpTZP6Q8Q6h6N9qSTFamkYYplnb/Mb9X21TKYNav3Pi0l
	oeIoOvZA==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBo4J-00000003Qjn-0l4N
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:45:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvlsH6lPVzYQttm
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:44:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 72BB240574
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:45:20 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgD3xSj_r7xqrobcCA--.8426S4;
	Wed, 30 Sep 2026 14:45:20 +0800 (CST)
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
Subject: [RESEND PATCH bpf-next 2/2] selftests/bpf: Enable callx related testcases for RV64
Date: Wed, 30 Sep 2026 06:49:28 +0000
Message-Id: <20260930064928.1909085-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930064928.1909085-1-pulehui@huaweicloud.com>
References: <20260930064928.1909085-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgD3xSj_r7xqrobcCA--.8426S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGr15Cw4kJF18uFWxCFykKrg_yoW5uw4xpa
	1kZ34vyw1SkF1akF1xJF4jvrZ3GF4kZryUAFW8ZrW5uFnrJrWxXrs3KFZ8Jrn0g39Yvr4r
	Zw1xt3s3ur48Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjTRRCJPDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074536_222767_6F47F6A7 
X-CRM114-Status: GOOD (  10.50  )
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
