Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CBCD5BB4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJp6+FzmOSSVZzGwbAqqRoBH18a48jBZ3lqAtXGsfhU=; b=M/qrOBvSZyAN27
	S96TM7EbG9U6XEpV67Dd1zuGy4nMMcaV9PUx5AC9S6bNAlP8DWBu+00PzXMYM3CgxRYm+FUBAQ9qz
	glp47WHxix1z7as2I6ZJZDag/Ahutuy7xzc/EQYcHFLtWKKd83fo/7GLTvEhlwbPTG64rSLmpo+3b
	JkWMuC7YhlkjXE0SM5iFj6rWN82O0vYb1HKf6/YOu0G6BLHVbZWHetCMmojf1wGVj8YST+6gUspRR
	EX31AcCIdm2bMKXz5Hgyx9gGVKWjaR5HO6GVtkBxILFELVXzDzVZD9xXl0q5sjmJ/8KjSTzUyTNPw
	Q7GF22GtSxo1OTKGiVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dx-00000008U1W-3FpX;
	Thu, 21 May 2026 16:26:17 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dv-00000008U0H-3xVO
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 16:26:17 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7c23248f3a3so67804777b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380775; x=1779985575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9FDf4DlWCdet9ejsQPRXtBBttAImyKEU2oe9Q8ZuQA=;
        b=VQ+seCHvwylzkeWFOq0nD1HKLcv1Q8R4y9hAaqtsY5v3kVsxC1gTgG7CWZnCwelOdq
         NF/RetXzoLpfhNfJuS23wz8xNpIzcgP3nQbKp49a15BKISbivunVl4nLook3u2EQsbsv
         jy3hEYWoYT2qtVMy9/KW0Xyq+Ij1X+2TJF0altwlvhh+9IzobXjkRQZYHyxTpnDN1hP0
         RI3/uSJZghIxcZx5SL4sAzdMVEE+yPudZE+q9kLMZOl34k+UHwtMYtRwbpFpNw9YE0g+
         mOB8l5GWH2VEpX6s4RqmZ068XiNPw9Ve7hTFHZqHLZJXqJToVshTyVzEMf489/gDp8EU
         5lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380775; x=1779985575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J9FDf4DlWCdet9ejsQPRXtBBttAImyKEU2oe9Q8ZuQA=;
        b=Y8nV9zKupNM7Y5xYkx2XYlfeXAdXWRh32oOMZcEWGd8xZhoIgb5WLZ1nLq1vRNezCz
         nPJghHbnYsPeAv6/B99ihebQ942nozcnpk7lv7WbwIDo+ht+/hsimL3luKAoNJui/kbi
         8TjdGMtwCDgKfX7pQ4zG5I//zHJUI2UzQANUc3ZcoID6GlTDH6nJhaIcJ57hei6k0TDA
         jAnD52Wj3QEl+8Rv7/k1dklmeAM7JrqP5zuYMuH7xvd0uON2GONx5egAqhe7f1tWflvQ
         xs5k44rWLwjNWfBWy45inJRl52MsFYZkFoJzguvYlMm4ji2PBPkA2A59x5XCAZwXBtlS
         94ag==
X-Forwarded-Encrypted: i=1; AFNElJ8qPwmfXrh/0eQWaN6dvO464XKuljOGYPauBkWAQkOkpiXntSTHR862Ozeiq07v4S3sr17iJ/YEXyb4eA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxigwx6b7WvesC6Mfstwqpvkq6Fe6qbS8dzGXs7a/x9Kopr11xV
	Dn00io/SJwKB9wOjPvVtu8nSn2dlSEDv5aPiBzV/yXKZYtTHs+zxcmWjw3tU6G4KzJE=
X-Gm-Gg: Acq92OFKZd7gF87swIGfyMnWYxnkIobKfSIfKG8DlIXFw2ynj9OC3r5pPTK/47jZv9M
	ZFh6v1cN7zNrgl+V/JNRtFiDZsNxGoq57BPGJAnHuGuEYZEdyxMiQU/8RGOUbOmrLKU2WqPEnwr
	oQzoCbhvCytNkVR6NY0rx64lPmfWjhYg/N5ZpVASGwnIlWjCeY+tANAfMIK86X9I3+rFMmWwovS
	2EnBON0818hg42mNn3T4jeVkmNfFCuoNldZC9L4/YvRUEjAELNxRc2mIfNfKhsntqw/b2NGM7rR
	YFvv+l6/HMlF77bRkq0JcIIw2sZgRGZ5bYM+YMqVZzJjwHWQ+39ETIE9F0LmAEGjYR25UG32NSB
	iV6KY4W6X8EpNuiuGqWodU9+jhML7f/UN+vSX3ceTzqhajVArFYl1HW0eOVqv3Uhg/wTVDBURRb
	ok7E4COCrTEHiqWoCsVQbm5wNIPSq9GX0qq1JxJPoq6lopHeAe0S2f2N2HVRJCrio3JPg=
X-Received: by 2002:a05:690c:7346:b0:7a2:842a:db7e with SMTP id 00721157ae682-7d20d020fdamr39734727b3.35.1779380774903;
        Thu, 21 May 2026 09:26:14 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:14 -0700 (PDT)
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
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 4/4] selftests: riscv: extend vector tests for sigreturn and ptrace
Date: Thu, 21 May 2026 11:25:20 -0500
Message-ID: <20260521162521.188629-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092616_020805_3340D666 
X-CRM114-Status: GOOD (  20.36  )
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
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  78 ++++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 100 +++++++++++++++++-
 2 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..c7d8cac80efb 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -3,10 +3,12 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <ucontext.h>
+#include <sys/time.h>
 #include <linux/ptrace.h>
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +63,82 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
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
+	/* Setup a 10ms timer to unblock us from pause() */
+	struct itimerval itv = {{0, 0}, {0, 10000}};
+
+	setitimer(ITIMER_REAL, &itv, NULL);
+
+	pause();
+
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
index 1479abc0c9cb..7952885a04c7 100644
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
@@ -109,11 +144,62 @@ static void do_parent(pid_t child)
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
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
+			size_t size;
+			void *data, *v31;
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
+			data = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!data)
+				goto out;
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
 
@@ -130,5 +216,17 @@ int main(void)
 
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
