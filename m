Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EB2CCD1AB
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGqsIquOUOaIKSfhdt5wsjW1HyCmkahGgOSIw5Mi0YY=; b=bTCBreCGdx8iMn
	FLW7qSFgEf2Uk/p8UwNIuhOjCDunPmfncwICwcvT8m8qp5xaQLzqMupbF3Mciug6RncnMWIZlNTdk
	8Y0PdWyGBPfikp2K+0/+4F7SZt+ckANFhqEG1HTCykaqttB9LUk3Wxk01fDyRiB9omSgzMYFLcoB9
	vrwpt8bfJ6YL9bqf0YZ5lwhMTMqPXsZq3MbhvabyxaCwRD3C10ZGzbi7pjMsLnKGodmFH31YEmXrw
	ZFrXq+VJIPhPyF8VAZl/Zw7v0QrXit3+bLWtssCNlwAKmQpxm6KhybdLd5dCxXLIaD4o72ngPT5OI
	bMs3K9kQu2O2vID6D3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLqP-00000000voe-1zi6;
	Tue, 21 Oct 2025 23:32:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLqM-00000000voA-1k47
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 23:32:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7a265a02477so222649b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761089561; x=1761694361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3SoQg6qUy/7R1NB2YZ8xX742KWcwmoU6IRF+Yny0HQ=;
        b=kPGwVh+0Qhs7ud2pPVNijvmRTt6e/Jtji4YIooKJZJz0EF75Eot2ITXwdep9ikpwJZ
         jD42Wi7Co9nmkHE/3CPtpyLtK5BrbPmKz9HZeZfTyu/2kw1vAHP/NvoqFqbsKrwDJL2q
         rd4F6VDYEeFMzvCyjo243Xn+6or+WzJJXpirDSRwVwR+Mj4aUF+dR92vOI75gz9Ku5/P
         iskg1ZH77ICOfFql1lki3L5kM3bZPf20h/cUu4rxxrgkR4fVzcr9qWb5SZAYMk8zEmT/
         G3wo1t5GsXMQuCEKiEpI0x0JKUiopAQKX/aOmGP+Vgf0DxBnVV7M/vQeej/kHH379teL
         pHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089561; x=1761694361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3SoQg6qUy/7R1NB2YZ8xX742KWcwmoU6IRF+Yny0HQ=;
        b=IZE/Cl+Q/uudxN/aRVB44wHwS2+TP2zWA5FLrmzeo8z5rWkPKzP5nFJxYuyrxYzRPY
         wI1bU6VjofSIiuSAn//DnVQCutFOYfQnsh7/trGt4sFX6PYKLI7NjeiAmBtFnelrIyl3
         CRUYGWc2hyim63xJn/STgyY9tl5JNtGKbBXZYqx2r6UEyg8bc89ZKT1IMIgWlPRGaMo2
         vJe0fzdENDokxl6ra0mZnKTNWYdSAxYfkYJx64kFfThC31C6D8Ke0POUbDaZCUBh99dl
         mDhd9xy75mAJg0Y1TZpZ2c64nRxBpk9+RfJAo0+Z3Sv1ghR+fcRemiOLsSJ5oH2V6hll
         PVqA==
X-Forwarded-Encrypted: i=1; AJvYcCWC//YLz9ZX8A3dYWfsUxMwb9zWfsOF8tL6VDmxvSzdcRGre71S9tEkCFTR/teYo6wSHJJPsVmO8YNRow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKWt1VP2hk2LtCVn02JplImb7YssC3oYwtFrJ0wPSGN0hgZQ98
	TiDcJ7EjxBt0HOS8dXkFaQ9Lm63H4Lk1abEbJU7OBgT3fThIIrWTYEhHlIER45fIDAE=
X-Gm-Gg: ASbGnctIFVD+v/3pR8W57zK0C1+mZ5DnAt96e5w4exTl7Z+CnLUXWfJeMopaWFC4vf9
	P4EqIkUiHE4M7C5ynS7Er598eWlPofE5CX37Jkds1HyLXqcQNEC8NfPQNu0W6EtTZHa/FKerHpa
	vdiKejiqCri+OK1tEAfv4v+AXzrV/WtbjO59YUW9rILUuJTJdujA24MdxioGCrHpRLtrcojSOK2
	a5w0CgjX8dFkai14PiH2QqeZn5F2RTwq0t3VgZcZzpZEE+ZHbUKLBoEj97J98mguTZpB9Zt9DNk
	7akX/26Lzp8UR26hAlS4C2l+ycevYc/8S7rFXYjDKpXGNuIwGBs/e9tFNFHuu+EO6lC6/mPMQTj
	TH6Q85z5rpzKjFmTAvAcu2yxGb/qgvcU6i8zxbVrH1dZ5DzkJL7tm6gQ48wV6Urmcl5zrzLPQpj
	E1+j0X15RAVxW8
X-Google-Smtp-Source: AGHT+IH03kcA+/FfdgqJXUp6O1wg52OQMz/iAFdL9ej2bbR8YwvepRUXUpSaIHOJ/xd6jmJ3hdD2jw==
X-Received: by 2002:a05:6a20:918a:b0:32b:71e9:81ae with SMTP id adf61e73a8af0-334a850dcc4mr24086859637.8.1761089561537;
        Tue, 21 Oct 2025 16:32:41 -0700 (PDT)
Received: from localhost ([208.115.86.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b33a27sm11434964a12.25.2025.10.21.16.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:32:41 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:32:40 -0700
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	cleger@rivosinc.com, evan@rivosinc.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, samuel.holland@sifive.com, 
	shuah@kernel.org, zhangyin2018@iscas.ac.cn, zihongyao@outlook.com
Subject: Re: [PATCH v3 2/2] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251021-01a9b77e3d88543581f1a7fb@orel>
References: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
 <20251020153721.71842-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020153721.71842-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_163242_474063_8CCF101E 
X-CRM114-Status: GOOD (  28.89  )
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

On Mon, Oct 20, 2025 at 11:37:20PM +0800, Yao Zihong wrote:
> Add selftest to cbo.c to verify Zicbop extension behavior.
> 
> The test checks:
> - That hwprobe correctly reports Zicbop presence and block size.
> - That prefetch instructions execute without exception on valid and NULL
>   addresses when Zicbop is present.
> - That prefetch.{i,r,w} do not trigger SIGILL even when Zicbop is absent,
>   since Zicbop instructions are defined as hints.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 188 +++++++++++++++++---
>  1 file changed, 159 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index 5e96ef785d0d..163228e3f2c7 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -15,24 +15,30 @@
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
>  static void sigill_handler(int sig, siginfo_t *info, void *context)
>  {
>  	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)->uc_mcontext;
>  	uint32_t insn = *(uint32_t *)regs[0];
>  
> -	assert(insn == MK_CBO(regs[11]));
> +	if (regs[12] == 0)
> +		assert(insn == MK_CBO(regs[11]));
> +	else
> +		assert(insn == MK_PREFETCH(regs[11]));
>  
> -	illegal_insn = true;
> +	got_fault = true;
>  	regs[0] += 4;
>  }
>  
> @@ -41,43 +47,75 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
>  	asm volatile(								\
>  	"mv	a0, %0\n"							\
>  	"li	a1, %1\n"							\
> +	"li	a2, 0\n"							\
>  	".4byte	%2\n"								\
> -	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "memory");	\
> +	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "a2", "memory");	\
> +})
> +
> +#define prefetch_insn(base, fn)							\
> +({										\
> +	asm volatile(								\
> +	"mv	a0, %0\n"							\
> +	"li	a1, %1\n"							\
> +	"li	a2, 1\n"							\
> +	".4byte	%2\n"								\
> +	: : "r" (base), "i" (fn), "i" (MK_PREFETCH(fn)) : "a0", "a1", "a2");\
>  })
>  
>  static void cbo_inval(char *base) { cbo_insn(base, 0); }
>  static void cbo_clean(char *base) { cbo_insn(base, 1); }
>  static void cbo_flush(char *base) { cbo_insn(base, 2); }
>  static void cbo_zero(char *base)  { cbo_insn(base, 4); }
> +static void prefetch_i(char *base) { prefetch_insn(base, 0); }
> +static void prefetch_r(char *base) { prefetch_insn(base, 1); }
> +static void prefetch_w(char *base) { prefetch_insn(base, 3); }
> +
> +static void test_no_zicbop(void *arg)
> +{
> +	/* Zicbop prefetch.* are HINT instructions. */
> +	ksft_print_msg("Testing Zicbop instructions\n");
> +
> +	got_fault = false;
> +	prefetch_i(&mem[0]);
> +	ksft_test_result(!got_fault, "No prefetch.i\n");
> +
> +	got_fault = false;
> +	prefetch_r(&mem[0]);
> +	ksft_test_result(!got_fault, "No prefetch.r\n");
> +
> +	got_fault = false;
> +	prefetch_w(&mem[0]);
> +	ksft_test_result(!got_fault, "No prefetch.w\n");
> +}
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
> @@ -85,6 +123,34 @@ static bool is_power_of_2(__u64 n)
>  	return n != 0 && (n & (n - 1)) == 0;
>  }
>  
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
> +}
> +
>  static void test_zicbom(void *arg)
>  {
>  	struct riscv_hwprobe pair = {
> @@ -100,13 +166,13 @@ static void test_zicbom(void *arg)
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
> @@ -125,11 +191,11 @@ static void test_zicboz(void *arg)
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
> @@ -148,7 +214,7 @@ static void test_zicboz(void *arg)
>  			if (mem[i * block_size + j] != expected) {
>  				ksft_test_result_fail("cbo.zero check\n");
>  				ksft_print_msg("cbo.zero check: mem[%llu] != 0x%x\n",
> -					       i * block_size + j, expected);
> +						   i * block_size + j, expected);

Undesired reformatting

>  				return;
>  			}
>  		}
> @@ -177,7 +243,19 @@ static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
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
> @@ -194,6 +272,8 @@ enum {
>  	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
>  	TEST_NO_CBO_INVAL,
> +	TEST_ZICBOP,
> +	TEST_NO_ZICBOP
>  };
>  
>  static struct test_info {
> @@ -206,27 +286,70 @@ static struct test_info {
>  	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
>  	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
>  	[TEST_NO_CBO_INVAL]	= { .nr_tests = 1, test_no_cbo_inval },
> +	[TEST_ZICBOP]		= { .nr_tests = 3, test_zicbop },
> +	[TEST_NO_ZICBOP]	= { .nr_tests = 3, test_no_zicbop },
>  };
>  
> -int main(int argc, char **argv)
> +static const struct option long_opts[] = {
> +	{"sigill", no_argument, 0, 'i'},
> +	{"sigsegv", no_argument, 0, 's'},
> +	{"sigbus", no_argument, 0, 'b'},
> +	{0, 0, 0, 0}
> +};
> +
> +static void install_sigaction(int argc, char **argv)
>  {
> +	int rc, opt, long_index;
> +	bool sigill;
> +
>  	struct sigaction act = {
>  		.sa_sigaction = &sigill_handler,
>  		.sa_flags = SA_SIGINFO,
>  	};
> +
> +	long_index = 0;
> +	sigill = false;
> +
> +	while ((opt = getopt_long(argc, argv, "isb", long_opts, &long_index)) != -1) {
> +		switch (opt) {
> +		case 'i':
> +			rc = sigaction(SIGILL, &act, NULL);
> +			assert(rc == 0);
> +			sigill = true;
> +			break;
> +		case 's':
> +			rc = sigaction(SIGSEGV, &act, NULL);
> +			assert(rc == 0);
> +			break;
> +		case 'b':
> +			rc = sigaction(SIGBUS, &act, NULL);
> +			assert(rc == 0);
> +			break;

Should we just unconditionally register handlers for SIGSEGV and SIGBUS?

> +		case '?':
> +			fprintf(stderr, "Unknown option or missing arg\n");
> +			exit(1);
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (sigill) {
> +		tests[TEST_NO_ZICBOZ].enabled = true;
> +		tests[TEST_NO_ZICBOM].enabled = true;
> +		tests[TEST_NO_CBO_INVAL].enabled = true;
> +		tests[TEST_NO_ZICBOP].enabled = true;
> +	}
> +}
> +
> +int main(int argc, char **argv)
> +{
>  	struct riscv_hwprobe pair;
>  	unsigned int plan = 0;
>  	cpu_set_t cpus;
>  	long rc;
>  	int i;
>  
> -	if (argc > 1 && !strcmp(argv[1], "--sigill")) {
> -		rc = sigaction(SIGILL, &act, NULL);
> -		assert(rc == 0);
> -		tests[TEST_NO_ZICBOZ].enabled = true;
> -		tests[TEST_NO_ZICBOM].enabled = true;
> -		tests[TEST_NO_CBO_INVAL].enabled = true;
> -	}
> +	install_sigaction(argc, argv);
>  
>  	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
>  	assert(rc == 0);
> @@ -253,6 +376,13 @@ int main(int argc, char **argv)
>  		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
>  	}
>  
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOP) {
> +		tests[TEST_ZICBOP].enabled = true;
> +		tests[TEST_NO_ZICBOP].enabled = false;
> +	} else {
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOP);
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(tests); ++i)
>  		plan += tests[i].enabled ? tests[i].nr_tests : 0;
>  
> -- 
> 2.47.2
>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
