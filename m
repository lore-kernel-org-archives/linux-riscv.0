Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1628BC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wi7nPFxN7RxUgs0Fzgz1CZxsaks8kZhqBD4T1aSJUvk=; b=XC4GsYO7YJmeLyk2Zka+jIFscH
	ZqbGyLpfwSjWAqAnCLOvcfsfw6PKd41kV31pUO7JQYHtpPAcg/ysrizii59WRLJz0Gnr76Pn6m3hq
	UyKv/DMwzt9o2LET3EVnvs2JC7m7g6knNLSj1zn1OPKXfkXzflpww/jjZ2JkFH8bNUMKue8n/9GPr
	UBHbpI4p5ooXoC5TgAGqKuQVlB5912UHyUXIT5Awc9cD/n0oASpvZUw8OSkhJlFV5GD6UDz1SAyMJ
	c60QmrZSBIDKoo7NZze1UXnaT2zpR7/IHD9qaNaz3iSKHGRCpRaDtVOzSprhjJLO8Ztxm7sC85QVG
	Dlh5z+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3W-00000003ksF-1sig;
	Fri, 10 May 2024 02:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsC-00000003OsL-2RCz
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dP5x9YOIiWmwRjQ2T8C8Utp6h4HpQk+9UqTSGSzUZhY=; b=aqm+WcA70EYPHLZOUThMMpxvfO
	jcBAfuaRXe3Q8xsoWFeOWkiK6AzjnNLR/ZwTXvv8NFFEX8Bws5PAmy2QcFkg6cbOIWcRHuX4mk/5w
	qMw7kvYYBhe4xwOevkoNR3/IrfnIVkfrKmC2uzbmodcKK4gYvM/XDMuY+FK0iwDn2vxwb3/86Zbd7
	0zdhIeyr67B4ucBC3y1k6zeh868a2CO60Ho8NPJuBendy1WVls+HETJEzPN6qsWJiEnJYhQ2AZofG
	/LqKRCFtf3TLfJfEChWsJmf2W+c7Gvqv/uzt4kQwBcy3vLtIxacRdlqNucuekXiloU6RG2VRRTmZJ
	1+jDGahg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ds1-000000036TK-3yqo
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:26 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f452eb2035so1501259b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299935; x=1715904735; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dP5x9YOIiWmwRjQ2T8C8Utp6h4HpQk+9UqTSGSzUZhY=;
        b=oVBG7pKGyqurpmLrpscx9WQN2dZPh37t7zsxnKwYJS3eUwh9rkEX6BdN5cpoud7+hj
         YJ+PYKtyDu4CDdfaFflvVC45UEVhmEVA/nvGg7ck+3wzeuq6N8AanULbpqgfXyN+u4KD
         wGwlA2jRYGKPsP/XT1r/tW18A8eL6l4rkYkwsm3YLnG0HSrE/X5Ah8jQw5F05J14x8eJ
         SrbLfsISLWP0qnaYPF8wPK52T/Os4T2tRdKJzP1um7HHkQPmjkJm2pbRLf3xKGN3N81R
         /y/nOz3/q+PzEAnZpHfoY3oFHTplCCP7pts8H+qT954oFSSK/FFodsRGNMvK/OhYCD7c
         St+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299935; x=1715904735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dP5x9YOIiWmwRjQ2T8C8Utp6h4HpQk+9UqTSGSzUZhY=;
        b=MBOABmEpM/mH4p+pEIsOSjZXfOBk05pzsGkoyrNM0yZQVoEy3THacwWmnnUVbWSKG1
         /t34mEP5ym7MgSSIhuLQk+5IGervoyFdACqwfS6uS+qz6GJWNWpoAxAHEpYhUazUUaB3
         Y6cw5uQvgbTvVmes8a1QTWxx0E+4hBByZxlbtKFs2BiUI+71BeQYOzgLMPUkmJWtIAbz
         BBdpiichWCWi9aQrV2xIe301GRyZxFOVFjXzGzAaEtIR/6+ihZfoaaupqCQEt169icT1
         9d2ksl6PmvXap19+WJO858yL53MTPRuxzWZZWwhKDI/qb1Anh+6cJXAjkCydejC6RiKT
         Ok+w==
X-Forwarded-Encrypted: i=1; AJvYcCVnwGtLE9/mCwnp3yA4OxZMz3+jUgOGATGs5uKFyQLyAVF5DHcTTG0aDvRBpkqicS/KOWKeNyrQJr52fzE3QzrsRi0lXKtLC3u7gkbEyjPJ
X-Gm-Message-State: AOJu0YwlC+T+6F0gNh0vis9NGOMPAmp4q+CfrxkJdO7qhkUaY+8h56sK
	UUJzxHxxZ02Wx1HRmPpLbAyHytDKAcOl1aXnuE37m4/e0FhhMMAI00QqoUa7rb4Nc8IAE4X7RcT
	fzA==
X-Google-Smtp-Source: AGHT+IFBHni2Nv0A8DlWmj9DpZJt3u89EmQeqTLLe/7XrenXhu+szXx9QYFJHIOL95+00ZEp58qkx/0KjzU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:1405:b0:6f3:f514:ec1c with SMTP id
 d2e1a72fcca58-6f4e02684bbmr14065b3a.1.1715299934888; Thu, 09 May 2024
 17:12:14 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:23 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-67-edliaw@google.com>
Subject: [PATCH v4 66/66] selftests/x86: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011222_982901_18FF2DB0 
X-CRM114-Status: GOOD (  16.00  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Drop #define __USE_GNU too, as it is bad practice and the GNU extensions
aren't actually being used in test_FCMOV, etc. where it is being defined.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/x86/amx.c                     | 2 --
 tools/testing/selftests/x86/check_initial_reg_state.c | 3 ---
 tools/testing/selftests/x86/corrupt_xstate_header.c   | 3 ---
 tools/testing/selftests/x86/entry_from_vm86.c         | 3 ---
 tools/testing/selftests/x86/fsgsbase.c                | 2 --
 tools/testing/selftests/x86/fsgsbase_restore.c        | 2 --
 tools/testing/selftests/x86/ioperm.c                  | 2 --
 tools/testing/selftests/x86/iopl.c                    | 2 --
 tools/testing/selftests/x86/lam.c                     | 1 -
 tools/testing/selftests/x86/ldt_gdt.c                 | 2 --
 tools/testing/selftests/x86/mov_ss_trap.c             | 2 --
 tools/testing/selftests/x86/nx_stack.c                | 2 --
 tools/testing/selftests/x86/ptrace_syscall.c          | 2 --
 tools/testing/selftests/x86/sigaltstack.c             | 2 --
 tools/testing/selftests/x86/sigreturn.c               | 3 ---
 tools/testing/selftests/x86/single_step_syscall.c     | 3 ---
 tools/testing/selftests/x86/syscall_arg_fault.c       | 3 ---
 tools/testing/selftests/x86/syscall_numbering.c       | 3 ---
 tools/testing/selftests/x86/sysret_rip.c              | 3 ---
 tools/testing/selftests/x86/sysret_ss_attrs.c         | 3 ---
 tools/testing/selftests/x86/test_FCMOV.c              | 4 ----
 tools/testing/selftests/x86/test_FCOMI.c              | 4 ----
 tools/testing/selftests/x86/test_FISTTP.c             | 4 ----
 tools/testing/selftests/x86/test_mremap_vdso.c        | 1 -
 tools/testing/selftests/x86/test_shadow_stack.c       | 3 ---
 tools/testing/selftests/x86/test_syscall_vdso.c       | 4 ----
 tools/testing/selftests/x86/test_vsyscall.c           | 3 ---
 tools/testing/selftests/x86/unwind_vdso.c             | 3 ---
 tools/testing/selftests/x86/vdso_restorer.c           | 3 ---
 29 files changed, 77 deletions(-)

diff --git a/tools/testing/selftests/x86/amx.c b/tools/testing/selftests/x86/amx.c
index 95aad6d8849b..3259362a7117 100644
--- a/tools/testing/selftests/x86/amx.c
+++ b/tools/testing/selftests/x86/amx.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <err.h>
 #include <errno.h>
 #include <pthread.h>
diff --git a/tools/testing/selftests/x86/check_initial_reg_state.c b/tools/testing/selftests/x86/check_initial_reg_state.c
index 3bc95f3ed585..0129cdae8abe 100644
--- a/tools/testing/selftests/x86/check_initial_reg_state.c
+++ b/tools/testing/selftests/x86/check_initial_reg_state.c
@@ -3,9 +3,6 @@
  * check_initial_reg_state.c - check that execve sets the correct state
  * Copyright (c) 2014-2016 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 
 unsigned long ax, bx, cx, dx, si, di, bp, sp, flags;
diff --git a/tools/testing/selftests/x86/corrupt_xstate_header.c b/tools/testing/selftests/x86/corrupt_xstate_header.c
index cf9ce8fbb656..d2c746149678 100644
--- a/tools/testing/selftests/x86/corrupt_xstate_header.c
+++ b/tools/testing/selftests/x86/corrupt_xstate_header.c
@@ -4,9 +4,6 @@
  *
  * Based on analysis and a test case from Thomas Gleixner.
  */
-
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/entry_from_vm86.c b/tools/testing/selftests/x86/entry_from_vm86.c
index d1e919b0c1dc..9fa9d4a847ac 100644
--- a/tools/testing/selftests/x86/entry_from_vm86.c
+++ b/tools/testing/selftests/x86/entry_from_vm86.c
@@ -5,9 +5,6 @@
  *
  * This exercises a few paths that need to special-case vm86 mode.
  */
-
-#define _GNU_SOURCE
-
 #include <assert.h>
 #include <stdlib.h>
 #include <sys/syscall.h>
diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
index 8c780cce941d..348134d2cefc 100644
--- a/tools/testing/selftests/x86/fsgsbase.c
+++ b/tools/testing/selftests/x86/fsgsbase.c
@@ -3,8 +3,6 @@
  * fsgsbase.c, an fsgsbase test
  * Copyright (c) 2014-2016 Andy Lutomirski
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/x86/fsgsbase_restore.c b/tools/testing/selftests/x86/fsgsbase_restore.c
index 6fffadc51579..88dce47ab8e6 100644
--- a/tools/testing/selftests/x86/fsgsbase_restore.c
+++ b/tools/testing/selftests/x86/fsgsbase_restore.c
@@ -12,8 +12,6 @@
  *
  * This is not part of fsgsbase.c, because that test is 64-bit only.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/x86/ioperm.c b/tools/testing/selftests/x86/ioperm.c
index 57ec5e99edb9..07b7c10f8d39 100644
--- a/tools/testing/selftests/x86/ioperm.c
+++ b/tools/testing/selftests/x86/ioperm.c
@@ -3,8 +3,6 @@
  * ioperm.c - Test case for ioperm(2)
  * Copyright (c) 2015 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
 #include <err.h>
 #include <stdio.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/x86/iopl.c b/tools/testing/selftests/x86/iopl.c
index 7e3e09c1abac..baa691154905 100644
--- a/tools/testing/selftests/x86/iopl.c
+++ b/tools/testing/selftests/x86/iopl.c
@@ -3,8 +3,6 @@
  * iopl.c - Test case for a Linux on Xen 64-bit bug
  * Copyright (c) 2015 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
 #include <err.h>
 #include <stdio.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
index 0ea4f6813930..cbfb19d546fa 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/ldt_gdt.c b/tools/testing/selftests/x86/ldt_gdt.c
index 3a29346e1452..3b4237a85a12 100644
--- a/tools/testing/selftests/x86/ldt_gdt.c
+++ b/tools/testing/selftests/x86/ldt_gdt.c
@@ -3,8 +3,6 @@
  * ldt_gdt.c - Test cases for LDT and GDT access
  * Copyright (c) 2015 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
 #include <err.h>
 #include <stdio.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index cc3de6ff9fba..47ecc63220b7 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -19,8 +19,6 @@
  *
  * This should mostly cover CVE-2018-1087 and CVE-2018-8897.
  */
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <sys/ptrace.h>
 #include <sys/types.h>
diff --git a/tools/testing/selftests/x86/nx_stack.c b/tools/testing/selftests/x86/nx_stack.c
index ea4a4e246879..97c5b34096cc 100644
--- a/tools/testing/selftests/x86/nx_stack.c
+++ b/tools/testing/selftests/x86/nx_stack.c
@@ -23,8 +23,6 @@
  * Regular stack is completely overwritten before testing.
  * Test doesn't exit SIGSEGV handler after first fault at INT3.
  */
-#undef _GNU_SOURCE
-#define _GNU_SOURCE
 #undef NDEBUG
 #include <assert.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/x86/ptrace_syscall.c b/tools/testing/selftests/x86/ptrace_syscall.c
index 12aaa063196e..bdc81c8bd1a7 100644
--- a/tools/testing/selftests/x86/ptrace_syscall.c
+++ b/tools/testing/selftests/x86/ptrace_syscall.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <sys/ptrace.h>
 #include <sys/types.h>
 #include <sys/wait.h>
diff --git a/tools/testing/selftests/x86/sigaltstack.c b/tools/testing/selftests/x86/sigaltstack.c
index f689af75e979..7f41c3a4268b 100644
--- a/tools/testing/selftests/x86/sigaltstack.c
+++ b/tools/testing/selftests/x86/sigaltstack.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-#define _GNU_SOURCE
 #include <signal.h>
 #include <stdio.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/x86/sigreturn.c b/tools/testing/selftests/x86/sigreturn.c
index 5d7961a5f7f6..2054f729b2c2 100644
--- a/tools/testing/selftests/x86/sigreturn.c
+++ b/tools/testing/selftests/x86/sigreturn.c
@@ -24,9 +24,6 @@
  *
  * Do not run on outdated, unpatched kernels at risk of nasty crashes.
  */
-
-#define _GNU_SOURCE
-
 #include <sys/time.h>
 #include <time.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/x86/single_step_syscall.c b/tools/testing/selftests/x86/single_step_syscall.c
index 9a30f443e928..375f3b50a0b5 100644
--- a/tools/testing/selftests/x86/single_step_syscall.c
+++ b/tools/testing/selftests/x86/single_step_syscall.c
@@ -9,9 +9,6 @@
  * immediately issues #DB from CPL 0.  This requires special handling in
  * the kernel.
  */
-
-#define _GNU_SOURCE
-
 #include <sys/time.h>
 #include <time.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/x86/syscall_arg_fault.c b/tools/testing/selftests/x86/syscall_arg_fault.c
index 461fa41a4d02..10eee1bcd015 100644
--- a/tools/testing/selftests/x86/syscall_arg_fault.c
+++ b/tools/testing/selftests/x86/syscall_arg_fault.c
@@ -3,9 +3,6 @@
  * syscall_arg_fault.c - tests faults 32-bit fast syscall stack args
  * Copyright (c) 2015 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/syscall_numbering.c b/tools/testing/selftests/x86/syscall_numbering.c
index 991591718bb0..c72fc8aaa4d3 100644
--- a/tools/testing/selftests/x86/syscall_numbering.c
+++ b/tools/testing/selftests/x86/syscall_numbering.c
@@ -5,9 +5,6 @@
  *
  * Copyright (c) 2018 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
index 84d74be1d902..24bc219358a5 100644
--- a/tools/testing/selftests/x86/sysret_rip.c
+++ b/tools/testing/selftests/x86/sysret_rip.c
@@ -3,9 +3,6 @@
  * sigreturn.c - tests that x86 avoids Intel SYSRET pitfalls
  * Copyright (c) 2014-2016 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/x86/sysret_ss_attrs.c b/tools/testing/selftests/x86/sysret_ss_attrs.c
index 5f3d4fca440f..f8b9e0b2a0c5 100644
--- a/tools/testing/selftests/x86/sysret_ss_attrs.c
+++ b/tools/testing/selftests/x86/sysret_ss_attrs.c
@@ -7,9 +7,6 @@
  * the hidden attributes set to an unusable state.  Make sure the kernel
  * doesn't let this happen.
  */
-
-#define _GNU_SOURCE
-
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/x86/test_FCMOV.c b/tools/testing/selftests/x86/test_FCMOV.c
index 6b5036fbb735..0c9431ba7d31 100644
--- a/tools/testing/selftests/x86/test_FCMOV.c
+++ b/tools/testing/selftests/x86/test_FCMOV.c
@@ -1,8 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#undef _GNU_SOURCE
-#define _GNU_SOURCE 1
-#undef __USE_GNU
-#define __USE_GNU 1
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/test_FCOMI.c b/tools/testing/selftests/x86/test_FCOMI.c
index aec6692c6dcf..ba186665918d 100644
--- a/tools/testing/selftests/x86/test_FCOMI.c
+++ b/tools/testing/selftests/x86/test_FCOMI.c
@@ -1,8 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#undef _GNU_SOURCE
-#define _GNU_SOURCE 1
-#undef __USE_GNU
-#define __USE_GNU 1
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/test_FISTTP.c b/tools/testing/selftests/x86/test_FISTTP.c
index 09789c0ce3e9..95580cdaaa32 100644
--- a/tools/testing/selftests/x86/test_FISTTP.c
+++ b/tools/testing/selftests/x86/test_FISTTP.c
@@ -1,8 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#undef _GNU_SOURCE
-#define _GNU_SOURCE 1
-#undef __USE_GNU
-#define __USE_GNU 1
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/test_mremap_vdso.c b/tools/testing/selftests/x86/test_mremap_vdso.c
index d53959e03593..34f199b0d615 100644
--- a/tools/testing/selftests/x86/test_mremap_vdso.c
+++ b/tools/testing/selftests/x86/test_mremap_vdso.c
@@ -9,7 +9,6 @@
  * Can be built statically:
  * gcc -Os -Wall -static -m32 test_mremap_vdso.c
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index ee909a7927f9..ca1c13e89d8d 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -7,9 +7,6 @@
  * special glibc shadow stack support (longjmp(), swapcontext(), etc). Just
  * stick to the basics and hope the compiler doesn't do anything strange.
  */
-
-#define _GNU_SOURCE
-
 #include <sys/syscall.h>
 #include <asm/mman.h>
 #include <sys/mman.h>
diff --git a/tools/testing/selftests/x86/test_syscall_vdso.c b/tools/testing/selftests/x86/test_syscall_vdso.c
index 8965c311bd65..5cd13279bba5 100644
--- a/tools/testing/selftests/x86/test_syscall_vdso.c
+++ b/tools/testing/selftests/x86/test_syscall_vdso.c
@@ -8,10 +8,6 @@
  * Can be built statically:
  * gcc -Os -Wall -static -m32 test_syscall_vdso.c thunks_32.S
  */
-#undef _GNU_SOURCE
-#define _GNU_SOURCE 1
-#undef __USE_GNU
-#define __USE_GNU 1
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/testing/selftests/x86/test_vsyscall.c b/tools/testing/selftests/x86/test_vsyscall.c
index d4c8e8d79d38..8e879263412d 100644
--- a/tools/testing/selftests/x86/test_vsyscall.c
+++ b/tools/testing/selftests/x86/test_vsyscall.c
@@ -1,7 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <sys/time.h>
 #include <time.h>
diff --git a/tools/testing/selftests/x86/unwind_vdso.c b/tools/testing/selftests/x86/unwind_vdso.c
index 4c311e1af4c7..754f5d4d425a 100644
--- a/tools/testing/selftests/x86/unwind_vdso.c
+++ b/tools/testing/selftests/x86/unwind_vdso.c
@@ -5,9 +5,6 @@
  *
  * This tests __kernel_vsyscall's unwind info.
  */
-
-#define _GNU_SOURCE
-
 #include <features.h>
 #include <stdio.h>
 
diff --git a/tools/testing/selftests/x86/vdso_restorer.c b/tools/testing/selftests/x86/vdso_restorer.c
index fe99f2434155..8193de22a390 100644
--- a/tools/testing/selftests/x86/vdso_restorer.c
+++ b/tools/testing/selftests/x86/vdso_restorer.c
@@ -10,9 +10,6 @@
  * 64-bit userspace has never supported sa_restorer == NULL, so this is
  * 32-bit only.
  */
-
-#define _GNU_SOURCE
-
 #include <err.h>
 #include <stdio.h>
 #include <dlfcn.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
