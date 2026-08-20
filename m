Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0DCC5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 01:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CVpk8gGLJeJxOB+bGgU/rzl3fsB8F8KPB3tDB+EGUE=; b=ONrfYmNvioua1G
	Pe25ojBBJWL2ZGERIX36kdqBIn9hHBR1B/2gHuUg3T1kAsINBsuxY8zxkSKLww1FudYtNpMLAujyE
	oko9ybkvSrt+AKRwBeDA7+IOTjUiZPz4XpPyRudLzjkOq8kymaddCP3gek1w+FNCbmzM5A7rZiqrU
	H3I7e3SRz3D7yXZzay8Sk6Wpdu+nOszPXuo/Dcmxu9t1N6jyMARYARZBB5KR1DIu+v3NFIz+v7lip
	8mlgDCcun5HNBCrl+GxY8+XLScWeTeGTWgPNmjeqR+krbKeU+46U7A9G0WFa9E6RqmFDTd3tb/Q0Y
	QMCS5nFwetzuh6RhTw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwrub-0000000Ajcx-1YZZ;
	Thu, 20 Aug 2026 01:49:45 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwruZ-0000000Ajcc-0u6x
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 01:49:44 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1050328a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 18:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787190582; x=1787795382; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze1L0S4sesJZh95VqJNWzJb8j2n+58CZfzAPSw1jjOA=;
        b=cKNmTerG2Ct0KT4ZJBmTHR5utboccoH0v3b0wZm4yoKfYiyDkF6JXbM+oH0nCTLp2s
         3ETIWjbrdZsEX8nzCltVFbAzMcnvRCjzoyXz/utHTylX3TRrr2YcXvX6GezT5wKlsEqe
         QPkh20tpDpe+axGkKzowBooXvNA2FOVIL5p2YOPVKVBG/aYV3l0OzPlozC/333afDhYA
         7KCnY2EtASsOV9o8fs+wJMKkLrb6r/xKKM3EGUh6DnOnhlhr1utQB2BLZDuA3pyt8KfI
         uqtGAV8Y6YG1T14uvLn3ZgSZd40h8z3pj5osqTLumeMqF1330DeDy5P1/SYqaD+T5O8K
         SGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787190582; x=1787795382;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze1L0S4sesJZh95VqJNWzJb8j2n+58CZfzAPSw1jjOA=;
        b=UwkgLZq3XMyvu7BYcpwWvE3I7VNlPB/E/BWwujYJr+0dZlbl2w5fJR+93xcNj6FAwv
         vP4iPVP2ZSdSKRL1yZYSTQ/rsguOToTD2LAwrgT6VsPi5J7kF/xuqAMlCknSWAijQsYM
         NBERiuATukYmIt6zEIHqKwI3y1Cy+uS5Ju+3/0dtciawD7TsZ0cHScqE1d1W8x4LQBPg
         mPFPuuWcpworO3Rqgc9JVYRFK7N1+6watcMAB3arGmvu6Z8Mtg6D3Vw3xjkaa5RfrFxN
         P7ur9ixS2BqOEz2obac6EtshBwor1uqA9I26lZ7pWLPyPYGdVoGOiGwufKG85bDvzcpc
         4MUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+9D7lOgwL9V6T4/zjFqNv55PuN0qILK7EnoCdOH5W6y/eQ5IHQ9hTrn58tDe+PzKeU4XsqOKSCGyjzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9eJi0vtfpulLEa+/5/KhomnMbsmCY2jpij/GfCvGr6P/iQonZ
	BCRsQUO+P/6mgVZAkQMpn9O/Ah1loVfXfSxceYaq+VJZUjcUEYmOuTfkcx1liW6dF/E=
X-Gm-Gg: AR+sD10qNKXT9ayE5qtoiWnqjLaBfxMCDJwHoBI4/fBiZ4EzHodyCIKiXjrzPYSwyc9
	h/lcgxq4fI56aY7Q/xpS3BfyLMLGGO1UA3Iz9HB/3aV9I1MXjU0MDV53FXnqANBb7YEoff4ngn1
	IT6RpMMTT6CeAGuGfYdiyqxHr43rz1+0NyJOEeXlYizEBoZPU/2TKNeFhEe8ukTwCDVsG4auBV1
	yjWXNvS8C5rvBt/3r93o58OY85ZIAWyTxhaxAw1OU4dzglOz3j6Gu4xu1oVY7N14JuL2eXvOqJf
	NfeW1Wj0e4W3JRjIt2QV4oPldzYjePj6RHxDsRhCxBqXvbtVm9KCrcYi2REE9iX6yj7gjffXceC
	RS863kwAmMyrpkBfGxbrL+31bOfnFCLOuETa51vGl+Ustn8Aq2DoxjZq5ZYEXaiOLHgdI2+5afE
	4JFkXzUvCmGxfdbSUYx8TRVy5Q34epoCEgPkxcqFy45p7vDKdhew4vmFNQsbBwKHtV2iJ7TVv1n
	+5rMofOeBk=
X-Received: by 2002:a05:6830:2117:b0:7e9:d4b5:8004 with SMTP id 46e09a7af769-7f43f95afe1mr10936044a34.5.1787190581986;
        Wed, 19 Aug 2026 18:49:41 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.102.82])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70786sm3565200a34.4.2026.08.19.18.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 18:49:41 -0700 (PDT)
Message-ID: <1e5340c0-6a36-4727-b96e-19ac40565a92@sifive.com>
Date: Wed, 19 Aug 2026 20:49:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: selftests: Fix pointer masking test failures on
 real hardware
To: JinRui <jinrui@haiwei.tech>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <04B199F7DC302BCA+20260721065242.233233-1-jinrui@haiwei.tech>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <04B199F7DC302BCA+20260721065242.233233-1-jinrui@haiwei.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_184943_274594_EFB522AB 
X-CRM114-Status: GOOD (  30.14  )
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

Hi,

On 2026-07-21 1:52 AM, JinRui wrote:
> From: jinrui <jinrui@haiwei.tech>
> 
> The pointer masking selftest contains several bugs that cause it to fail
> on real RISC-V hardware:
> 
> 1. test_pmlen() did not pass PR_TAGGED_ADDR_ENABLE when requesting a
>    non-zero PMLEN. The kernel requires this flag; without it, PMLEN is
>    forced to 0 regardless of the requested value (see process.c:352).

Ouch, sorry, this is a bug in the kernel, introduced by commit 3033b2b1e394
("riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"). The kernel
documentation and existing selftest logic are correct. PMLEN is independent from
PR_TAGGED_ADDR_ENABLE so userspace can use pointer masking internally without
changing the syscall ABI. This allows userspace software to behave like it does
on arm64, where TBI is always enabled, but the tagged address ABI is disabled by
default.

I was not paying enough attention and should not have Reviewed-by that patch. I
just sent a revert:
https://lore.kernel.org/linux-riscv/20260820014551.1979772-1-samuel.holland@sifive.com/

> 2. set_tagged_addr_ctrl() required the PR_GET return value to exactly
>    match the PR_SET argument. However, the kernel may legitimately:
>    - Force PMLEN to 0 when the ABI is disabled (tagged_addr_abi=false)
>    - Round up PMLEN (e.g., request=1 -> PMLEN=7 or PMLEN=16)

There should be no rounding here, because set_tagged_addr_ctrl() is only ever
called with pmlen set to 0, min_pmlen, or max_pmlen. All of these are values
that the kernel is known to support (in other words, they are already rounded).
The remaining issues described here should be fixed by the revert linked above.

Regards,
Samuel

> 3. test_dereference_pmlen() always passed tagged_addr_abi=false, even
>    for non-zero PMLEN values. This meant PMLEN was never actually
>    enabled, so the valid tag dereference test always triggered SIGSEGV.
> 
> 4. test_fork_exec() passed tagged_addr_abi=false, causing the fork
>    child's tagged pointer dereference to fail because the inherited
>    PMLEN was 0.
> 
> Additionally, add an explicit #include <stdint.h> for uintptr_t, which
> is required by the C standard and must be included explicitly on some
> compiler/libc combinations.
> 
> Fixes: 7470b5afd150 ("riscv: selftests: Add a pointer masking test")
> Signed-off-by: jinrui <jinrui@haiwei.tech>
> ---
>  .../selftests/riscv/abi/pointer_masking.c     | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/abi/pointer_masking.c b/tools/testing/selftests/riscv/abi/pointer_masking.c
> index 2d540af7b558..106f12f1ea44 100644
> --- a/tools/testing/selftests/riscv/abi/pointer_masking.c
> +++ b/tools/testing/selftests/riscv/abi/pointer_masking.c
> @@ -5,6 +5,7 @@
>  #include <setjmp.h>
>  #include <signal.h>
>  #include <stdbool.h>
> +#include <stdint.h>
>  #include <sys/prctl.h>
>  #include <sys/wait.h>
>  #include <unistd.h>
> @@ -17,6 +18,9 @@
>  #ifndef PR_PMLEN_MASK
>  #define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
>  #endif
> +#ifndef PR_TAGGED_ADDR_ENABLE
> +#define PR_TAGGED_ADDR_ENABLE		1
> +#endif
>  
>  static int dev_zero;
>  
> @@ -44,7 +48,10 @@ static void test_pmlen(void)
>  	for (int request = 0; request <= 16; request++) {
>  		int pmlen, ret;
>  
> -		ret = prctl(PR_SET_TAGGED_ADDR_CTRL, request << PR_PMLEN_SHIFT, 0, 0, 0);
> +		ret = prctl(PR_SET_TAGGED_ADDR_CTRL,
> +			    request << PR_PMLEN_SHIFT |
> +			    (request ? PR_TAGGED_ADDR_ENABLE : 0),
> +			    0, 0, 0);
>  		if (ret)
>  			goto pr_set_error;
>  
> @@ -85,6 +92,22 @@ static int set_tagged_addr_ctrl(int pmlen, bool tagged_addr_abi)
>  		ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
>  		if (ret == arg)
>  			return 0;
> +
> +		/*
> +		 * When tagged_addr_abi is false, the kernel forces PMLEN
> +		 * to 0 regardless of what was requested. Accept the result
> +		 * as long as PR_TAGGED_ADDR_ENABLE is not set.
> +		 */
> +		if (!tagged_addr_abi && !(ret & PR_TAGGED_ADDR_ENABLE))
> +			return 0;
> +
> +		/*
> +		 * When tagged_addr_abi is true, the kernel may round up
> +		 * the PMLEN (e.g. request=1 -> PMLEN=7 or PMLEN=16).
> +		 * Accept the result if the enable bit is set.
> +		 */
> +		if (tagged_addr_abi && (ret & PR_TAGGED_ADDR_ENABLE))
> +			return 0;
>  	}
>  
>  	return ret < 0 ? -errno : -ENODATA;
> @@ -96,7 +119,12 @@ static void test_dereference_pmlen(int pmlen)
>  	volatile int *p;
>  	int ret;
>  
> -	ret = set_tagged_addr_ctrl(pmlen, false);
> +	/*
> +	 * When pmlen is 0, the tagged address ABI cannot be enabled (the
> +	 * kernel rejects PR_TAGGED_ADDR_ENABLE when PMLEN is 0). Disable
> +	 * pointer masking and test the invalid tag path instead.
> +	 */
> +	ret = set_tagged_addr_ctrl(pmlen, pmlen ? true : false);
>  	if (ret)
>  		return ksft_test_result_error("PMLEN=%d setup (%d)\n", pmlen, ret);
>  
> @@ -157,7 +185,7 @@ static void test_fork_exec(void)
>  
>  	ksft_print_msg("Testing fork/exec behavior\n");
>  
> -	ret = set_tagged_addr_ctrl(min_pmlen, false);
> +	ret = set_tagged_addr_ctrl(min_pmlen, true);
>  	if (ret)
>  		return ksft_test_result_error("setup (%d)\n", ret);
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
