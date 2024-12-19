Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A48DE7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IO/jCXNWYazEhgdsIIOeCERrMLTTfz6/6RXi4mEe5M=; b=ChxwsfvjV8g7f4
	KKwjhjXICDN++ynnB1rWPV/ir1KjjEDkeH2lP2lbr2jMgl/TumKbZt6UyAlC2+nmf5MMDAoYC3rsK
	Bx2gJcP9roG/DM4kJ/6/9s6thneowr5/DiXFWj1X28dsBvUE1KO4OgXysV+OEIlXeepBG+L8NDmTE
	ebNHlBO3ecbYEocZH1s/8ytfLFJ4OAlIHboeX8s/ZRfQ8S1PkfPvMo2PZLDmvIwc0jF+AdDXzpGQB
	UFaxecmt5+2FEzm4s9pNZ0dSSfe9Tg76k5ff91HrnaSGd3iYyWUbRBJtj7LaGQrvn7xTd8Vzypdiu
	SBblnsWC4rlzpD7i8Psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOCY-00000003B5a-1Uvd;
	Thu, 19 Dec 2024 21:36:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOCV-00000003B5A-3T1x
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 21:36:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163dc5155fso11937695ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 13:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734644215; x=1735249015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBYqbJyIvcJfLc67nzPKYdjSB+90GgtMbY2G3flDnUI=;
        b=h/bi6HzxkwDHEMkYKNee1gjAWzRqwNt0PTKJHib2AADPkGdCKoPZKYvFPMnwP5aqaO
         BgHCaYT/nGbzcekbPkGTF3VtspiH9WrTtXioRMDx199WYFNd8Srier7myBkqm9R6CUVt
         Queu6cVbWzs+Vzkc3xGun09H+YmztMcsXOS+sKLz0yE9vr1I5N+9ifDkhZ82VbHhD1dn
         7+LFrbEAdYosljf6o0l2e1EzcTgmYIfqDSbSvc50M4AZLnVNsCCadTy22P/gqgb87WMu
         BBa/93WVVxqjVuLtdlYgT4MRlkmY2KnVpPIqmofKxanIPzHMFtcAgeSIlVJ0rSWgvxxp
         FNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734644215; x=1735249015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBYqbJyIvcJfLc67nzPKYdjSB+90GgtMbY2G3flDnUI=;
        b=YcXDUAQ4xD9yshabHVFxe8reGHCUr3/sZuy4wIYiY9MqAY/YEmda+JQCjvI9AmzZdS
         qoLl7RKewEAyKu4ixN2vKNVOmxWR+ZgotyDRqMjcMfjN8LGfBrQbMhvemRYHCR/BH/LS
         p7CH5n7OC15HEGqKo6syfM8sYvF+X5vGASXFL10FJpuzUlpnFuN43FByb1Zn2Y98KTwV
         O5uyoo+4+uqDSpR8/YGvwBV7LW2E4r8aKGMYR8w1KBB+Vm5L5nqkc5A+DPcYnUgtzqKr
         7e36AC8gyWO+o7eKF/Np1sXihyHWjWNt+0txzfQbfv7FXy9DJjTMGPE6o3WoKLjRzHo8
         67tA==
X-Forwarded-Encrypted: i=1; AJvYcCWaon9jQJMiHJCZ1bv2SoamSvvQNqRU+qKr+0ZHdk+aF/z8e1TNt0Ju9CyHuo45Hwab7mR2u8MJTROHrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6/nhH9f74un00BsKRyuc22pM7a+Zg4B2PtjYYNzlOymE//8v
	i7icyCBkMdX30YDCJ8jHAaM/IQUzAVcbiAigFuVZcbp+IFjMtslA4WV4E/id8yo=
X-Gm-Gg: ASbGncv7CdEAItmSMFK9UWfI5I83up60wacy4nc7dPkwAkFm9R2GcxC5mWqIjpb7Rpc
	vBqxvCeOyghekTrEOWHB3KCmGKiOlI+0IpNaEZO2+wiGShQA0E5V1KGISaXtePbin54rVb+NGDT
	8ZbwozVXUxkaw6l9NlOPKm5RaKy+eO1wMfzoRgz1HvwRSx5Iy4Oz6zvz1v8kmWCYu4kxMadfqkq
	uVT1oQkCx65M3Ze3C9OrynHTKTiW6+XEQ6HQxxESCGUSRs=
X-Google-Smtp-Source: AGHT+IG/Dgc/5kYcDlkg099vZ9/LAsV1QDOIoLm+mwtiNyuB7pILZ0WR6EgDxOuwJUotkZK+n+l86A==
X-Received: by 2002:a17:90a:d64d:b0:2ee:b2fe:eeee with SMTP id 98e67ed59e1d1-2f452e3021cmr942885a91.15.1734644214713;
        Thu, 19 Dec 2024 13:36:54 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4166935a91.27.2024.12.19.13.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:36:54 -0800 (PST)
Date: Thu, 19 Dec 2024 13:36:51 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Andrew Jones <ajones@ventanamicro.com>, Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	"Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Quan Zhou <zhouquan@iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, stable@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <Z2SR86wpB5waLtx-@ghost>
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
 <20241203-55c76715e16422ddaf8d7edf@orel>
 <Z2RlR1cP9tne8rNi@ghost>
 <50a62291-5ae1-47b0-8f64-a42271820789@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50a62291-5ae1-47b0-8f64-a42271820789@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_133656_135597_9BA67756 
X-CRM114-Status: GOOD (  37.27  )
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

On Fri, Dec 20, 2024 at 05:29:45AM +0800, Celeste Liu wrote:
> 
> On 2024-12-20 02:26, Charlie Jenkins wrote:
> > On Tue, Dec 03, 2024 at 01:55:07PM +0100, Andrew Jones wrote:
> >> On Tue, Dec 03, 2024 at 05:30:05PM +0800, Celeste Liu wrote:
> >>> From: Charlie Jenkins <charlie@rivosinc.com>
> >>>
> >>> This test checks that orig_a0 allows a syscall argument to be modified,
> >>> and that changing a0 does not change the syscall argument.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> >>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> >>> Co-developed-by: Celeste Liu <uwu@coelacanthus.name>
> >>> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >>> ---
> >>>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
> >>>  tools/testing/selftests/riscv/abi/Makefile   |   5 +-
> >>>  tools/testing/selftests/riscv/abi/ptrace.c   | 134 +++++++++++++++++++++++++++
> >>>  3 files changed, 139 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/selftests/riscv/abi/.gitignore
> >>> index b38358f91c4d2240ae64892871d9ca98bda1ae58..378c605919a3b3d58eec2701eb7af430cfe315d6 100644
> >>> --- a/tools/testing/selftests/riscv/abi/.gitignore
> >>> +++ b/tools/testing/selftests/riscv/abi/.gitignore
> >>> @@ -1 +1,2 @@
> >>>  pointer_masking
> >>> +ptrace
> >>> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
> >>> index ed82ff9c664e7eb3f760cbab81fb957ff72579c5..3f74d059dfdcbce4d45d8ff618781ccea1419061 100644
> >>> --- a/tools/testing/selftests/riscv/abi/Makefile
> >>> +++ b/tools/testing/selftests/riscv/abi/Makefile
> >>> @@ -2,9 +2,12 @@
> >>>  
> >>>  CFLAGS += -I$(top_srcdir)/tools/include
> >>>  
> >>> -TEST_GEN_PROGS := pointer_masking
> >>> +TEST_GEN_PROGS := pointer_masking ptrace
> >>>  
> >>>  include ../../lib.mk
> >>>  
> >>>  $(OUTPUT)/pointer_masking: pointer_masking.c
> >>>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> >>> +
> >>> +$(OUTPUT)/ptrace: ptrace.c
> >>> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> >>> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/selftests/riscv/abi/ptrace.c
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..d192764b428d1f1c442f3957c6fedeb01a48d556
> >>> --- /dev/null
> >>> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> >>> @@ -0,0 +1,134 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +#include <stdio.h>
> >>> +#include <stdlib.h>
> >>> +#include <string.h>
> >>> +#include <unistd.h>
> >>> +#include <fcntl.h>
> >>> +#include <signal.h>
> >>> +#include <errno.h>
> >>> +#include <sys/types.h>
> >>> +#include <sys/ptrace.h>
> >>> +#include <sys/stat.h>
> >>> +#include <sys/user.h>
> >>> +#include <sys/wait.h>
> >>> +#include <sys/uio.h>
> >>> +#include <linux/elf.h>
> >>> +#include <linux/unistd.h>
> >>> +#include <asm/ptrace.h>
> >>> +
> >>> +#include "../../kselftest_harness.h"
> >>> +
> >>> +#define ORIG_A0_MODIFY      0x01
> >>> +#define A0_MODIFY           0x02
> >>> +#define A0_OLD              0x03
> >>> +#define A0_NEW              0x04
> >>
> >> Shouldn't A0_OLD and A0_NEW set more bits, since 3 and 4 aren't very
> >> unique (we could have those values by accident)? And should we include
> >> setting bits over 31 for 64-bit targets?
> >>
> >>> +
> >>> +#define perr_and_exit(fmt, ...)						\
> >>> +	({								\
> >>> +		char buf[256];						\
> >>> +		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
> >>> +			__func__, __LINE__, ##__VA_ARGS__);		\
> >>> +		perror(buf);						\
> >>> +		exit(-1);						\
> >>> +	})
> >>
> >> Can we use e.g. ksft_exit_fail_perror() instead? I'd prefer we try to
> >> consolidate testing/selftests/riscv/* tests on a common format for
> >> errors and exit codes and we're already using other kselftest stuff.
> >>
> >>> +
> >>> +static inline void resume_and_wait_tracee(pid_t pid, int flag)
> >>> +{
> >>> +	int status;
> >>> +
> >>> +	if (ptrace(flag, pid, 0, 0))
> >>> +		perr_and_exit("failed to resume the tracee %d\n", pid);
> >>> +
> >>> +	if (waitpid(pid, &status, 0) != pid)
> >>> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> >>> +}
> >>> +
> >>> +static void ptrace_test(int opt, int *result)
> >>> +{
> >>> +	int status;
> >>> +	pid_t pid;
> >>> +	struct user_regs_struct regs;
> >>> +	struct iovec iov = {
> >>> +		.iov_base = &regs,
> >>> +		.iov_len = sizeof(regs),
> >>> +	};
> >>> +
> >>> +	unsigned long orig_a0;
> >>> +	struct iovec a0_iov = {
> >>> +		.iov_base = &orig_a0,
> >>> +		.iov_len = sizeof(orig_a0),
> >>> +	};
> >>> +
> >>> +	pid = fork();
> >>> +	if (pid == 0) {
> >>> +		/* Mark oneself being traced */
> >>> +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> >>> +
> >>> +		if (val)
> >>> +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> >>> +
> >>> +		kill(getpid(), SIGSTOP);
> >>> +
> >>> +		/* Perform exit syscall that will be intercepted */
> >>> +		exit(A0_OLD);
> >>> +	}
> >>> +
> >>> +	if (pid < 0)
> >>> +		exit(1);
> >>
> >> This unexpected error condition deserves a message, so I'd use
> >> ksft_exit_fail_perror() here.
> >>
> >>> +
> >>> +	if (waitpid(pid, &status, 0) != pid)
> >>> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> >>> +
> >>> +	/* Stop at the entry point of the syscall */
> >>> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> >>> +
> >>> +	/* Check tracee regs before the syscall */
> >>> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> >>> +		perr_and_exit("failed to get tracee registers\n");
> >>> +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> >>> +		perr_and_exit("failed to get tracee registers\n");
> >>> +	if (orig_a0 != A0_OLD)
> >>> +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
> >>> +
> >>> +	/* Modify a0/orig_a0 for the syscall */
> >>> +	switch (opt) {
> >>> +	case A0_MODIFY:
> >>> +		regs.a0 = A0_NEW;
> >>> +		break;
> >>> +	case ORIG_A0_MODIFY:
> >>> +		orig_a0 = A0_NEW;
> >>> +		break;
> >>> +	}
> >>> +
> >>> +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> >>> +		perr_and_exit("failed to set tracee registers\n");
> >>> +
> >>> +	/* Resume the tracee */
> >>> +	ptrace(PTRACE_CONT, pid, 0, 0);
> >>> +	if (waitpid(pid, &status, 0) != pid)
> >>> +		perr_and_exit("failed to wait for the tracee\n");
> >>> +
> >>> +	*result = WEXITSTATUS(status);
> >>> +}
> >>> +
> >>> +TEST(ptrace_modify_a0)
> >>> +{
> >>> +	int result;
> >>> +
> >>> +	ptrace_test(A0_MODIFY, &result);
> >>> +
> >>> +	/* The modification of a0 cannot affect the first argument of the syscall */
> >>> +	EXPECT_EQ(A0_OLD, result);
> >>
> >> What about checking that we actually set regs.a0 to A0_NEW? We'd need
> >> A0_NEW to be more unique than 4, though.
> >>
> >>> +}
> >>> +
> >>> +TEST(ptrace_modify_orig_a0)
> >>> +{
> >>> +	int result;
> >>> +
> >>> +	ptrace_test(ORIG_A0_MODIFY, &result);
> >>> +
> >>> +	/* Only modify orig_a0 to change the first argument of the syscall */
> >>
> >> If we run ptrace_modify_a0 first then we've already set regs.a0 to A0_NEW
> >> and can't check with this test that we don't set it to A0_NEW. We should
> >> probably have two different test values, one for regs.a0 and one for
> >> orig_a0 and ensure on both tests that we aren't writing both.
> >>
> > 
> > Celeste, do you want to fix this up or are you waiting for me to?
> 
> Sorry for delay. I was busy with household affairs in the past few weeks.
> v3 will be sent tomorrow or the day after tomorrow.
> 
> I am deeply sorry for this.

No need to apologize! Just wanted to make sure you weren't expected me
to update the test :)

- Charlie

> 
> > 
> > - Charlie
> > 
> >>> +	EXPECT_EQ(A0_NEW, result);
> >>> +}
> >>> +
> >>> +TEST_HARNESS_MAIN
> >>>
> >>> -- 
> >>> 2.47.0
> >>>
> >>
> >> Thanks,
> >> drew
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
