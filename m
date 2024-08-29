Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AFEC71159
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/aumojnQ/oIia25wTw2cCIq1C5EuY/+N3dzyN3lb/M=; b=qzf9oAQzmrY16h
	3hdsMSb0M9tOznon0efH/G2d7eWl8uah++U5+OUQ7xBnC6ygAH0tx25O+q8cZnG/UX7/cMdJSKtfS
	bfZzQacMm0htl4QXskPCPdLbXADo6arDOVBnnGeEkDsl6su1TOlPeoYdrVZVXt1SmNXAQm19/13G/
	/PC0FZh7+mfeD2bVD4Mr2UPW6zYzq/TEsPPYVrFtHjz5gBKlfNYdESfMzMf86L3zrc4h7051y5Fmx
	W/MkbdBJj7tCULYtB5/zE0amsLsCssIfp0d61fog2t9oWpEVEPtpi/8qgLUPiyxs44L4sx4BuzLg6
	f4KwO0opgQnh83Z14IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYJ-000000003pI-1rJy;
	Thu, 29 Aug 2024 01:02:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY6-000000003ez-2aDI
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-715cdc7a153so97755b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893326; x=1725498126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdTr6WFexikZD5z5SMB0wNcwIFtpGfuIsUFT4S+mZyo=;
        b=LG/3axfglD9hvGLIg4E5wAuew//03kruKK7nOY57RM0OWJj3XZPhpahKtUvZ4R6ioz
         TjYq67D8T+VY6b06iGpVBHtqUhxDWL45miWBTwDfQg52sZkF7YlKonOskeETQH7zXR/P
         vyPz2+JdKmrDHsp24kfVULsvQbJFUCEo+VFpC2TyIm0q4za2YtLJway2I+x/EtfMZx5E
         uFx6y2UfNtKrlQTvFtrIwV/TcFjEjbFE4lIfAtqAhd3784MmMKondoNWqUOcywyLNSjj
         SMHBWJ46fmcpFVWOpLLmOzqPEJav81697dJsZn4z1g3EwEjg5fffJTDtAaJFaYrDHuwE
         C7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893326; x=1725498126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdTr6WFexikZD5z5SMB0wNcwIFtpGfuIsUFT4S+mZyo=;
        b=dJNiQS21DYjCzk1daUYIudi8fOporki7bJpePwjBuwCV2yFNQ40MI3BGTRiNUs94dm
         TpFZqFPPEN3QYhstulsqO200qXrX2va4ThJvPBwiW5LL0gvKEYaJ8+nRPlq2HFA/S6vg
         jPMwbngrlyhKYffXjpgyFQt7yyyY/RgMJ/6/waNGEM+A59DYVtMvjVN5FQ95IqGsAIcu
         Wf98jGCZHsK200qf7KcUekXHl1Xvyhvr3FClmqeNUYHBN2QqraQFIHUNPpD1DHW73Uug
         vIkP6HatlB3vfM+uuFiPIRx7CdOinY2eEknQZUhMxPSrwIangv5p0SN3cH4v/biFjyMb
         rM+A==
X-Forwarded-Encrypted: i=1; AJvYcCW38Gv+bAz50aIQ0F8ZcB51vHLTu6b0Oq+jxfVl7pYf05eBL7lOx2dKR6ukqvy1kYQLrOWRUM5WJA2MiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQWWiq6U9TQdJ1AS1K9g1txNIcaZrR0zy3tn6+PDwbS7PV310e
	lXcDnQRgA2b4f+4QFXp2u6HUgVfObB6pJu+fl7NZZduzcHpBQemSFxZBswwdtlM=
X-Google-Smtp-Source: AGHT+IFnyAUi+jdFWCp7P3UvK+iLjj8unoHUnQu+ZFU5AeGz5NMnrX1PmfJWm6s1iYa6KBrU206IDA==
X-Received: by 2002:a05:6a00:3a99:b0:70e:ce95:b87 with SMTP id d2e1a72fcca58-715e0d94b8cmr1199293b3a.0.1724893325492;
        Wed, 28 Aug 2024 18:02:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:02:05 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 07/10] selftests: riscv: Add a pointer masking test
Date: Wed, 28 Aug 2024 18:01:29 -0700
Message-ID: <20240829010151.2813377-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180206_722683_03999BA6 
X-CRM114-Status: GOOD (  23.83  )
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

This test covers the behavior of the PR_SET_TAGGED_ADDR_CTRL and
PR_GET_TAGGED_ADDR_CTRL prctl() operations, their effects on the
userspace ABI, and their effects on the system call ABI.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Rename "tags" directory to "pm" to avoid .gitignore rules
 - Add .gitignore file to ignore the compiled selftest binary
 - Write to a pipe to force dereferencing the user pointer
 - Handle SIGSEGV in the child process to reduce dmesg noise

 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/pm/.gitignore   |   1 +
 tools/testing/selftests/riscv/pm/Makefile     |  10 +
 .../selftests/riscv/pm/pointer_masking.c      | 330 ++++++++++++++++++
 4 files changed, 342 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/pm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/pm/Makefile
 create mode 100644 tools/testing/selftests/riscv/pm/pointer_masking.c

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 7ce03d832b64..2ee1d1548c5f 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
+RISCV_SUBTARGETS ?= hwprobe mm pm sigreturn vector
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/pm/.gitignore b/tools/testing/selftests/riscv/pm/.gitignore
new file mode 100644
index 000000000000..b38358f91c4d
--- /dev/null
+++ b/tools/testing/selftests/riscv/pm/.gitignore
@@ -0,0 +1 @@
+pointer_masking
diff --git a/tools/testing/selftests/riscv/pm/Makefile b/tools/testing/selftests/riscv/pm/Makefile
new file mode 100644
index 000000000000..ed82ff9c664e
--- /dev/null
+++ b/tools/testing/selftests/riscv/pm/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += -I$(top_srcdir)/tools/include
+
+TEST_GEN_PROGS := pointer_masking
+
+include ../../lib.mk
+
+$(OUTPUT)/pointer_masking: pointer_masking.c
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/pm/pointer_masking.c b/tools/testing/selftests/riscv/pm/pointer_masking.c
new file mode 100644
index 000000000000..0fe80f963ace
--- /dev/null
+++ b/tools/testing/selftests/riscv/pm/pointer_masking.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <errno.h>
+#include <fcntl.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "../../kselftest.h"
+
+#ifndef PR_PMLEN_SHIFT
+#define PR_PMLEN_SHIFT			24
+#endif
+#ifndef PR_PMLEN_MASK
+#define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
+#endif
+
+static int dev_zero;
+
+static int pipefd[2];
+
+static sigjmp_buf jmpbuf;
+
+static void sigsegv_handler(int sig)
+{
+	siglongjmp(jmpbuf, 1);
+}
+
+static int min_pmlen;
+static int max_pmlen;
+
+static inline bool valid_pmlen(int pmlen)
+{
+	return pmlen == 0 || pmlen == 7 || pmlen == 16;
+}
+
+static void test_pmlen(void)
+{
+	ksft_print_msg("Testing available PMLEN values\n");
+
+	for (int request = 0; request <= 16; request++) {
+		int pmlen, ret;
+
+		ret = prctl(PR_SET_TAGGED_ADDR_CTRL, request << PR_PMLEN_SHIFT, 0, 0, 0);
+		if (ret)
+			goto pr_set_error;
+
+		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
+		ksft_test_result(ret >= 0, "PMLEN=%d PR_GET_TAGGED_ADDR_CTRL\n", request);
+		if (ret < 0)
+			goto pr_get_error;
+
+		pmlen = (ret & PR_PMLEN_MASK) >> PR_PMLEN_SHIFT;
+		ksft_test_result(pmlen >= request, "PMLEN=%d constraint\n", request);
+		ksft_test_result(valid_pmlen(pmlen), "PMLEN=%d validity\n", request);
+
+		if (min_pmlen == 0)
+			min_pmlen = pmlen;
+		if (max_pmlen < pmlen)
+			max_pmlen = pmlen;
+
+		continue;
+
+pr_set_error:
+		ksft_test_result_skip("PMLEN=%d PR_GET_TAGGED_ADDR_CTRL\n", request);
+pr_get_error:
+		ksft_test_result_skip("PMLEN=%d constraint\n", request);
+		ksft_test_result_skip("PMLEN=%d validity\n", request);
+	}
+
+	if (max_pmlen == 0)
+		ksft_exit_fail_msg("Failed to enable pointer masking\n");
+}
+
+static int set_tagged_addr_ctrl(int pmlen, bool tagged_addr_abi)
+{
+	int arg, ret;
+
+	arg = pmlen << PR_PMLEN_SHIFT | tagged_addr_abi;
+	ret = prctl(PR_SET_TAGGED_ADDR_CTRL, arg, 0, 0, 0);
+	if (!ret) {
+		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
+		if (ret == arg)
+			return 0;
+	}
+
+	return ret < 0 ? -errno : -ENODATA;
+}
+
+static void test_dereference_pmlen(int pmlen)
+{
+	static volatile int i;
+	volatile int *p;
+	int ret;
+
+	ret = set_tagged_addr_ctrl(pmlen, false);
+	if (ret)
+		return ksft_test_result_error("PMLEN=%d setup (%d)\n", pmlen, ret);
+
+	i = pmlen;
+
+	if (pmlen) {
+		p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen);
+
+		/* These dereferences should succeed. */
+		if (sigsetjmp(jmpbuf, 1))
+			return ksft_test_result_fail("PMLEN=%d valid tag\n", pmlen);
+		if (*p != pmlen)
+			return ksft_test_result_fail("PMLEN=%d bad value\n", pmlen);
+		*p++;
+	}
+
+	p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen - 1);
+
+	/* These dereferences should raise SIGSEGV. */
+	if (sigsetjmp(jmpbuf, 1))
+		return ksft_test_result_pass("PMLEN=%d dereference\n", pmlen);
+	*p++;
+	ksft_test_result_fail("PMLEN=%d invalid tag\n", pmlen);
+}
+
+static void test_dereference(void)
+{
+	ksft_print_msg("Testing userspace pointer dereference\n");
+
+	signal(SIGSEGV, sigsegv_handler);
+
+	test_dereference_pmlen(0);
+	test_dereference_pmlen(min_pmlen);
+	test_dereference_pmlen(max_pmlen);
+
+	signal(SIGSEGV, SIG_DFL);
+}
+
+static void execve_child_sigsegv_handler(int sig)
+{
+	exit(42);
+}
+
+static int execve_child(void)
+{
+	static volatile int i;
+	volatile int *p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - 7);
+
+	signal(SIGSEGV, execve_child_sigsegv_handler);
+
+	/* This dereference should raise SIGSEGV. */
+	return *p;
+}
+
+static void test_fork_exec(void)
+{
+	int ret, status;
+
+	ksft_print_msg("Testing fork/exec behavior\n");
+
+	ret = set_tagged_addr_ctrl(min_pmlen, false);
+	if (ret)
+		return ksft_test_result_error("setup (%d)\n", ret);
+
+	if (fork()) {
+		wait(&status);
+		ksft_test_result(WIFEXITED(status) && WEXITSTATUS(status) == 42,
+				 "dereference after fork\n");
+	} else {
+		static volatile int i = 42;
+		volatile int *p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - min_pmlen);
+
+		/* This dereference should succeed. */
+		exit(*p);
+	}
+
+	if (fork()) {
+		wait(&status);
+		ksft_test_result(WIFEXITED(status) && WEXITSTATUS(status) == 42,
+				 "dereference after fork+exec\n");
+	} else {
+		/* Will call execve_child(). */
+		execve("/proc/self/exe", (char *const []) { "", NULL }, NULL);
+	}
+}
+
+static void test_tagged_addr_abi_sysctl(void)
+{
+	char value;
+	int fd;
+
+	ksft_print_msg("Testing tagged address ABI sysctl\n");
+
+	fd = open("/proc/sys/abi/tagged_addr_disabled", O_WRONLY);
+	if (fd < 0) {
+		ksft_test_result_skip("failed to open sysctl file\n");
+		ksft_test_result_skip("failed to open sysctl file\n");
+		return;
+	}
+
+	value = '1';
+	pwrite(fd, &value, 1, 0);
+	ksft_test_result(set_tagged_addr_ctrl(min_pmlen, true) == -EINVAL,
+			 "sysctl disabled\n");
+
+	value = '0';
+	pwrite(fd, &value, 1, 0);
+	ksft_test_result(set_tagged_addr_ctrl(min_pmlen, true) == 0,
+			 "sysctl enabled\n");
+
+	set_tagged_addr_ctrl(0, false);
+
+	close(fd);
+}
+
+static void test_tagged_addr_abi_pmlen(int pmlen)
+{
+	int i, *p, ret;
+
+	i = ~pmlen;
+
+	if (pmlen) {
+		p = (int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen);
+
+		ret = set_tagged_addr_ctrl(pmlen, false);
+		if (ret)
+			return ksft_test_result_error("PMLEN=%d ABI disabled setup (%d)\n",
+						      pmlen, ret);
+
+		ret = write(pipefd[1], p, sizeof(*p));
+		if (ret >= 0 || errno != EFAULT)
+			return ksft_test_result_fail("PMLEN=%d ABI disabled write\n", pmlen);
+
+		ret = read(dev_zero, p, sizeof(*p));
+		if (ret >= 0 || errno != EFAULT)
+			return ksft_test_result_fail("PMLEN=%d ABI disabled read\n", pmlen);
+
+		if (i != ~pmlen)
+			return ksft_test_result_fail("PMLEN=%d ABI disabled value\n", pmlen);
+
+		ret = set_tagged_addr_ctrl(pmlen, true);
+		if (ret)
+			return ksft_test_result_error("PMLEN=%d ABI enabled setup (%d)\n",
+						      pmlen, ret);
+
+		ret = write(pipefd[1], p, sizeof(*p));
+		if (ret != sizeof(*p))
+			return ksft_test_result_fail("PMLEN=%d ABI enabled write\n", pmlen);
+
+		ret = read(dev_zero, p, sizeof(*p));
+		if (ret != sizeof(*p))
+			return ksft_test_result_fail("PMLEN=%d ABI enabled read\n", pmlen);
+
+		if (i)
+			return ksft_test_result_fail("PMLEN=%d ABI enabled value\n", pmlen);
+
+		i = ~pmlen;
+	} else {
+		/* The tagged address ABI cannot be enabled when PMLEN == 0. */
+		ret = set_tagged_addr_ctrl(pmlen, true);
+		if (ret != -EINVAL)
+			return ksft_test_result_error("PMLEN=%d ABI setup (%d)\n",
+						      pmlen, ret);
+	}
+
+	p = (int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen - 1);
+
+	ret = write(pipefd[1], p, sizeof(*p));
+	if (ret >= 0 || errno != EFAULT)
+		return ksft_test_result_fail("PMLEN=%d invalid tag write (%d)\n", pmlen, errno);
+
+	ret = read(dev_zero, p, sizeof(*p));
+	if (ret >= 0 || errno != EFAULT)
+		return ksft_test_result_fail("PMLEN=%d invalid tag read\n", pmlen);
+
+	if (i != ~pmlen)
+		return ksft_test_result_fail("PMLEN=%d invalid tag value\n", pmlen);
+
+	ksft_test_result_pass("PMLEN=%d tagged address ABI\n", pmlen);
+}
+
+static void test_tagged_addr_abi(void)
+{
+	ksft_print_msg("Testing tagged address ABI\n");
+
+	test_tagged_addr_abi_pmlen(0);
+	test_tagged_addr_abi_pmlen(min_pmlen);
+	test_tagged_addr_abi_pmlen(max_pmlen);
+}
+
+static struct test_info {
+	unsigned int nr_tests;
+	void (*test_fn)(void);
+} tests[] = {
+	{ .nr_tests = 17 * 3, test_pmlen },
+	{ .nr_tests = 3, test_dereference },
+	{ .nr_tests = 2, test_fork_exec },
+	{ .nr_tests = 2, test_tagged_addr_abi_sysctl },
+	{ .nr_tests = 3, test_tagged_addr_abi },
+};
+
+int main(int argc, char **argv)
+{
+	unsigned int plan = 0;
+	int ret;
+
+	/* Check if this is the child process after execve(). */
+	if (!argv[0][0])
+		return execve_child();
+
+	dev_zero = open("/dev/zero", O_RDWR);
+	if (dev_zero < 0)
+		return 1;
+
+	/* Write to a pipe so the kernel must dereference the buffer pointer. */
+	ret = pipe(pipefd);
+	if (ret)
+		return 1;
+
+	ksft_print_header();
+
+	for (int i = 0; i < ARRAY_SIZE(tests); ++i)
+		plan += tests[i].nr_tests;
+
+	ksft_set_plan(plan);
+
+	for (int i = 0; i < ARRAY_SIZE(tests); ++i)
+		tests[i].test_fn();
+
+	ksft_finished();
+}
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
