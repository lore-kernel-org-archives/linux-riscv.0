Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FA2C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DcFGtjspWC+CoHYHVPXtxOHfMBd6ZbiuSVshf0K428=; b=pGellsVcJ1YUAE
	ds9fRl8it3jdZTxdUeZTdy/NwMYPtXDLcOEMQhQEOqR1pFQ+sHc0SGR3R1yq/OPlBvIC1oW/mzN6t
	NOT3L44G/XJuc/iiGAwBxXzGoHGSdBV08qQBh/6TKvcVsR4Zp1tkjZuOAoylcScdSkbb34GsenSOa
	0ExLa91wcsSI/5Zu0ZPFTH584exsjhWLvZiivGovW63vojK2b2E5Hjnh/luXnXDP9cy2KqxKGWBhx
	/quUqfpsN4JcycxtSZmas/eNVtBsfSSg+n9DNjKV6/bfzDSGrG5uO/r4zQMzHFDuaXUUBUE9sJjRN
	eU+ug0j80WvOuEGKGnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkP-0000000CVs1-3PLe;
	Mon, 10 Aug 2026 17:25:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkO-0000000CVrI-0cNn
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:25:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2045597b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382711; x=1786987511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=DL4HVlb0l+eypo8yxmTAI7Y9uFEUkmT0wKiGyijK/3mM+Jy8IAozzn3/kR56dhLkXf
         I7EiUtGth8C57FDKhE2Ljz/VInrhP6vm5wzADgUqbJ4QmMsplcCh98jWSdw6m3mX1jQy
         Q+nXLpRC9As98ZiREPBPu2bS+77FLoEW22yEYiA7DNY9qPQg3dAKXMsb0mBNvH1QDv6n
         1j68UeI98MEFtHhhHY8MYdkDAOOoUqmaTUZKfS4YIfIAqahiqOMingyruLznBtl9dmoB
         TgicWlPjH3MjiAS8cgOewczUC2oyFRRNm4qsRVG3Jl0ATssvp2fNiXrh6Oc3CChh7fH5
         EBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382711; x=1786987511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=oh9M85Z4tS8qN0BOngDXxWeP4hzi+4oT9lcAdRf9/UiDSc4nfX4wkppgDowPgWDf57
         g5sa7AnEwIfY/Hn8D28t/gucHdYpAGitgLi35yTPdtqCI3x0O4QG7aaP/SvPHsXpd1gA
         gm7rwFiR9kCNv7maCBDeoEjoynenjH+LkwQ6cChWVus7/VyD9Vb9xsbV97NDg6N0Y10V
         YobJTobzbmJc6GvGrIse9U03K+H2ttMJQK9IJHfKKSDnQRs89dncT25vYlGbz+birVs3
         LRhNTtlARFluOQZS/Ujyoa8NKbb3gxO8ImjnzwPLtRrFslpaC+zucVg7XBqb4dCMn0Vy
         CPnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqitQ9vjMmb2OI4Sb77klxiZ4QTWus39tX6TWTvkXgCdBKrpElKZtM+a0nEPzFvTOdyPFrrc8JFx1HThA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxds2VmGpolKqwZZYfy8Q47KNEpsNwvQIyP6h+MLSHHe9hwxNpL
	F3S5FWmxxhxwAUA0fN8x8ofMSSqHA20YQ+GIaZ48vZ70FyY8bQHbRv0wzwGNFkyY9XI=
X-Gm-Gg: AR+sD13Mt1boXSnvEmk2km8gOHqBxgexFRiMFQAAwzdiiNzcZtSxewvNr+xKKKNgzeH
	S3QqflGM2pLGsURm4LQfPYuHRQOjK2evxbMuIv0+0Yvn732PfV96YoFi5WzizTltsA/5aAzvvHh
	2EmSuXvvE/99pV1XRyl68kmuKykelNpy+2qLwf35EsPmdCe2XoSOnFMbS6kzwJH0xV3OK/tl8Kn
	HAyhMd+FVAk3AjyzXxKI8wRWf6CQ6h0BAa1JJKgZX79sUdhlRPhPBpRJ1WCQJRliyUAlwL7wZPU
	Q15dlRiYx0W5tdbM/+9d3pPB80670ACvHAVsxXRneVKKeR9eTuUHPo/u8gsgRfB7ZhFE6zP5PKA
	m2gDxR0+H5xRrwMyaV2aqRhtX5r7DTfKzQt0sanLJV2CX6gJbB0uBjKQ1aKraB14JgvalJ3sHuH
	dVHYB/AVn1jIcXiwHN3YsHX/zY9yvZb50A4WN5fq6+/r4zPx6KGnHSNKMCf73Jwi6EiYTY2gtgq
	yojudYtGdwvo9lU2lKky7LjjAmxSRLjYfJYZzA+M8DUmITUHdtumB7dmbhqTz242/adyGk5cgze
X-Received: by 2002:a05:6a00:420f:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84f5e0c56admr29573843b3a.31.1786382711117;
        Mon, 10 Aug 2026 10:25:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:10 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 2/7] selftest: riscv: test vectorized user copy
Date: Mon, 10 Aug 2026 12:22:29 -0500
Message-ID: <20260810172255.1532787-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102512_194935_C278C5C1 
X-CRM114-Status: GOOD (  24.40  )
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

Add a test that pushes a 1KiB pseudo-random stream through a pipe, so
write() and read() copy it in and out of the kernel on the vectorized
uaccess path, and compares the result against the original. Both buffers
shift every iteration to sweep all relative alignments, and 16 processes
per online CPU keep the vector unit contended. The compare is a byte at a
time loop through volatile pointers rather than memcmp(), keeping it scalar
and independent of the user vector state.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - new patch since v5
---
 tools/testing/selftests/riscv/vector/Makefile |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c | 221 ++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 7e0017b3fb8b..0ed09b69dd8a 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
+TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace \
+		  v_uaccess_stress
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
 
@@ -36,4 +37,7 @@ $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_hel
 $(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
+$(OUTPUT)/v_uaccess_stress: v_uaccess_stress.c
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
 EXTRA_CLEAN += $(TEST_GEN_OBJ)
diff --git a/tools/testing/selftests/riscv/vector/v_uaccess_stress.c b/tools/testing/selftests/riscv/vector/v_uaccess_stress.c
new file mode 100644
index 000000000000..d70e0387e246
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_uaccess_stress.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Stress the kernel's user copy path from several processes at once.
+ *
+ * Each child pushes a 1KiB pseudo-random byte stream through a pipe: write()
+ * copies it from user space into the kernel (copy_from_user()) and read()
+ * copies it back out (copy_to_user()). The round trip is repeated 512 times
+ * per child, and every iteration the buffers are shifted so that the copies
+ * cover all of the source/destination alignment combinations.
+ *
+ * On RISC-V those copies may be serviced by kernel-mode vector routines, so
+ * the payload is generated and verified with plain scalar loads and stores
+ * only. The comparison goes through volatile pointers, which keeps both GCC
+ * and clang from turning the loop into a vectorised compare and keeps the
+ * check independent of the user vector state the kernel is supposed to
+ * preserve. memcmp() is avoided for the same reason: the libc version is free
+ * to use vector instructions.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/wait.h>
+
+#include "kselftest_harness.h"
+
+#define ITERATIONS	32768
+#define STREAM_SIZE	1024
+#define MAX_SHIFT	16
+#define BUF_SIZE	(STREAM_SIZE + MAX_SHIFT)
+
+#define CONCURRENCY	16
+
+/* xorshift64*, so the payload does not depend on any libc or kernel helper. */
+static unsigned long prng_state;
+
+static unsigned long prng_next(void)
+{
+	prng_state ^= prng_state >> 12;
+	prng_state ^= prng_state << 25;
+	prng_state ^= prng_state >> 27;
+
+	return prng_state * 2685821657736338717UL;
+}
+
+static void fill_random(unsigned char *buf, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = (unsigned char)(prng_next() >> 24);
+}
+
+/*
+ * Scalar, byte at a time comparison. Returns the offset of the first
+ * mismatching byte, or len when the two streams are identical.
+ */
+static size_t scalar_diff(const unsigned char *a, const unsigned char *b,
+			  size_t len)
+{
+	const volatile unsigned char *va = a;
+	const volatile unsigned char *vb = b;
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (va[i] != vb[i])
+			break;
+	}
+
+	return i;
+}
+
+static ssize_t write_all(int fd, const unsigned char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t ret = write(fd, buf + done, len - done);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		done += ret;
+	}
+
+	return done;
+}
+
+static ssize_t read_all(int fd, unsigned char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t ret = read(fd, buf + done, len - done);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		if (ret == 0)
+			return -1;
+		done += ret;
+	}
+
+	return done;
+}
+
+/* Runs in the child. Returns the exit status to hand back to the parent. */
+static int child_loop(unsigned long seed)
+{
+	unsigned char src[BUF_SIZE], dst[BUF_SIZE];
+	int pipefd[2];
+	int i;
+
+	prng_state = seed;
+
+	if (pipe(pipefd)) {
+		fprintf(stderr, "pid %d: pipe() failed: %s\n",
+			getpid(), strerror(errno));
+		return 1;
+	}
+
+	for (i = 0; i < ITERATIONS; i++) {
+		/*
+		 * Walk the source and destination through every relative
+		 * alignment, including the case where both are equally
+		 * misaligned.
+		 */
+		unsigned char *in = src + (i % MAX_SHIFT);
+		unsigned char *out = dst + ((i / MAX_SHIFT) % MAX_SHIFT);
+		size_t off;
+
+		fill_random(in, STREAM_SIZE);
+		memset(out, 0, STREAM_SIZE);
+
+		if (write_all(pipefd[1], in, STREAM_SIZE) < 0) {
+			fprintf(stderr, "pid %d: iteration %d: write() failed: %s\n",
+				getpid(), i, strerror(errno));
+			return 1;
+		}
+
+		if (read_all(pipefd[0], out, STREAM_SIZE) < 0) {
+			fprintf(stderr, "pid %d: iteration %d: read() failed: %s\n",
+				getpid(), i, strerror(errno));
+			return 1;
+		}
+
+		off = scalar_diff(in, out, STREAM_SIZE);
+		if (off != STREAM_SIZE) {
+			fprintf(stderr,
+				"pid %d: iteration %d: mismatch at byte %zu of %d (in %p, out %p): expected 0x%02x, got 0x%02x\n",
+				getpid(), i, off, STREAM_SIZE, in, out,
+				in[off], out[off]);
+			return 1;
+		}
+	}
+
+	close(pipefd[0]);
+	close(pipefd[1]);
+
+	return 0;
+}
+
+static int nr_children(void)
+{
+	long online = sysconf(_SC_NPROCESSORS_ONLN);
+
+	return online * CONCURRENCY;
+}
+
+TEST(uaccess_round_trip)
+{
+	int nr = nr_children();
+	int failures = 0;
+	pid_t pids[nr];
+	int i;
+
+	ksft_print_msg("%d children, %d iterations of %d bytes each\n",
+		       nr, ITERATIONS, STREAM_SIZE);
+
+	for (i = 0; i < nr; i++) {
+		pids[i] = fork();
+		ASSERT_LE(0, pids[i]) {
+			TH_LOG("fork() failed: %s", strerror(errno));
+		}
+
+		if (pids[i] == 0) {
+			/* A distinct, reproducible stream per child. */
+			_exit(child_loop(0x9e3779b97f4a7c15UL + i));
+		}
+	}
+
+	for (i = 0; i < nr; i++) {
+		int status;
+
+		if (waitpid(pids[i], &status, 0) < 0) {
+			TH_LOG("waitpid(%d) failed: %s", pids[i],
+			       strerror(errno));
+			failures++;
+			continue;
+		}
+
+		if (WIFSIGNALED(status)) {
+			TH_LOG("child %d killed by signal %d", pids[i],
+			       WTERMSIG(status));
+			failures++;
+		} else if (!WIFEXITED(status) || WEXITSTATUS(status)) {
+			TH_LOG("child %d failed", pids[i]);
+			failures++;
+		}
+	}
+
+	ASSERT_EQ(0, failures);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
