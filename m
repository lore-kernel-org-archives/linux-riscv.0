Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408DBC5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 04:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTVQzfOtWfI0BPQtuWCOPpYFFoLGsi9SQbR964gzXgk=; b=nlwaXHoLVOWjEq
	XGWlqtrt6aKYu2fSDZaD8w2lE+bbhViHJlJzURq9wLXvp4NlBJYqyr9AzXYXievS7nuQIfhmiRJ3i
	p91CbkoMM6GTpmTUBasWVK50KhKwRYpAUvYd/DCV4jkl0cUFLEO//Iq8b/TKdvRS24ttLbKIGPzL9
	DSyrFzwvaLIHOVUVPVech0e6sLPk3BQGH1xQaimktomoeW5RmhmGTtpXNpb4NHEC6KBmCqAhGdHZY
	8tO625A0WRSGKbPJRQjDHeSdAiHhRt1RZimWnP8XWIvUzjI+zgAyRzDa8DfRXcCRKjbhC/0mRe1bj
	SCMjv/rg72JIBsV0aoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioHq-00000009mjP-45RM;
	Tue, 27 Aug 2024 04:58:34 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioHm-00000009mhp-2UZk
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 04:58:33 +0000
Received: from mail-lj1-f181.google.com (unknown [209.85.208.181])
	by APP-05 (Coremail) with SMTP id zQCowAD3oEDqXM1meYSqCg--.53447S2;
	Tue, 27 Aug 2024 12:58:19 +0800 (CST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f4f2868710so48366061fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 21:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEMKWopZmg4GaR5NKkAcdu7o1CKPJDe8DlP2Vg8pmLz+BjcUKH+r//iJ8kypnrFNhzsI5nUQwS4G3EQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBa7mQs/3PHdHTZcQIB/s1tmqcIAfiCWH31LV+TwO0Y6lnjBu
	t7bq7cumh4SKmTi6pohVOtcdQpAiQrGwhRNo9tcE3HJjQkilhDHOrOSoVayl7cW09iYbjdivGl9
	ATVOX6ZQXSPeP3GPbV/f2c7UEtXs=
X-Google-Smtp-Source: AGHT+IEX2H14GaCeJnkXY/Hbp0IXMG89lckaKR7RzwZ1eGKC2jJnXqdOjHhRK9agwk4zLmoFkQsnPUlFPowk5NPeaZM=
X-Received: by 2002:a2e:be0e:0:b0:2f3:d032:4489 with SMTP id
 38308e7fff4ca-2f4f48ef6c3mr95286331fa.8.1724734697966; Mon, 26 Aug 2024
 21:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
In-Reply-To: <20240826105737.106879-1-alexghiti@rivosinc.com>
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Date: Tue, 27 Aug 2024 12:57:41 +0800
X-Gmail-Original-Message-ID: <CAOsKWHCCEAi-G=Ld9GJ2YUrbbV6dEzThXh5rOzYp6kWfUHfNHw@mail.gmail.com>
Message-ID: <CAOsKWHCCEAi-G=Ld9GJ2YUrbbV6dEzThXh5rOzYp6kWfUHfNHw@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CM-TRANSID: zQCowAD3oEDqXM1meYSqCg--.53447S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFyfAFW3ZryUuFy8CF1Dtrb_yoWxKr1UpF
	W5GFn8Kr4rX3y7try3AFWDZF1fA34kG342qa12yryrXayUAryrtrWag39FyFn5AFZ7XayI
	yFZYqrs8CF4UJ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr
	0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxG
	rwCY02Avz4vEIxC_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x07jQ9NsUUUUU=
X-Originating-IP: [209.85.208.181]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgCB2bNLauHMgAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_215831_030159_741E28DE 
X-CRM114-Status: GOOD (  24.75  )
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
Reply-To: zhangchunyan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alex,

On Mon, 26 Aug 2024 at 18:58, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
> process, before the first memory mapping is setup so we can't have any
> instrumentation happening here.

I also found that when CONFIG_KASAN is enabled, and either
RISCV_ALTERNATIVE_EARLY or CONFIG_DT_IDLE_GENPD is set, the kernel
cannot boot.

This patch fixed the issue.

Tested-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

>
> In addition, when the kernel is relocatable, we must also not issue any
> relocation this early since they would have been patched virtually only.
>
> So, instead of disabling instrumentation for the whole kernel/sbi.c file
> and compiling it with -fno-pie, simply move __sbi_ecall() and
> __sbi_base_ecall() into their own file where this is fixed.
>
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
>                           unsigned long arg2, unsigned long arg3,
>                           unsigned long arg4, unsigned long arg5,
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
> @@ -88,7 +92,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  += mcount-dyn.o
>
>  obj-$(CONFIG_PERF_EVENTS)      += perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)   += perf_regs.o
> -obj-$(CONFIG_RISCV_SBI)                += sbi.o
> +obj-$(CONFIG_RISCV_SBI)                += sbi.o sbi_ecall.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)              += sbi-ipi.o
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
>                            unsigned long start, unsigned long size,
>                            unsigned long arg4, unsigned long arg5) __ro_after_init;
>
> -struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> -                         unsigned long arg2, unsigned long arg3,
> -                         unsigned long arg4, unsigned long arg5,
> -                         int fid, int ext)
> -{
> -       struct sbiret ret;
> -
> -       trace_sbi_call(ext, fid);
> -
> -       register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
> -       register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
> -       register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
> -       register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
> -       register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
> -       register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
> -       register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
> -       register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
> -       asm volatile ("ecall"
> -                     : "+r" (a0), "+r" (a1)
> -                     : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> -                     : "memory");
> -       ret.error = a0;
> -       ret.value = a1;
> -
> -       trace_sbi_return(ext, ret.error, ret.value);
> -
> -       return ret;
> -}
> -EXPORT_SYMBOL(__sbi_ecall);
> -
>  int sbi_err_map_linux_errno(int err)
>  {
>         switch (err) {
> @@ -535,17 +502,6 @@ long sbi_probe_extension(int extid)
>  }
>  EXPORT_SYMBOL(sbi_probe_extension);
>
> -static long __sbi_base_ecall(int fid)
> -{
> -       struct sbiret ret;
> -
> -       ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> -       if (!ret.error)
> -               return ret.value;
> -       else
> -               return sbi_err_map_linux_errno(ret.error);
> -}
> -
>  static inline long sbi_get_spec_version(void)
>  {
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
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
> +       struct sbiret ret;
> +
> +       ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +       if (!ret.error)
> +               return ret.value;
> +       else
> +               return sbi_err_map_linux_errno(ret.error);
> +}
> +EXPORT_SYMBOL(__sbi_base_ecall);
> +
> +struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> +                         unsigned long arg2, unsigned long arg3,
> +                         unsigned long arg4, unsigned long arg5,
> +                         int fid, int ext)
> +{
> +       struct sbiret ret;
> +
> +       trace_sbi_call(ext, fid);
> +
> +       register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
> +       register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
> +       register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
> +       register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
> +       register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
> +       register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
> +       register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
> +       register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
> +       asm volatile ("ecall"
> +                      : "+r" (a0), "+r" (a1)
> +                      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> +                      : "memory");
> +       ret.error = a0;
> +       ret.value = a1;
> +
> +       trace_sbi_return(ext, ret.error, ret.value);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(__sbi_ecall);
> --
> 2.39.2
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
