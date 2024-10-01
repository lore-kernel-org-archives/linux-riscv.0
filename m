Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D8ECEACEE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=769pre3U57W/Bl+1iXwZwj3zjrObR7Hwzux18yLGp4M=; b=rL3OF9jCBIfewH
	/IOinS7n2lpo9JtixMpfwwBLK9+IfZkJfDz4JI1h+FGSqn6A0IG4mP8DYDoTM6g3y23VL6GgFZFWj
	27ADn+9Ll6EXzkNV/adw6ta7qtnyRzw7EPRaeVYfvXno7ekhoZ3/gpHIN7WOUYdUHy/dYqlW77XKD
	SKmnOgivwROBYIWZ4rDyodNXVMaJ8lPPTNl8a5l3OG7+UfYODPZ0sKGIV7pfGGcmmyCg59CvKesku
	ZWCNMk4/eKLme6Bv/Wdby8OmqEqsQ1DlMNYqjhKSYaPDiiR+39KkCcy3DN3WInVUuD3AoqbtgSyPE
	xI8m+D1jdDXD0qycyVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgir-00000003fEt-3q7E;
	Tue, 01 Oct 2024 17:31:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQQ-00000003RmA-3jIk
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Oct 2024 16:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+7AY89VLdRvm3rOEfUxECD0x4KyucTXFJokv/01dAQg=; b=NE1nn0iK3eqdJXRM9N1FVSTqZ/
	5wSsJWedX9zQ9x6QDjNUC7n3Y69FNY4/BhUAYTULqJweb2qrgBVYowSYlHXnTWLVtM1K9C48+hL1b
	ueBZ4LoRD8BfIXRWA45vKMMiD4v/jGiNv0euhecephDq2bkBRB7gHEy54A35jzNdSnqk4bN16rt0Z
	C/TDTI+lb134Vm/3RmvaW2En8+zbt4OUY2IMjG2Ca+7pCKOou/7kbahQDNSsNoW+kfC8v1KYICZYu
	+fFfFXtN8Y8keC9W5FHuAjO7BYxbWPXmG3Jl5QZyQ0F8/z9qD/28xdo7lM70nOAksymhfuHCRjnUb
	mM2NuCnw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQM-00000003CDn-4267
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20ba6b39a78so12514255ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798908; x=1728403708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7AY89VLdRvm3rOEfUxECD0x4KyucTXFJokv/01dAQg=;
        b=faq3QU2Br4qSLILS6sZHzifFxF7MZEnX713+PepHQUt6JBn6aamFhs0BRoxH8EA1C0
         MhsNk2FX0N2RWqBw9Qy2CDf+A3Tfz9Czk/Yg8izL1aqi/1T+jHph7i6wAO+iUg7gB3gl
         oyxxU0JcEYgvQ9Ib/ogHKFpRw0kNgtByltzZL12A5Y8GAiKfNidCNHh45AXuz9AE96y7
         4jJWS2G5t7Kor2duANf0ZweTQyLjCn+/1+mcdWGT6vO+eMTFpJg/qr2EJ6kMorntE34R
         iO3GepRYLbp3RuS4dJNH1sQ6Md6gvlmCcuIwbfyt6F5a1l+YkXQryL4Jt/KGyG9H8uh/
         +4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798908; x=1728403708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7AY89VLdRvm3rOEfUxECD0x4KyucTXFJokv/01dAQg=;
        b=Mh7MgpE3qe4cSD2+MSCmbwtxwUOIiAeY7oHCFve+pX8iAXdu6NIF/BRko+JQ4lT//8
         zxjHFgk7KgElvV3d3QX4EyTE5pau3XhgNo3rhoRm4y/icvMgToRwqPoggitUkajm1LO9
         qN2gOHh9xXrgqElp+k/7tUCNRWnVnvn6kkZjF+lepEoFbD6nXewhDmOqCWou1Fz/T4wc
         34aPmZ2ANL11R1x1rix4z3fglFzngWKxa7jmL05kcfYBJEo50UdRPZ3qy+yTgTzrg4o/
         0eVfAivTEWBx3mrFfuGi3VL+x2Lg/QR/DaJclKXn3McHGmAQkxkw0O6GD4YuW+icq/NO
         V+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpkR6iL6SUmsAunWOUwno3OH06qS6dPPO9RIsmRESxeaTXhUU1eVwFBS2fhRIlIzmECXVJDU7njJQZfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB9sLVpiQzV7hF8nKPIHkLnwAVNohQ90GhbJf+eECM5BMGpktg
	PxB6mAaf/Krb4y9y3yCNCCWptRGXjtDfQTGlEu8znQ0GVQvV5AUlTiv8YGaZs6k=
X-Google-Smtp-Source: AGHT+IESwlV/P+Xn7LHT+0O4twld/g+xo1FbeMyT3YnCkcbo1lz2445d7k3qW7OogumJ7xfjjia5hQ==
X-Received: by 2002:a17:90b:3a86:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2e184814fabmr237995a91.22.1727798907977;
        Tue, 01 Oct 2024 09:08:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:38 -0700
Subject: [PATCH 33/33] kselftest/riscv: kselftest for user mode cfi
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-33-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_170831_162744_860D54FB 
X-CRM114-Status: GOOD (  26.07  )
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

Adds kselftest for RISC-V control flow integrity implementation for user
mode. There is not a lot going on in kernel for enabling landing pad for
user mode. cfi selftest are intended to be compiled with zicfilp and
zicfiss enabled compiler. Thus kselftest simply checks if landing pad and
shadow stack for the binary and process are enabled or not. selftest then
register a signal handler for SIGSEGV. Any control flow violation are
reported as SIGSEGV with si_code = SEGV_CPERR. Test will fail on receiving
any SEGV_CPERR. Shadow stack part has more changes in kernel and thus there
are separate tests for that
	- Exercise `map_shadow_stack` syscall
	- `fork` test to make sure COW works for shadow stack pages
	- gup tests
	  As of today kernel uses FOLL_FORCE when access happens to memory via
	  /proc/<pid>/mem. Not breaking that for shadow stack
	- signal test. Make sure signal delivery results in token creation on
      shadow stack and consumes (and verifies) token on sigreturn
    - shadow stack protection test. attempts to write using regular store
	  instruction on shadow stack memory must result in access faults

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/cfi/.gitignore       |   3 +
 tools/testing/selftests/riscv/cfi/Makefile         |  10 +
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  83 +++++
 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c |  82 +++++
 tools/testing/selftests/riscv/cfi/shadowstack.c    | 362 +++++++++++++++++++++
 tools/testing/selftests/riscv/cfi/shadowstack.h    |  37 +++
 7 files changed, 578 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 7ce03d832b64..6e142fe004ab 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
+RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn cfi
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/cfi/.gitignore b/tools/testing/selftests/riscv/cfi/.gitignore
new file mode 100644
index 000000000000..ce7623f9da28
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/.gitignore
@@ -0,0 +1,3 @@
+cfitests
+riscv_cfi_test
+shadowstack
\ No newline at end of file
diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
new file mode 100644
index 000000000000..b65f7ff38a32
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -0,0 +1,10 @@
+CFLAGS += -I$(top_srcdir)/tools/include
+
+CFLAGS += -march=rv64gc_zicfilp_zicfiss
+
+TEST_GEN_PROGS := cfitests
+
+include ../../lib.mk
+
+$(OUTPUT)/cfitests: riscv_cfi_test.c shadowstack.c
+	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
new file mode 100644
index 000000000000..fa1cf7183672
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef SELFTEST_RISCV_CFI_H
+#define SELFTEST_RISCV_CFI_H
+#include <stddef.h>
+#include <sys/types.h>
+#include "shadowstack.h"
+
+#define RISCV_CFI_SELFTEST_COUNT RISCV_SHADOW_STACK_TESTS
+
+#define CHILD_EXIT_CODE_SSWRITE		10
+#define CHILD_EXIT_CODE_SIG_TEST	11
+
+#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)		\
+({															\
+	register long _num  __asm__ ("a7") = (num);				\
+	register long _arg1 __asm__ ("a0") = (long)(arg1);		\
+	register long _arg2 __asm__ ("a1") = (long)(arg2);		\
+	register long _arg3 __asm__ ("a2") = (long)(arg3);		\
+	register long _arg4 __asm__ ("a3") = (long)(arg4);		\
+	register long _arg5 __asm__ ("a4") = (long)(arg5);		\
+															\
+	__asm__ volatile (										\
+		"ecall\n"											\
+		: "+r"(_arg1)										\
+		: "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5),	\
+		  "r"(_num)											\
+		: "memory", "cc"									\
+	);														\
+	_arg1;													\
+})
+
+#define my_syscall3(num, arg1, arg2, arg3)					\
+({															\
+	register long _num  __asm__ ("a7") = (num);				\
+	register long _arg1 __asm__ ("a0") = (long)(arg1);		\
+	register long _arg2 __asm__ ("a1") = (long)(arg2);		\
+	register long _arg3 __asm__ ("a2") = (long)(arg3);		\
+															\
+	__asm__ volatile (										\
+		"ecall\n"											\
+		: "+r"(_arg1)										\
+		: "r"(_arg2), "r"(_arg3),							\
+		  "r"(_num)											\
+		: "memory", "cc"									\
+	);														\
+	_arg1;													\
+})
+
+#ifndef __NR_prctl
+#define __NR_prctl 167
+#endif
+
+#ifndef __NR_map_shadow_stack
+#define __NR_map_shadow_stack 453
+#endif
+
+#define CSR_SSP 0x011
+
+#ifdef __ASSEMBLY__
+#define __ASM_STR(x)    x
+#else
+#define __ASM_STR(x)    #x
+#endif
+
+#define csr_read(csr)									\
+({														\
+	register unsigned long __v;							\
+	__asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)	\
+						  : "=r" (__v) :				\
+						  : "memory");					\
+	__v;												\
+})
+
+#define csr_write(csr, val)								\
+({														\
+	unsigned long __v = (unsigned long) (val);			\
+	__asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"	\
+						  : : "rK" (__v)				\
+						  : "memory");					\
+})
+
+#endif
diff --git a/tools/testing/selftests/riscv/cfi/riscv_cfi_test.c b/tools/testing/selftests/riscv/cfi/riscv_cfi_test.c
new file mode 100644
index 000000000000..f22b3f0f24de
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/riscv_cfi_test.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "../../kselftest.h"
+#include <signal.h>
+#include <asm/ucontext.h>
+#include <linux/prctl.h>
+#include "cfi_rv_test.h"
+
+/* do not optimize cfi related test functions */
+#pragma GCC push_options
+#pragma GCC optimize("O0")
+
+void sigsegv_handler(int signum, siginfo_t *si, void *uc)
+{
+	struct ucontext *ctx = (struct ucontext *) uc;
+
+	if (si->si_code == SEGV_CPERR) {
+		printf("Control flow violation happened somewhere\n");
+		printf("pc where violation happened %lx\n", ctx->uc_mcontext.gregs[0]);
+		exit(-1);
+	}
+
+	printf("In sigsegv handler\n");
+	/* all other cases are expected to be of shadow stack write case */
+	exit(CHILD_EXIT_CODE_SSWRITE);
+}
+
+bool register_signal_handler(void)
+{
+	struct sigaction sa = {};
+
+	sa.sa_sigaction = sigsegv_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, NULL)) {
+		printf("registering signal handler for landing pad violation failed\n");
+		return false;
+	}
+
+	return true;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret = 0;
+	unsigned long lpad_status = 0, ss_status = 0;
+
+	ksft_print_header();
+
+	ksft_set_plan(RISCV_CFI_SELFTEST_COUNT);
+
+	ksft_print_msg("starting risc-v tests\n");
+
+	/*
+	 * Landing pad test. Not a lot of kernel changes to support landing
+	 * pad for user mode except lighting up a bit in senvcfg via a prctl
+	 * Enable landing pad through out the execution of test binary
+	 */
+	ret = my_syscall5(__NR_prctl, PR_GET_INDIR_BR_LP_STATUS, &lpad_status, 0, 0, 0);
+	if (ret)
+		ksft_exit_skip("Get landing pad status failed with %d\n", ret);
+
+	if (!(lpad_status & PR_INDIR_BR_LP_ENABLE))
+		ksft_exit_skip("landing pad is not enabled, should be enabled via glibc\n");
+
+	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_status, 0, 0, 0);
+	if (ret)
+		ksft_exit_skip("Get shadow stack failed with %d\n", ret);
+
+	if (!(ss_status & PR_SHADOW_STACK_ENABLE))
+		ksft_exit_skip("shadow stack is not enabled, should be enabled via glibc\n");
+
+	if (!register_signal_handler())
+		ksft_exit_skip("registering signal handler for SIGSEGV failed\n");
+
+	ksft_print_msg("landing pad and shadow stack are enabled for binary\n");
+	ksft_print_msg("starting risc-v shadow stack tests\n");
+	execute_shadow_stack_tests();
+
+	ksft_finished();
+}
+
+#pragma GCC pop_options
diff --git a/tools/testing/selftests/riscv/cfi/shadowstack.c b/tools/testing/selftests/riscv/cfi/shadowstack.c
new file mode 100644
index 000000000000..2f65eb970c44
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shadowstack.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "../../kselftest.h"
+#include <sys/wait.h>
+#include <signal.h>
+#include <fcntl.h>
+#include <asm-generic/unistd.h>
+#include <sys/mman.h>
+#include "shadowstack.h"
+#include "cfi_rv_test.h"
+
+/* do not optimize shadow stack related test functions */
+#pragma GCC push_options
+#pragma GCC optimize("O0")
+
+void zar(void)
+{
+	unsigned long ssp = 0;
+
+	ssp = csr_read(CSR_SSP);
+	printf("inside %s and shadow stack ptr is %lx\n", __func__, ssp);
+}
+
+void bar(void)
+{
+	printf("inside %s\n", __func__);
+	zar();
+}
+
+void foo(void)
+{
+	printf("inside %s\n", __func__);
+	bar();
+}
+
+void zar_child(void)
+{
+	unsigned long ssp = 0;
+
+	ssp = csr_read(CSR_SSP);
+	printf("inside %s and shadow stack ptr is %lx\n", __func__, ssp);
+}
+
+void bar_child(void)
+{
+	printf("inside %s\n", __func__);
+	zar_child();
+}
+
+void foo_child(void)
+{
+	printf("inside %s\n", __func__);
+	bar_child();
+}
+
+typedef void (call_func_ptr)(void);
+/*
+ * call couple of functions to test push pop.
+ */
+int shadow_stack_call_tests(call_func_ptr fn_ptr, bool parent)
+{
+	if (parent)
+		printf("call test for parent\n");
+	else
+		printf("call test for child\n");
+
+	(fn_ptr)();
+
+	return 0;
+}
+
+/* forks a thread, and ensure shadow stacks fork out */
+bool shadow_stack_fork_test(unsigned long test_num, void *ctx)
+{
+	int pid = 0, child_status = 0, parent_pid = 0, ret = 0;
+	unsigned long ss_status = 0;
+
+	printf("exercising shadow stack fork test\n");
+
+	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_status, 0, 0, 0);
+	if (ret) {
+		printf("shadow stack get status prctl failed with errorcode %d\n", ret);
+		return false;
+	}
+
+	if (!(ss_status & PR_SHADOW_STACK_ENABLE))
+		ksft_exit_skip("shadow stack is not enabled, should be enabled via glibc\n");
+
+	parent_pid = getpid();
+	pid = fork();
+
+	if (pid) {
+		printf("Parent pid %d and child pid %d\n", parent_pid, pid);
+		shadow_stack_call_tests(&foo, true);
+	} else
+		shadow_stack_call_tests(&foo_child, false);
+
+	if (pid) {
+		printf("waiting on child to finish\n");
+		wait(&child_status);
+	} else {
+		/* exit child gracefully */
+		exit(0);
+	}
+
+	if (pid && WIFSIGNALED(child_status)) {
+		printf("child faulted");
+		return false;
+	}
+
+	return true;
+}
+
+/* exercise `map_shadow_stack`, pivot to it and call some functions to ensure it works */
+#define SHADOW_STACK_ALLOC_SIZE 4096
+bool shadow_stack_map_test(unsigned long test_num, void *ctx)
+{
+	unsigned long shdw_addr;
+	int ret = 0;
+
+	shdw_addr = my_syscall3(__NR_map_shadow_stack, NULL, SHADOW_STACK_ALLOC_SIZE, 0);
+
+	if (((long) shdw_addr) <= 0) {
+		printf("map_shadow_stack failed with error code %d\n", (int) shdw_addr);
+		return false;
+	}
+
+	ret = munmap((void *) shdw_addr, SHADOW_STACK_ALLOC_SIZE);
+
+	if (ret) {
+		printf("munmap failed with error code %d\n", ret);
+		return false;
+	}
+
+	return true;
+}
+
+/*
+ * shadow stack protection tests. map a shadow stack and
+ * validate all memory protections work on it
+ */
+bool shadow_stack_protection_test(unsigned long test_num, void *ctx)
+{
+	unsigned long shdw_addr;
+	unsigned long *write_addr = NULL;
+	int ret = 0, pid = 0, child_status = 0;
+
+	shdw_addr = my_syscall3(__NR_map_shadow_stack, NULL, SHADOW_STACK_ALLOC_SIZE, 0);
+
+	if (((long) shdw_addr) <= 0) {
+		printf("map_shadow_stack failed with error code %d\n", (int) shdw_addr);
+		return false;
+	}
+
+	write_addr = (unsigned long *) shdw_addr;
+	pid = fork();
+
+	/* no child was created, return false */
+	if (pid == -1)
+		return false;
+
+	/*
+	 * try to perform a store from child on shadow stack memory
+	 * it should result in SIGSEGV
+	 */
+	if (!pid) {
+		/* below write must lead to SIGSEGV */
+		*write_addr = 0xdeadbeef;
+	} else {
+		wait(&child_status);
+	}
+
+	/* test fail, if 0xdeadbeef present on shadow stack address */
+	if (*write_addr == 0xdeadbeef) {
+		printf("write suceeded\n");
+		return false;
+	}
+
+	/* if child reached here, then fail */
+	if (!pid) {
+		printf("child reached unreachable state\n");
+		return false;
+	}
+
+	/* if child exited via signal handler but not for write on ss */
+	if (WIFEXITED(child_status) &&
+		WEXITSTATUS(child_status) != CHILD_EXIT_CODE_SSWRITE) {
+		printf("child wasn't signaled for write on shadow stack\n");
+		return false;
+	}
+
+	ret = munmap(write_addr, SHADOW_STACK_ALLOC_SIZE);
+	if (ret) {
+		printf("munmap failed with error code %d\n", ret);
+		return false;
+	}
+
+	return true;
+}
+
+#define SS_MAGIC_WRITE_VAL 0xbeefdead
+
+int gup_tests(int mem_fd, unsigned long *shdw_addr)
+{
+	unsigned long val = 0;
+
+	lseek(mem_fd, (unsigned long)shdw_addr, SEEK_SET);
+	if (read(mem_fd, &val, sizeof(val)) < 0) {
+		printf("reading shadow stack mem via gup failed\n");
+		return 1;
+	}
+
+	val = SS_MAGIC_WRITE_VAL;
+	lseek(mem_fd, (unsigned long)shdw_addr, SEEK_SET);
+	if (write(mem_fd, &val, sizeof(val)) < 0) {
+		printf("writing shadow stack mem via gup failed\n");
+		return 1;
+	}
+
+	if (*shdw_addr != SS_MAGIC_WRITE_VAL) {
+		printf("GUP write to shadow stack memory didn't happen\n");
+		return 1;
+	}
+
+	return 0;
+}
+
+bool shadow_stack_gup_tests(unsigned long test_num, void *ctx)
+{
+	unsigned long shdw_addr = 0;
+	unsigned long *write_addr = NULL;
+	int fd = 0;
+	bool ret = false;
+
+	shdw_addr = my_syscall3(__NR_map_shadow_stack, NULL, SHADOW_STACK_ALLOC_SIZE, 0);
+
+	if (((long) shdw_addr) <= 0) {
+		printf("map_shadow_stack failed with error code %d\n", (int) shdw_addr);
+		return false;
+	}
+
+	write_addr = (unsigned long *) shdw_addr;
+
+	fd = open("/proc/self/mem", O_RDWR);
+	if (fd == -1)
+		return false;
+
+	if (gup_tests(fd, write_addr)) {
+		printf("gup tests failed\n");
+		goto out;
+	}
+
+	ret = true;
+out:
+	if (shdw_addr && munmap(write_addr, SHADOW_STACK_ALLOC_SIZE)) {
+		printf("munmap failed with error code %d\n", ret);
+		ret = false;
+	}
+
+	return ret;
+}
+
+volatile bool break_loop;
+
+void sigusr1_handler(int signo)
+{
+	printf("In sigusr1 handler\n");
+	break_loop = true;
+}
+
+bool sigusr1_signal_test(void)
+{
+	struct sigaction sa = {};
+
+	sa.sa_handler = sigusr1_handler;
+	sa.sa_flags = 0;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(SIGUSR1, &sa, NULL)) {
+		printf("registering signal handler for SIGUSR1 failed\n");
+		return false;
+	}
+
+	return true;
+}
+/*
+ * shadow stack signal test. shadow stack must be enabled.
+ * register a signal, fork another thread which is waiting
+ * on signal. Send a signal from parent to child, verify
+ * that signal was received by child. If not test fails
+ */
+bool shadow_stack_signal_test(unsigned long test_num, void *ctx)
+{
+	int pid = 0, child_status = 0, ret = 0;
+	unsigned long ss_status = 0;
+
+	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_status, 0, 0, 0);
+	if (ret) {
+		printf("shadow stack get status prctl failed with errorcode %d\n", ret);
+		return false;
+	}
+
+	if (!(ss_status & PR_SHADOW_STACK_ENABLE))
+		ksft_exit_skip("shadow stack is not enabled, should be enabled via glibc\n");
+
+	/* this should be caught by signal handler and do an exit */
+	if (!sigusr1_signal_test()) {
+		printf("registering sigusr1 handler failed\n");
+		exit(-1);
+	}
+
+	pid = fork();
+
+	if (pid == -1) {
+		printf("signal test: fork failed\n");
+		goto out;
+	}
+
+	if (pid == 0) {
+		while (!break_loop)
+			sleep(1);
+
+		exit(11);
+		/* child shouldn't go beyond here */
+	}
+
+	/* send SIGUSR1 to child */
+	kill(pid, SIGUSR1);
+	wait(&child_status);
+
+out:
+
+	return (WIFEXITED(child_status) &&
+			WEXITSTATUS(child_status) == 11);
+}
+
+int execute_shadow_stack_tests(void)
+{
+	int ret = 0;
+	unsigned long test_count = 0;
+	unsigned long shstk_status = 0;
+
+	printf("Executing RISC-V shadow stack self tests\n");
+
+	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &shstk_status, 0, 0, 0);
+
+	if (ret != 0)
+		ksft_exit_skip("Get shadow stack status failed with %d\n", ret);
+
+	/*
+	 * If we are here that means get shadow stack status succeeded and
+	 * thus shadow stack support is baked in the kernel.
+	 */
+	while (test_count < ARRAY_SIZE(shstk_tests)) {
+		ksft_test_result((*shstk_tests[test_count].t_func)(test_count, NULL),
+						 shstk_tests[test_count].name);
+		test_count++;
+	}
+
+	return 0;
+}
+
+#pragma GCC pop_options
diff --git a/tools/testing/selftests/riscv/cfi/shadowstack.h b/tools/testing/selftests/riscv/cfi/shadowstack.h
new file mode 100644
index 000000000000..b43e74136a26
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shadowstack.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef SELFTEST_SHADOWSTACK_TEST_H
+#define SELFTEST_SHADOWSTACK_TEST_H
+#include <stddef.h>
+#include <linux/prctl.h>
+
+/*
+ * a cfi test returns true for success or false for fail
+ * takes a number for test number to index into array and void pointer.
+ */
+typedef bool (*shstk_test_func)(unsigned long test_num, void *);
+
+struct shadow_stack_tests {
+	char *name;
+	shstk_test_func t_func;
+};
+
+bool shadow_stack_fork_test(unsigned long test_num, void *ctx);
+bool shadow_stack_map_test(unsigned long test_num, void *ctx);
+bool shadow_stack_protection_test(unsigned long test_num, void *ctx);
+bool shadow_stack_gup_tests(unsigned long test_num, void *ctx);
+bool shadow_stack_signal_test(unsigned long test_num, void *ctx);
+
+static struct shadow_stack_tests shstk_tests[] = {
+	{ "shstk fork test\n", shadow_stack_fork_test },
+	{ "map shadow stack syscall\n", shadow_stack_map_test },
+	{ "shadow stack gup tests\n", shadow_stack_gup_tests },
+	{ "shadow stack signal tests\n", shadow_stack_signal_test},
+	{ "memory protections of shadow stack memory\n", shadow_stack_protection_test }
+};
+
+#define RISCV_SHADOW_STACK_TESTS ARRAY_SIZE(shstk_tests)
+
+int execute_shadow_stack_tests(void);
+
+#endif

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
