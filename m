Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2E9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20dJGNjeebgUMXDRSRpLBZ6akd0hAloD1lrEDWCaB6A=; b=Nz8FiPO3BYfksB
	AYMPepw+Ag5n+vd/P0N1WoiEwTbPonbfs2BTd2BrqT9qX+cETRD3B6ZHInKTxH/iAZmRAN278LRMD
	EQQqT1dF/eUf/48o2yg5fILLYPWnfMClVKjU4yWH4E8eAtfgsjoJY5ZTaAmhLlVu8i32uA8KnuQ5o
	OKzKILpJMy1FoSLjRt3W4kB+PAx2zjkhGVMaRa8l34bFb00+m6/zkCTuYjvDcTstxG+TvPhCzESWt
	yoQHqVUXBUSx6vdbENk+W3grNAc2e3I5t9/DCSnzN+GeMW7mfamlCyAhoMVobUxJLgh/CtjjGoY6a
	dG6LVQv6GVWt0Mo6RqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVVG-009H3B-5y; Mon, 31 Jan 2022 12:09:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEVVC-009H17-Mi
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 12:09:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id a13so24986571wrh.9
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 04:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXSLKD8e22MuZf6AnO2TxGylz1Lw9cVB+ONQQSlcUs0=;
 b=oLL/Qx2rSTHNHeWZuqcgjD0Aw7Q1T0Nz+aiWK863MqevCjJDHNzctfnnoqFnNp2woP
 zbuONw2iV2DyA9OaxpV6Dr2+GlMhz59QKWNYLZgKH6l+PVcxd/peo8iQxboDZ6aOB5yM
 Wtxir9Y1U277QyO7KhcdH5aTL2v+zzSpmLO2ZVwklKKce9HloNy7Tjl3ABv+xUP/QVyX
 uHgRxn2lBAHoZ9x36iy6u0ytWV48q+BBfegnQffFC982AMmXLTi3oIBixXRDTbyUymgH
 clLv4lGv0UMdkDuF/w/rA0hhyjc3xFETu8t74FtPWVe5ltYg22cqCxkIG/E4N18Xs0ua
 evYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXSLKD8e22MuZf6AnO2TxGylz1Lw9cVB+ONQQSlcUs0=;
 b=QB76N4S1msmE5wnnf2CccK1iz1SFV3bULNacfdIQFXEei2hI63t94dX6Cdptwi/6VO
 ithu3xMuFmaWsiVnqdFCp4ATYO0qdV3e/uugqU4f9S6b0UHCYviUSyJ7ufo5BkUuf6Hk
 HI5Wq3APQUBgl50s/IUPSXoSt1lLMJfE28LCI/JChcijBYCFyKICjK1ZbZHMOiSQIvoh
 tC2s9z31Jq4+/gXw/hqaU+iVx9aRNlUwOf8QgQO30aJ+/X7Iu4NjEXcamTQ4KfU+xIDX
 ureCMXSsjXIw4IAEJBzuU/UlOqasVP+w4wk7012s3h1lwJs5ihgP+viZ8tL6uN5EbLkh
 dKCQ==
X-Gm-Message-State: AOAM5320UZ49awjW6j+xF6C3w2R/9lyY7hjsKycRRDWyKk7R8PjS9BkA
 PWl28SkgmXWRKLAWyalp17/NbExg1Z1x+i2yggL1SQ==
X-Google-Smtp-Source: ABdhPJzvUXAmh6/D1wXD1n3TSLPwqicitfWmSs+RkZw9KtwdC02h0LDdtrK7Ynk92Fl+qeTC4MVQhHvIhFoQbfZrTiY=
X-Received: by 2002:a05:6000:1e0a:: with SMTP id
 bj10mr17207813wrb.313.1643630984644; 
 Mon, 31 Jan 2022 04:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
 <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
 <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
 <CAMuHMdXq7OQJL6H7=JRnDTR6p+AD0o2Ctjn806XZQZ9PYjvepg@mail.gmail.com>
 <CAOnJCU+AVS5Js4ZXmUubTqwU5Ye-9_z8onEE1mwhvCsOXchFBg@mail.gmail.com>
 <CAMuHMdWsX-Pg3B1=KRf9hz1JrPAbydBrANTXg4q5CFJCqHJAoA@mail.gmail.com>
 <CAOnJCU+U0xmw-_yTEUo9ZXO5pvoJ6VCGu+jjU-Sa2MnhcAha6Q@mail.gmail.com>
 <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jan 2022 17:39:32 +0530
Message-ID: <CAAhSdy03QnZAxuKODA3MGWpRtKJio-19Nea+QM_KrBuye7opSw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_040946_871983_2D94B538 
X-CRM114-Status: GOOD (  59.41  )
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

On Fri, Jan 28, 2022 at 2:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Atish,
>
> On Fri, Jan 28, 2022 at 1:13 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Thu, Jan 27, 2022 at 12:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Thu, Jan 27, 2022 at 2:02 AM Atish Patra <atishp@atishpatra.org> wrote:
> >> > On Wed, Jan 26, 2022 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > > On Wed, Jan 26, 2022 at 9:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > > > On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
> >> > > > > On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >> > > > > > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> >> > > > > > > Currently, SBI APIs accept a hartmask that is generated from struct
> >> > > > > > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> >> > > > > > > is not the correct data structure for hartids as it can be higher
> >> > > > > > > than NR_CPUs for platforms with sparse or discontguous hartids.
> >> > > > > > >
> >> > > > > > > Remove all association between hartid mask and struct cpumask.
> >> > > > > > >
> >> > > > > > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> >> > > > > > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> >> > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >> > > >
> >> > > > > I am yet to reproduce it on my end.
> >> > > > > @Geert Uytterhoeven: can you please try the below diff on your end.
> >> > > >
> >> > > > Unfortunately it doesn't fix the issue for me.
> >> > > >
> >> > > > /me debugging...
> >> > >
> >> > > Found it: after this commit, the SBI_EXT_RFENCE_REMOTE_FENCE_I and
> >> > > SBI_EXT_RFENCE_REMOTE_SFENCE_VMA ecalls are now called with
> >> > > hmask = 0x8000000000000001 and hbase = 1 instead of hmask = 3 and
> >> > > hbase = 0.
> >> > >
> >> > > cpuid 1 maps to  hartid 0
> >> > > cpuid 0 maps to hartid 1
> >> > >
> >> > >     __sbi_rfence_v02:364: cpuid 1 hartid 0
> >> > >     __sbi_rfence_v02:377: hartid 0 hbase 1
> >> > >     hmask |= 1UL << (hartid - hbase);
> >> > >
> >> > > oops
> >> > >
> >> > >     __sbi_rfence_v02_call:303: SBI_EXT_RFENCE_REMOTE_FENCE_I hmask
> >> > > 8000000000000001 hbase 1
> >> > >
> >> >
> >> > Ahh yes. hmask will be incorrect if the bootcpu(cpu 0) is a higher
> >> > hartid and it is trying to do a remote tlb flush/IPI
> >> > to lower the hartid. We should generate the hartid array before the loop.
> >> >
> >> > Can you try this diff ? It seems to work for me during multiple boot
> >> > cycle on the unleashed.
> >> >
> >> > You can find the patch here as well
> >> > https://github.com/atishp04/linux/commits/v5.17-rc1
>
> >> > @@ -345,13 +368,21 @@ static int __sbi_rfence_v02(int fid, const
> >> > struct cpumask *cpu_mask,
> >> >       unsigned long arg4, unsigned long arg5)
> >> >  {
> >> >   unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> >> > - int result;
> >> > + int result, index = 0, max_index = 0;
> >> > + unsigned long hartid_arr[NR_CPUS] = {0};
> >>
> >> That's up to 256 bytes on the stack. And more if the maximum
> >> number of cores is increased.
> >>
> >
> > Yeah. We can switch to dynamic allocation using kmalloc based on
> > the number of bits set in the cpumask.
>
> Even more overhead...
>
> >> > - if (!cpu_mask)
> >> > + if (!cpu_mask || cpumask_empty(cpu_mask))
> >> >   cpu_mask = cpu_online_mask;
> >> >
> >> >   for_each_cpu(cpuid, cpu_mask) {
> >> >   hartid = cpuid_to_hartid_map(cpuid);
> >> > + hartid_arr[index] = hartid;
> >> > + index++;
> >> > + }
> >> > + max_index = index;
> >> > + sort(hartid_arr, max_index, sizeof(unsigned long), cmp_ulong, NULL);
> >> > + for (index = 0; index < max_index; index++) {
> >> > + hartid = hartid_arr[index];
> >>
> >> That looks expensive to me.
> >>
> >> What about shifting hmask and adjusting hbase if a hartid is
> >> lower than the current hbase?
> >
> > That will probably work for current systems but it will fail when we have hartid > 64.
> > The below logic as it assumes that the hartids are in order. We can have a situation
> > where a two consecutive cpuid belong to hartids that require two invocations of sbi call
> > because the number of harts exceeds BITS_PER_LONG.
>
> If the number of harts exceeds BITS_PER_LONG, you always need multiple
> calls, right?
>
> I think the below (gmail-whitespace-damaged diff) should work:
>
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -249,7 +249,7 @@ static void __sbi_set_timer_v02(uint64_t stime_value)
>
>  static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
>  {
> -       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> +       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>         struct sbiret ret = {0};
>         int result;
>
> @@ -258,16 +258,27 @@ static int __sbi_send_ipi_v02(const struct
> cpumask *cpu_mask)
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask &&
> -                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
> -                       ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
> -                                       hmask, hbase, 0, 0, 0, 0);
> -                       if (ret.error)
> -                               goto ecall_failed;
> -                       hmask = 0;
> +               if (hmask) {
> +                       if (hartid + BITS_PER_LONG <= htop ||
> +                           hartid >= hbase + BITS_PER_LONG) {
> +                               ret = sbi_ecall(SBI_EXT_IPI,
> +                                               SBI_EXT_IPI_SEND_IPI, hmask,
> +                                               hbase, 0, 0, 0, 0);
> +                               if (ret.error)
> +                                       goto ecall_failed;
> +                               hmask = 0;
> +                       } else if (hartid < hbase) {
> +                               /* shift the mask to fit lower hartid */
> +                               hmask <<= hbase - hartid;
> +                               hbase = hartid;
> +                       }
>                 }
> -               if (!hmask)
> +               if (!hmask) {
>                         hbase = hartid & -BITS_PER_LONG;
> +                       htop = hartid;
> +               } else if (hartid > htop) {
> +                       htop = hartid;
> +               }
>                 hmask |= 1UL << (hartid - hbase);
>         }
>
> @@ -344,7 +355,7 @@ static int __sbi_rfence_v02(int fid, const struct
> cpumask *cpu_mask,
>                             unsigned long start, unsigned long size,
>                             unsigned long arg4, unsigned long arg5)
>  {
> -       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> +       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>         int result;
>
>         if (!cpu_mask || cpumask_empty(cpu_mask))
> @@ -352,16 +363,26 @@ static int __sbi_rfence_v02(int fid, const
> struct cpumask *cpu_mask,
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask &&
> -                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
> -                       result = __sbi_rfence_v02_call(fid, hmask, hbase,
> -                                                      start, size, arg4, arg5);
> -                       if (result)
> -                               return result;
> -                       hmask = 0;
> +               if (hmask) {
> +                       if (hartid + BITS_PER_LONG <= htop ||
> +                           hartid >= hbase + BITS_PER_LONG) {
> +                               result = __sbi_rfence_v02_call(fid, hmask,
> +                                               hbase, start, size, arg4, arg5);
> +                               if (result)
> +                                       return result;
> +                               hmask = 0;
> +                       } else if (hartid < hbase) {
> +                               /* shift the mask to fit lower hartid */
> +                               hmask <<= hbase - hartid;
> +                               hbase = hartid;
> +                       }
> +               }
> +               if (!hmask) {
> +                       hbase = hartid;
> +                       htop = hartid;
> +               } else if (hartid > htop) {
> +                       htop = hartid;
>                 }
> -               if (!hmask)
> -                       hbase = hartid & -BITS_PER_LONG;
>                 hmask |= 1UL << (hartid - hbase);
>         }
>
> Another simpler solution would be to just round hbase down to a
> multiple of 32/64 (gmail-whitespace-damaged diff):
>
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -258,16 +258,16 @@ static int __sbi_send_ipi_v02(const struct
> cpumask *cpu_mask)
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
> +               if (hmask &&
> +                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
>                         ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
>                                         hmask, hbase, 0, 0, 0, 0);
>                         if (ret.error)
>                                 goto ecall_failed;
>                         hmask = 0;
> -                       hbase = 0;
>                 }
>                 if (!hmask)
> -                       hbase = hartid;
> +                       hbase = hartid & -BITS_PER_LONG;
>                 hmask |= 1UL << (hartid - hbase);
>         }
>
> @@ -352,16 +352,16 @@ static int __sbi_rfence_v02(int fid, const
> struct cpumask *cpu_mask,
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
> +               if (hmask &&
> +                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
>                         result = __sbi_rfence_v02_call(fid, hmask, hbase,
>                                                        start, size, arg4, arg5);
>                         if (result)
>                                 return result;
>                         hmask = 0;
> -                       hbase = 0;
>                 }
>                 if (!hmask)
> -                       hbase = hartid;
> +                       hbase = hartid & -BITS_PER_LONG;
>                 hmask |= 1UL << (hartid - hbase);
>         }
>
> But that means multiple SBI calls if you have e.g. hartids 1-64.
> The shifted mask solution doesn't suffer from that.
> Both solutions don't sort the CPUs, so they are suboptimal in case of
> hartid numberings like 0, 64, 1, 65, ...

In most cases, the hartids will be in sorted order under /cpus DT node
but it is not guaranteed that boot_cpu will be having smallest hartid

This means hartid numbering will be something like:
0, 1, 2, .....,
64, 0, 1, 2, ....
31, 0, 1, 2, .....

>
> What do you think?

Assuming hartids under /cpus DT node are ordered, I think your
approach will only have one additional SBI call compared to Atish's
approach but Atish's approach will require more memory with
increasing NR_CPUS so I suggest we go with your approach.

Can you send a patch with your approach ?

Regards,
Anup


> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
