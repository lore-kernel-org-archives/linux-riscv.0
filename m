Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A37606A33B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtqGj3td;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LqQGnGm5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cxjNJNia
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HXiTFWtqbdAqSPiTiojGJDL7g+S9gTlwmJkx+9vu66Q=; b=NtqGj3tdvnzZSlXXIZ6mYewJL4
	f3v73AWhTA5sjgpIJZEQaMTyGTd7pl31oyQ8nYiZgutJKiTwqoDmyQC83mYO+A/a5612H/AREGBky
	L3nwyuocLFq90LLnSpnvsqcdoj0tLubOdujtc4hlJTfJaLuY+qdxqbagPtQ6iwVgHKhcUizWzYmWC
	H5oVLjeioLgxFYAxwYV38BbeVnXLpVbdLAfC9jk+5rxaOSU1MmNfHQzVl7Avtri5BA3H6yYWVPsHK
	R78Ojxjq+x5Lghh+ZbPs0PJ5iNwCqT0yq0i7QA9Lm53b2+92k96hIGBaniAa79v1UbhNVHIqqBr/0
	0c2VvdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUH-0000000DMzr-3Tri;
	Fri, 06 Nov 2026 18:16:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUG-0000000DMz5-4Bfp
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Nov 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S+xY08b+4lGwFp9GSsFCatLAGSU0o4KhAbA+GoZVnSs=; b=LqQGnGm5pTgaef3F62/RWZUM+e
	AeNuADysJcI1mR8Wkruval71g/uNUmeJI8NqMOC/DVOvliYso/Bq8l8z9oNZvhMUH2/ogT4VOgQfW
	GlzYUNCzGYl4olvOX/Fd5nQU1dQ/SfUdycq0/KZd5BPo8hN9up2ARzMMvPvLQ5nYOxRFk/kX+Vk/F
	ztUljainMXYtHaGbeqKS47x99o9OSwZiTW/uPUzG1MQnAGtx9B4scmefQGyd5FChJXFPrlUGelkFA
	JVi8k58NXdcOy5IgNHx5hzJpKeaH0apBMSpRGNyv875gYclXl+LMULR+j/zPqyUpwALYYitFLK+u7
	6ILwAWPw==;
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUD-00000004ZB0-265p
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793988973; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=S+xY08b+4lGwFp9GSsFCatLAGSU0o4KhAbA+GoZVnSs=;
	b=cxjNJNiafXG8GXkyLd5mdJlHdCNXhBpjZTrWJ7tR50WCtDor+fzD+u2HO1SCoPa8vujP9rd+T7BIBdKXKBHcmvWi4zCzaS6f0ZKClq6DwfrDVFP/tqDTA62wP3vHDSCFaz+6vdBXfc2QgYQvbzkg6qbcz7ly7YBTCVtWoS8JMvo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XECMC2r_1793988971;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XECMC2r_1793988971 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 02:16:11 +0800
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
Subject: [PATCH v3 bpf-next 3/3] selftests/bpf: Test a private stack together with stack arguments
Date: Sat,  7 Nov 2026 02:15:58 +0800
Message-ID: <20261106181558.1564-4-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106181558.1564-1-cp0613@linux.alibaba.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_181626_290959_75B0C39E 
X-CRM114-Status: UNSURE (   9.21  )
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

Add two asm programs to verifier_stack_arg.c, inside the block that is
already gated on x86, arm64 and riscv64. A raw_tp program with a 64 byte
frame calls a ten-argument subprog with a 64 byte frame of its own, and
BPF_PROG_TEST_RUN runs the pair without attaching it. Args 9 and 10 stay
in the kernel frame and arg 10 points into the caller's frame, so the two
have to agree on where the outgoing area is. The callee returns what the
caller stored plus arg 9, so a wrong area shows up as a wrong retval
rather than as a crash.

Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../selftests/bpf/progs/verifier_stack_arg.c  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index 146cdf81bbc4..e8108e768b89 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -975,6 +975,55 @@ __naked void stack_arg_precision_fallback(void)
 	);
 }
 
+/* Writes both ends of its frame, then reads args 9, 10 and the frame of the caller. */
+static __naked __noinline __used
+long priv_stack_10args(long a, long b, long c, long d, long e, long f, long g, long h,
+		       long i, long *j)
+{
+	asm volatile (
+		"r1 = 0;"
+		"*(u64 *)(r10 - 8) = r1;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r0 = *(u64 *)(r11 + 32);"
+		"r1 = *(u64 *)(r11 + 40);"
+		"r1 = *(u64 *)(r1 + 0);"
+		"r0 += r1;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
+/*
+ * A frame of 64 bytes in a raw_tp prog goes to the private stack.
+ * arm64 and riscv64 pass args 9 and 10 on the kernel stack. On x86-64
+ * both frames stay there as well.
+ */
+SEC("raw_tp")
+__description("stack_arg: private stack in the caller and in the callee")
+__success __retval(890)
+__naked void stack_arg_priv_stack(void)
+{
+	asm volatile (
+		"r1 = 800;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r1 = r10;"
+		"r1 += -64;"
+		"*(u64 *)(r11 - 40) = r1;"
+		"*(u64 *)(r11 - 32) = 90;"
+		"*(u64 *)(r11 - 24) = 8;"
+		"*(u64 *)(r11 - 16) = 7;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"call priv_stack_10args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 #else
 
 /* No BTF tells about this store. The insn is what JIT has to deal with. */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
