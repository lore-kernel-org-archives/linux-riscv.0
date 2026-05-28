Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDACD5BD5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ty/Nap+iDJPelre87WenJVq1f1oukqH9vWfBPUHvDY=; b=0R9Lzme/LScfpC
	3ZFqD3ZYCevdQO1/JgMUsbyOl1Sm7uHqPXn8I4PJGtLRcdhhcEUN2tEMrwNVJfALkmNorlMB9m3uF
	ALlISxEpgiW5wfCIYinVXTi4rIv9pjgCMUl06FHPNpwAmwS82+qkJQcxNiN8pXsDWGesSzPF2oMtA
	RDuJfM2dcUy/iKKZLbPJ1qKS4mahO1d6sm47nfXaaVp29OV/VTPDWG9bPpCwKVG/T+tkN41Fh9fq3
	q0IWcSlDl/bPPXFsKJpFUgDriBaoseQ3F8/jN7DmrAbnFTcLUXd7DfG6UxlKxA5N52VRX+BoNhhsV
	T2KmMXCiAcoDNAMopGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8Z-00000006G5z-3kCR;
	Thu, 28 May 2026 19:11:23 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8X-00000006G3p-1Dbp
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 19:11:22 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e61e251966so2824353a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995480; x=1780600280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=Iki6bbMLOEhIHkAMgnzTy/tLq+ICDtZOqYyIkqZvLFLVfGyEFYFhnjSn9m0hSPlKSD
         KP7VMhSqK28MR2XcDXsd3RLXdM32wESSuAyojfYHgxyhQxBFFudFsqBEGjqhnngc6jGz
         1FljL8xImpTAbUJ4htiKEtJ8NQOWvhSEOyegcyvvJKJaX2cEqcWM341ZvhCQGxdSiDee
         Uvj4Ds+I2CAI6poz5sjeb/56qP4sAME6duYIDmTDi05MapptI3EQszElDdSzK9/cs+or
         zXXLTXzJyYV2vT67yg1wzl2+rOb3mqlM+I6xJUiRT/gIz4bd51nO014EueTpPGgttwB2
         pZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995480; x=1780600280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=NKh18DlXK1tCxhvPcJWrLwkh2doXY73+CFZiAlkoWdsdLZpKA9iQj6Fe4fYHkPyjRE
         bzPNQKl6wcIw+8BtHFUPhC6olYWRBeU0hGnLoe/rmNboeu4l12LP8VxUr+aU8ANzLx9M
         vUGJ+Gu6S04DJL6o6zThPaeyHe7slxnmOL5OLghb6ISBSdlMzFE9MX/+3D/BgftM16OM
         U2vNyOKpkAO3MH9y+KMRY6+BeqvCnGwIGcjotUt/4wb5KjARQlsCZlexrMbdQ/EIzNY6
         RxcSHwLaX8UGdjDDJny9VXzdacvV42q3QkQHjuSMSkaOrkKRTkx1Lux455x3aXFk+xCC
         XqRA==
X-Forwarded-Encrypted: i=1; AFNElJ/pj/5OTBYFzaVNkIXuKhTFlwzY0KcN/1o/AcIjo/rTDdNvbRy8u1IZHENXzVa/MuGx6UqWiwckbq82Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuDIy8aXspmqBWQ7l9h9GvY+OEr3yHBa7hCjxPUjWrWZ238jSd
	KKsIENrHTiE18B7QUMIxOo39k30/9iMxZ8l9yk8a9Di3c3ZMmXTRP1GjbH221wf9A6o=
X-Gm-Gg: Acq92OFg7jahR9PUq3TYR2D2uLX+L4SoI7/z/Y3Ic+O+SqehxcVdULIaoCHg5awdZQE
	cqSHnpSOVIxTI8+CsIkydppMiU29GtyJBqtSm59L5zrZ19Za7A2A/ij1KXy3sPGdZclpyHDORIQ
	4Fhh3/VRYt28Pmo5i3gza9jeEL9bwtvuS8f4j4lYHFhX/9DoAy0fI4huIAqNzKVoJUbRN7YpJiA
	GPzSntgRMW39nlod3KhLLxzZfxgzpsMvfMvr/PAEec1o8peL/3xIG1mfIxssXRL9T9Ot8uv/1jK
	pbHjMFEmYUKTQgrSJcxKCresJruTl6WjkkENd3GEdX2ZW9ZCesRrwHflDHM1G46imOptO+/pGom
	FF7mDWPTveaq7sjk5hMxCeWx48gCseWmsne6pcyHvxynmzGh3mas2IB+TWODzfFMEdL3abaVRBx
	PjtBEihMcUYQavG2r1oYpvcSoQqx+nOu8uKXqCD6BUczjUoIaDoI7mToCqcOlGK1vL8j3EAdQbs
	uAnSw==
X-Received: by 2002:a05:6830:3808:b0:7dc:e6e8:62b with SMTP id 46e09a7af769-7e5fefcb98emr16751871a34.13.1779995480287;
        Thu, 28 May 2026 12:11:20 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:19 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [[PATCH] v4 4/4] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Thu, 28 May 2026 14:09:15 -0500
Message-ID: <20260528190927.886558-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528190927.886558-1-tchiu@tenstorrent.com>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
 <20260528190927.886558-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121121_345748_167959BB 
X-CRM114-Status: GOOD (  20.11  )
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
