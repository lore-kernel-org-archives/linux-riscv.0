Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDBCEEE27A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 02:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+eFE4i90W5V4yg2vaSTpt3/MumrMdKVdsCHxoJ9ch8=; b=bUlC6ekog9OBxT
	l07Xqsl8UaJ1MOstnhz2/HAR1DEAxVtm26ku0Jm9eBiMwfIA+j+qcUYw49y63fH7gnAnvg2N7XeHD
	pNR4A3/F7PNuNi2aLIKW2u+4efotqJClA7fVom0CMt4CMb/2Yw57lZQMxVd+vOzrtFD111iZMYaHn
	n87q2XPqShiRCLOBW9nfnVyOAiyUwurvqUSq8/xq3k/Djum9F1DlBI6Bcz6uMRO3mTlNjtAwgxOnr
	R78bXAYLxgGH8D2kqUfJOyb5dI45biHc4zQ87yMFSWkYoapK6SLxt5/NALHpGnYxOb8mxssXILps4
	kp6JGxEtsp2Gx2VnmaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowTV-0000000EmBb-2Dfe;
	Fri, 13 Sep 2024 02:55:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowST-0000000Em1F-30HY
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 02:54:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2068acc8b98so15458805ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 19:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726196093; x=1726800893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/P8PUdJnvCleQHGflHWKJwQSU5jI0eeDWaSn23VHlk=;
        b=JJDGl6lDLMm1GDJXL96aHi5N3u/6ch0tUZkMPWjsXO+q4sgnxMh1/+9Ny4TPkLEu82
         Cb2w7E4HP7fHaaMqXY7cEDg+THs9lDxf4kJ/gd+S2RLikCEuHhsPZXFhvrejU1onjVYe
         4n0ZnLa4aovLjUrbIY8J+tqe7Dyzm43ZkdrB5M4v11JN2BWLBaWPKprLA4fj8ZQscE9X
         RCvzoVuwuj3S74oHk8bi0rBDXMMIaInjYuZOtMZ0vdaqm8mqW+nCqHH36tg6PY5Qy3Th
         zm2Rih70yRNRLcaE7vh+iWMTPvfrnhUIrwIV8WziLtyxshXn+9ixo9hjURETM4IxLDjs
         O0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726196093; x=1726800893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/P8PUdJnvCleQHGflHWKJwQSU5jI0eeDWaSn23VHlk=;
        b=PhaTHvs7BBepn+L+zW/P2Y/DLo9r8RVuyIy2HqWtPA5K6Umn9h6GN7aBg2s23LD929
         XfakX+6dB8maFnSnQRtRMogy8z6SmtZZproucF0CpKHSSlhmpiMfJt8AECULPm9QnpXH
         2tUcnI303dxvMFBGE4316Sm5I43smL+pgFv56mmMDBbUGsLrtsZQdKFIDCQcjFtbunSr
         ogKzWPsBwtaz1FnmtNNLq9yl59UwSnlVGJvn9COIcuNTMS32/3f7/jFDKxnyLTXJZeHL
         81cK6VaOcjv5GlwfLgIxGwrnltoxkRrHbrE17N7RtNRIpUaZ4vOZlqJ0zQ4duZDKGObL
         tR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBEz1XlR/wF4+hYxHOS1d7fmz30eZWFOGfG18IzyzzRDGJc46be+F5YRSqu0mDMcdVgP6K7It2ychsqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF0Vj1JHc9lTRL5J2EQadi8lln/lbC9Oq7zRAii7k2KQ/v745C
	XLCpfe4B8Q5aRD3HbGYbb2dixSDShoS/MSmxBEYuGZV2fHEWex+Arvodbsz/rkCbZkiw/Q8z7gT
	u
X-Google-Smtp-Source: AGHT+IEBFt1rQLh+y+QAZIklzaCIhPnDP4xTdJ7YpOtZC9XQCR02JK6exakLY4qQcqeoMCking/YYA==
X-Received: by 2002:a17:903:185:b0:205:8425:e9c6 with SMTP id d9443c01a7336-2076e43fe94mr56673625ad.52.1726196092428;
        Thu, 12 Sep 2024 19:54:52 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01a329sm20082975ad.290.2024.09.12.19.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 19:54:51 -0700 (PDT)
Date: Thu, 12 Sep 2024 19:54:49 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 07/10] selftests: riscv: Add a pointer masking test
Message-ID: <ZuOpeSDO173y8Ut7@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-8-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-8-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_195453_794255_13415B8D 
X-CRM114-Status: GOOD (  32.77  )
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

On Wed, Aug 28, 2024 at 06:01:29PM -0700, Samuel Holland wrote:
> This test covers the behavior of the PR_SET_TAGGED_ADDR_CTRL and
> PR_GET_TAGGED_ADDR_CTRL prctl() operations, their effects on the
> userspace ABI, and their effects on the system call ABI.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - Rename "tags" directory to "pm" to avoid .gitignore rules
>  - Add .gitignore file to ignore the compiled selftest binary
>  - Write to a pipe to force dereferencing the user pointer
>  - Handle SIGSEGV in the child process to reduce dmesg noise
> 
>  tools/testing/selftests/riscv/Makefile        |   2 +-
>  tools/testing/selftests/riscv/pm/.gitignore   |   1 +
>  tools/testing/selftests/riscv/pm/Makefile     |  10 +
>  .../selftests/riscv/pm/pointer_masking.c      | 330 ++++++++++++++++++
>  4 files changed, 342 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/pm/.gitignore
>  create mode 100644 tools/testing/selftests/riscv/pm/Makefile
>  create mode 100644 tools/testing/selftests/riscv/pm/pointer_masking.c
> 
> diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> index 7ce03d832b64..2ee1d1548c5f 100644
> --- a/tools/testing/selftests/riscv/Makefile
> +++ b/tools/testing/selftests/riscv/Makefile
> @@ -5,7 +5,7 @@
>  ARCH ?= $(shell uname -m 2>/dev/null || echo not)
>  
>  ifneq (,$(filter $(ARCH),riscv))
> -RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
> +RISCV_SUBTARGETS ?= hwprobe mm pm sigreturn vector
>  else
>  RISCV_SUBTARGETS :=
>  endif
> diff --git a/tools/testing/selftests/riscv/pm/.gitignore b/tools/testing/selftests/riscv/pm/.gitignore
> new file mode 100644
> index 000000000000..b38358f91c4d
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/pm/.gitignore
> @@ -0,0 +1 @@
> +pointer_masking
> diff --git a/tools/testing/selftests/riscv/pm/Makefile b/tools/testing/selftests/riscv/pm/Makefile
> new file mode 100644
> index 000000000000..ed82ff9c664e
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/pm/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := pointer_masking
> +
> +include ../../lib.mk
> +
> +$(OUTPUT)/pointer_masking: pointer_masking.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/pm/pointer_masking.c b/tools/testing/selftests/riscv/pm/pointer_masking.c
> new file mode 100644
> index 000000000000..0fe80f963ace
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/pm/pointer_masking.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <setjmp.h>
> +#include <signal.h>
> +#include <stdbool.h>
> +#include <sys/prctl.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +#include "../../kselftest.h"
> +
> +#ifndef PR_PMLEN_SHIFT
> +#define PR_PMLEN_SHIFT			24
> +#endif
> +#ifndef PR_PMLEN_MASK
> +#define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
> +#endif
> +
> +static int dev_zero;
> +
> +static int pipefd[2];
> +
> +static sigjmp_buf jmpbuf;
> +
> +static void sigsegv_handler(int sig)
> +{
> +	siglongjmp(jmpbuf, 1);
> +}
> +
> +static int min_pmlen;
> +static int max_pmlen;
> +
> +static inline bool valid_pmlen(int pmlen)
> +{
> +	return pmlen == 0 || pmlen == 7 || pmlen == 16;
> +}
> +
> +static void test_pmlen(void)
> +{
> +	ksft_print_msg("Testing available PMLEN values\n");
> +
> +	for (int request = 0; request <= 16; request++) {
> +		int pmlen, ret;
> +
> +		ret = prctl(PR_SET_TAGGED_ADDR_CTRL, request << PR_PMLEN_SHIFT, 0, 0, 0);
> +		if (ret)
> +			goto pr_set_error;
> +
> +		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
> +		ksft_test_result(ret >= 0, "PMLEN=%d PR_GET_TAGGED_ADDR_CTRL\n", request);
> +		if (ret < 0)
> +			goto pr_get_error;
> +
> +		pmlen = (ret & PR_PMLEN_MASK) >> PR_PMLEN_SHIFT;
> +		ksft_test_result(pmlen >= request, "PMLEN=%d constraint\n", request);
> +		ksft_test_result(valid_pmlen(pmlen), "PMLEN=%d validity\n", request);
> +
> +		if (min_pmlen == 0)
> +			min_pmlen = pmlen;
> +		if (max_pmlen < pmlen)
> +			max_pmlen = pmlen;
> +
> +		continue;
> +
> +pr_set_error:
> +		ksft_test_result_skip("PMLEN=%d PR_GET_TAGGED_ADDR_CTRL\n", request);
> +pr_get_error:
> +		ksft_test_result_skip("PMLEN=%d constraint\n", request);
> +		ksft_test_result_skip("PMLEN=%d validity\n", request);
> +	}
> +
> +	if (max_pmlen == 0)
> +		ksft_exit_fail_msg("Failed to enable pointer masking\n");
> +}
> +
> +static int set_tagged_addr_ctrl(int pmlen, bool tagged_addr_abi)
> +{
> +	int arg, ret;
> +
> +	arg = pmlen << PR_PMLEN_SHIFT | tagged_addr_abi;
> +	ret = prctl(PR_SET_TAGGED_ADDR_CTRL, arg, 0, 0, 0);
> +	if (!ret) {
> +		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
> +		if (ret == arg)
> +			return 0;
> +	}
> +
> +	return ret < 0 ? -errno : -ENODATA;
> +}
> +
> +static void test_dereference_pmlen(int pmlen)
> +{
> +	static volatile int i;
> +	volatile int *p;
> +	int ret;
> +
> +	ret = set_tagged_addr_ctrl(pmlen, false);
> +	if (ret)
> +		return ksft_test_result_error("PMLEN=%d setup (%d)\n", pmlen, ret);
> +
> +	i = pmlen;
> +
> +	if (pmlen) {
> +		p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen);
> +
> +		/* These dereferences should succeed. */
> +		if (sigsetjmp(jmpbuf, 1))
> +			return ksft_test_result_fail("PMLEN=%d valid tag\n", pmlen);
> +		if (*p != pmlen)
> +			return ksft_test_result_fail("PMLEN=%d bad value\n", pmlen);
> +		*p++;
> +	}
> +
> +	p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen - 1);
> +
> +	/* These dereferences should raise SIGSEGV. */
> +	if (sigsetjmp(jmpbuf, 1))
> +		return ksft_test_result_pass("PMLEN=%d dereference\n", pmlen);
> +	*p++;
> +	ksft_test_result_fail("PMLEN=%d invalid tag\n", pmlen);
> +}
> +
> +static void test_dereference(void)
> +{
> +	ksft_print_msg("Testing userspace pointer dereference\n");
> +
> +	signal(SIGSEGV, sigsegv_handler);
> +
> +	test_dereference_pmlen(0);
> +	test_dereference_pmlen(min_pmlen);
> +	test_dereference_pmlen(max_pmlen);
> +
> +	signal(SIGSEGV, SIG_DFL);
> +}
> +
> +static void execve_child_sigsegv_handler(int sig)
> +{
> +	exit(42);
> +}
> +
> +static int execve_child(void)
> +{
> +	static volatile int i;
> +	volatile int *p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - 7);
> +
> +	signal(SIGSEGV, execve_child_sigsegv_handler);
> +
> +	/* This dereference should raise SIGSEGV. */
> +	return *p;
> +}
> +
> +static void test_fork_exec(void)
> +{
> +	int ret, status;
> +
> +	ksft_print_msg("Testing fork/exec behavior\n");
> +
> +	ret = set_tagged_addr_ctrl(min_pmlen, false);
> +	if (ret)
> +		return ksft_test_result_error("setup (%d)\n", ret);
> +
> +	if (fork()) {
> +		wait(&status);
> +		ksft_test_result(WIFEXITED(status) && WEXITSTATUS(status) == 42,
> +				 "dereference after fork\n");
> +	} else {
> +		static volatile int i = 42;
> +		volatile int *p = (volatile int *)((uintptr_t)&i | 1UL << __riscv_xlen - min_pmlen);
> +
> +		/* This dereference should succeed. */
> +		exit(*p);
> +	}
> +
> +	if (fork()) {
> +		wait(&status);
> +		ksft_test_result(WIFEXITED(status) && WEXITSTATUS(status) == 42,
> +				 "dereference after fork+exec\n");
> +	} else {
> +		/* Will call execve_child(). */
> +		execve("/proc/self/exe", (char *const []) { "", NULL }, NULL);
> +	}
> +}
> +
> +static void test_tagged_addr_abi_sysctl(void)
> +{
> +	char value;
> +	int fd;
> +
> +	ksft_print_msg("Testing tagged address ABI sysctl\n");
> +
> +	fd = open("/proc/sys/abi/tagged_addr_disabled", O_WRONLY);
> +	if (fd < 0) {
> +		ksft_test_result_skip("failed to open sysctl file\n");
> +		ksft_test_result_skip("failed to open sysctl file\n");
> +		return;
> +	}
> +
> +	value = '1';
> +	pwrite(fd, &value, 1, 0);
> +	ksft_test_result(set_tagged_addr_ctrl(min_pmlen, true) == -EINVAL,
> +			 "sysctl disabled\n");
> +
> +	value = '0';
> +	pwrite(fd, &value, 1, 0);
> +	ksft_test_result(set_tagged_addr_ctrl(min_pmlen, true) == 0,
> +			 "sysctl enabled\n");
> +
> +	set_tagged_addr_ctrl(0, false);
> +
> +	close(fd);
> +}
> +
> +static void test_tagged_addr_abi_pmlen(int pmlen)
> +{
> +	int i, *p, ret;
> +
> +	i = ~pmlen;
> +
> +	if (pmlen) {
> +		p = (int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen);

I am trying to put something together with
https://lore.kernel.org/linux-mm/20240905-patches-below_hint_mmap-v3-2-3cd5564efbbb@rivosinc.com/T/
to ensure that the upper addresses aren't allocated. This is only
relevant on sv57 and PMLEN=16 hardware where addresses could overlap.

> +
> +		ret = set_tagged_addr_ctrl(pmlen, false);
> +		if (ret)
> +			return ksft_test_result_error("PMLEN=%d ABI disabled setup (%d)\n",
> +						      pmlen, ret);
> +
> +		ret = write(pipefd[1], p, sizeof(*p));
> +		if (ret >= 0 || errno != EFAULT)
> +			return ksft_test_result_fail("PMLEN=%d ABI disabled write\n", pmlen);
> +
> +		ret = read(dev_zero, p, sizeof(*p));
> +		if (ret >= 0 || errno != EFAULT)
> +			return ksft_test_result_fail("PMLEN=%d ABI disabled read\n", pmlen);
> +
> +		if (i != ~pmlen)
> +			return ksft_test_result_fail("PMLEN=%d ABI disabled value\n", pmlen);
> +
> +		ret = set_tagged_addr_ctrl(pmlen, true);
> +		if (ret)
> +			return ksft_test_result_error("PMLEN=%d ABI enabled setup (%d)\n",
> +						      pmlen, ret);
> +
> +		ret = write(pipefd[1], p, sizeof(*p));
> +		if (ret != sizeof(*p))
> +			return ksft_test_result_fail("PMLEN=%d ABI enabled write\n", pmlen);
> +
> +		ret = read(dev_zero, p, sizeof(*p));
> +		if (ret != sizeof(*p))
> +			return ksft_test_result_fail("PMLEN=%d ABI enabled read\n", pmlen);
> +
> +		if (i)
> +			return ksft_test_result_fail("PMLEN=%d ABI enabled value\n", pmlen);
> +
> +		i = ~pmlen;
> +	} else {
> +		/* The tagged address ABI cannot be enabled when PMLEN == 0. */
> +		ret = set_tagged_addr_ctrl(pmlen, true);
> +		if (ret != -EINVAL)
> +			return ksft_test_result_error("PMLEN=%d ABI setup (%d)\n",
> +						      pmlen, ret);
> +	}
> +
> +	p = (int *)((uintptr_t)&i | 1UL << __riscv_xlen - pmlen - 1);
> +
> +	ret = write(pipefd[1], p, sizeof(*p));
> +	if (ret >= 0 || errno != EFAULT)
> +		return ksft_test_result_fail("PMLEN=%d invalid tag write (%d)\n", pmlen, errno);
> +
> +	ret = read(dev_zero, p, sizeof(*p));
> +	if (ret >= 0 || errno != EFAULT)
> +		return ksft_test_result_fail("PMLEN=%d invalid tag read\n", pmlen);
> +
> +	if (i != ~pmlen)
> +		return ksft_test_result_fail("PMLEN=%d invalid tag value\n", pmlen);
> +
> +	ksft_test_result_pass("PMLEN=%d tagged address ABI\n", pmlen);
> +}
> +
> +static void test_tagged_addr_abi(void)
> +{
> +	ksft_print_msg("Testing tagged address ABI\n");
> +
> +	test_tagged_addr_abi_pmlen(0);
> +	test_tagged_addr_abi_pmlen(min_pmlen);
> +	test_tagged_addr_abi_pmlen(max_pmlen);
> +}
> +
> +static struct test_info {
> +	unsigned int nr_tests;
> +	void (*test_fn)(void);
> +} tests[] = {
> +	{ .nr_tests = 17 * 3, test_pmlen },
> +	{ .nr_tests = 3, test_dereference },
> +	{ .nr_tests = 2, test_fork_exec },
> +	{ .nr_tests = 2, test_tagged_addr_abi_sysctl },
> +	{ .nr_tests = 3, test_tagged_addr_abi },
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	unsigned int plan = 0;
> +	int ret;
> +
> +	/* Check if this is the child process after execve(). */
> +	if (!argv[0][0])
> +		return execve_child();
> +
> +	dev_zero = open("/dev/zero", O_RDWR);
> +	if (dev_zero < 0)
> +		return 1;
> +
> +	/* Write to a pipe so the kernel must dereference the buffer pointer. */
> +	ret = pipe(pipefd);
> +	if (ret)
> +		return 1;
> +
> +	ksft_print_header();
> +
> +	for (int i = 0; i < ARRAY_SIZE(tests); ++i)
> +		plan += tests[i].nr_tests;
> +
> +	ksft_set_plan(plan);
> +
> +	for (int i = 0; i < ARRAY_SIZE(tests); ++i)
> +		tests[i].test_fn();
> +
> +	ksft_finished();
> +}
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
