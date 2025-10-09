Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E9BCCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+VsjflMIURJ4oQJb65INrJM/pW4G/xDAn0c7ah4tEE=; b=OIvK/KIZBcH5vD
	DJlIGlF0YWev/2vZ5FR6qVv0gmQmCXpch39V6ohhsunm7NobpjIhq+jY8RZMCedAqpDFVl3ywkrc4
	PR2AlL0SRGNBbXeBf2B4De4DcsbcaPICBvkIcNubCx1Df6U1Eml9zoGkzlAL6pY0vB8U4UbCiEc7m
	I2Bl/h4vas/4G4EFP6mGm0EBfKfdyrMPv3Ll4jaS3VPA2qQQld83xt6HfqAKkEnLltHyQ3hF8HK7F
	4L6Mi3TgldNKVOjm9TU4J/M9kFHdYvbmfz+Cm9Sz5udBjL1znldDC023LvBk3dXIV8G7o/yLNwiMm
	xaqbL6CWaYqBt0haUPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u6J-00000006mWJ-25UI;
	Thu, 09 Oct 2025 17:06:47 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u6G-00000006mVo-3fBo
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 17:06:46 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-9032edd72c1so134863839f.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760029604; x=1760634404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKPMxaw1e/CSI4IBpW9bqFcqd8FgCY16hn8f9eezxvU=;
        b=TWaTbwC2p/aSoB8OxjjiqpPY4OO7m+XZmqGXkYcKNp2j4FYoEarasxD8hC19/irX+D
         Ht9xmMyvg0MBklzJpixsHkaTMUYnd760SGs9M3988UHxY/JAM+H94KjmNq1n9cZ5Ftg3
         23pUqMEGDpUlDCx8R6kcvwrww34s//5IVPPzX9uBeNqtHdG4UiyYxG85DF8KVB8zOooO
         oJZRDiP8FQaVApHsfzYpK1gPnZSc9V6EXfyFwfnf7NRNCcfPVl4569agPIPSX+bIEFwe
         BGG5MibDaK8+qumlNld1jEte5x2K195H27O5/zFO4WtBC4gPaeym5nN0t5888oCMtTWG
         KA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029604; x=1760634404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKPMxaw1e/CSI4IBpW9bqFcqd8FgCY16hn8f9eezxvU=;
        b=H+qlD+3/8Vpt9/SUbdIopsCw20uv3iMobByK9o/csypyIDojQtSLv6UvzqbzN9a9wf
         8UUekK0/TaTCO3jAm6OcXTkJXaz9V5hPn7Yeb5kjpV+ErHkYnVbZc0CCVKl0HCWe32eU
         Go3dlgpro0RUMwiIUNWhFLkvaBsFQQ3xyv+DypkzTfFt+nFKegUddk1Gr5KFoaOWVYas
         tVwNqcis4zbzedZiGsmaOhsznf3qjiWuYWATC98oB2NEnFH1wtu6tDe54Y/LaKnoIEdJ
         ifaJI3d3RRZmE/QWADJAXiWclsb5wKuI/QLw5L7qpQbr8TcFBz9MbESLJ2Y8bbPW1akt
         pi5A==
X-Gm-Message-State: AOJu0YyBdgYGWBG5CVQCUR8b6YbQklU0EcbVAiY9JV3sHfjSLH0bIKGQ
	xotzSiYh58kI2XLrQRJOLB2Qp1z4EQ+HCi8jRhhXdDS7MFbnZvIldzkIK5cwrteLc3aiXkOr8af
	83R6WfJc=
X-Gm-Gg: ASbGncsUTq/qZJVC75/sdcQXo4p0wqqcCPAo29DDDcZXWzceMldHNWOkdUMuDCPwmw5
	PDsB8Q2dzCef55qlC+PjBju07U2TQYyEeWYgRpEB59ijbvSRv1xJl1yB7B4BxmerQGJ0Sf64miA
	J4X4FxzwtRzqB4iycY6MbfDdKiRfycOZTgAFYckIPv0pvYKGF7J6hZgob1HTKRuaHDGnqsJOQPw
	kYMiXZONh99w4J9BBbsGaBhA/HToaxG0HBpKzVLis42PeO2q0lADKNwZOBTQOyurrkLxHYwOfqT
	jU3fJwBOog/eXr8AadhqPP5ai9EujnpgGIzcXekDFU0Ds16HZiIXEimFO6WY6dz7gLzj6vpZsBc
	5qbcpPPcK8Tr6oCa0Tvr/qGecncso08uOBXCCKc1U28h8NAY0MnnSytmitHI=
X-Google-Smtp-Source: AGHT+IE7HmtjM/fdzDtBAUsvXAeivVgUWkJTe2pyKClZENU3vOd6f/J8Y5IULzzyaLuO7T3tVJzjVQ==
X-Received: by 2002:a05:6e02:18c7:b0:424:7d95:b90b with SMTP id e9e14a558f8ab-42f8737e0b5mr87355225ab.14.1760029603650;
        Thu, 09 Oct 2025 10:06:43 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ebc84e7sm7896959173.36.2025.10.09.10.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:06:43 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:06:42 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251009-49032bae395a1c26cbe80928@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
 <20251009134318.23040-5-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-5-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_100644_928744_214116F4 
X-CRM114-Status: GOOD (  33.56  )
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

On Thu, Oct 09, 2025 at 09:41:54PM +0800, Yao Zihong wrote:
> Add a new selftest under hwprobe/ to verify Zicbop extension behavior.
> 
> The test checks:
> - That hwprobe correctly reports Zicbop presence and block size.
> - That prefetch instructions execute without exception on valid and NULL
>   addresses when Zicbop is present.
> - That prefetch.{i,r,w} do not trigger SIGILL even when Zicbop is absent,
>   since Zicbop instructions are defined as hints.
> 
> The test is based on cbo.c but adapted for Zicbop prefetch instructions.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
>  .../selftests/riscv/hwprobe/prefetch.c        | 236 ++++++++++++++++++
>  2 files changed, 240 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/prefetch.c
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
> index cec81610a5f2..3c8b8ba7629c 100644
> --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> @@ -4,7 +4,7 @@
>  
>  CFLAGS += -I$(top_srcdir)/tools/include
>  
> -TEST_GEN_PROGS := hwprobe cbo which-cpus
> +TEST_GEN_PROGS := hwprobe cbo which-cpus prefetch
>  
>  include ../../lib.mk
>  
> @@ -16,3 +16,6 @@ $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
>  
>  $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/prefetch: prefetch.c sys_hwprobe.S
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/hwprobe/prefetch.c b/tools/testing/selftests/riscv/hwprobe/prefetch.c
> new file mode 100644
> index 000000000000..d9ea048325fb
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/prefetch.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + * Copyright (c) 2025 PLCT Lab, ISCAS
> + *
> + * Based on tools/testing/selftests/riscv/hwprobe/cbo.c with modifications
> + * for Zicbop prefetch testing.
> + *
> + * Run with 'taskset -c <cpu-list> prefetch' to only execute hwprobe on a
> + * subset of cpus, as well as only executing the tests on those cpus.
> + */
> +#define _GNU_SOURCE
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <assert.h>
> +#include <linux/compiler.h>
> +#include <linux/kernel.h>
> +#include <asm/ucontext.h>
> +
> +#include "hwprobe.h"
> +#include "../../kselftest.h"
> +
> +#define MK_PREFETCH(fn) \
> +	le32_bswap(0 << 25 | (uint32_t)(fn) << 20 | 10 << 15 | 6 << 12 | 0 << 7 | 19)
> +
> +static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
> +
> +static bool illegal;
> +
> +static void sigill_handler(int sig, siginfo_t *info, void *context)
> +{
> +	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)->uc_mcontext;
> +	uint32_t insn = *(uint32_t *)regs[0];
> +
> +	assert(insn == MK_PREFETCH(regs[11]));
> +
> +	illegal = true;
> +	regs[0] += 4;
> +}
> +
> +#define prefetch_insn(base, fn)							\
> +({										\
> +	asm volatile(								\
> +	"mv	a0, %0\n"							\
> +	"li	a1, %1\n"							\
> +	".4byte	%2\n"								\
> +	: : "r" (base), "i" (fn), "i" (MK_PREFETCH(fn)) : "a0", "a1", "memory");\
> +})
> +
> +static void prefetch_i(char *base) { prefetch_insn(base, 0); }
> +
> +static void prefetch_r(char *base) { prefetch_insn(base, 1); }
> +
> +static void prefetch_w(char *base) { prefetch_insn(base, 3); }

Please remove the unnecessary blank lines between function definitions.

> +
> +static bool is_power_of_2(__u64 n)
> +{
> +	return n != 0 && (n & (n - 1)) == 0;
> +}
> +
> +static void test_no_zicbop(void *arg)
> +{
> +	// Zicbop prefetch.* are HINT instructions.

No C++ comments. Run checkpatch.

> +	ksft_print_msg("Testing Zicbop instructions\n");
> +
> +	illegal = false;
> +	prefetch_i(&mem[0]);
> +	ksft_test_result(!illegal, "No prefetch.i\n");
> +
> +	illegal = false;
> +	prefetch_r(&mem[0]);
> +	ksft_test_result(!illegal, "No prefetch.r\n");
> +
> +	illegal = false;
> +	prefetch_w(&mem[0]);
> +	ksft_test_result(!illegal, "No prefetch.w\n");
> +}
> +
> +static void test_zicbop(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE,
> +	};
> +	cpu_set_t *cpus = (cpu_set_t *)arg;
> +	__u64 block_size;
> +	long rc;
> +
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
> +	block_size = pair.value;
> +	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE &&
> +			 is_power_of_2(block_size), "Zicbop block size\n");
> +	ksft_print_msg("Zicbop block size: %llu\n", block_size);
> +
> +	illegal = false;
> +	prefetch_i(&mem[0]);
> +	prefetch_r(&mem[0]);
> +	prefetch_w(&mem[0]);
> +	ksft_test_result(!illegal, "Zicbop prefetch.* on valid address\n");
> +
> +	illegal = false;
> +	prefetch_i(NULL);
> +	prefetch_r(NULL);
> +	prefetch_w(NULL);
> +	ksft_test_result(!illegal, "Zicbop prefetch.* on NULL\n");
> +}
> +
> +static void check_no_zicbop_cpus(cpu_set_t *cpus)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> +	};
> +	cpu_set_t one_cpu;
> +	int i = 0, c = 0;
> +	long rc;
> +
> +	while (i++ < CPU_COUNT(cpus)) {
> +		while (!CPU_ISSET(c, cpus))
> +			++c;
> +
> +		CPU_ZERO(&one_cpu);
> +		CPU_SET(c, &one_cpu);
> +
> +		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
> +		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> +
> +		if (pair.value & RISCV_HWPROBE_EXT_ZICBOP)
> +			ksft_exit_fail_msg("zicbop is only present on a subset of harts.\n"
> +					   "Use taskset to select a set of harts where zicbop\n"
> +					   "presence (present or not) is consistent for each hart\n");
> +		++c;
> +	}
> +}
> +
> +enum {
> +	TEST_ZICBOP,
> +	TEST_NO_ZICBOP,
> +};
> +
> +enum {
> +	HANDLER_SIGILL,
> +	HANDLER_SIGSEGV,
> +	HANDLER_SIGBUS,
> +};

Why create this enum?

> +
> +static struct test_info {
> +	bool enabled;
> +	unsigned int nr_tests;
> +	void (*test_fn)(void *arg);
> +} tests[] = {
> +	[TEST_ZICBOP]		= { .nr_tests = 3, test_zicbop },
> +	[TEST_NO_ZICBOP]	= { .nr_tests = 3, test_no_zicbop },
> +};
> +
> +static struct sighandler_info {
> +	const char *flag;
> +	int sig;
> +} handlers[] = {
> +	[HANDLER_SIGILL] = { .flag = "--sigill", .sig = SIGILL },
> +	[HANDLER_SIGSEGV] = { .flag = "--sigsegv", .sig = SIGSEGV },
> +	[HANDLER_SIGBUS] = { .flag = "--sigbus", .sig = SIGBUS },
> +};
> +
> +static bool search_flag(int argc, char **argv, const char *flag)
> +{
> +	int i;
> +
> +	for (i = 1; i < argc; i++) {
> +		if (!strcmp(argv[i], flag))
> +			return true;
> +	}
> +	return false;
> +}

Instead of this search function just use getopt()

> +
> +static void install_sigaction(int argc, char **argv)
> +{
> +	int i, rc;
> +	struct sigaction act = {
> +		.sa_sigaction = &sigill_handler,
> +		.sa_flags = SA_SIGINFO,
> +	};
> +
> +	for (i = 0; i < ARRAY_SIZE(handlers); ++i) {
> +		if (search_flag(argc, argv, handlers[i].flag)) {
> +			rc = sigaction(handlers[i].sig, &act, NULL);
> +			assert(rc == 0);
> +		}
> +	}
> +
> +	if (search_flag(argc, argv, handlers[HANDLER_SIGILL].flag))
> +		tests[TEST_NO_ZICBOP].enabled = true;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	struct riscv_hwprobe pair;
> +	unsigned int plan = 0;
> +	cpu_set_t cpus;
> +	long rc;
> +	int i;
> +
> +	install_sigaction(argc, argv);
> +
> +	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
> +	assert(rc == 0);
> +
> +	ksft_print_header();
> +
> +	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&cpus, 0);
> +	if (rc < 0)
> +		ksft_exit_fail_msg("hwprobe() failed with %ld\n", rc);
> +	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> +
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOP)
> +		tests[TEST_ZICBOP].enabled = true;
> +	else
> +		check_no_zicbop_cpus(&cpus);
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); ++i)
> +		plan += tests[i].enabled ? tests[i].nr_tests : 0;
> +
> +	if (plan == 0)
> +		ksft_print_msg("No tests enabled.\n");
> +	else
> +		ksft_set_plan(plan);
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); ++i) {
> +		if (tests[i].enabled)
> +			tests[i].test_fn(&cpus);
> +	}
> +
> +	ksft_finished();
> +}
> -- 
> 2.47.2
>

There's no reason to duplicate cbo.c. Just parameterize
check_no_zicboz_cpus() (and rename it to check_no_zicbo_cpus())
in order to share it with zicbop and then add your new tests.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
