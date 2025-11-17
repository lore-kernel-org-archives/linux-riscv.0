Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B78CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+eJ2ThD+/089TG0VHhZAjyYVvcRT43ZRysqC+bP/G8=; b=lYAp0w0QlHHhKD
	YTwVS2GhrxGTP8HVjHXqEEL3IHiMad2TRpHXGlHPGpiaNM5rvp4bcHShcynfmIiEMO3+vPsqowrM3
	e8JVfPmcQgFkAJRhafTBV7lMQqRO+zPgeVAcCVxGvZs8t2o4KT9NOMixcrd695AKhn9lXwyJPDG60
	h6nGgbmrekwOQeMGiM9/YZol/xTxJAw8lVxU1nFLitYKO/6HPuiWZKVfbngNMhg9YqWnGTvuzm0CF
	5dQe4YwupPLY7R+deYOcSZCzLe4Bc3LE89CD2ghUo/gMe3n4kaUXdK2tyo1a3yVu/fO5WeFTuyvDD
	HtfWzpDjPwEZzP94qoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2VT-0000000GRCr-15eJ;
	Mon, 17 Nov 2025 16:55:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2VR-0000000GRCb-1xDY
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Nov 2025 16:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tMAxTRV3TgsiFn1K04BFzh0dTbLwFOnIA2pcDSZrnWo=; b=Eg3od/80Q3xHr1FQ60PJkHdJVW
	xS7Vkus4lZo3ndwiUg2yNZkcW1tw+Hj9/mNBCh6xk48bujKMzLNSITEbPaQY14QAZlyklE/+VmMqA
	OEs/iGPN+d3PeE3QkIoz1/iFK0OPyhO1lyZhrtDEmCtvGOkb9F4vgm8D1/kDlpliYTQvd6bGvzB56
	FLpqSa3prNHGEzXUAkPAFzBTE1MXxkEHqg13k3QmDzdmjj3oDkPs5a03JmCjdGJbvGw2JogBobucp
	HGFTNhuiCnxi+coYes9F57qFrnuBKZI8dRzNvfgE0p0rJykJpw4U7jy/dSFQL9yumc8+6oh9uCvlv
	R9bz0zDg==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1dk-00000007hnP-3OBv
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:59:42 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-88703c873d5so161090039f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763398504; x=1764003304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMAxTRV3TgsiFn1K04BFzh0dTbLwFOnIA2pcDSZrnWo=;
        b=MKepZaSmcfb1wwBgEjSXLC0gmi5YLQluh4sWhZhct2ImvBGEymxnreaP8dT8G6g3ee
         th+nhxzvpU6SmojJ9RvK1dMYVNV4TdofODP2b++8P1TBG9yQXm6hXDA/odZw95clZdnQ
         fnj5pRvuDVdtNhecS5b+XCE4KqVTEe2n1AuZJHMDGbWjXQouFWGyndRgZzVPpBMqIcv2
         P2DZwSNZnmuJw6nr9KDF8kAxjN6bjaT9Y7CGO9GVRKR+jpKus3NrWjRltYUfNN5U8iX/
         yyPu6QmscmkXF9+68MULUd0sDZFTcX94+0OyzO5a2NCJzKeKibURB6T264VWFz9LwYil
         tSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763398504; x=1764003304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMAxTRV3TgsiFn1K04BFzh0dTbLwFOnIA2pcDSZrnWo=;
        b=XpfOKP/7ndJEcKPSRLCg8/5RifnLB96Id7KVBGpniqJ3Z7pfAlPhFa/hfmUioDaCYe
         9ArSHr9h164DTDDQMi0XM19PSHR41JbFrmdzEG5/iApVb6rxXnlDpg1Tz3M2Arty92yx
         CO7S2IEH3esZFz5ekEeCps0b29d5kq9Pwwq1wDLz2zVxT2/j6W2uTfeZA/gLOCtoSBAJ
         EakP/r8VdxSNlvV5UNzm7XP4H+EOgaOz3Rgsy5zqYKkhpz34skCMbBtfsfiBUPvGsx/R
         DfhRN7bJzCokUW1NoqdVwTkIwmIn98Y/IcDY/P+Bxgd+SgbswQQHPMAXBEPQw/+oVMM1
         ZgUA==
X-Gm-Message-State: AOJu0YxD2o/ZXcw4eNP6P/G9z/WKMDw5EClfqKi1/XTOEzENLhith2eA
	49dyGwd7NmwVqwE9iLVq6Hx/U40DTbI3jkPtbpSOj4YYr0Bo40ISmflXmr77bvvfBTE=
X-Gm-Gg: ASbGncuW+pgh1U+mcD3KNIOA6W42Hw5w+eD9xKvZsdtkU5uDDziMjyZJiOSgFRqGVya
	mvmZo6d76S9t26owanh8KOMt/UaGORZAw5jN8Z+uEucxgbXcpk31AJIIUbH+YKCpYg3o/vB1sU4
	8VPOKyXQD11OBiq5eHBGMcszv2D5du4jhaKzeGj70kmSQaeFM/jpafm6b0WCflK3EayhiUtsjN3
	K6i+m5+769rvLnwzuRlS6Z3hUvQbx0Mc88q81ZcjxeuMsu7ngDz7AOPh/JXEJf1bPlTklwO3gHg
	ltwSfjR/wnTfKmL5LlQi6HvDGbt1auhjxKS+X8GchOy9ILTdS8kKhlFVbT9M025vmEylZlbajE9
	I9zuBgW7xslYgd9X+3Q8xSNBY1XllCdd/M4WYLIfvY1E27KMx6HK2cLUfpF/hHrDepwXiTa0SVT
	vbCsPBch9oRt7cqdyvlMdfIBo=
X-Google-Smtp-Source: AGHT+IGHCandStb8koVGBfHFAN45GRA82vVlZmYRD4t69bcXCrI3C61oCksL+k193GjSW36PMMHjrQ==
X-Received: by 2002:a05:6638:8884:b0:5b7:1753:3abc with SMTP id 8926c6da1cb9f-5b7c9d8bcb4mr8889237173.11.1763398503996;
        Mon, 17 Nov 2025 08:55:03 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd315e75sm4949720173.36.2025.11.17.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:55:03 -0800 (PST)
Date: Mon, 17 Nov 2025 10:55:02 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Samuel Holland <samuel.holland@sifive.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251117-801c9f5a162e4a81c724990b@orel>
References: <20251117163333.31182-1-zihong.plct@isrc.iscas.ac.cn>
 <20251117163333.31182-3-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117163333.31182-3-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_155941_003622_18826847 
X-CRM114-Status: GOOD (  30.48  )
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

On Tue, Nov 18, 2025 at 12:32:40AM +0800, Yao Zihong wrote:
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
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 168 ++++++++++++++++----
>  1 file changed, 139 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index 5e96ef785d0d..281ab440e696 100644
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
> @@ -85,6 +104,54 @@ static bool is_power_of_2(__u64 n)
>  	return n != 0 && (n & (n - 1)) == 0;
>  }
>  
> +static void test_zicbop(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE,
> +	};
> +
> +	struct sigaction act = {
> +		.sa_sigaction = &fault_handler,
> +		.sa_flags = SA_SIGINFO
> +	};
> +
> +	struct sigaction dfl = {
> +		.sa_handler = SIG_DFL
> +	};
> +
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
> @@ -100,13 +167,13 @@ static void test_zicbom(void *arg)
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
> @@ -125,11 +192,11 @@ static void test_zicboz(void *arg)
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
> @@ -177,7 +244,19 @@ static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
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
> @@ -194,6 +273,7 @@ enum {
>  	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
>  	TEST_NO_CBO_INVAL,
> +	TEST_ZICBOP

nit: It's best to add the comma now so if we add another test later we
won't need to change this line.

>  };
>  
>  static struct test_info {
> @@ -206,26 +286,51 @@ static struct test_info {
>  	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
>  	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
>  	[TEST_NO_CBO_INVAL]	= { .nr_tests = 1, test_no_cbo_inval },
> +	[TEST_ZICBOP]		= { .nr_tests = 3, test_zicbop }
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
> +

nit: Don't put blank lines between variables (same comment for all
the blanks between the structs above in test_zicbop())

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

Should continue enabling TEST_NO_CBO_INVAL for this too. Since 'm' and 'z'
are almost the same then it should be possible to merge the cases somehow.

> +			rc = sigaction(SIGILL, &act, NULL);
> +			assert(rc == 0);
> +			break;
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
> @@ -253,6 +358,11 @@ int main(int argc, char **argv)
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

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
