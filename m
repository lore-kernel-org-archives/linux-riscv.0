Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63A606A332
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QNAxwBYs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Hu0H2nhF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Ty/Nap+iDJPelre87WenJVq1f1oukqH9vWfBPUHvDY=; b=QNAxwBYsLaRxoWWlvv56OXPLpt
	0r+ANQxbmy8LIqKElHByBOhF3VrfU5QsrL+psLfM7WoFjOMhmzJt8KoaTLX7njlOYOc8nfOXDfvtN
	BF77LgNHDsDh9jEDtQphzkXxI0HBjdQDCfTPtTIpauXdREEvczI8g4Ig4jFkKjOukeDiEcGItLGC2
	VhJMtsq5EkZqGj4bxaqsw3wMva84dVdFSMynYX0xpVdK9JOMpnPC0clzBlZDtau8wzFM9cjRW8ww2
	rzj/s/xX4GBqpNIgQVFx3t/L2j9BgB7+2nPZk/csJihRA1SxUB95IbyVjy5QVI8iBubD/SuL+PpKT
	KV68lmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZO-00000007Spb-03Jf;
	Wed, 11 Nov 2026 19:01:18 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZK-00000007Smb-0StI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:15 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b300713befso30689487b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423673; x=1795028473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=Hu0H2nhFro8HNmpYVrgVDU0rMiaKImiMvX88X0mFm0lVGlSON/hx3IEYXonYtze5Lw
         +abzU+t0H1Id2wG98fMTw2D5rtabALSfhNDZaXoYZ0BAOjY7UDMBwU3Vb/SdtYiyZtSz
         OTFWju5pcAyKQfjIsdPY5E5I+wDYBewB3zjTg3dYFEDflNENTMdqkz7LgCPWeJ5R55JF
         PKS9SZZ7QjEK9dI4Wa2is1ctAUxWjsfSACgNkfFnIUwUiy6v+YFPYCWXvZxwvoeTXoIS
         N2qL/uPHF6trW8RIDAg2i8RFXGYrmpHpHTuJYUQywDYcwR2saWVW4bJvPVktfrlaVnVp
         IF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423673; x=1795028473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=07nM/7aH+3hDWEtTu23WVBxNeXEahb4ixhictLVzLYIc+KS5grQh155EZIepH9wx2T
         Su/YlqsqIjtxEc3/GexABl3VggKZ+ujKI+NLjihZ/VDgmw6MX6Z//VvsCFxf+KbWRwNA
         7WDoXZ2WoLWbYQorowxljaNaaMPkIXFAZdf1utcrsD1B6mWZLk+6n/0POUFjT7WRuv8D
         bXwbm9YA1T+EvciEVtISOmLDJuQSlUaj2mreHd62zwdonfIfXeEy6i3H0h/DN/lf3oB9
         a23T4tFb3mXzmlgyM1E0pKvFgYMDiSTixaqwO9HW44QaNNc8/LNhpsvM/qdUtj+8lJBL
         opGA==
X-Forwarded-Encrypted: i=1; AL+hErEENlqyiu4iw2w208M8Ma9O4tf4qRX7lkb+pWsoVDyFnOuDt3F9h+tEzK0KcRbQDZaDqdJ0v9lZVaF3MQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+l1e4qPn5sPi+xMJjKpbl6qeOp6hMB5zkc4Mrp5gcvCEQo9UdE
	WhfJ4HyZVIPI5xZWHuUigw5CEzDgbgXDOLe/HptokY+CZn1KQnGGTJsqQLyXwEROes4=
X-Gm-Gg: AYBFou26d2O1jG3Tci1BH1t4SMxfOjnN7DT05z/x/PEqVLaRFJNG5MXFKd2GJm8SQ5X
	Wj0qHOmBeBWIgxaFWFhSH/JYU/UeQotbKxR92ot24fztcY7oVI2YpUPiIviHjJ8VLXR2oelNyl8
	2Gc2zTrG10ruMS5pBFrlo0pi9ZtmFo6GQ5YH4tqw2hPDrWgHpkM/xM238JhebyT034tSuxlQLz+
	hATHtBqBIL2STbmOzxtW6+T4Q9TPejZeis24Umfu+5NXRSCfh02bkjmSPKbVSNR8zZyD9H47zxA
	YHGS55cjy2NTv2Ccr5CMCJmBWq36lAOtE65t3EwDADer+VCU4skH/H7n0Z099WEqe1d4PWunr5K
	B5SgQYcDlEr6zovrcvbFeGM1Wh/VTQJwx9YkCsAT2wP9NJoa3SO9RtXYB+hViNSbJeIuKGywKoA
	2NZEHgGiUJpJzz7Z6YmZ4u9IA4OU7UkTqXiUIHeGBIUf8DuMgjPWeMW35Qc49qh2Y5he3pdT5iF
	5lO8NEVgEQOtsLfBhKipn0ktu0f9Gugd/b7aoprfzWellVDb9OJl5mMdHkpqvHpjW8LKEefYIK3
	K5+Edq9ggq+OeHZDrfEzSdxQh9Qfx6HyKUNx5j62h23GkLA7SfQKgIgwV15pTC68Bp8ztZ2hQCR
	pCxRI/Ru3bD3A2MaOfr1sW/PeZOKM4Zc6lXh1A/Zm/8Z/ny+3
X-Received: by 2002:a05:690e:4851:b0:67b:fe99:a7a0 with SMTP id 956f58d0204a3-67c67fb2612mr1607228d50.69.1794423672627;
        Wed, 11 Nov 2026 11:01:12 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:11 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v7 4/6] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Wed, 11 Nov 2026 12:43:26 -0600
Message-ID: <20261111184359.1239821-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110114_774332_C2159E89 
X-CRM114-Status: GOOD (  20.55  )
X-Spam-Score: -2.1 (--)
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add new test cases to verify the vector state restorations at syscall
stops for ptrace and signal interfaces. Specifically:
1. Signal handler should read all ones at syscall stop and modifying
   context should success.
2. Ptrace should read all ones but any modification to NT_RISCV_VECTOR
   is silently dropped.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v4:
 - remove timer dependency from the signal delivery (Sashiko)
 - solve 2 memory leaks in ptrace (Sashiko)
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 2 files changed, 178 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..647249dbd7e6 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -7,6 +7,7 @@
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +62,76 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 	return after_sigreturn;
 }
 
+#define V_TEST_PATTERN_SIGNAL 0x98
+int nulled_val;
+static void sigalrm_handler(int sig, siginfo_t *info, void *vcontext)
+{
+	ucontext_t *context = vcontext;
+	struct __riscv_extra_ext_header *ext;
+	struct __riscv_ctx_hdr *hdr;
+	uint8_t *ext_ptr;
+
+	/* Find the vector context */
+	ext = (void *)(&context->uc_mcontext.__fpregs);
+	ext_ptr = (uint8_t *)ext;
+	hdr = &ext->hdr;
+
+	while (hdr->magic != END_MAGIC) {
+		if (hdr->magic == RISCV_V_MAGIC) {
+			struct __riscv_v_ext_state *v_state = (struct __riscv_v_ext_state *)(hdr + 1);
+			/* Assume a valid datap */
+			nulled_val = *(int *)v_state->datap;
+			/* Fill all vector registers with magic pattern */
+			memset(v_state->datap, V_TEST_PATTERN_SIGNAL, v_state->vlenb * 32);
+			/*
+			 * We must also set the vector configuration so that when
+			 * userspace reads v0, it uses a valid element width (e8).
+			 */
+			v_state->vl = v_state->vlenb;
+			v_state->vtype = 0; /* e8, m1, tu, mu */
+			break;
+		}
+		/* Move to the next extension header */
+		ext_ptr += hdr->size;
+		hdr = (struct __riscv_ctx_hdr *)ext_ptr;
+	}
+}
+
+TEST(test_signal_syscall_ucontext) {
+	struct sigaction sa;
+
+	/* Make sure we get V in ucontext by executing vsetvli */
+	asm volatile (
+	    ".option push\n\t"
+	    ".option		arch, +v\n\t"
+	    "vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+	    ".option pop\n\t" : : :);
+
+	sa.sa_flags = SA_SIGINFO;
+	sa.sa_sigaction = sigalrm_handler;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(SIGALRM, &sa, NULL) == -1)
+		ksft_exit_fail_msg("Failed to register signal handler\n");
+
+	raise(SIGALRM);
+	/*
+	 * If the kernel successfully parsed and restored our modified ucontext,
+	 * v0 will contain V_TEST_PATTERN_SIGNAL.
+	 */
+	unsigned char v0_val;
+
+	asm volatile(
+			".option push\n\t"
+			".option arch, +zve32x\n\t"
+			"vmv.x.s %0, v0\n\t"
+			".option pop\n\t"
+			: "=r" (v0_val)
+		    );
+
+	EXPECT_EQ(v0_val, V_TEST_PATTERN_SIGNAL);
+	EXPECT_EQ(nulled_val, -1);
+}
+
 TEST(vector_restore)
 {
 	int result;
diff --git a/tools/testing/selftests/riscv/vector/vstate_ptrace.c b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
index 1479abc0c9cb..863a16f6e1a3 100644
--- a/tools/testing/selftests/riscv/vector/vstate_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
@@ -21,6 +21,41 @@ static long do_ptrace(enum __ptrace_request op, pid_t pid, long type, size_t siz
 	return ptrace(op, pid, type, &v_iovec);
 }
 
+static int do_child_syscall_stop(void)
+{
+	int out;
+
+	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL)) {
+		ksft_perror("PTRACE_TRACEME failed\n");
+		return EXIT_FAILURE;
+	}
+
+	raise(SIGSTOP);
+
+	asm volatile (".option push\n\t"
+		".option	arch, +v\n\t"
+		"vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		"vmv.s.x	v31, %[in]\n\t"
+		".option pop\n\t"
+		:
+		: [in] "r" (child_set_val));
+
+	getpid();
+
+	asm volatile (".option push\n\t"
+		".option	arch, +v\n\t"
+		"vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		"vmv.x.s	%[out], v31\n\t"
+		".option pop\n\t"
+		: [out] "=r" (out)
+		:);
+
+	if (out != -1)
+		return EXIT_FAILURE;
+
+	return EXIT_SUCCESS;
+}
+
 static int do_child(void)
 {
 	int out;
@@ -59,7 +94,7 @@ static void do_parent(pid_t child)
 			goto out;
 		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
 			size_t size;
-			void *data, *v31;
+			void *vctx, *v31;
 			struct __riscv_v_regset_state *v_regset_hdr;
 			struct user_regs_struct *gpreg;
 
@@ -73,9 +108,11 @@ static void do_parent(pid_t child)
 				goto out;
 
 			ksft_print_msg("vlenb %ld\n", v_regset_hdr->vlenb);
-			data = realloc(data, size + v_regset_hdr->vlenb * 32);
-			if (!data)
+			vctx = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!vctx)
 				goto out;
+			data = vctx;
+
 			v_regset_hdr = (struct __riscv_v_regset_state *)data;
 			v31 = (void *)(data + size + v_regset_hdr->vlenb * 31);
 			size += v_regset_hdr->vlenb * 32;
@@ -109,11 +146,65 @@ static void do_parent(pid_t child)
 	free(data);
 }
 
+static void do_parent_syscall_stop(pid_t child)
+{
+	int status;
+	void *data = NULL;
+
+	while (waitpid(child, &status, 0)) {
+		if (WIFEXITED(status)) {
+			ksft_test_result(WEXITSTATUS(status) == 0,
+					 "SETREGSET vector at syscall stop\n");
+			goto out;
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGSTOP)) {
+			/* Attach to the child at syscall stop */
+			ptrace(PTRACE_SYSCALL, child, NULL, NULL);
+			continue;
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
+			size_t size;
+			void *vctx, *v31;
+			struct __riscv_v_regset_state *v_regset_hdr;
+
+			size = sizeof(*v_regset_hdr);
+			data = malloc(size);
+			if (!data)
+				goto out;
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_print_msg("vlenb %ld\n", v_regset_hdr->vlenb);
+			vctx = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!vctx)
+				goto out;
+			data = vctx;
+
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
+			v31 = (void *)(data + size + v_regset_hdr->vlenb * 31);
+			size += v_regset_hdr->vlenb * 32;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_test_result(*(int *)v31 == -1, "GETREGSET vector at syscall stop\n");
+
+			*(int *)v31 = parent_set_val;
+			if (do_ptrace(PTRACE_SETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+		}
+		ptrace(PTRACE_CONT, child, NULL, NULL);
+	}
+
+out:
+	free(data);
+}
+
 int main(void)
 {
 	pid_t child;
 
-	ksft_set_plan(2);
+	ksft_set_plan(4);
 	if (!is_vector_supported() && !is_xtheadvector_supported())
 		ksft_exit_skip("Vector not supported\n");
 
@@ -130,5 +221,17 @@ int main(void)
 
 	do_parent(child);
 
+	parent_set_val = 0x53355457;
+	child_set_val = 0x49504F21;
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_msg("Fork failed %d\n", child);
+
+	if (!child)
+		return do_child_syscall_stop();
+
+	do_parent_syscall_stop(child);
+
 	ksft_finished();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
