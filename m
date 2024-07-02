Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F548C30658
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 05:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuSyMKy8Q+4TKOJUT0d/XIw72oRp0pgxz09ryH1f3gI=; b=J/y/RdkmQFYP1Z
	iV3RUsQ0S4gjJAXAZJwVE/NKemlvJ/HZsYA8WEsNROJSzjoYpyyR7jCPpn1i5eVZnoW43n0XLgUMZ
	RsFrt7ybriO3oq0MXiaROcc88SiBiLeM5oXXCaf134EULmb02BFfudblTsV3Cf9Oi5sC3U3Vx5hkM
	y3OacpC9W/Dq/maJ+BM+qqtqf6slq0COHDBMgaIEcy1iIX8cRyihu8vJNWpHYJ2Us1B3A3f8wlU31
	2VTpXUXrcBgWFGeB+1isJrP19d7yLISqUq1AjxalSJdBBXjmvOLK76gtGUoPwa1Lf/vQSis5GfUzU
	+NSQVnNonkf7tB5kAhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWCw-00000005bDn-1dR8;
	Tue, 02 Jul 2024 05:37:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOWCs-00000005bBc-2ad6
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 05:37:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fab03d2f23so28304215ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719898653; x=1720503453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QylUuXEtNL3Eo0vKPHJFlDtSdhA+F4KnUDy2bHeIjjY=;
        b=nTripd3WXrr/gqT2Ozer33fCWZgxJhATtXy2l+BYuyvtiIyon/+vK1KiwrIaLiDjuq
         qa332qAJQFfhO2H/PI0xIkhODqI8Dy/vleO7Tu55Eg5seheBd1kgV89rqQPsDuq4lm7c
         t6LzETrWg6/pC/ct+18SMF67bpZG9Md2AaMX7YmGxfrVUaCXY6+0Dfyo1AvA0UHFDQjP
         2gjLQ7RdPe1G8ZJeqWw1dHaYEMvHvCc3V9jtF0VcGfBK0lLn9fv6q5XndUWPzw965k5j
         6HPP05/up+BNyc5/ALivySD31SP3QhBh87nSh6LT4i9by8cpL4pqnNn8N53QmyFmuW+G
         X6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719898653; x=1720503453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QylUuXEtNL3Eo0vKPHJFlDtSdhA+F4KnUDy2bHeIjjY=;
        b=Hj2BB3emFUrqfBRIeCSs8oMxc2qcgeIzsewIiQ0pqspTACalx1cULTrFDw186CNokm
         haUnqyg1aVTJJusJuGhd8kt9FxxZzd5b/SqHgqD48YXzVTEa7EcEvD3vhfNS+6GsO4db
         i/dnQiPmxQf9SDrwzQ6qH9gc8AHKZtuUi/UDYl940b2VPfYdUFrtb/xP0/ktYnHF861t
         FMkjK+AMzGfJ4xNciZ9o0hLUHxrRa/CjSFuv7yvqaymysCvlN5fFqR7MK1KvF9gqgdD9
         Dfe/YduFuF9AR0uWAzYMcNtg4NEL4UO2W79BCRpTDmeduJcjKj84kCaUSlvzjC1XefOa
         OpZA==
X-Gm-Message-State: AOJu0Yxs7sBp/8FI61SoO8zCkmZlIpDjfGR6GuLYSUJT85Mo4mZTAHz3
	UCgAj1Dem1PFQ77S3RcgprxsxUYpj97Xuv5BdAXAdazQW3GTpuj54jWWDYGrIbo=
X-Google-Smtp-Source: AGHT+IHD/AlEviT8SXJiTbsVNwnXf2yMzxVXULAD/ULUcJEhqMDI0cnZbgXoTsLn/2TmyvmqZXXKYw==
X-Received: by 2002:a17:902:e5cb:b0:1f6:6ef0:dae4 with SMTP id d9443c01a7336-1fadbca5bc3mr43646675ad.32.1719898653462;
        Mon, 01 Jul 2024 22:37:33 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d15a9sm74873685ad.37.2024.07.01.22.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 22:37:32 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:37:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, oleg@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	andy.chiu@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v1 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <ZoOSGt9jbKn1f37d@ghost>
References: <cover.1719408040.git.zhouquan@iscas.ac.cn>
 <1e9cbab1b0badc05592fce46717418930076a6ae.1719408040.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e9cbab1b0badc05592fce46717418930076a6ae.1719408040.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_223734_876600_97B2CBB8 
X-CRM114-Status: GOOD (  28.85  )
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

On Thu, Jun 27, 2024 at 11:02:54AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> This test checks that orig_a0 allows a syscall argument to be modified,
> and that changing a0 does not change the syscall argument.
> 
> Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/riscv/Makefile       |   2 +-
>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
>  tools/testing/selftests/riscv/abi/Makefile   |  12 ++
>  tools/testing/selftests/riscv/abi/ptrace.c   | 124 +++++++++++++++++++
>  4 files changed, 138 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/abi/.gitignore
>  create mode 100644 tools/testing/selftests/riscv/abi/Makefile
>  create mode 100644 tools/testing/selftests/riscv/abi/ptrace.c
> 
> diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> index 7ce03d832b64..98541dc2f164 100644
> --- a/tools/testing/selftests/riscv/Makefile
> +++ b/tools/testing/selftests/riscv/Makefile
> @@ -5,7 +5,7 @@
>  ARCH ?= $(shell uname -m 2>/dev/null || echo not)
>  
>  ifneq (,$(filter $(ARCH),riscv))
> -RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
> +RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn abi
>  else
>  RISCV_SUBTARGETS :=
>  endif
> diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/selftests/riscv/abi/.gitignore
> new file mode 100644
> index 000000000000..d61c51358965
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/.gitignore
> @@ -0,0 +1 @@
> +ptrace
> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
> new file mode 100644
> index 000000000000..808d48a91ad7
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2021 ARM Limited
> +# Originally tools/testing/arm64/abi/Makefile
> +
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := ptrace
> +
> +include ../../lib.mk
> +
> +$(OUTPUT)/ptrace: ptrace.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/selftests/riscv/abi/ptrace.c
> new file mode 100644
> index 000000000000..f85f927cd685
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <errno.h>
> +#include <sys/types.h>
> +#include <sys/ptrace.h>
> +#include <sys/stat.h>
> +#include <sys/user.h>
> +#include <sys/wait.h>
> +#include <sys/uio.h>
> +#include <linux/elf.h>
> +#include <linux/unistd.h>
> +#include <asm/ptrace.h>
> +
> +#include "../../kselftest_harness.h"
> +
> +#define ORIG_A0_MODIFY      0x01
> +#define A0_MODIFY           0x02
> +#define A0_OLD              0x03
> +#define A0_NEW              0x04
> +
> +#define perr_and_exit(fmt, ...)					\
> +	({								\
> +	 	char buf[256];						\

Apologies, I missed this in the last review. In the above line there is
a space in the middle of the tabs before `char buf[256];`.

> +		snprintf(buf, sizeof(buf), "%s:%d: " fmt ": %m\n",	\
> +			__func__, __LINE__, ##__VA_ARGS__);		\
> +		perror(buf);						\
> +		exit(-1);						\
> +	})
> +
> +static inline void resume_and_wait_tracee(pid_t pid, int flag)
> +{
> +	int status;
> +
> +	if (ptrace(flag, pid, 0, 0))
> +		perr_and_exit("failed to resume the tracee %d\n", pid);
> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> +}
> +
> +static void ptrace_test(int opt, int *result)
> +{
> +	int status;
> +	pid_t pid;
> +	struct user_regs_struct regs;
> +	struct iovec iov = {
> +		.iov_base = &regs,
> +		.iov_len = sizeof(regs),
> +	};
> +
> +	pid = fork();
> +	if (pid == 0) {
> +		/* Mark oneself being traced */
> +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> +		if (val)
> +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> +
> +		kill(getpid(), SIGSTOP);
> +
> +		/* Perform exit syscall that will be intercepted */
> +		exit(A0_OLD);
> +	}
> +	if (pid < 0)
> +		exit(1);
> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> +
> +	/* Stop at the entry point of the syscall */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Check tracee orig_a0 before the syscall */
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to get tracee registers\n");
> +	if (regs.orig_a0 != A0_OLD)
> +		perr_and_exit("unexpected orig_a0: 0x%lx\n", regs.orig_a0);
> +
> +	/* Modify a0/orig_a0 for the syscall */
> +	switch (opt) {
> +	case A0_MODIFY:
> +		regs.a0 = A0_NEW;
> +		break;
> +	case ORIG_A0_MODIFY:
> +		regs.orig_a0 = A0_NEW;
> +		break;
> +	}
> +
> +	if (ptrace(PTRACE_SETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to set tracee registers\n");
> +
> +	/* Resume the tracee */
> +	ptrace(PTRACE_CONT, pid, 0, 0);
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee\n");
> +
> +	*result = WEXITSTATUS(status);
> +}
> +
> +TEST(ptrace_modify_a0)
> +{
> +	int result;
> +
> +	ptrace_test(A0_MODIFY, &result);
> +
> +	/* The modification of a0 cannot affect the first argument of the syscall */
> +	EXPECT_EQ(A0_OLD, result);
> +}
> +
> +TEST(ptrace_modify_orig_a0)
> +{
> +	int result;
> +
> +	ptrace_test(ORIG_A0_MODIFY, &result);
> +
> +	/* Only modify orig_a0 to change the first argument of the syscall */
> +	EXPECT_EQ(A0_NEW, result);
> +}
> +
> +TEST_HARNESS_MAIN
> -- 
> 2.34.1
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
