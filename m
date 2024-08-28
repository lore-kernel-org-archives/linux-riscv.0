Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33192C54FB3
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viX9oghzrZPUDcJcWR8hVlOECTX4shfgzztrj73H/fc=; b=VMM18jD3/hq2ub
	bduc1/sv2KScVHuM6LQi+mDudlC4Ssk3uvU6CS/4JquZZDnon0GmbzzXaWdcqJIfyhnxOybcbRpzF
	8Ej1d3Fnre7cC7Kar8y9b3qeUT065brWTRdkAa8EgCeiF6kYoVo6Kn6XdMM7MPRTFuHwRxcLYUn6D
	40IxLMaEXvWl4OhKYfJLiI/coO6e/ds00c+1LJWPu97KTaY3DxkM9D0uVqFIbYCotCNc3EQ7LcI+L
	Lso0bfCMzH08oNzQe2uJ4X7SnfX+3jl0euFqQ9btLi3Xbp66qe0Xm94yN26DiEydRazJTP/WrgdUE
	2koBjENJGRQyQxuY/XaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjIQw-0000000FTSr-3qXf;
	Wed, 28 Aug 2024 13:09:58 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjIPR-0000000FT4h-3Str
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 13:08:27 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-39d4a4e4931so21764465ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724850504; x=1725455304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRugccQxWcrb++fcdfIGc7HnEfuP1yE5tRkb4v6wa+E=;
        b=KNkgR7JoOfMgSxq8WXXZqg1BIt7FdedGI5Y5xIACL83igerQHHGE/McXBtNl7pBMDf
         EviN/mIgYYtZDQ7HX4ylbN873Ge0I3uG9kxoz4zHcmU9WYN809jFqOIRvEZRULHO9kp3
         qDrvj/eH4qij5b0HgShwZvph3VaaPyl/J+HdktTELTcYDnG3RcB+z8WwwMqt597SVpfq
         SUwo8jFnu6kHcfsNdAdA2bMBnu30c9iOvPhKjGZTmWauO0hUvSKiB3rMQGJzqJDXUrXY
         mBNGwkjx9K2jaVtOAhjtl9mKK5Pq/h8lzRdv1tQ3lqKNwoQgquDaKA6akrBGABF88RLf
         CesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724850504; x=1725455304;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRugccQxWcrb++fcdfIGc7HnEfuP1yE5tRkb4v6wa+E=;
        b=XHDm+6898y5lh4yK0p0w/l8krgD3NEnEq7zikMc5Rz/CknUh0w97FpPiITY1yO09iL
         6lfpyCEwWCO4s5+Rv7w6Wi6ZMMudzJwVzc7LNu3owWY+fcEkJG04DX3/0X0h0ESM93/t
         7LA9TK5rasJya3p0Pmr5UaHgBZiW/bOYML84Hi4Q/eC1YaZ12LPR4c/914z0zy6lXIbH
         oq1I75JLu+L44BRp+eYd00DHYxnRS8IQ981zdPctf8BDLogt5uakEEE7hIc1hxD4r641
         j78tSJpW9lVJ9dII7oFOU+lOKCHXXNRr6qQesk7sNt0oi/OEvarDz8paS6KcdaVtGTo6
         b9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVUl3U7+F5NKLwialobWaw3O1bSsNGqLb0sFf0uxHrB4b46jEITOlpTcpENt0sZuDG7aSijPSoH+1Xxqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbKuC92uYXyBI9fZEbzBn3lP1BTf9dLt7wkDURlfOccMQql3LU
	9J+EsPVzu00pjWJDdkqSIqWfjjfJJLo0a+s7tYmwgyTWXCAgKqJrZVgIw9bF39A=
X-Google-Smtp-Source: AGHT+IFGARinHfv9SVtpM/GUQkr3obp0SvgN0jGDYhUoMl6fvwznsqI3PoQ4/ZyJzR3MAdQHsoFqfQ==
X-Received: by 2002:a05:6e02:178c:b0:39d:46f6:b936 with SMTP id e9e14a558f8ab-39e3c9c0812mr213073725ab.17.1724850504177;
        Wed, 28 Aug 2024 06:08:24 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ce70f81180sm2969647173.73.2024.08.28.06.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 06:08:23 -0700 (PDT)
Message-ID: <869b5faa-82c3-456a-a7b0-6dcc41114280@sifive.com>
Date: Wed, 28 Aug 2024 08:08:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240826105737.106879-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_060825_918499_00EA8136 
X-CRM114-Status: GOOD (  27.68  )
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

Hi Alex,

On 2024-08-26 5:57 AM, Alexandre Ghiti wrote:
> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
> process, before the first memory mapping is setup so we can't have any
> instrumentation happening here.
> 
> In addition, when the kernel is relocatable, we must also not issue any
> relocation this early since they would have been patched virtually only.
> 
> So, instead of disabling instrumentation for the whole kernel/sbi.c file
> and compiling it with -fno-pie, simply move __sbi_ecall() and
> __sbi_base_ecall() into their own file where this is fixed.

Looking at the baseline disassembly from both LLVM 19 and GCC 13.2.0 with
RISCV_ALTERNATIVE_EARLY + KASAN + TRACEPOINTS, all of the instrumentation in
__sbi_ecall() itself is out of line and only executed when the tracepoint static
branches are enabled. However, there is instrumentation in sbi_get_m*id() from
the switch table inlined from sbi_err_map_linux_errno(), and some of those
memory accesses are done unconditionally.

This change will force sbi_err_map_linux_errno() to be out of line (unless LTO
is enabled), so it also forces that particular bit of instrumentation to be
executed only in the error path. But we could still crash in the error path. So
I think sbi_err_map_linux_errno() needs to be moved to sbi_ecall.c as well.

Alternatively, sbi_get_m*id() do not have any errors defined (and we don't
really handle that possibility), so we could drop to the call to
sbi_err_map_linux_errno() from __sbi_base_ecall().

Regards,
Samuel

> Fixes: 1745cfafebdf ("riscv: don't use global static vars to store alternative data")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h  |  2 ++
>  arch/riscv/kernel/Makefile    |  6 ++++-
>  arch/riscv/kernel/sbi.c       | 44 --------------------------------
>  arch/riscv/kernel/sbi_ecall.c | 48 +++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 45 deletions(-)
>  create mode 100644 arch/riscv/kernel/sbi_ecall.c
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 7cffd4ffecd0..5843a10b380e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -9,6 +9,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> +#include <linux/jump_label.h>
>  
>  #ifdef CONFIG_RISCV_SBI
>  enum sbi_ext_id {
> @@ -304,6 +305,7 @@ struct sbiret {
>  };
>  
>  void sbi_init(void);
> +long __sbi_base_ecall(int fid);
>  struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
>  			  unsigned long arg2, unsigned long arg3,
>  			  unsigned long arg4, unsigned long arg5,
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 06d407f1b30b..7f88cc4931f5 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -20,17 +20,21 @@ endif
>  ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>  CFLAGS_alternative.o := -mcmodel=medany
>  CFLAGS_cpufeature.o := -mcmodel=medany
> +CFLAGS_sbi_ecall.o := -mcmodel=medany
>  ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
>  endif
>  ifdef CONFIG_RELOCATABLE
>  CFLAGS_alternative.o += -fno-pie
>  CFLAGS_cpufeature.o += -fno-pie
> +CFLAGS_sbi_ecall.o += -fno-pie
>  endif
>  ifdef CONFIG_KASAN
>  KASAN_SANITIZE_alternative.o := n
>  KASAN_SANITIZE_cpufeature.o := n
> +KASAN_SANITIZE_sbi_ecall.o := n
>  endif
>  endif
>  
> @@ -88,7 +92,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
>  
>  obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
> -obj-$(CONFIG_RISCV_SBI)		+= sbi.o
> +obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)		+= sbi-ipi.o
>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 837bdab2601b..ace9e2f59c41 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -14,9 +14,6 @@
>  #include <asm/smp.h>
>  #include <asm/tlbflush.h>
>  
> -#define CREATE_TRACE_POINTS
> -#include <asm/trace.h>
> -
>  /* default SBI version is 0.1 */
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
> @@ -27,36 +24,6 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
>  			   unsigned long start, unsigned long size,
>  			   unsigned long arg4, unsigned long arg5) __ro_after_init;
>  
> -struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> -			  unsigned long arg2, unsigned long arg3,
> -			  unsigned long arg4, unsigned long arg5,
> -			  int fid, int ext)
> -{
> -	struct sbiret ret;
> -
> -	trace_sbi_call(ext, fid);
> -
> -	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
> -	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
> -	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
> -	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
> -	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
> -	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
> -	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
> -	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
> -	asm volatile ("ecall"
> -		      : "+r" (a0), "+r" (a1)
> -		      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> -		      : "memory");
> -	ret.error = a0;
> -	ret.value = a1;
> -
> -	trace_sbi_return(ext, ret.error, ret.value);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(__sbi_ecall);
> -
>  int sbi_err_map_linux_errno(int err)
>  {
>  	switch (err) {
> @@ -535,17 +502,6 @@ long sbi_probe_extension(int extid)
>  }
>  EXPORT_SYMBOL(sbi_probe_extension);
>  
> -static long __sbi_base_ecall(int fid)
> -{
> -	struct sbiret ret;
> -
> -	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> -	if (!ret.error)
> -		return ret.value;
> -	else
> -		return sbi_err_map_linux_errno(ret.error);
> -}
> -
>  static inline long sbi_get_spec_version(void)
>  {
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
> diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
> new file mode 100644
> index 000000000000..24aabb4fbde3
> --- /dev/null
> +++ b/arch/riscv/kernel/sbi_ecall.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2024 Rivos Inc. */
> +
> +#include <asm/sbi.h>
> +#define CREATE_TRACE_POINTS
> +#include <asm/trace.h>
> +
> +long __sbi_base_ecall(int fid)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +	if (!ret.error)
> +		return ret.value;
> +	else
> +		return sbi_err_map_linux_errno(ret.error);
> +}
> +EXPORT_SYMBOL(__sbi_base_ecall);
> +
> +struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> +			  unsigned long arg2, unsigned long arg3,
> +			  unsigned long arg4, unsigned long arg5,
> +			  int fid, int ext)
> +{
> +	struct sbiret ret;
> +
> +	trace_sbi_call(ext, fid);
> +
> +	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
> +	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
> +	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
> +	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
> +	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
> +	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
> +	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
> +	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
> +	asm volatile ("ecall"
> +		       : "+r" (a0), "+r" (a1)
> +		       : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> +		       : "memory");
> +	ret.error = a0;
> +	ret.value = a1;
> +
> +	trace_sbi_return(ext, ret.error, ret.value);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(__sbi_ecall);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
