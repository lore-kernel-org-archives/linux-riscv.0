Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2BDC02187
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9e5JcOq5hsQO1w+0yB/j6B/rm5od6R+E6YETczYPo5U=; b=LaWcbqNey0rIDq
	7DQ9tHnT3KcJxbX7yMrSPTCuYiPpEpeauS8swvF3l5c6jhG7pU4nC/IlJDh3w22VzpqSmLubrjfDg
	I8QPNCa1g99dPrGy1b2nkDOCBrBKaCrMsPAAJaBiqkGS6civNRHKWxnaP7cUkbpA4HLHoIhyqbALS
	cbohkC6BTFfD0B7VLHgrKqWJfWMx21V2gyL1f8XoWzJcLZi8QYdA2+L5ePTP9EavvRZC9lubwvHmp
	dJfK/EHbS/ToMu15kT/QadGkmMhJlmfY25tGfDkbC+UVH77yDGx2i6qT+7ZJYpLxEtVD0D7aH80LX
	RLOZrIpXSiC1BBrsRYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1nE-0000000Bj89-28wr;
	Wed, 15 Jan 2025 11:42:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1i5-0000000Bi7k-1NQS
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:37:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so8872838a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 03:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736941040; x=1737545840; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bR+WWYwGVwj9iq4wp1piIxfs/pyaIAjlJdJ0bpNK8EE=;
        b=j0/UHsuVLnz8r5MdCuILiF8fM1W2DjanNFI5OgpgA7hUsaflG0/k6QbDTwbx5MM6RC
         vD5Hs/70Og1+FzPVGV0pm2gYaZC21mUOnQnf6RM9TumVRZe/TCxk6gXo0ZvLZqTXgEJU
         KNLsauB+1GFIo/G6uWB7quHtNHC/0RoWEOFh8BsOxNiVrTwDYWNOTBEroW3hUMXfKhK2
         4vDs4WU/acIhp/OyXnVqpRNObrzk8BGQjosHgLH5xlJJZK4TWR5kxRWpjOvB53k3q07l
         Ou/w1yrMtib5XPTe74+GrWDcnQyun8g3CBe0/LgmFFEJD7uRLzk5jJtLqMx3Et8aF507
         KbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941040; x=1737545840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bR+WWYwGVwj9iq4wp1piIxfs/pyaIAjlJdJ0bpNK8EE=;
        b=YKQkg87lQsPuuM2+P5rC2HFfwBuTAngfv0H4f7qgJpppsQkoEbxlbnOY1jSaNptkf4
         cbppUMedadGYnQu7y4WuALWgvrHNmj2jXYK14w2B7aw8H8gNPXeXG1nymCCeeEn67Tkn
         fAPO0EAEcsx+8/yJQYUSYDQY/vXuzL+B+CoZJnYM1dDu3SEX0rZAfuj0qSGBUsAxU8HS
         AHApWhAvDi+5zz2xz7e+aShA+yOTwQNza9UawZNaqVghrmHvHLzmbOam1yeN+wHyGFNq
         1VGA3B1Bozv3aThIuJXFX2AUzIHIcYzu5qwccFj8MWTZBsaM5+BIEKNxHs0pQiUNYb2F
         SixQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTbrQ9vzghxbFx711rkaGn3kpAQRJEqfaChbP6bJ+WXEFCby/AuBjlaMagRy4TPzeMSqvvWW/2OLU7uQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxByN0Iw+qc+hx7qZQEwVn0gnOpLqFlPuuVP7Q7o+8cnxBmrrBp
	RnzyXaEwJTWMajUwTnjKb6Ryk0p4vL3R4tlF97Oa/rr27T42ZdhcXT7OqEC1rQg=
X-Gm-Gg: ASbGncvqxBUPxsH+W8qUcG7H5DRIzeEOBhS+azVJnftk2dXz81HGfxcXuEk+P4kKFsd
	1ho0etjO7E7a6OUhAGA/xmQC7/unJjfbRcV06/00i7gYB7DOTGbKosbfmY5aNgraiOd/+W1n7Ut
	+lY/ZDdaQEGzpWTA31oY4GBzf1ep9C0FtBnnOAR30eQZk7EvNNyQAEkh3mnKUVvxJtOHVaEvgXw
	him7V8+P+eWA4bOJLwzFKYu19wz5OluoR36ZzPKuHjG3rfknn3oJEmUEthGgxNAp5UJvjPOYUrQ
	lkX9ucfg4acoJHpWFI3KQAefsvV478e/msIpxkaUNg==
X-Google-Smtp-Source: AGHT+IEOkZVi43hTcd5c9zWbi3HxwwGowdbRYih1cWc4DFfPmKBxVNAcGDdIhoBiy/DfEt+4yE+XqA==
X-Received: by 2002:a17:906:f58e:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-ab2ab749f27mr2166727066b.29.1736941039534;
        Wed, 15 Jan 2025 03:37:19 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af65dsm746359666b.140.2025.01.15.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:37:19 -0800 (PST)
Date: Wed, 15 Jan 2025 12:37:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
	Charlie Jenkins <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>, 
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v6 3/3] riscv: selftests: Add a ptrace test to verify a0
 and orig_a0 access
Message-ID: <20250115-13cc73c36c7bb3b9f046f614@orel>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
 <20250115-riscv-new-regset-v6-3-59bfddd33525@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v6-3-59bfddd33525@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033721_368566_C445F7D1 
X-CRM114-Status: GOOD (  30.24  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2025 at 07:13:29PM +0800, Celeste Liu wrote:
> This test checks that orig_a0 and a0 can be modified and accessed
> independently.
> =

> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Co-developed-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
>  tools/testing/selftests/riscv/abi/Makefile   |   6 +-
>  tools/testing/selftests/riscv/abi/ptrace.c   | 193 +++++++++++++++++++++=
++++++
>  3 files changed, 199 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing=
/selftests/riscv/abi/.gitignore
> index b38358f91c4d2240ae64892871d9ca98bda1ae58..378c605919a3b3d58eec2701e=
b7af430cfe315d6 100644
> --- a/tools/testing/selftests/riscv/abi/.gitignore
> +++ b/tools/testing/selftests/riscv/abi/.gitignore
> @@ -1 +1,2 @@
>  pointer_masking
> +ptrace
> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/s=
elftests/riscv/abi/Makefile
> index ed82ff9c664e7eb3f760cbab81fb957ff72579c5..359a082c88a401883fb3776b3=
5e4dacf69beaaaa 100644
> --- a/tools/testing/selftests/riscv/abi/Makefile
> +++ b/tools/testing/selftests/riscv/abi/Makefile
> @@ -1,10 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0
>  =

>  CFLAGS +=3D -I$(top_srcdir)/tools/include
> +CFLAGS +=3D $(KHDR_INCLUDES)
>  =

> -TEST_GEN_PROGS :=3D pointer_masking
> +TEST_GEN_PROGS :=3D pointer_masking ptrace
>  =

>  include ../../lib.mk
>  =

>  $(OUTPUT)/pointer_masking: pointer_masking.c
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/ptrace: ptrace.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/s=
elftests/riscv/abi/ptrace.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cbd60462021165ca2bcc38be2=
4b8423c96047b93
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> @@ -0,0 +1,193 @@
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
> +#include <linux/ptrace.h>
> +#include <linux/stddef.h>
> +#include <asm/ptrace.h>
> +
> +#include "../../kselftest_harness.h"
> +
> +#define ORIG_A0_MODIFY      0x01
> +#define A0_MODIFY           0x02
> +#define A0_OLD              0xbadbeefbeeff
> +#define A0_NEW              0xffeebfeebdab
> +
> +
> +struct a0_regs {
> +	__s64 orig_a0;
> +	__u64 a0;
> +};
> +
> +#define perr_and_exit(fmt, ...)						\
> +	({								\
> +		char buf[256];						\
> +		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
> +			__func__, __LINE__, ##__VA_ARGS__);		\
> +		ksft_exit_fail_perror(buf);				\
> +	})
> +
> +static void ptrace_test(int opt, struct a0_regs result[])
> +{
> +	int status;
> +	long rc;
> +	pid_t pid;
> +	struct user_regs_struct regs;
> +	struct iovec iov =3D {
> +		.iov_base =3D &regs,
> +		.iov_len =3D sizeof(regs),
> +	};
> +
> +	unsigned long orig_a0;
> +	struct iovec a0_iov =3D {
> +		.iov_base =3D &orig_a0,
> +		.iov_len =3D sizeof(orig_a0),
> +	};
> +	struct ptrace_syscall_info syscall_info =3D {
> +		.op =3D 0xff,
> +	};
> +	const unsigned int expected_sci_entry_size =3D
> +		offsetofend(struct ptrace_syscall_info, entry.args);
> +	const unsigned int expected_sci_exit_size =3D
> +		offsetofend(struct ptrace_syscall_info, exit.is_error);
> +
> +	pid =3D fork();
> +	if (pid =3D=3D 0) {
> +		/* Mark oneself being traced */
> +		long val =3D ptrace(PTRACE_TRACEME, 0, 0, 0);
> +
> +		if (val < 0)
> +			perr_and_exit("failed to request for tracer to trace me: %ld", val);
> +
> +		kill(getpid(), SIGSTOP);
> +
> +		/* Perform chdir syscall that will be intercepted */
> +		syscall(__NR_chdir, A0_OLD);
> +
> +		exit(0);
> +	}
> +
> +	if (pid < 0)
> +		ksft_exit_fail_perror("failed to fork");
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		if (waitpid(pid, &status, 0) !=3D pid)
> +			perr_and_exit("failed to wait for the tracee %d", pid);
> +		if (WIFSTOPPED(status)) {
> +			switch (WSTOPSIG(status)) {
> +			case SIGSTOP:
> +				if (ptrace(PTRACE_SETOPTIONS, pid, 0, PTRACE_O_TRACESYSGOOD) < 0)
> +					perr_and_exit("failed to set PTRACE_O_TRACESYSGOOD");
> +				break;
> +			case SIGTRAP|0x80:
> +				/* Modify twice so GET_SYSCALL_INFO get modified a0 and orig_a0 */
> +				if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +					perr_and_exit("failed to get tracee registers");
> +				if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> +					perr_and_exit("failed to get tracee registers");
> +
> +				/* Modify a0/orig_a0 for the syscall */
> +				switch (opt) {
> +				case A0_MODIFY:
> +					regs.a0 =3D A0_NEW;
> +					break;
> +				case ORIG_A0_MODIFY:
> +					orig_a0 =3D A0_NEW;
> +					break;
> +				}
> +
> +				if (ptrace(PTRACE_SETREGSET, pid, NT_PRSTATUS, &iov))
> +					perr_and_exit("failed to set tracee registers");
> +				if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> +					perr_and_exit("failed to set tracee registers");
> +				switch (i) {
> +				case 1:
> +					/* Stop at the beginning of syscall */
> +					rc =3D ptrace(PTRACE_GET_SYSCALL_INFO, pid,
> +						sizeof(syscall_info), &syscall_info);
> +					if (rc < 0)
> +						perr_and_exit("failed to get syscall info of entry");
> +					if (rc < expected_sci_entry_size
> +						|| syscall_info.op !=3D PTRACE_SYSCALL_INFO_ENTRY)
> +						perr_and_exit("stop position of entry mismatched");
> +					result[0].orig_a0 =3D syscall_info.entry.args[0];
> +					break;
> +
> +				case 2:
> +					/* Stop at the end of syscall */
> +					rc =3D ptrace(PTRACE_GET_SYSCALL_INFO, pid,
> +						sizeof(syscall_info), &syscall_info);
> +					if (rc < 0)
> +						perr_and_exit("failed to get syscall info of entry");
> +					if (rc < expected_sci_exit_size
> +						|| syscall_info.op !=3D PTRACE_SYSCALL_INFO_EXIT)
> +						perr_and_exit("stop position of exit mismatched");
> +					result[0].a0 =3D syscall_info.exit.rval;
> +
> +					if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +						perr_and_exit("failed to get tracee registers");
> +					result[1].a0 =3D regs.a0;
> +					if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0,
> +						   &a0_iov))
> +						perr_and_exit("failed to get tracee registers");
> +					result[1].orig_a0 =3D orig_a0;
> +				}
> +			}
> +			if (ptrace(PTRACE_SYSCALL, pid, 0, 0) < 0)
> +				perr_and_exit("failed to resume tracee");
> +		}
> +	}
> +
> +	/* Resume the tracee */
> +	ptrace(PTRACE_CONT, pid, 0, 0);
> +	if (waitpid(pid, &status, 0) !=3D pid)
> +		perr_and_exit("failed to wait for the tracee");
> +
> +}
> +
> +TEST(ptrace_access_a0)
> +{
> +	struct a0_regs result[2];
> +
> +	ptrace_test(A0_MODIFY, result);
> +
> +	/* Verify PTRACE_SETREGSET */
> +	/* The modification of a0 cannot affect the first argument of the sysca=
ll */
> +	EXPECT_EQ(A0_OLD, result[0].orig_a0);
> +	EXPECT_EQ(A0_NEW, result[0].a0);
> +
> +	/* Verify PTRACE_GETREGSET */
> +	EXPECT_EQ(result[1].orig_a0, result[0].orig_a0);
> +	EXPECT_EQ(result[1].a0, result[0].a0);
> +}
> +
> +TEST(ptrace_access_orig_a0)
> +{
> +	struct a0_regs result[2];
> +
> +	ptrace_test(ORIG_A0_MODIFY, result);
> +
> +	/* Verify PTRACE_SETREGSET */
> +	/* Only modify orig_a0 to change the first argument of the syscall */
> +	EXPECT_EQ(A0_NEW, result[0].orig_a0);
> +	/* a0 will not be affected */
> +	EXPECT_NE(A0_NEW, result[0].a0);
> +
> +	/* Verify PTRACE_GETREGSET */
> +	EXPECT_EQ(result[1].orig_a0, result[0].orig_a0);
> +	EXPECT_EQ(result[1].a0, result[0].a0);
> +}
> +
> +TEST_HARNESS_MAIN
> =

> -- =

> 2.48.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
