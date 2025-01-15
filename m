Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3446DC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=du1vvo2rC484X6aIRHxO5lCJR4Def5b4VEVoq0fq648=; b=pfxGEZDctcVPza
	bmirXSOras5memiHv8OVj0k3g8dzzjzrTHCNVZjkJ1Cr6bF7jXyHzTWLv1XT8hJ3R1OFSUnY9wNQs
	NFDkPYJ73nGqNl7scmwQ/wdM2ybeAQ2WbmhWfqQ/trMGamYHBcIlisNRRKi38uhNqX8N/dnjQHG2w
	sCx8aMNXm7igJJUhxRH/GD5KsFw0M2C5t/YXW4Gu0ExRtGIdJg+CypRHQ0IWGUo2XUKR/Mf1Yc+n/
	D43pIQkfrHzyUr41U3rkoHGqTwDscrGQUIvAGcN1mThhqaysfyv9mlX47qNAAtTt5GJDsbLzfFF2I
	DMp+rVkwqNSDuh+PisEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzZc-0000000BHgR-3FBT;
	Wed, 15 Jan 2025 09:20:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzTR-0000000BFZR-0sxa
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:14:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e06af753so3253103f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 01:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736932443; x=1737537243; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkB3uXY/AOyeg5DHcTZ6HX3qGswDR1dziSNDHE7y11I=;
        b=HdSi3YAEDYO97/min4UO33g5ePxJORsr9uBPL1fceLl0n2X32TV2PR17TEGFThC1yi
         o7QPs9A7x5Zm+53BAevfUy+aakeMRNa0It2Ss8UQMh2Kjk9cC2g/WoeYrjRQYjgCw9yg
         iHytlheFseTjViV/rYYLNQ5F58/mzdYkHPH0U4M24agFbah8vIqbA7r2BoRdbYefgXgL
         qyX1Ap4SnvznwJxeOiyzrAVvynYf+sDBMapS79YwjebdrCAsKl4dkcREGMgBgQAdv8v3
         I3jI4gmAxi/QbsZ4AbLox9gvgeZzTkYF3xQhX1r2vFsR5KlXDwlWCgPFWWiTrP+dJouZ
         dlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932443; x=1737537243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkB3uXY/AOyeg5DHcTZ6HX3qGswDR1dziSNDHE7y11I=;
        b=LR1hnjLTNzcvwUzBztXwkp6PCX1iwaZSjNm6eSfdXcFxxhgcNail4TEO6C4Y6G/PjS
         cx+LLt3Ig4UNV/p83+XATP6foKSWgjSEJsGUbZwkHiJbUUJEcLCZZTvphCiPvGjc7E1s
         TgSC+rzld4vSk1K5tt4uRvNZFtZ+jx52l/MzdqbY/4DC1gFM6VQiIoCvhYRo33Qrh3uw
         NV328M0iUjdqLGmRUPm5FPcAkrWqnYmctg/u4ImNvKoRJaEeEXzGoVKT/a9hia4Ts1wk
         PJ6MR3idfDiazrFMq9Uc9a0L7lOWS0X8I1qPMIFXnj9bUfQN/r/oN+NcIlnnX8gVutFA
         J+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuwQjL2uj19lzrNyAHMEgzPs7mUUorvsycn+BWMuDq8kdxZhBBRUjYq5EjNQtdtiNt3Ae3iF5hQuvtEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQsm/IDlsrx7J3DTo+fbz/CnUaCB0uVKcx154hIAR80QS5RJUx
	niHKYP4EyhTtpTnVpMhZMefHQzWi8nghfRVO4nVk6Bmz/1fmGmTtYoXush91syw=
X-Gm-Gg: ASbGncv4mRwwj5uWfhtR+R2oxy+lhOvBVAf/P//zEtfHD3gaSjH/bwOy+TFL+Py0FOA
	0HyIRn3QNF7vZ/ZWTGC6EanYt1DP12dQil25M/K9qD7y9oDFYaAGbbtMYG8gK6rFdU3DZXelmil
	CJITfFnX6XzewvY/+wu3B98Fv78f7iY16/9kTecVhrz1JZbCkNtXSFyFDGj2N6+5m1m7Qs3L73/
	Ias6keEhBnDC9Id1F1eSGg4mUqXqAMY+vAxw7ZvY2M8ki5T/x0PdjXbwDyHHNEfbqgWI6HXF0Ig
	n5tsmOuIsrj9jmTp9tirliWxT5IBEf/TPsgdvTBMnw==
X-Google-Smtp-Source: AGHT+IGmhitdB2mwPEw/mSZXPL9iFDHsGoUy45feW5F9AYgsqTCf/RMUBQMFPFd1JqfQEgOZ/guGog==
X-Received: by 2002:a5d:64e2:0:b0:38b:e32a:10ab with SMTP id ffacd0b85a97d-38be32a13a4mr4176173f8f.9.1736932443464;
        Wed, 15 Jan 2025 01:14:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e3b97sm15973265e9.32.2025.01.15.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:14:03 -0800 (PST)
Date: Wed, 15 Jan 2025 10:14:02 +0100
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
Subject: Re: [PATCH v5 2/2] riscv: selftests: Add a ptrace test to verify a0
 and orig_a0 access
Message-ID: <20250115-28c95808502d43f84b3fe0a6@orel>
References: <20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name>
 <20250115-riscv-new-regset-v5-2-d0e6ec031a23@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v5-2-d0e6ec031a23@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_011405_268009_8E31686E 
X-CRM114-Status: GOOD (  35.05  )
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

On Wed, Jan 15, 2025 at 04:24:59AM +0800, Celeste Liu wrote:
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
>  tools/testing/selftests/riscv/abi/ptrace.c   | 201 +++++++++++++++++++++=
++++++
>  3 files changed, 207 insertions(+), 1 deletion(-)
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
> index 0000000000000000000000000000000000000000..f1a0458adccdd040bfaa350e2=
e8d98b1ef34c0ad
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> @@ -0,0 +1,201 @@
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
> +#include <asm/ptrace.h>
> +
> +#include "../../kselftest_harness.h"
> +
> +#ifndef sizeof_field
> +#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
> +#endif
> +#ifndef offsetofend
> +#define offsetofend(TYPE, MEMBER) \
> +	(offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
> +#endif

I think this is the sixth test to define these. We should copy
include/linux/stddef.h into tools/include. We already have
tools/include/uapi/linux/stddef.h with __struct_group and
__DECLARE_FLEX_ARRAY, so I think it should just work.

> +
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
> +	/* a0 will keep default value, orig_a0 or -ENOSYS, depends on internal.=
 */
> +	EXPECT_NE(A0_NEW, result[0].a0);

I don't understand this test. Why don't we know what to expect? Also, the
comment says orig_a0 is an option for the value, but then we don't expect
it to be A0_NEW, even though we expect orig_a0 to be A0_NEW?

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

Other than the two comments/questions, this test looks great.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
