Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C2BE64A8D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXEteXEdnp6qDj3MiGwd3Tyqg6DCtK3I7583A6YFma8=; b=UKVnn22k4vkrJ+
	MPHhkyKgB+hWiAP1fIfBqkyA5ox7du+enU5ceo91pFyLqh1hCLAibvdYnFuKRD+L+BVK0npmz/XtV
	pEXBolHjBJpP64ZjlaqJUdkEvc4bbo6y3tYsIXFFGz8u5g1NKhqlULVCeJvpNyuLNgS908VraE4qp
	7Esz554kMe13yJFIxrrsDk9tW5IxaPPUil8dS/UDFAe4z0RPUEFcOgnUSyKJKVEeBEvf6YhJNQYhZ
	yffBLutLnwQyGF4BEHPltbbl4UYlzdZLzZAigppO3iz7WnbWGunnQDDjwEpYshf9pA8PNBiagAEpB
	N3WaYEhuPdI3fKF7nQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISkt-00000009Zld-2qN0;
	Tue, 03 Dec 2024 13:15:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISQp-00000009VqD-1DAW
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 12:55:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so384331666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733230509; x=1733835309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHILDQFXZNWmnBoZHrlTEDnKUcbN4skUfD9kORV0Rxw=;
        b=CbX5+/lh0VxrkK3BsoxW6yJ2FcB1GFz3kQlr+7yHVdxlzEKs4RBYE2rl1fwNpI2PvD
         73W94HFym/Ik0ylynjPsHUv8jLFHlueHavFmf7zjBawrfAbGDeM8Q/lynCq6HZoQ9zdk
         s+td52eXQ2MJPdBG0XQtMk0sT2lRKcJZEvdq4/r2r9D0fx6SONINU/CSvDdqNsO0fUcG
         qo0BiraZL/D7eVUIyTEJ/MZgczWfJoxvApWMGgeGa1FvYCzqupMKAiSpLOKye+aDkYlC
         rFvXO05lMRTuD2cet9KHEB+0SZZ0F10HEy+3wKVwxnNsOp+A55DckXtOIreBDIZWLapc
         8Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733230509; x=1733835309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHILDQFXZNWmnBoZHrlTEDnKUcbN4skUfD9kORV0Rxw=;
        b=QE4En7eUDxeiHIuKa3bLA04Lkc0Nf35A98hM9jBBb1SmgmzltsAFWoMrWGm1h9n0wl
         BB0CgVsZe6F6mu+qyzVdvGO5RLSIaWaX36PTtetsGJ0giDyrWoZ8z8a/tfhp9upnuONa
         tER+87Ap1Bcr/PNBRzsd2L0+/rS4RwgTTog4Dm9jqAfEBbTAkDxc19kMcHqvaydfmbqe
         PIeuVd4X9Yc6FyYCTAwYMrHK87OBeaikTTV7Z/2PZ1/dVkrDIAHL2MU+9TI2C8PYeNZO
         Zu/8kZ5iQgSweO7IVnK54HEaL72K8nRwgc/m21+I2u+Ou5FWMCy14V9V1SvBl6mpcVSo
         MgyA==
X-Forwarded-Encrypted: i=1; AJvYcCUIAeIknvMjQaxVgsAQNjO/me/SYRvr10od6Agyzf1NMfWhyQ2ESBoHOvQ6BrdsQ1LODCWOJHx8fV4ncg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6blPgIFsBy8VUhuFvj5xdc92R/6qzpigvfb0EFnuyy1VH2cS
	q8dcaX92l7vXPICnq/cuzPTeudmtpAsjhY3NC71SkQQyamAGHhTDGIzxSNuuQmw=
X-Gm-Gg: ASbGncve7gxmaNZD1GAn1fE6EcmlE41PbyofwLLTNlCWo5sI7b2goRPPhRfEuDZVq/P
	ZMVhLafU98PG7tV/4B5CZXDnDS0RYEtTIuiF0Yqxh2ULAOIG5LnsUIUV8XHEU43S3US7JQZj2HL
	ho2qNyRUkdD1GazRgG8pKqCjLntIQ2F8s4U3RzpK5HZ8PKwUxMNsCy78Db5m73Amx+K4CkW4fb8
	mXw6LuShELRjJIswvdETaJRCq6i93JHEpx+y6t9tXlA8ECUuwDxTkS6xTIbDbbZ3LiGhqEMscaB
	2Ko2koCWX9Q4umdQTnFLlH9R+E/2YQkeEvA=
X-Google-Smtp-Source: AGHT+IGekZlGXSXB9uvq/WKox/qwoGRSQFTd/XXdhj+W5cxmME+Tkf15rQ0BhZmI5BozveUjcxzWTA==
X-Received: by 2002:a05:6402:234a:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5d10cb5c778mr2754267a12.19.1733230508565;
        Tue, 03 Dec 2024 04:55:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d55fdsm607288366b.55.2024.12.03.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:55:08 -0800 (PST)
Date: Tue, 3 Dec 2024 13:55:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
	Charlie Jenkins <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <20241203-55c76715e16422ddaf8d7edf@orel>
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_045511_332432_4590A74F 
X-CRM114-Status: GOOD (  32.96  )
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

On Tue, Dec 03, 2024 at 05:30:05PM +0800, Celeste Liu wrote:
> From: Charlie Jenkins <charlie@rivosinc.com>
> 
> This test checks that orig_a0 allows a syscall argument to be modified,
> and that changing a0 does not change the syscall argument.
> 
> Cc: stable@vger.kernel.org
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Co-developed-by: Celeste Liu <uwu@coelacanthus.name>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
>  tools/testing/selftests/riscv/abi/Makefile   |   5 +-
>  tools/testing/selftests/riscv/abi/ptrace.c   | 134 +++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/selftests/riscv/abi/.gitignore
> index b38358f91c4d2240ae64892871d9ca98bda1ae58..378c605919a3b3d58eec2701eb7af430cfe315d6 100644
> --- a/tools/testing/selftests/riscv/abi/.gitignore
> +++ b/tools/testing/selftests/riscv/abi/.gitignore
> @@ -1 +1,2 @@
>  pointer_masking
> +ptrace
> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
> index ed82ff9c664e7eb3f760cbab81fb957ff72579c5..3f74d059dfdcbce4d45d8ff618781ccea1419061 100644
> --- a/tools/testing/selftests/riscv/abi/Makefile
> +++ b/tools/testing/selftests/riscv/abi/Makefile
> @@ -2,9 +2,12 @@
>  
>  CFLAGS += -I$(top_srcdir)/tools/include
>  
> -TEST_GEN_PROGS := pointer_masking
> +TEST_GEN_PROGS := pointer_masking ptrace
>  
>  include ../../lib.mk
>  
>  $(OUTPUT)/pointer_masking: pointer_masking.c
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/ptrace: ptrace.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/selftests/riscv/abi/ptrace.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d192764b428d1f1c442f3957c6fedeb01a48d556
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> @@ -0,0 +1,134 @@
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

Shouldn't A0_OLD and A0_NEW set more bits, since 3 and 4 aren't very
unique (we could have those values by accident)? And should we include
setting bits over 31 for 64-bit targets?

> +
> +#define perr_and_exit(fmt, ...)						\
> +	({								\
> +		char buf[256];						\
> +		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
> +			__func__, __LINE__, ##__VA_ARGS__);		\
> +		perror(buf);						\
> +		exit(-1);						\
> +	})

Can we use e.g. ksft_exit_fail_perror() instead? I'd prefer we try to
consolidate testing/selftests/riscv/* tests on a common format for
errors and exit codes and we're already using other kselftest stuff.

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
> +	unsigned long orig_a0;
> +	struct iovec a0_iov = {
> +		.iov_base = &orig_a0,
> +		.iov_len = sizeof(orig_a0),
> +	};
> +
> +	pid = fork();
> +	if (pid == 0) {
> +		/* Mark oneself being traced */
> +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> +
> +		if (val)
> +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> +
> +		kill(getpid(), SIGSTOP);
> +
> +		/* Perform exit syscall that will be intercepted */
> +		exit(A0_OLD);
> +	}
> +
> +	if (pid < 0)
> +		exit(1);

This unexpected error condition deserves a message, so I'd use
ksft_exit_fail_perror() here.

> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> +
> +	/* Stop at the entry point of the syscall */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Check tracee regs before the syscall */
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to get tracee registers\n");
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> +		perr_and_exit("failed to get tracee registers\n");
> +	if (orig_a0 != A0_OLD)
> +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
> +
> +	/* Modify a0/orig_a0 for the syscall */
> +	switch (opt) {
> +	case A0_MODIFY:
> +		regs.a0 = A0_NEW;
> +		break;
> +	case ORIG_A0_MODIFY:
> +		orig_a0 = A0_NEW;
> +		break;
> +	}
> +
> +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
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

What about checking that we actually set regs.a0 to A0_NEW? We'd need
A0_NEW to be more unique than 4, though.

> +}
> +
> +TEST(ptrace_modify_orig_a0)
> +{
> +	int result;
> +
> +	ptrace_test(ORIG_A0_MODIFY, &result);
> +
> +	/* Only modify orig_a0 to change the first argument of the syscall */

If we run ptrace_modify_a0 first then we've already set regs.a0 to A0_NEW
and can't check with this test that we don't set it to A0_NEW. We should
probably have two different test values, one for regs.a0 and one for
orig_a0 and ensure on both tests that we aren't writing both.

> +	EXPECT_EQ(A0_NEW, result);
> +}
> +
> +TEST_HARNESS_MAIN
> 
> -- 
> 2.47.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
