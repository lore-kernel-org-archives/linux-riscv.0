Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6370CEDDA4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ5S+swgvtaeXmocDy4sJxUODKV5znN6ahjEy/FfhNw=; b=bGssbsJlMqdnHI
	mdfoh5V1jk0Xx1DO9sBKgFf0+N9pGw3uTHAhb9tYZ1qbmfm8xdXjVhvb/yYce90dzfUzTzayGXKLC
	Z7Ji8eJqz6iAiTCm2mZ4MQ3DYN0Rbhby8vTtr+bNLBQBnq+cky4c2scUGvMRukObxoxrwMwodrMYZ
	MtN62yyI7kOZBvohwBleNYXg3a8DX+gXIUHS3vukUiDMPv8+ip81dyczEJjCE5Q0h3dRSUQkw1o1p
	vFbjr8HR30YP0o4nwZcgxCbm8RMnPutMMEECqAlwaIAf1CZcFJlU20yf4FwQWkUWdwGD8r0+pcVLn
	UGn9bu6tO/25P+/vxK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpy-00000000mCV-1Atw;
	Tue, 18 Nov 2025 16:45:50 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpu-00000000mBa-3Exw
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:49 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-431d65ad973so21091055ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 08:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763484345; x=1764089145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ILDiozK7Z3N7Gifp/XPbCYzuZckjIPa28Dx6hmBsP8=;
        b=TJ6viFwsghV8tMkESVfs9wENnuiTJ7xt8avmRZhiD/R5xVTQAcbCdeOA6JCNgBbdwn
         nI2WU1OUp4htfdkR1y5x9EHNYQQt3cjbzmhF7ZC+TH0FBAdZ1nS594HU969AuJddnkCt
         Jk7FsnUzSH0S7XHGTLNCRB2J2tBarpQUScZVYBTEaMfUEgi1sFVDaBE/Imw81Ho1gnm4
         wxpy32KfUVewtjFWIHuN+Gh5hICku/8IHBf7pdyWwoKqimbWep8/u5+OZQTNmw4Y4dVt
         yr88pQl8DB2emh2bt2lU8AThvGk5kxOpEcErrYUliRFQDMopLJQHQ5gaUJREfhbiSLr0
         DKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484345; x=1764089145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ILDiozK7Z3N7Gifp/XPbCYzuZckjIPa28Dx6hmBsP8=;
        b=me6PHuwdwQFjsuV0ZIBwbNtucuxS0CO4ic6FsUZf4cbclZVbEcczFrATOLbYNG0eRm
         aK7AaI+ZisgchmiLAPJOi1HA/T5B1DX2XhZf4lh0JUgtB4CcKIrNxHfKs1Cl2aH0/odp
         0k2beO0gk6P/NBbQKswSkMAxDVRoYHq7+AiYGp1DFIOmJnvGqamZIytq2UqvJ0j8rt8V
         D4gOqWj6HKEkUeTTnTCo2eIWkGMVbGdvlrloSNBdi4z7lsgFOULoq6KPrFgRadmhWwm7
         P/M6314K2p4MQ89iVB5xNpNt3nAZ1yzNC+aKS1xD6+VModMVafoUVdDgoZXCe7cA2cfR
         uviQ==
X-Gm-Message-State: AOJu0Yxq+w936nLhc1q+vyV6wSTDdYlIyck4PzHBnrgecBYjzWjRjZoH
	qGmlDTxHGfLPjhLC4DEOIb1n3i9qhmHxpIu+kUTN6ZKpTb7OvMDUcPq61Xa966Dx9TU=
X-Gm-Gg: ASbGnctR1W4GcAajZ0aVBs7+kUULlNszzfi2aiW7l1Y4XoVHmD4DHYfgb0K9nKn3uez
	zkIST7ovhAwXXxuqTP5xlTlTvBEn7KnYmq3ykMymOv26RUL7aKPlmkfa/B82w4eJa7tbrJmhIBD
	0906mBaOR66ZqayreXmGFS2Xo0jN8r+keNtz2RUR9uu/v7F1W74VzuMBzVFd+tCEv1HrkjrYys1
	F7CDpvNs+cogdhltO1d4c3JIoTLuY2LFb1tTdblJDsEQ3nU0ZdjiLaoRcLX6AZRPEoOjsqCLDa6
	e5wLv5AoIW+eVrJ5isvXE9zZIuiLBLCdrlMDDUQTQoMvQbQj4YhRN4Ues0qwFEArZ95O+cPH8IH
	lM9/wA9IKqCSJ2hQA5R0EQ6Ag+2aTGog9ZzPvanEFSth85yrcWfise9hC+49L/MJL8teykrXsle
	rimIGNlRyQXbBe
X-Google-Smtp-Source: AGHT+IEG/ZXTvWV/BZXQAuMFuIBlB9Lm6j2vkTCu+uGpPXAiS7L7tob5Vetea5EjX2PZBZrD5A2qvQ==
X-Received: by 2002:a05:6e02:228f:b0:433:58b2:65f1 with SMTP id e9e14a558f8ab-4348c942c55mr206206745ab.15.1763484345137;
        Tue, 18 Nov 2025 08:45:45 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434833c5ef5sm83086175ab.3.2025.11.18.08.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:45:44 -0800 (PST)
Date: Tue, 18 Nov 2025 10:45:43 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251118-cbe35d090a464d246ed0b8eb@orel>
References: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
 <20251118162436.15485-3-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118162436.15485-3-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084547_813261_3E848A3D 
X-CRM114-Status: GOOD (  28.22  )
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

On Wed, Nov 19, 2025 at 12:23:25AM +0800, Yao Zihong wrote:
> Add selftests to cbo.c to verify Zicbop extension behavior, and split
> the previous `--sigill` mode into two options so they can be tested
> independently.
> 
> The test checks:
> - That hwprobe correctly reports Zicbop presence and block size.
> - That prefetch instructions execute without exception on valid and NULL
>   addresses when Zicbop is present.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 165 ++++++++++++++++----
>  1 file changed, 136 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index 5e96ef785d0d..6d99726aceac 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -15,24 +15,31 @@
>  #include <linux/compiler.h>
>  #include <linux/kernel.h>
>  #include <asm/ucontext.h>
> +#include <getopt.h>
>  
>  #include "hwprobe.h"
>  #include "../../kselftest.h"
>  
>  #define MK_CBO(fn) le32_bswap((uint32_t)(fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
> +#define MK_PREFETCH(fn) \
> +	le32_bswap(0 << 25 | (uint32_t)(fn) << 20 | 10 << 15 | 6 << 12 | 0 << 7 | 19)
>  
>  static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
>  
> -static bool illegal_insn;
> +static bool got_fault;
>  
> -static void sigill_handler(int sig, siginfo_t *info, void *context)
> +static void fault_handler(int sig, siginfo_t *info, void *context)
>  {
>  	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)->uc_mcontext;
>  	uint32_t insn = *(uint32_t *)regs[0];
>  
> -	assert(insn == MK_CBO(regs[11]));
> +	if (sig == SIGILL)
> +		assert(insn == MK_CBO(regs[11]));
>  
> -	illegal_insn = true;
> +	if (sig == SIGSEGV || sig == SIGBUS)
> +		assert(insn == MK_PREFETCH(regs[11]));
> +
> +	got_fault = true;
>  	regs[0] += 4;
>  }
>  
> @@ -45,39 +52,51 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
>  	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "memory");	\
>  })
>  
> +#define prefetch_insn(base, fn)							\
> +({										\
> +	asm volatile(								\
> +	"mv	a0, %0\n"							\
> +	"li	a1, %1\n"							\
> +	".4byte	%2\n"								\
> +	: : "r" (base), "i" (fn), "i" (MK_PREFETCH(fn)) : "a0", "a1");		\
> +})
> +
>  static void cbo_inval(char *base) { cbo_insn(base, 0); }
>  static void cbo_clean(char *base) { cbo_insn(base, 1); }
>  static void cbo_flush(char *base) { cbo_insn(base, 2); }
>  static void cbo_zero(char *base)  { cbo_insn(base, 4); }
> +static void prefetch_i(char *base) { prefetch_insn(base, 0); }
> +static void prefetch_r(char *base) { prefetch_insn(base, 1); }
> +static void prefetch_w(char *base) { prefetch_insn(base, 3); }
>  
>  static void test_no_cbo_inval(void *arg)
>  {
>  	ksft_print_msg("Testing cbo.inval instruction remain privileged\n");
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_inval(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.inval\n");
> +	ksft_test_result(got_fault, "No cbo.inval\n");
>  }
>  
>  static void test_no_zicbom(void *arg)
>  {
>  	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_clean(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.clean\n");
> +	ksft_test_result(got_fault, "No cbo.clean\n");
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_flush(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.flush\n");
> +	ksft_test_result(got_fault, "No cbo.flush\n");
>  }
>  
>  static void test_no_zicboz(void *arg)
>  {
>  	ksft_print_msg("No Zicboz, testing cbo.zero remains privileged\n");
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_zero(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.zero\n");
> +	ksft_test_result(got_fault, "No cbo.zero\n");
>  }
>  
>  static bool is_power_of_2(__u64 n)
> @@ -85,6 +104,51 @@ static bool is_power_of_2(__u64 n)
>  	return n != 0 && (n & (n - 1)) == 0;
>  }
>  
> +static void test_zicbop(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE,
> +	};
> +	struct sigaction act = {
> +		.sa_sigaction = &fault_handler,
> +		.sa_flags = SA_SIGINFO
> +	};
> +	struct sigaction dfl = {
> +		.sa_handler = SIG_DFL
> +	};
> +	cpu_set_t *cpus = (cpu_set_t *)arg;
> +	__u64 block_size;
> +	long rc;
> +
> +	rc = sigaction(SIGSEGV, &act, NULL);
> +	assert(rc == 0);
> +	rc = sigaction(SIGBUS, &act, NULL);
> +	assert(rc == 0);
> +
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
> +	block_size = pair.value;
> +	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE &&
> +			 is_power_of_2(block_size), "Zicbop block size\n");
> +	ksft_print_msg("Zicbop block size: %llu\n", block_size);
> +
> +	got_fault = false;
> +	prefetch_i(&mem[0]);
> +	prefetch_r(&mem[0]);
> +	prefetch_w(&mem[0]);
> +	ksft_test_result(!got_fault, "Zicbop prefetch.* on valid address\n");
> +
> +	got_fault = false;
> +	prefetch_i(NULL);
> +	prefetch_r(NULL);
> +	prefetch_w(NULL);
> +	ksft_test_result(!got_fault, "Zicbop prefetch.* on NULL\n");
> +
> +	rc = sigaction(SIGBUS, &dfl, NULL);
> +	assert(rc == 0);
> +	rc = sigaction(SIGSEGV, &dfl, NULL);
> +	assert(rc == 0);
> +}
> +
>  static void test_zicbom(void *arg)
>  {
>  	struct riscv_hwprobe pair = {
> @@ -100,13 +164,13 @@ static void test_zicbom(void *arg)
>  			 is_power_of_2(block_size), "Zicbom block size\n");
>  	ksft_print_msg("Zicbom block size: %llu\n", block_size);
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_clean(&mem[block_size]);
> -	ksft_test_result(!illegal_insn, "cbo.clean\n");
> +	ksft_test_result(!got_fault, "cbo.clean\n");
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_flush(&mem[block_size]);
> -	ksft_test_result(!illegal_insn, "cbo.flush\n");
> +	ksft_test_result(!got_fault, "cbo.flush\n");
>  }
>  
>  static void test_zicboz(void *arg)
> @@ -125,11 +189,11 @@ static void test_zicboz(void *arg)
>  			 is_power_of_2(block_size), "Zicboz block size\n");
>  	ksft_print_msg("Zicboz block size: %llu\n", block_size);
>  
> -	illegal_insn = false;
> +	got_fault = false;
>  	cbo_zero(&mem[block_size]);
> -	ksft_test_result(!illegal_insn, "cbo.zero\n");
> +	ksft_test_result(!got_fault, "cbo.zero\n");
>  
> -	if (illegal_insn || !is_power_of_2(block_size)) {
> +	if (got_fault || !is_power_of_2(block_size)) {
>  		ksft_test_result_skip("cbo.zero check\n");
>  		return;
>  	}
> @@ -177,7 +241,19 @@ static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
>  		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
>  		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
>  
> -		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
> +		switch (cbo) {
> +		case RISCV_HWPROBE_EXT_ZICBOZ:
> +			cbostr = "Zicboz";
> +			break;
> +		case RISCV_HWPROBE_EXT_ZICBOM:
> +			cbostr = "Zicbom";
> +			break;
> +		case RISCV_HWPROBE_EXT_ZICBOP:
> +			cbostr = "Zicbop";
> +			break;
> +		default:
> +			ksft_exit_fail_msg("Internal error: invalid cbo %llu\n", cbo);
> +		}
>  
>  		if (pair.value & cbo)
>  			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
> @@ -194,6 +270,7 @@ enum {
>  	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
>  	TEST_NO_CBO_INVAL,
> +	TEST_ZICBOP,
>  };
>  
>  static struct test_info {
> @@ -206,26 +283,51 @@ static struct test_info {
>  	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
>  	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
>  	[TEST_NO_CBO_INVAL]	= { .nr_tests = 1, test_no_cbo_inval },
> +	[TEST_ZICBOP]		= { .nr_tests = 3, test_zicbop },
> +};
> +
> +static const struct option long_opts[] = {
> +	{"zicbom-raises-sigill", no_argument, 0, 'm'},
> +	{"zicboz-raises-sigill", no_argument, 0, 'z'},
> +	{0, 0, 0, 0}
>  };
>  
>  int main(int argc, char **argv)
>  {
>  	struct sigaction act = {
> -		.sa_sigaction = &sigill_handler,
> +		.sa_sigaction = &fault_handler,
>  		.sa_flags = SA_SIGINFO,
>  	};
>  	struct riscv_hwprobe pair;
>  	unsigned int plan = 0;
>  	cpu_set_t cpus;
>  	long rc;
> -	int i;
> -
> -	if (argc > 1 && !strcmp(argv[1], "--sigill")) {
> -		rc = sigaction(SIGILL, &act, NULL);
> -		assert(rc == 0);
> -		tests[TEST_NO_ZICBOZ].enabled = true;
> -		tests[TEST_NO_ZICBOM].enabled = true;
> -		tests[TEST_NO_CBO_INVAL].enabled = true;
> +	int i, opt, long_index;
> +
> +	long_index = 0;
> +
> +	while ((opt = getopt_long(argc, argv, "mz", long_opts, &long_index)) != -1) {
> +		switch (opt) {
> +		case 'm':
> +			tests[TEST_NO_ZICBOM].enabled = true;
> +			tests[TEST_NO_CBO_INVAL].enabled = true;
> +			rc = sigaction(SIGILL, &act, NULL);
> +			assert(rc == 0);
> +			break;
> +		case 'z':
> +			tests[TEST_NO_ZICBOZ].enabled = true;
> +			tests[TEST_NO_CBO_INVAL].enabled = true;
> +			rc = sigaction(SIGILL, &act, NULL);
> +			assert(rc == 0);
> +			break;

I would have written it like below to avoid four redundant lines

 case 'm': case 'z':
   tests[opt == 'm' ? TEST_NO_ZICBOM : TEST_NO_ZICBOZ].enabled = true;
   tests[TEST_NO_CBO_INVAL].enabled = true;
   rc = sigaction(SIGILL, &act, NULL);
   assert(rc == 0);
   break;

> +		case '?':
> +			fprintf(stderr,
> +				"Usage: %s [--zicbom-raises-sigill|-m] [--zicboz-raises-sigill|-z]\n",
> +				argv[0]);
> +			exit(1);
> +		default:
> +			break;
> +		}
>  	}
>  
>  	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
> @@ -253,6 +355,11 @@ int main(int argc, char **argv)
>  		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
>  	}
>  
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOP)
> +		tests[TEST_ZICBOP].enabled = true;
> +	else
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOP);
> +
>  	for (i = 0; i < ARRAY_SIZE(tests); ++i)
>  		plan += tests[i].enabled ? tests[i].nr_tests : 0;
>  
> -- 
> 2.47.2
>

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
