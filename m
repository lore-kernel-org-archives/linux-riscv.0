Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC53606A889
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGYEAEgg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jB/jc/zf3/mHUiLsKbX2Y8zinkOaMqP3krmzN1+rPT4=; b=tGYEAEggKlOYyQc3rySjxfuoxz
	TVz6o6PFTBaNlgTAvGvafyd2R+z4kMdBn99Ik0W/OiNKkBkoJ5T8/vRU2PYrVG0n/CnMI/HYIe2gh
	KxeujpGGvcZmxZRN3ocPGsM48a5CiXnHro5AiI6j5NjsQ5nfPT6uN5fmCpFDXeYgK0bHf3qP7yRWM
	bZILXUn6j0rD7DxeJp79EPiG+b06TqVW6VIzRTwshgRikOY9D4Bie40RJvAqWgoQRkJzBDSS6GITc
	SV2Ls31D33p0m+w6ddrMnuoQBYSgk9BeTXZ98PvgQ3q/9vHz1QYoR6kzz40TcSXp3NWo+AoaU7ESl
	anV4muDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmZJ-00000000x4D-2brQ;
	Mon, 16 Nov 2026 02:35:41 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmZG-00000000x34-3Lhz
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:35:40 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmZC-004DmY-VK;
	Sun, 15 Nov 2026 21:35:35 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v3 2/2] selftests: riscv: test FP state restore when rt_sigreturn() faults
Date: Sun, 15 Nov 2026 21:35:34 -0500
Message-ID: <20261116023534.50074-3-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116023534.50074-1-nickolai@csail.mit.edu>
References: <20261116023534.50074-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_183538_845151_06F012E4 
X-CRM114-Status: GOOD (  19.90  )
X-Spam-Score: -1.9 (-)
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

Add a test for the previous patch: the signal frame sits on a
userfaultfd page that the handler drops after dirtying the FP
registers, so rt_sigreturn() sleeps in the middle of copying the FP
registers from the frame. The interrupted code must get its own
registers back.

The test is skipped without the D extension or when userfaultfd is not
available to the caller.

Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 147 ++++++++++++++++++
 3 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c

diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
index 35002b8ae780..8ed282ecb618 100644
--- a/tools/testing/selftests/riscv/sigreturn/.gitignore
+++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
@@ -1 +1,2 @@
+fp_restore
 sigreturn
diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
index 8c77508641f3..ac7ae7a7c2ae 100644
--- a/tools/testing/selftests/riscv/sigreturn/Makefile
+++ b/tools/testing/selftests/riscv/sigreturn/Makefile
@@ -4,9 +4,12 @@
 
 CFLAGS += -I$(top_srcdir)/tools/include
 
-TEST_GEN_PROGS := sigreturn
+TEST_GEN_PROGS := sigreturn fp_restore
 
 include ../../lib.mk
 
 $(OUTPUT)/sigreturn: sigreturn.c
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/fp_restore: fp_restore.c
+	$(CC) -static -pthread -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/sigreturn/fp_restore.c b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
new file mode 100644
index 000000000000..29875572b738
--- /dev/null
+++ b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Check that rt_sigreturn() restores the FP registers from the signal
+ * frame when the copy of the frame sleeps on a page fault while the
+ * handler's FP state is dirty.  The frame is placed on a userfaultfd
+ * page that the handler drops, so the copy faults after f0-f15.
+ */
+#include <fcntl.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <ucontext.h>
+#include <unistd.h>
+#include <asm/hwcap.h>
+#include <linux/userfaultfd.h>
+#include "kselftest_harness.h"
+
+#define PAGE		4096UL
+#define STACK_SIZE	65536UL
+/* the page boundary falls this far into the FP image, after f0-f15 */
+#define SPLIT		128
+
+#define F0_15	"0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15"
+/* caller-saved only, so the handler's epilogue does not reload them */
+#define HANDLER_REGS	"0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15"
+
+static uint64_t pattern[16], handler_pattern[16];
+static void *saved;
+static int placed;
+
+static void handler(int sig, siginfo_t *si, void *context)
+{
+	ucontext_t *uc = context;
+	unsigned long split = (unsigned long)&uc->uc_mcontext.__fpregs + SPLIT;
+
+	placed = !(split & (PAGE - 1));
+	if (placed) {
+		/* rt_sigreturn() will fault on this page and wait for serve() */
+		memcpy(saved, (void *)split, PAGE);
+		if (madvise((void *)split, PAGE, MADV_DONTNEED))
+			_exit(1);
+	}
+	asm volatile(".irp i, " HANDLER_REGS "\n"
+		     "fld f\\i, \\i * 8(%[h])\n"
+		     ".endr\n"
+		     : : [h] "r" (handler_pattern)
+		     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
+		       "ft6", "ft7", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5");
+}
+
+static void *serve(void *arg)
+{
+	struct uffdio_copy copy = { .src = (unsigned long)saved, .len = PAGE };
+	struct uffd_msg msg;
+	int fd = (long)arg;
+
+	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
+		copy.dst = msg.arg.pagefault.address & ~(PAGE - 1);
+		copy.copy = 0;
+		ioctl(fd, UFFDIO_COPY, &copy);
+	}
+	return NULL;
+}
+
+TEST(fp_restore_frame_fault)
+{
+	struct sigaction sa = {
+		.sa_sigaction = handler,
+		.sa_flags = SA_SIGINFO | SA_ONSTACK,
+	};
+	struct uffdio_api api = { .api = UFFD_API };
+	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
+	stack_t ss = { .ss_size = STACK_SIZE };
+	long pid = getpid(), tid = syscall(__NR_gettid);
+	uint64_t out[16];
+	unsigned long fcsr, shift;
+	pthread_t thread;
+	int fd, i;
+
+	if (!(getauxval(AT_HWCAP) & COMPAT_HWCAP_ISA_D))
+		SKIP(return, "no D extension");
+
+	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
+	if (fd < 0)
+		SKIP(return, "userfaultfd not available");
+	ASSERT_EQ(0, ioctl(fd, UFFDIO_API, &api));
+
+	for (i = 0; i < 16; i++) {
+		pattern[i] = 0x4010000000000000ULL + i;
+		handler_pattern[i] = 0xbff0000000000000ULL + i;
+	}
+
+	saved = mmap(NULL, PAGE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, saved);
+	ss.ss_sp = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, ss.ss_sp);
+	/* populate it, so only the page the handler drops faults */
+	memset(ss.ss_sp, 0, STACK_SIZE);
+	reg.range.start = (unsigned long)ss.ss_sp;
+	reg.range.len = STACK_SIZE;
+	ASSERT_EQ(0, ioctl(fd, UFFDIO_REGISTER, &reg));
+	ASSERT_EQ(0, pthread_create(&thread, NULL, serve, (void *)(long)fd));
+	ASSERT_EQ(0, sigaction(SIGUSR1, &sa, NULL));
+
+	/* lower the frame until the FP image crosses a page at SPLIT */
+	for (shift = 0; shift < PAGE && !placed; shift += 16) {
+		ss.ss_size = STACK_SIZE - shift;
+		ASSERT_EQ(0, sigaltstack(&ss, NULL));
+		fcsr = 0x1f;
+		asm volatile(".irp i, " F0_15 "\n"
+			     "fld f\\i, \\i * 8(%[in])\n"
+			     ".endr\n"
+			     "csrw fcsr, %[fcsr]\n"
+			     "mv a0, %[pid]\n"
+			     "mv a1, %[tid]\n"
+			     "li a2, %[sig]\n"
+			     "li a7, %[nr]\n"
+			     "ecall\n"
+			     "csrr %[fcsr], fcsr\n"
+			     ".irp i, " F0_15 "\n"
+			     "fsd f\\i, \\i * 8(%[out])\n"
+			     ".endr\n"
+			     : [fcsr] "+r" (fcsr)
+			     : [pid] "r" (pid), [tid] "r" (tid),
+			       [sig] "i" (SIGUSR1), [nr] "i" (__NR_tgkill),
+			       [in] "r" (pattern), [out] "r" (out)
+			     : "memory", "a0", "a1", "a2", "a7",
+			       "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
+			       "ft6", "ft7", "fs0", "fs1", "fa0", "fa1", "fa2",
+			       "fa3", "fa4", "fa5");
+	}
+	ASSERT_TRUE(placed);
+
+	for (i = 0; i < 16; i++) {
+		EXPECT_EQ(pattern[i], out[i]) TH_LOG("f%d", i);
+	}
+	EXPECT_EQ(0x1fUL, fcsr);
+}
+
+TEST_HARNESS_MAIN
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
