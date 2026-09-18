Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD45C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DcFGtjspWC+CoHYHVPXtxOHfMBd6ZbiuSVshf0K428=; b=raQxO99QI5ewOn
	RExZI5PqjDQSMitFHVnNvqP5JvuBWeNNPrly6UdzzVePQOu3r/oBMzs1TZXPAVm4zPe0J7qSh+j62
	KHnty553p3rkzpsWXNGtFlSwIk7MV2oho+wWCjX0DXDKRFgDomJl6tNnH9F3ijDgLRmoUWacF9TAK
	/HvwdUXgH4yi5HRazCLJDCcmcb4shkFL4NLuEdquAxN+fv991A5hkcsAzm74j2viqN+WQ+zL3F0QC
	HlQ+XRuO9W7byVV8bH98Dxog6yiFXS3pFot20rLctd7rB0Pm9raYZsGBZP/aZPBuThNT9K3k55gXh
	eK0yldC0DBApYQ3/9mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWY-0000000FaZU-0diV;
	Fri, 18 Sep 2026 21:53:38 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWV-0000000FaYT-2eMa
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:36 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aac92dbso1166489d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768414; x=1790373214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=gD+lFn7Poe2K1aR5kDpA6Shk+MYc302Km7xR8F+8mQC7xBZ27e8hk+JVjp5Z3dXNqU
         oUOwM3YdF0PXhmYqG4UNGNAjixjwoPqp2Bq7ltUuurS6D1gF+G3lShSqKxfWrGG7+JFM
         P06VPe4BiS6ODJfGcRaldCrtvgEPy5q9m6YaOLZH2poQSNMtquU6UDW/RLYrQHqXAtwI
         iZiXc5zhPCdDu4EUFKfEXtP+egOFMNBdYpk2tGa2Ss5bCTj6hpIaRUekX9Yzd7u26dQH
         VU17WSeJjh98F0FO/uxob6dy39BjTO3x8p7Gr0xCKUflJfK+dJDHZwrsGpAaU3ACQlAq
         lo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768414; x=1790373214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=YnZBqBE1uP54zryTfsI1byDWyimDmXXuOIkjNVT9afTx4wzk+g26eflluoUk2hYupM
         J8ramv2p4HTFBEWcX8m1LtCNlonD9Vhm/f9qHmRejkeyYkztMcfmgWwdxTHsKP+7DWac
         UMEKx2upNaSDrpCiyYT1IYXJskmJwAjaPP27akUJUpksqiueR0nf55oMBTFRxaKsCus4
         aA1zuU3Dh374j2MuR6hy3VQDZQc/VKOqTK3K6Hjgb+dSMumDkCZJOrEmyLqq2lIR8wsR
         2wSeN+eD5K8D4lWXZ4Y8q/whGl37MQP+UBYVyTPHWm2RhlV3c0/zUy90Zg9e8GhHpJKN
         Isjw==
X-Forwarded-Encrypted: i=1; AKwUvBxR2xhypHWDBYGhoGf0KCrIc7BEw5sAtfeiMOxePz7MQLEC2SbvcOuMefH5V4ME/KnWo4E6x9i/BGmQYg==@lists.infradead.org
X-Gm-Message-State: AFuF++kXX3VkwQ1Bx3LHqfCIBiwY6FVj2rpeCl+tubCtYEHx6jZKg+HK
	YrO4vTZD//gmUJyNjuNogctUsiltKASx6jUoYiPuECNrHVpJKqkKB+C7ZFygXlDjGbE=
X-Gm-Gg: AYBFou1iENJP05FNUbkHeV2aUdIYOyezJfqYBCszyTu1NQxSlTUEd8EN7KHO0IeQ9Uv
	btlJQbOBry1wUGtQms7qrAAN9qs82CnHWsdziyhU1s6avacG2DMolJ6dvNgcXB17ab1XiCkE0R9
	SFWN3KjpZft/mzgwhODUK62OTFCuyzCwjpzeEDURdlGQcio4VYbAHyYl0pTMWG9KThoE+0TP9oM
	ey7lRA3W3wrxus1r2sX3vHg0RT1NNigi1QiF4HKd8zCOdNZGdQkTeY3ofw6Qq8ztCDjNbvjK2Hy
	/mbQza8/YDAEg/Ci6mWuKXo3eblzCDxLpP1po2H9OT0gVYZyQpO8K2q5vWINvhdM19p8xq1/ItG
	6eOiW2rQFEF/Gfj4W13U7DWJtKOIJvaIuqLkkM0aBO4oIfJxPgRHa4slWZnPCwMHckhFpebEsSe
	F3VNLZTo2wmtBOFu2M4uIa7vd4WEz0VcAamfIV7UDWlGVRmrIBkJRBD6dfnBFSRq+wpu5MjRqMa
	EyofMAkQSXKzjeVRkiGqyh8hA/ze+cKkDEE
X-Received: by 2002:a05:690e:4548:20b0:670:fe0f:fe39 with SMTP id 956f58d0204a3-6717fdfd203mr887495d50.88.1789768414543;
        Fri, 18 Sep 2026 14:53:34 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:34 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
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
Subject: [PATCH v6 3/8] selftest: riscv: test vectorized user copy
Date: Fri, 18 Sep 2026 16:51:17 -0500
Message-ID: <20260918215154.2481482-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145335_891138_8A194B56 
X-CRM114-Status: GOOD (  24.25  )
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
