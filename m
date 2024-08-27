Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE130C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 05:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1cj1sXqhe1Fnjp3dmHccudLxfs2ZaZ2T6SLvAsntOE=; b=FbnoHHw56RbWlb
	P3Q3sSScN5YJ6O44qTrCbkuSKuC9xtPMMY7jc+39YRNskvMYVz9rb0QxV2gGk66Kem/f2VFKEAJs6
	kc+ToDG87AJpidVdQ4aVmy3wYg9V4ZoPNtEef4mksgbqp8IHCm49fERiLsDQDr1xmwTuGMElAJuOf
	ZjLFzRoma9c9AYMwnCbVNQhH4UcD7a5fuVx0ekeDxS4nRDfKBCHp5LQFw0PxogC8yK4cqv3ZR1p6n
	N+HV8HOupmBD+HbMSgG03nSNDJzwX5C2ImHmWQHuSOiBgjJnUXD018FNd2diJnGexC1d4czRBE84k
	9Q1hnTFo4sXHR1kHuqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siokT-00000009s1t-1xIF;
	Tue, 27 Aug 2024 05:28:09 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siokP-00000009s0e-49at
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 05:28:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D0CF60002;
	Tue, 27 Aug 2024 05:27:56 +0000 (UTC)
Message-ID: <9535776a-5e4a-49b0-b75f-6e1b94706f46@ghiti.fr>
Date: Tue, 27 Aug 2024 07:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
Content-Language: en-US
To: zhangchunyan@iscas.ac.cn, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
 <CAOsKWHCCEAi-G=Ld9GJ2YUrbbV6dEzThXh5rOzYp6kWfUHfNHw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAOsKWHCCEAi-G=Ld9GJ2YUrbbV6dEzThXh5rOzYp6kWfUHfNHw@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_222806_458194_312DF8A1 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Chunyan,

On 27/08/2024 06:57, Chunyan Zhang wrote:
> Hi Alex,
>
> On Mon, 26 Aug 2024 at 18:58, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
>> process, before the first memory mapping is setup so we can't have any
>> instrumentation happening here.
> I also found that when CONFIG_KASAN is enabled, and either
> RISCV_ALTERNATIVE_EARLY or CONFIG_DT_IDLE_GENPD is set, the kernel
> cannot boot.


Yes, I was initially fixing this report: 
https://lore.kernel.org/linux-riscv/00000000000065062c061fcec37b@google.com/

And that makes me think I forgot the syzbot tag:

Reported-by: syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com


>
> This patch fixed the issue.
>
> Tested-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>


Thanks!

Alex


>
>> In addition, when the kernel is relocatable, we must also not issue any
>> relocation this early since they would have been patched virtually only.
>>
>> So, instead of disabling instrumentation for the whole kernel/sbi.c file
>> and compiling it with -fno-pie, simply move __sbi_ecall() and
>> __sbi_base_ecall() into their own file where this is fixed.
>>
>> Fixes: 1745cfafebdf ("riscv: don't use global static vars to store alternative data")
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/sbi.h  |  2 ++
>>   arch/riscv/kernel/Makefile    |  6 ++++-
>>   arch/riscv/kernel/sbi.c       | 44 --------------------------------
>>   arch/riscv/kernel/sbi_ecall.c | 48 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 55 insertions(+), 45 deletions(-)
>>   create mode 100644 arch/riscv/kernel/sbi_ecall.c
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 7cffd4ffecd0..5843a10b380e 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -9,6 +9,7 @@
>>
>>   #include <linux/types.h>
>>   #include <linux/cpumask.h>
>> +#include <linux/jump_label.h>
>>
>>   #ifdef CONFIG_RISCV_SBI
>>   enum sbi_ext_id {
>> @@ -304,6 +305,7 @@ struct sbiret {
>>   };
>>
>>   void sbi_init(void);
>> +long __sbi_base_ecall(int fid);
>>   struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
>>                            unsigned long arg2, unsigned long arg3,
>>                            unsigned long arg4, unsigned long arg5,
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index 06d407f1b30b..7f88cc4931f5 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -20,17 +20,21 @@ endif
>>   ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>>   CFLAGS_alternative.o := -mcmodel=medany
>>   CFLAGS_cpufeature.o := -mcmodel=medany
>> +CFLAGS_sbi_ecall.o := -mcmodel=medany
>>   ifdef CONFIG_FTRACE
>>   CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
>>   CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
>> +CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
>>   endif
>>   ifdef CONFIG_RELOCATABLE
>>   CFLAGS_alternative.o += -fno-pie
>>   CFLAGS_cpufeature.o += -fno-pie
>> +CFLAGS_sbi_ecall.o += -fno-pie
>>   endif
>>   ifdef CONFIG_KASAN
>>   KASAN_SANITIZE_alternative.o := n
>>   KASAN_SANITIZE_cpufeature.o := n
>> +KASAN_SANITIZE_sbi_ecall.o := n
>>   endif
>>   endif
>>
>> @@ -88,7 +92,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)  += mcount-dyn.o
>>
>>   obj-$(CONFIG_PERF_EVENTS)      += perf_callchain.o
>>   obj-$(CONFIG_HAVE_PERF_REGS)   += perf_regs.o
>> -obj-$(CONFIG_RISCV_SBI)                += sbi.o
>> +obj-$(CONFIG_RISCV_SBI)                += sbi.o sbi_ecall.o
>>   ifeq ($(CONFIG_RISCV_SBI), y)
>>   obj-$(CONFIG_SMP)              += sbi-ipi.o
>>   obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 837bdab2601b..ace9e2f59c41 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -14,9 +14,6 @@
>>   #include <asm/smp.h>
>>   #include <asm/tlbflush.h>
>>
>> -#define CREATE_TRACE_POINTS
>> -#include <asm/trace.h>
>> -
>>   /* default SBI version is 0.1 */
>>   unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>>   EXPORT_SYMBOL(sbi_spec_version);
>> @@ -27,36 +24,6 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
>>                             unsigned long start, unsigned long size,
>>                             unsigned long arg4, unsigned long arg5) __ro_after_init;
>>
>> -struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
>> -                         unsigned long arg2, unsigned long arg3,
>> -                         unsigned long arg4, unsigned long arg5,
>> -                         int fid, int ext)
>> -{
>> -       struct sbiret ret;
>> -
>> -       trace_sbi_call(ext, fid);
>> -
>> -       register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
>> -       register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
>> -       register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
>> -       register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
>> -       register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
>> -       register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
>> -       register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
>> -       register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
>> -       asm volatile ("ecall"
>> -                     : "+r" (a0), "+r" (a1)
>> -                     : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
>> -                     : "memory");
>> -       ret.error = a0;
>> -       ret.value = a1;
>> -
>> -       trace_sbi_return(ext, ret.error, ret.value);
>> -
>> -       return ret;
>> -}
>> -EXPORT_SYMBOL(__sbi_ecall);
>> -
>>   int sbi_err_map_linux_errno(int err)
>>   {
>>          switch (err) {
>> @@ -535,17 +502,6 @@ long sbi_probe_extension(int extid)
>>   }
>>   EXPORT_SYMBOL(sbi_probe_extension);
>>
>> -static long __sbi_base_ecall(int fid)
>> -{
>> -       struct sbiret ret;
>> -
>> -       ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> -       if (!ret.error)
>> -               return ret.value;
>> -       else
>> -               return sbi_err_map_linux_errno(ret.error);
>> -}
>> -
>>   static inline long sbi_get_spec_version(void)
>>   {
>>          return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
>> diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
>> new file mode 100644
>> index 000000000000..24aabb4fbde3
>> --- /dev/null
>> +++ b/arch/riscv/kernel/sbi_ecall.c
>> @@ -0,0 +1,48 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (c) 2024 Rivos Inc. */
>> +
>> +#include <asm/sbi.h>
>> +#define CREATE_TRACE_POINTS
>> +#include <asm/trace.h>
>> +
>> +long __sbi_base_ecall(int fid)
>> +{
>> +       struct sbiret ret;
>> +
>> +       ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> +       if (!ret.error)
>> +               return ret.value;
>> +       else
>> +               return sbi_err_map_linux_errno(ret.error);
>> +}
>> +EXPORT_SYMBOL(__sbi_base_ecall);
>> +
>> +struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
>> +                         unsigned long arg2, unsigned long arg3,
>> +                         unsigned long arg4, unsigned long arg5,
>> +                         int fid, int ext)
>> +{
>> +       struct sbiret ret;
>> +
>> +       trace_sbi_call(ext, fid);
>> +
>> +       register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
>> +       register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
>> +       register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
>> +       register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
>> +       register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
>> +       register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
>> +       register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
>> +       register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
>> +       asm volatile ("ecall"
>> +                      : "+r" (a0), "+r" (a1)
>> +                      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
>> +                      : "memory");
>> +       ret.error = a0;
>> +       ret.value = a1;
>> +
>> +       trace_sbi_return(ext, ret.error, ret.value);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(__sbi_ecall);
>> --
>> 2.39.2
>>
>>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
