Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE3DC982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0mcXpK+p7UkE5n5kzZVsgmgXilEm2Tf/QNMHhD3+0c=; b=No2lOURv8PQiL8
	yc2gQ6Ai1Odv5tPdcBKKFp9TnuCkY8+6IP9Rg8r82PacK7RQaqnAoTo/OwSuTXw8CcV4NfGOLikco
	2iMw+7mPLJkDftqb+Jhd/A793aDUGiKVv/hw6tftpgV/0RNNOhTw4uA92ijfEsscfKBWZG1n85cGj
	Cz1XOsXn2moRs+8GqEvjUW+cmzQ0Q2/IWKvagJ+bHo4dNNuJrBQKGLqc6AdEPiGgZutup/foMen6R
	ryC6q+syJLeABDzBbmwl6+b40VhjrtQk7hDDOA4K8QMWSrF+h+3sGJJbwnP3LKqZSQHNJqK13iJzk
	ZDBc0pevwKJBo88FhhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWo-0000000Faoj-1Lvq;
	Fri, 18 Sep 2026 21:53:54 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWl-0000000FalU-1pzx
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:52 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-8961cca9193so15792367b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768430; x=1790373230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgKQxSeRnOzoiZ3Got1iPeMZXr/r/xBvpSPq8RVnIaQ=;
        b=RFzTZNWqAx/Jkr4ZseJ4Kdz7pELOVj5kE5ExnCH349ULwg9e99xsHL7mjaBf12rFHO
         qFDAl4j5DBks0dN/vfYGl4ZH7eWAVZpuK10zU5QfQG5zG5pIcZSDhXQzwNjeSrCDBQFs
         S0BdH/Umui8V9RJAGLnedi1vRitlt5HFlep/3QE20sVgWfuPpAfR2NyRjW095ZG6NHRo
         RERiK/ns6MHhzfQfqu1XT1JARpvOKJL5EyVcUxavr6pFoRLIIPf4nPvFj2yu9CQWuzsx
         OvNrYsCvnxdoGqVcl5f7a52LfFl43fUZBLHuHuqGEIiFDShf4uyacbx2hMw4Q+yfe8Bw
         RplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768430; x=1790373230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgKQxSeRnOzoiZ3Got1iPeMZXr/r/xBvpSPq8RVnIaQ=;
        b=D8KCxRv41132v4Z92Aho0I5Y+s9zdYDix2URDBJYcFznhqiKY6frcyMTsxee4o6bD3
         zbfeFKzuHcgkzfdokm1ahrgBBnRF/fp/DIBk4Q6ZSZsY6GK3pV3GK/1JMh5BcTiu5Spj
         iz+JpUDYzs6xKiKe2ZH+GCrTxjh/8WnmbMx8i+YsXjSZ1edENK5efxiRCd3ZbK7j9SwA
         OqLCDnE6vp2+KX+I5Qgp5FdFaZTdra2cMVLu/siq7jLljrtOtqfv7uZN7OM1qx9LcgGT
         Nx5gRwVr4ni9svR0QHvtp1Y0pDbEnIAclqXDgO5Lt/rMAW6U4GFRXhm7Nzkoq85lEfhd
         1kIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpNtCPrcHd9z6sYXysygvpC7yj5Vme44S5XydX4j5DLD66eaHPjFBlZV/HoSYbju0TFEOaV6caB0XWxg==@lists.infradead.org
X-Gm-Message-State: AFuF++kz1jRJACVmXUVQ25Q0Pb8LPhY07I2dwyJhu4RY3FmYtGSSMi/L
	ZMcdu0BbAImgGrTrwetZIwcTXbYoCV5egFV0WhhkxQcQIaJmi9i6hYYceslJKhlKiv2Tr2Q8GuS
	Z3KSDDgEkNw==
X-Gm-Gg: AYBFou0MpnObUn077fOyFIk3UdtDMugo9oTmdEKlTbeqcRwewbwkclc1P0xHIqkG31t
	l3o/i++k06i3KcxRJO7MbS3FRn4TGhv+tuxVCQbxWNq+UpgGr6MkK0n0z2E66WQTPzEK6celQ+Z
	IMc1aUX3jh2AEPBjadCDuWWdzEh22ywtEi8606Umuusc09+4ZRREWg/+N/tuk7LT+aAHpUKh0tI
	6MsC7qa9MpQjbQ2w7y15Zs5f5AbI2Acbzf/UvM7hgsxZ+DyLvwb56AM2lrH9YRV+H1oK05zU+Mx
	msNwpowSwG7nTeVTjzUvBUuiV16UFLpLpKqxLBZTi0UPx2Q/9XcDKCPsSQCzWSNzA1j5QBTdGdw
	HxDElYKqX4yHtp6KdkaEH158LPWgcj+0GNgwqIxldFMdq6ixjpzhaK1Xl/nr3vJ9zFZAqWRBehv
	+iOdWBU1r2B4dt1Y7+WmgESYTYklSa/uLSNBT9KfG+zUTHyKSD13obcqz85WY8+44K9LKqV643P
	omFiI1AA3LIhLOutn34AjbAbtA0OD6NWx2L
X-Received: by 2002:a05:690c:93:b0:872:1e2e:b496 with SMTP id 00721157ae682-89736948fdfmr26927807b3.31.1789768430101;
        Fri, 18 Sep 2026 14:53:50 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:49 -0700 (PDT)
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
Subject: [PATCH v6 7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Fri, 18 Sep 2026 16:51:21 -0500
Message-ID: <20260918215154.2481482-8-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145351_515430_0C0CFCCA 
X-CRM114-Status: GOOD (  20.86  )
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
Changelog v6:
 - reformat code to slience checkpatch
Changelog v4:
 - remove timer dependency from the signal delivery (Sashiko)
 - solve 2 memory leaks in ptrace (Sashiko)
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  69 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 2 files changed, 176 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..386367cf28be 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -7,6 +7,7 @@
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +62,74 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 	return after_sigreturn;
 }
 
+#define V_TEST_PATTERN_SIGNAL 0x98
+int nulled_val;
+static void sigalrm_handler(int sig, siginfo_t *info, void *vcontext)
+{
+	struct __riscv_extra_ext_header *ext;
+	struct __riscv_v_ext_state *v_state;
+	ucontext_t *context = vcontext;
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
+			v_state = (struct __riscv_v_ext_state *)(hdr + 1);
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
+	asm volatile (".option push\n\t"
+		      ".option		arch, +v\n\t"
+		      "vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		      ".option pop\n\t" : : :);
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
+	asm volatile(".option push\n\t"
+		     ".option arch, +zve32x\n\t"
+		     "vmv.x.s %0, v0\n\t"
+		     ".option pop\n\t"
+		     : "=r" (v0_val));
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
