Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB67C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHtadRxlQic2+ql6DMk8EIzJGAFFvZ1RmEJkIxLUM0M=; b=rO6iODB6ELx/cT
	iF1CsepuWAXORU64MycLhb15g4dFItpLrV9z2u9Y2C54lSJCJC9QXynxt9O8PfILlrtWR6Fco5I3h
	WF726q+XT6FdoRzhpbVmvrYmMSY2oMsGVYFXqqnVWE/2Ys7I8DmJxXOQ1LZtqNi5IQ/FHJ6xEt+nY
	Cpi9IFWFkDcFCdCwZ0Ladjhi+u7YflvS3WInXDg0B2I8Yg8VBECjEZh12Aka7xGpJtRO1B83ZUzsL
	YvV5sIORuuYP/a9DVcUt+EqOJ6nNWce8FHgdQ3D2Z11lzjWycsztYruPifZAQx0IAoMAfEcEHSPmw
	OdTHsplRW1fI/ZzRfm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNsy-007B1T-02;
	Thu, 06 Apr 2023 11:34:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNsu-007B0L-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 11:34:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45663646CE;
	Thu,  6 Apr 2023 11:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2634C433D2;
	Thu,  6 Apr 2023 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680780871;
	bh=V5BQsr3kjpmrNU85YSATEXJCjRsQghWvapoHfDmbADI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CL2DFiJbpiVUHZyaRsFIKr64609SX2qUMaRuLbfgBNegShercRs9iCTf+yaN78Anc
	 lXdjRVE1CpRpS3YNsW4ERROQe09TUQOhaeYRsKUJdcfSzwr0cMwzTJHgSvK9Zw8RH3
	 2j/Y/C4mCwZTjlq1rPM223zHnR89CcQUDkrZNCXvtzx/HaPVPUEEED0AMp92N5sWss
	 siF6c3QojJ6ujju+qR3B6IwkZWSVxS/DwTwFUM0FS6Jdyd4X+eDwOvEetUPVHs9Iom
	 WI5z0qLtXQjKQJYmDAOFLAD8Q8sX8xhYy06cTsXK7UVbsNXISNk8Zy6sc1dqX4mvnZ
	 f5+Si1Uunj7bA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	nathan@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 4.14 2/7] selftests: sigaltstack: fix -Wuninitialized
Date: Thu,  6 Apr 2023 07:34:16 -0400
Message-Id: <20230406113421.649149-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113421.649149-1-sashal@kernel.org>
References: <20230406113421.649149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_043432_865148_9EBE9F0C 
X-CRM114-Status: GOOD (  14.83  )
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

From: Nick Desaulniers <ndesaulniers@google.com>

[ Upstream commit 05107edc910135d27fe557267dc45be9630bf3dd ]

Building sigaltstack with clang via:
$ ARCH=x86 make LLVM=1 -C tools/testing/selftests/sigaltstack/

produces the following warning:
  warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
  if (sp < (unsigned long)sstack ||
      ^~

Clang expects these to be declared at global scope; we've fixed this in
the kernel proper by using the macro `current_stack_pointer`. This is
defined in different headers for different target architectures, so just
create a new header that defines the arch-specific register names for
the stack pointer register, and define it for more targets (at least the
ones that support current_stack_pointer/ARCH_HAS_CURRENT_STACK_POINTER).

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Link: https://lore.kernel.org/lkml/CA+G9fYsi3OOu7yCsMutpzKDnBMAzJBCPimBp86LhGBa0eCnEpA@mail.gmail.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../sigaltstack/current_stack_pointer.h       | 23 +++++++++++++++++++
 tools/testing/selftests/sigaltstack/sas.c     |  7 +-----
 2 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/sigaltstack/current_stack_pointer.h

diff --git a/tools/testing/selftests/sigaltstack/current_stack_pointer.h b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
new file mode 100644
index 0000000000000..ea9bdf3a90b16
--- /dev/null
+++ b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#if __alpha__
+register unsigned long sp asm("$30");
+#elif __arm__ || __aarch64__ || __csky__ || __m68k__ || __mips__ || __riscv
+register unsigned long sp asm("sp");
+#elif __i386__
+register unsigned long sp asm("esp");
+#elif __loongarch64
+register unsigned long sp asm("$sp");
+#elif __ppc__
+register unsigned long sp asm("r1");
+#elif __s390x__
+register unsigned long sp asm("%15");
+#elif __sh__
+register unsigned long sp asm("r15");
+#elif __x86_64__
+register unsigned long sp asm("rsp");
+#elif __XTENSA__
+register unsigned long sp asm("a1");
+#else
+#error "implement current_stack_pointer equivalent"
+#endif
diff --git a/tools/testing/selftests/sigaltstack/sas.c b/tools/testing/selftests/sigaltstack/sas.c
index 228c2ae47687d..6069d97bf5063 100644
--- a/tools/testing/selftests/sigaltstack/sas.c
+++ b/tools/testing/selftests/sigaltstack/sas.c
@@ -19,6 +19,7 @@
 #include <errno.h>
 
 #include "../kselftest.h"
+#include "current_stack_pointer.h"
 
 #ifndef SS_AUTODISARM
 #define SS_AUTODISARM  (1U << 31)
@@ -40,12 +41,6 @@ void my_usr1(int sig, siginfo_t *si, void *u)
 	stack_t stk;
 	struct stk_data *p;
 
-#if __s390x__
-	register unsigned long sp asm("%15");
-#else
-	register unsigned long sp asm("sp");
-#endif
-
 	if (sp < (unsigned long)sstack ||
 			sp >= (unsigned long)sstack + SIGSTKSZ) {
 		ksft_exit_fail_msg("SP is not on sigaltstack\n");
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
