Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A86C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 02:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/LuZOKebmv4csi34VQ88EQqR0e3pzSvuo9/5AcueMM=; b=Tqy84yQROhgDSv
	xWw20IZFiBWcjBI/EXN4X3QDQeYmdvXU5KeZQnlQD81K9V0B4PW4ApeS5uXix2N5XkJqpAYd1vidL
	9hIbB4yfoaPwVUxmWLtk39wO2q9S65ntVeSgxLQ9J/8jf7C13A6YfqiyMxSzixNp1Pm/eax9VsmaL
	tBwlLXm6YqoTT/M6SaYSQJwBha9CS4pbjVBXlQECaqYRAygQGtlp7TMENEegQm9Uq/ghcxpXGT8UG
	ZpVVzqfMogc6I4T/5MfCGktEf3My2AexuEOzrhEvOWauTyGicc/uLPEaGAxgDX+sDBivegL1lqN6F
	1dDvtJ8dTyZKebJrBHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK7x7-00000003Ozy-3oOm;
	Thu, 20 Jun 2024 02:55:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK7x4-00000003Oz2-3AAz
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 02:55:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2c7dd4586afso393670a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718852106; x=1719456906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0YpBScLtAJGTGM2s3CoYyWDmo/kLXPc7O8IoTMAC7I=;
        b=eQXnkZkS5aoYuV7+/QUviMJCUhKDD5JO1hpFfynpdKm99WjotUZgQQSEsnfYD/SuA/
         y/PNMc7n77cZRGQhrk9130yHLfq8ceMdb01+gGB9StgaBNl9PkQTqEmW9GLsKO5wTuft
         KNfpI0oMhsIkBmKVRjL/m97evDUixEmGYmyuAkr4b2WwjpnHs8eziZpq5v2KUFhGKXK4
         +9oswgdR72DKLi1U254KT/sGE8vM/rafBoJRGGv4u9W6xturbdi9ZdO+6DnNoAbtujZD
         lIrfO2Pe5KpzvxRTb6fiEqyzCbU7ogfotq3l52NP3XoOuYGnDThnt4lm+dyvoipNssSZ
         lgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718852106; x=1719456906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0YpBScLtAJGTGM2s3CoYyWDmo/kLXPc7O8IoTMAC7I=;
        b=IC9V9vLW6mbYCNjm97BRbLeS9tS2TJmSdbRLlx6enRByN4/EhEr4lqg4hOAHiL6gyd
         yR1dLkYlGgYvT77uHtXQQdqVV/B/sbJGMsrWGyoS1VN66GpxKOoK+yhudUvr+cCKZSKa
         WbyvfjLke40ufVtubzFoYGVWYyVFToqNpHLHJTWuoLmo3U/lZnIPjwuG0LjmC5fCmY6T
         1SpqQBsLhRgWpMwYe8TMEigMLdP6Rd+9YNZcIDvLIUkJWYOVSIfsl8+vNCwrXo1w5/rj
         6LXsDBcfxp8DHZgUEvvNmRptlNRPrKO3GaZif72mUrUksrySgL7LFsNiRyAYlD1uj57W
         i95g==
X-Gm-Message-State: AOJu0Yw9owieLv9RG1ZdFXMQCMUmiqo12INbvQkg88SZhsR4vTs4j0qY
	SIoGFdbgVwRMGh31ZzEQlLOJNJDMuM2HzNDthTQ/bu9tF3jxChG2MBS7CnHqw+8=
X-Google-Smtp-Source: AGHT+IGoHty+m475VS6H7tBXu/rGiyFhft2efoZBmP4zONICNba0bof2A+QASS4REaNRwQE+15tCtw==
X-Received: by 2002:a17:90a:1fc7:b0:2c7:c788:d34d with SMTP id 98e67ed59e1d1-2c7c788d4dcmr3119962a91.38.1718852105931;
        Wed, 19 Jun 2024 19:55:05 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e57ce2e9sm446262a91.33.2024.06.19.19.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 19:55:05 -0700 (PDT)
Date: Wed, 19 Jun 2024 19:55:01 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, oleg@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	andy.chiu@sifive.com, shuah@kernel.org
Subject: Re: [RFC PATCH 2/2] riscv: selftests: Add a ptrace test to check a0
 of restarted syscall
Message-ID: <ZnOaBeNnNpvrE5ss@ghost>
References: <cover.1718693532.git.zhouquan@iscas.ac.cn>
 <b5fbdd3417e925dbe5db4716e51ce49d21d27f2f.1718693532.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5fbdd3417e925dbe5db4716e51ce49d21d27f2f.1718693532.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_195506_953319_BCAEFA1B 
X-CRM114-Status: GOOD (  33.97  )
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

On Wed, Jun 19, 2024 at 10:01:47AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> This test creates two processes: a tracer and a tracee. The tracer actively
> sends a SIGUSR1 signal in user mode to interrupt the read syscall being
> executed by the tracee. We will reset a0/orig_a0 and then observe the value
> of a0 held by the restarted read syscall.

I don't quite follow what the goal of this test is. With orig_a0 being
added to the previous patch for ptrace, a more constrained test could
ensure that this value is respected.

> 
> Compared to the test program, a more common scenario is the use of the
> exece syscall, which sends a signal in the kernel path to restart
> the syscall.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/riscv/Makefile        |   2 +-
>  tools/testing/selftests/riscv/abi/.gitignore  |   1 +
>  tools/testing/selftests/riscv/abi/Makefile    |  12 ++
>  .../riscv/abi/ptrace_restart_syscall.c        | 148 ++++++++++++++++++
>  4 files changed, 162 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/abi/.gitignore
>  create mode 100644 tools/testing/selftests/riscv/abi/Makefile
>  create mode 100644 tools/testing/selftests/riscv/abi/ptrace_restart_syscall.c
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
> index 000000000000..e1e00ffb9db9
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/.gitignore
> @@ -0,0 +1 @@
> +abi

The gitignore should contain a list of all of the generated binaries
that should be ignored. Can you put ptrace_restart_syscall in here
instead of abi?

> diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
> new file mode 100644
> index 000000000000..634fa7de74e6
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2021 ARM Limited
> +# Originally tools/testing/arm64/abi/Makefile
> +
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := ptrace_restart_syscall
> +
> +include ../../lib.mk
> +
> +$(OUTPUT)/ptrace_restart_syscall: ptrace_restart_syscall.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/abi/ptrace_restart_syscall.c b/tools/testing/selftests/riscv/abi/ptrace_restart_syscall.c
> new file mode 100644
> index 000000000000..3e25548cb95e
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/abi/ptrace_restart_syscall.c
> @@ -0,0 +1,148 @@
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
> +#define ORIG_A0_AFTER_MODIFIED  0x5
> +#define MODIFY_A0               0x01
> +#define MODIFY_ORIG_A0          0x02
> +
> +#define perr_and_exit(fmt, ...) do {			\
> +	char buf[256];					\
> +	snprintf(buf, sizeof(buf), "%s:%d: " fmt ": %m\n",	\
> +			__func__, __LINE__, ##__VA_ARGS__);	\
> +	perror(buf);						\
> +	exit(-1);						\
> +} while (0)
> +
> +static inline void resume_and_wait_tracee(pid_t pid, int flag)
> +{
> +	int status;
> +
> +	if (ptrace(flag, pid, 0, 0))
> +		perr_and_exit("failed to resume the tracee %d", pid);
> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d", pid);
> +}
> +
> +static void ptrace_restart_syscall(int opt, int *result)
> +{
> +	int status;
> +	int p[2], fd_zero;
> +	pid_t pid;
> +
> +	struct user_regs_struct regs;
> +	struct iovec iov = {
> +		.iov_base = &regs,
> +		.iov_len = sizeof(regs),
> +	};
> +
> +	if (pipe(p))
> +		perr_and_exit("failed to create a pipe");
> +
> +	fd_zero = open("/dev/zero", O_RDONLY);
> +	if (fd_zero < 0)
> +		perr_and_exit("failed to open /dev/zero");
> +
> +	pid = fork();
> +	if (pid == 0) {
> +		char c;
> +
> +		/* Mark oneself being traced */
> +		if (ptrace(PTRACE_TRACEME, 0, 0, 0))
> +			perr_and_exit("failed to request for tracer to trace me");
> +
> +		kill(getpid(), SIGSTOP);
> +
> +		if (read(p[0], &c, 1) != 1)
> +			exit(1);
> +
> +		exit(0);
> +	} else if (pid < 0)
> +		exit(1);
> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> +
> +	/* Resume the tracee until the next syscall */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Deliver a signal to interrupt the syscall */
> +	kill(pid, SIGUSR1);
> +
> +	/* The tracee stops at syscall exit */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Check tracee orig_a0 before syscall restart */
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to get tracee registers");
> +	if (regs.orig_a0 != p[0])
> +		perr_and_exit("unexpected a0");
> +
> +	/* Modify a0/orig_a0 for the restarted syscall */
> +	switch (opt) {
> +	case MODIFY_A0:
> +		regs.a0 = fd_zero;
> +		break;
> +	case MODIFY_ORIG_A0:
> +		regs.orig_a0 = fd_zero;
> +		break;
> +	}
> +
> +	if (ptrace(PTRACE_SETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to set tracee registers");
> +
> +	/* Ignore SIGUSR1 signal */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Stop at the entry point of the restarted syscall */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Now, check regs.a0 of the restarted syscall */
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to get tracee registers");
> +	*result = regs.a0;
> +
> +	/* Resume the tracee */
> +	ptrace(PTRACE_CONT, pid, 0, 0);
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee");
> +}
> +
> +TEST(ptrace_modify_a0)
> +{
> +	int result;
> +
> +	ptrace_restart_syscall(MODIFY_A0, &result);
> +
> +	/* The tracer's modification of a0 cannot affect the restarted tracee */
> +	EXPECT_NE(ORIG_A0_AFTER_MODIFIED, result);
> +}
> +
> +TEST(ptrace_modify_orig_a0)
> +{
> +	int result;
> +
> +	ptrace_restart_syscall(MODIFY_ORIG_A0, &result);
> +
> +	/* The tracer must modify orig_a0 to actually change the tracee's a0 */
> +	EXPECT_EQ(ORIG_A0_AFTER_MODIFIED, result);

How does the value end up being 5?

- Charlie

> +}
> +
> +TEST_HARNESS_MAIN
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
