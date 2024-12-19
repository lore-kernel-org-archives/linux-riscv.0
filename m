Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83105E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT0FbbsurS5S4ECv5z1enEwKrOdtiLXNJ+lQpQ2OqoQ=; b=xYgMSCmDUtfqRj
	c3WKQIEudjAo1wRGQBgilLSSwN/0zIcCmOtRLOkLOx2aQjleYNPL8OtyQaKXLCeEc12ISCVkt14bl
	+AYNP65ozcMNt2ndYXDwQXjxV7KdW3alzUMpohF3zXfqoK9JAY2szZSghd0+Hgwy/93CYrDEZQJMY
	qxkc/AYN3kPV3omSgjBYOQ3Z6do2fR7so/BOoYOXZToH7p/lj2xwlc5mX6VbIq2mcfF2KkFcvg3F+
	K054MwEfwmX0TTMgVllTL/GpdSsJJB/j096Gksi9ajAiAIuyYiFaXVWVr7Mb2Cke8MszqSL9xKQDq
	GTXXYz8wBdlCNhUOSteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLE7-00000002jmx-2biy;
	Thu, 19 Dec 2024 18:26:23 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLE4-00000002jmZ-3Xg4
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 18:26:22 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so737009a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734632779; x=1735237579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hMRnvozbssngVqbSknpjzbx2RK+JVnD39zwZDG+y2n8=;
        b=qQGm+Oe/J+dXhdQwhCUI6HuNC2wr+lcizByK0xLxecn2F7d3Vj/AIJalBwJpNg8nMc
         pnXFxhIlzTBO/WHYJ+Ilq/KndB1mr4csIune73PNfePJxlGhWL9RVyuHG84PcbHrs1Vc
         q1EfezyYHXWAPKobmibOspe3dWD9Imc8lLAGSMn3sFN7QsFN4kFuO90rnBxTIn9tlFwh
         I3iEAoBV4dysT6LS8qSaww2fZIQ3JpO5m2j0bbReTZ0nrlyLoMO6x9kH8e5saabiqYbU
         +pA9ku2yTlNxmPjxZKhb8cETetNkUVFSLoRyiwWWg+W7S4hnZh6JTzu5nveGS8AlSt/a
         +jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632779; x=1735237579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMRnvozbssngVqbSknpjzbx2RK+JVnD39zwZDG+y2n8=;
        b=bTK2ax8nDBWlMAPp9XKf6Ut54XHEgmn3wF8e3Rap47XXSgb8d2OtNU23SW7lUhLxCN
         wQY+AUXCF9VvXFpjHC2LE+B+A1qC1/afcnk6IJ6JicfS+Y7IxkE+AyRoEEp+kSnPl2ym
         xZNsVr269aWw6AMg8YZtjGJbZUTzM5nFa+Wxy3b9YfCwWmVAOZrB9dKyaOdTV6Z9aeC7
         2Nmbf0aoKIPfglBaQWnUVsNc2O33ydE3QuoWt0IDhYEwQ74iTFqt3kMbK2epGbi+ZLza
         989UR7tGzxPTugUEhFDDR3BGySunxh609F7JmZSpn2j8XWRQucEHHl3iEpC4RNvsQrpV
         yDVg==
X-Forwarded-Encrypted: i=1; AJvYcCU2FjuOcCdcEIYV4vRsbcSiz9Kc5Wmxk0OKD6f6RhVcqTSEm8RWdma3sV5IUkKmwhPEPu35+zAV+1+yNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsFbyZBQH6mtKyrlDZy1+loxDx/Dyug2FFpk/+y3tLyhNd6dsb
	BMZGdZkPvh8i+laZJyXS6/oQ1GmJMa5mHzZUzFlIA+GJ7gwnxnpfbpxjqzJxO6A=
X-Gm-Gg: ASbGncvQdcFj+g8c/vSA/sK1eYml3NOP+vg3I4vYDCoCqVMqfO7OxUXNtG+F9TWb4gg
	DogJ5SMUtE36/e03+Xd9jlsKNuMQjY+ENbwj4Cz8octyJzr+NvSikTd8gJUVzgqHu2CmpQGa1gE
	uQyJD7SOWtY1y2Iq6+UcHb1jipwiPoYjEV6iDp/xBAdDLi0t/8KEhyEDAEuQKvFjPzil/zwSzB3
	/b+hpnbPU8/XC5btITgeyP9cIsZ+BIc9ZuxiMJf2E3lE69x0bym
X-Google-Smtp-Source: AGHT+IFsWgJOva12zvp6tp180q3OiFLZ0d0TjIkVYwvTLN5q8JRYcM/SHtSfXHGK+OHbcvE+dj549w==
X-Received: by 2002:a17:90b:2c84:b0:2ee:bbe0:98c6 with SMTP id 98e67ed59e1d1-2f452dfcb28mr13994a91.8.1734632779465;
        Thu, 19 Dec 2024 10:26:19 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:1e6a:6188:cfff:248e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447883b0csm1887523a91.42.2024.12.19.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:26:18 -0800 (PST)
Date: Thu, 19 Dec 2024 10:26:15 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	"Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, stable@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <Z2RlR1cP9tne8rNi@ghost>
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
 <20241203-55c76715e16422ddaf8d7edf@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241203-55c76715e16422ddaf8d7edf@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_102621_157439_460723B8 
X-CRM114-Status: GOOD (  37.40  )
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

On Tue, Dec 03, 2024 at 01:55:07PM +0100, Andrew Jones wrote:
> On Tue, Dec 03, 2024 at 05:30:05PM +0800, Celeste Liu wrote:
> > From: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > This test checks that orig_a0 allows a syscall argument to be modified,
> > and that changing a0 does not change the syscall argument.
> > 
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > Co-developed-by: Celeste Liu <uwu@coelacanthus.name>
> > Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/riscv/abi/.gitignore |   1 +
> >  tools/testing/selftests/riscv/abi/Makefile   |   5 +-
> >  tools/testing/selftests/riscv/abi/ptrace.c   | 134 +++++++++++++++++++++++++++
> >  3 files changed, 139 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/selftests/riscv/abi/.gitignore
> > index b38358f91c4d2240ae64892871d9ca98bda1ae58..378c605919a3b3d58eec2701eb7af430cfe315d6 100644
> > --- a/tools/testing/selftests/riscv/abi/.gitignore
> > +++ b/tools/testing/selftests/riscv/abi/.gitignore
> > @@ -1 +1,2 @@
> >  pointer_masking
> > +ptrace
> > diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
> > index ed82ff9c664e7eb3f760cbab81fb957ff72579c5..3f74d059dfdcbce4d45d8ff618781ccea1419061 100644
> > --- a/tools/testing/selftests/riscv/abi/Makefile
> > +++ b/tools/testing/selftests/riscv/abi/Makefile
> > @@ -2,9 +2,12 @@
> >  
> >  CFLAGS += -I$(top_srcdir)/tools/include
> >  
> > -TEST_GEN_PROGS := pointer_masking
> > +TEST_GEN_PROGS := pointer_masking ptrace
> >  
> >  include ../../lib.mk
> >  
> >  $(OUTPUT)/pointer_masking: pointer_masking.c
> >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > +
> > +$(OUTPUT)/ptrace: ptrace.c
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/selftests/riscv/abi/ptrace.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d192764b428d1f1c442f3957c6fedeb01a48d556
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> > @@ -0,0 +1,134 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +#include <signal.h>
> > +#include <errno.h>
> > +#include <sys/types.h>
> > +#include <sys/ptrace.h>
> > +#include <sys/stat.h>
> > +#include <sys/user.h>
> > +#include <sys/wait.h>
> > +#include <sys/uio.h>
> > +#include <linux/elf.h>
> > +#include <linux/unistd.h>
> > +#include <asm/ptrace.h>
> > +
> > +#include "../../kselftest_harness.h"
> > +
> > +#define ORIG_A0_MODIFY      0x01
> > +#define A0_MODIFY           0x02
> > +#define A0_OLD              0x03
> > +#define A0_NEW              0x04
> 
> Shouldn't A0_OLD and A0_NEW set more bits, since 3 and 4 aren't very
> unique (we could have those values by accident)? And should we include
> setting bits over 31 for 64-bit targets?
> 
> > +
> > +#define perr_and_exit(fmt, ...)						\
> > +	({								\
> > +		char buf[256];						\
> > +		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
> > +			__func__, __LINE__, ##__VA_ARGS__);		\
> > +		perror(buf);						\
> > +		exit(-1);						\
> > +	})
> 
> Can we use e.g. ksft_exit_fail_perror() instead? I'd prefer we try to
> consolidate testing/selftests/riscv/* tests on a common format for
> errors and exit codes and we're already using other kselftest stuff.
> 
> > +
> > +static inline void resume_and_wait_tracee(pid_t pid, int flag)
> > +{
> > +	int status;
> > +
> > +	if (ptrace(flag, pid, 0, 0))
> > +		perr_and_exit("failed to resume the tracee %d\n", pid);
> > +
> > +	if (waitpid(pid, &status, 0) != pid)
> > +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> > +}
> > +
> > +static void ptrace_test(int opt, int *result)
> > +{
> > +	int status;
> > +	pid_t pid;
> > +	struct user_regs_struct regs;
> > +	struct iovec iov = {
> > +		.iov_base = &regs,
> > +		.iov_len = sizeof(regs),
> > +	};
> > +
> > +	unsigned long orig_a0;
> > +	struct iovec a0_iov = {
> > +		.iov_base = &orig_a0,
> > +		.iov_len = sizeof(orig_a0),
> > +	};
> > +
> > +	pid = fork();
> > +	if (pid == 0) {
> > +		/* Mark oneself being traced */
> > +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> > +
> > +		if (val)
> > +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> > +
> > +		kill(getpid(), SIGSTOP);
> > +
> > +		/* Perform exit syscall that will be intercepted */
> > +		exit(A0_OLD);
> > +	}
> > +
> > +	if (pid < 0)
> > +		exit(1);
> 
> This unexpected error condition deserves a message, so I'd use
> ksft_exit_fail_perror() here.
> 
> > +
> > +	if (waitpid(pid, &status, 0) != pid)
> > +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> > +
> > +	/* Stop at the entry point of the syscall */
> > +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> > +
> > +	/* Check tracee regs before the syscall */
> > +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> > +		perr_and_exit("failed to get tracee registers\n");
> > +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> > +		perr_and_exit("failed to get tracee registers\n");
> > +	if (orig_a0 != A0_OLD)
> > +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
> > +
> > +	/* Modify a0/orig_a0 for the syscall */
> > +	switch (opt) {
> > +	case A0_MODIFY:
> > +		regs.a0 = A0_NEW;
> > +		break;
> > +	case ORIG_A0_MODIFY:
> > +		orig_a0 = A0_NEW;
> > +		break;
> > +	}
> > +
> > +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> > +		perr_and_exit("failed to set tracee registers\n");
> > +
> > +	/* Resume the tracee */
> > +	ptrace(PTRACE_CONT, pid, 0, 0);
> > +	if (waitpid(pid, &status, 0) != pid)
> > +		perr_and_exit("failed to wait for the tracee\n");
> > +
> > +	*result = WEXITSTATUS(status);
> > +}
> > +
> > +TEST(ptrace_modify_a0)
> > +{
> > +	int result;
> > +
> > +	ptrace_test(A0_MODIFY, &result);
> > +
> > +	/* The modification of a0 cannot affect the first argument of the syscall */
> > +	EXPECT_EQ(A0_OLD, result);
> 
> What about checking that we actually set regs.a0 to A0_NEW? We'd need
> A0_NEW to be more unique than 4, though.
> 
> > +}
> > +
> > +TEST(ptrace_modify_orig_a0)
> > +{
> > +	int result;
> > +
> > +	ptrace_test(ORIG_A0_MODIFY, &result);
> > +
> > +	/* Only modify orig_a0 to change the first argument of the syscall */
> 
> If we run ptrace_modify_a0 first then we've already set regs.a0 to A0_NEW
> and can't check with this test that we don't set it to A0_NEW. We should
> probably have two different test values, one for regs.a0 and one for
> orig_a0 and ensure on both tests that we aren't writing both.
> 

Celeste, do you want to fix this up or are you waiting for me to?

- Charlie

> > +	EXPECT_EQ(A0_NEW, result);
> > +}
> > +
> > +TEST_HARNESS_MAIN
> > 
> > -- 
> > 2.47.0
> >
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
