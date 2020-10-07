Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88609C4363D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 14:45:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036E5208C7
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 14:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rb7NNHhg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kztaml6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036E5208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dmJ0kivtJCthXcl+OAE2L3FcU2rMdRTzjniZSt26izQ=; b=rb7NNHhgVlAJCfzU5se39fiBu
	JKY4f2snqMyQa9iJuKFu4VMkE++Z7v0W85mE6UlAEmooTkKRudxFuMX69+y8SDCuuMlyD8R1u4jM7
	8yCiJbylsoYhS6GQb/eR7TP27uE2tFfIdCHvu7lTZKnklpgA2Fu+5TuseRU+b/7uJgjiXa74IPbSN
	+P25UjQymVWfQ1A2bnPfqiN7fmNZQ4AKiDonZI2oyT3WiNb4hyyXdKAsoC112UovW8T0bEHpubbqR
	j4oYFyjFNR+f2sqwAqSFkzjLGV7BLuKi8tLFBTAZtWy817jAj+lhbPnnqCA9saX54YllGUYGLQ/WA
	3E9giuvsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQAhN-0007Xh-70; Wed, 07 Oct 2020 14:45:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQAhK-0007Wi-FQ
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 14:45:43 +0000
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2F3121548
 for <linux-riscv@lists.infradead.org>; Wed,  7 Oct 2020 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602081941;
 bh=HqHWoEb0KM+2Iv1t78qbp26pS5O6oD/T7GrrvprJ3Ls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kztaml6Cz72XpOSd+pf8PAok5QQ7VX456uJ6Ycdyz3w1hJjfEbHRI+xiszhbgGJzm
 E77z0vT5POzt6mTx7K+FhuplGiIfFbLaVUlHslxTYJK6RRQKf6eoZCRJMoKqjMliKV
 d+26T+SdKnbfnukuxOImHq4fXZfj982V0dRbgyJQ=
Received: by mail-lf1-f49.google.com with SMTP id a7so1512809lfk.9
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 07:45:40 -0700 (PDT)
X-Gm-Message-State: AOAM533iLmVaFb2ADKh61n4MoQy7gLHgYsL0qv52doEKZwzsZVlxqg0Q
 BmxD0k+FuNEDf0LobZAHe8UtJGN7nKXyMvK0yjw=
X-Google-Smtp-Source: ABdhPJyFrX7LvRQmTVje0bCmurpdxswldnNK6zrOwIjljf3kA88E42dK7RkSl+E3U0ZrG56ef4D/d7WypwZFHj1BvOY=
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr1003603lfi.58.1602081939013; 
 Wed, 07 Oct 2020 07:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net> <87lfgzeidk.fsf@igel.home>
 <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
 <CAOnJCUJhb2K89pRETbfTJ=5jHQhWfyfrOUu8zOE77j+id6OpSA@mail.gmail.com>
 <CAJF2gTRc-RUBiQ=ZE7BT8tABHu3=Bcmuc+ADyBLZ7r7fozwahg@mail.gmail.com>
 <CAOnJCUKi-bzEvYWw3BxBbGe6ODHEzdjTWsfrmS54qEk1i1Kr8Q@mail.gmail.com>
In-Reply-To: <CAOnJCUKi-bzEvYWw3BxBbGe6ODHEzdjTWsfrmS54qEk1i1Kr8Q@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Oct 2020 22:45:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRGZKU8aW+D1U6JWh55bdNVxXZmktMz69b25Ng0RUd-Mg@mail.gmail.com>
Message-ID: <CAJF2gTRGZKU8aW+D1U6JWh55bdNVxXZmktMz69b25Ng0RUd-Mg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_104542_653397_324230F9 
X-CRM114-Status: GOOD (  52.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andreas Schwab <schwab@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2020 at 4:39 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Oct 6, 2020 at 9:46 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Oct 6, 2020 at 3:14 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Thu, Sep 24, 2020 at 9:19 AM Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > How about this, revert the commit and don't free INIT_DATA_SECTION. I
> > > > think the solution is safe enough, but wast a little memory.
> > > >
> > > > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > > > index f3586e3..34d00d9 100644
> > > > --- a/arch/riscv/kernel/vmlinux.lds.S
> > > > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > > > @@ -22,13 +22,11 @@ SECTIONS
> > > >         /* Beginning of code and text segment */
> > > >         . = LOAD_OFFSET;
> > > >         _start = .;
> > > > -       _stext = .;
> > > >         HEAD_TEXT_SECTION
> > > >         . = ALIGN(PAGE_SIZE);
> > > >
> > > >         __init_begin = .;
> > > >         INIT_TEXT_SECTION(PAGE_SIZE)
> > > > -       INIT_DATA_SECTION(16)
> > > >         . = ALIGN(8);
> > > >         __soc_early_init_table : {
> > > >                 __soc_early_init_table_start = .;
> > > > @@ -55,6 +53,7 @@ SECTIONS
> > > >         . = ALIGN(SECTION_ALIGN);
> > > >         .text : {
> > > >                 _text = .;
> > > > +               _stext = .;
> > > >                 TEXT_TEXT
> > > >                 SCHED_TEXT
> > > >                 CPUIDLE_TEXT
> > > > @@ -67,6 +66,8 @@ SECTIONS
> > > >                 _etext = .;
> > > >         }
> > > >
> > > > +       INIT_DATA_SECTION(16)
> > > > +
> > >
> > > I think you need to move EXIT_DATA as well. Currently, we have init
> > > data & text in one section.
> > It's not related to this issue. There is two check code problem:
>
> Yes. But we shouldn't move only INIT_DATA_SECTION out of __init section
> while leaving percpu & exit data in the __init section. Here is what I
> have in mind.
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S
> b/arch/riscv/kernel/vmlinux.lds.S
> index 9795359cb9da..4432cef8184e 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -26,13 +26,11 @@ SECTIONS
>         /* Beginning of code and text segment */
>         . = LOAD_OFFSET;
>         _start = .;
>         _start = .;
> -       _stext = .;
>         HEAD_TEXT_SECTION
>         . = ALIGN(PAGE_SIZE);
>
>         __init_begin = .;
>         INIT_TEXT_SECTION(PAGE_SIZE)
> -       INIT_DATA_SECTION(16)
>         . = ALIGN(8);
>         __soc_early_init_table : {
>                 __soc_early_init_table_start = .;
> @@ -49,16 +47,13 @@ SECTIONS
>         {
>                 EXIT_TEXT
>         }
> -       .exit.data :
> -       {
> -               EXIT_DATA
> -       }
> -       PERCPU_SECTION(L1_CACHE_BYTES)
> +
>         __init_end = .;
>
>         . = ALIGN(SECTION_ALIGN);
>         .text : {
>                 _text = .;
> +               _stext = .;
>                 TEXT_TEXT
>                 SCHED_TEXT
>                 CPUIDLE_TEXT
> @@ -77,6 +72,17 @@ SECTIONS
>  #endif
>
>         /* Start of data section */
> +       __init_data_begin = .;
> +       INIT_DATA_SECTION(16)
> +       .exit.data :
> +       {
> +               EXIT_DATA
> +       }
> +
> +       PERCPU_SECTION(L1_CACHE_BYTES)
> +
> +       __init_data_end = .;
> +
>
> As you correctly pointed out, this wastes around ~200K init memory
> that is wasted.
> That is not an ideal solution.
>
> The other alternative is to move __init_text section after _text as
> well similar to other architectures. But that won't work
> for RISC-V as we jump from _start to __start_kernel(in __init section)
> in head.S.  A JAL instruction can't be fit because
> __start_kernel is now too far. We can't replace JAL with a JALR
> because that would require an additional
> instruction and violates image header format.
>
> Any other ideas to solve this problem without wasting memory ?
How about:

diff --git a/arch/riscv/include/asm/sections.h
b/arch/riscv/include/asm/sections.h
new file mode 100644
index 00000000..2317b9e
--- /dev/null
+++ b/arch/riscv/include/asm/sections.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_SECTIONS_H
+#define _ASM_RISCV_SECTIONS_H
+
+#define arch_is_kernel_data arch_is_kernel_data
+
+#include <asm-generic/sections.h>
+
+extern bool init_mem_is_free;
+
+static inline int arch_is_kernel_data(unsigned long addr)
+{
+       if (init_mem_is_free)
+               return 0;
+
+       return addr >= (unsigned long)__init_begin &&
+               addr < (unsigned long)__init_end;
+}
+#endif /* _ASM_RISCV_SECTIONS_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c6dd32..9ebd5eb4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -17,6 +17,7 @@
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
+#include <linux/poison.h>

 #include <asm/cpu_ops.h>
 #include <asm/setup.h>
@@ -112,3 +113,11 @@ static int __init topology_init(void)
        return 0;
 }
 subsys_initcall(topology_init);
+
+bool init_mem_is_free = false;
+
+void free_initmem(void)
+{
+       free_initmem_default(POISON_FREE_INITMEM);
+       init_mem_is_free = true;
+}

>
> >  1.     static int static_obj(const void *obj)
> >     {
> >             unsigned long start = (unsigned long) &_stext,
> >                           end   = (unsigned long) &_end,
> >                           addr  = (unsigned long) obj;
> >
> >             /*
> >              * static variable?
> >              */
> >             if ((addr >= start) && (addr < end))
> >                     return 1;
> >
> >  2.     /* Is this address range in the kernel text area? */
> >     static inline void check_kernel_text_object(const unsigned long ptr,
> >                                                 unsigned long n, bool to_user)
> >     {
> >             unsigned long textlow = (unsigned long)_stext;
> >             unsigned long texthigh = (unsigned long)_etext;
> >             unsigned long textlow_linear, texthigh_linear;
> >
> >             if (overlaps(ptr, n, textlow, texthigh))
> >                     usercopy_abort("kernel text", NULL, to_user, ptr -
> > textlow, n);
> >
> > The patch of commit: a0fa4027dc911 (riscv: Fixup static_obj() fail) broke 2th.
> >
> > > In general it is better idea to separate those similar to ARM64.
> > > Additionally, ARM64 applies different mapping for init data & text
> > > as the init data section is marked as non-executable[1]
> > Yes, it's safer to protect init text & init data, but it's should be
> > another patch.
> >
>
> Yes. I will send the patch based on this fix.
>
> > >
> > > However, we don't modify any permission for any init sections. Should
> > > we do that as well ?
> > Agree, we should do that.
> >
> > >
> > > [1] https://patchwork.kernel.org/patch/9572869/
> > >
> > > >         /* Start of data section */
> > > >         _sdata = .;
> > > >         RO_DATA(SECTION_ALIGN)
> > > >
> > > > On Thu, Sep 24, 2020 at 3:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > > >
> > > > > On Sep 14 2020, Aurelien Jarno wrote:
> > > > >
> > > > > > How should we proceed to get that fixed in time for 5.9? For the older
> > > > > > branches where it has been backported (so far 5.7 and 5.8), should we
> > > > > > just get that commit reverted instead?
> > > > >
> > > > > Can this please be resolved ASAP?
> > > > >
> > > > > Andreas.
> > > > >
> > > > > --
> > > > > Andreas Schwab, schwab@linux-m68k.org
> > > > > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> > > > > "And now for something completely different."
> > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > >  Guo Ren
> > > >
> > > > ML: https://lore.kernel.org/linux-csky/
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
