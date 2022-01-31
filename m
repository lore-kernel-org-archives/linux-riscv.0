Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE02C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS6z9nqKwPs5Lsm+/1Xsb+HZOl+/OruAcG64XVZh5PU=; b=iPvou9i6Ggo49n
	oU88gEH23+b+vr5SiTK4f0hpQm5YeR+drcPDcQRFXSc2MDkXvvWnAx2K8Cn4zFrB/jdaxeLV6a/ay
	z3CiQ0z13EQzA0/pdcocg+9cKwlnjI2rNpvsYEWyNOmc90/fbooCvlEtQ7tXKfNQYlqkHGkaHBaHj
	nvs9xBqTW/GpU4qCN3OVpcdD1VBq8HeUzWRTMVFw6sSoq2tD/5Lj57xT8oEUdKonSbyOqwMq7FuCj
	ZGe1fLjNWf+ELNOTE6uCTiJQIXKjv6gIwj/9TO6aMMdmDmBcTI1oGd2nm55IaAr2V6xof5idVfSX2
	fwftg1Z4og7gQGqiPEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWj4-009UH4-JC; Mon, 31 Jan 2022 13:28:10 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWj0-009UEr-ES
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:28:08 +0000
Received: by mail-ua1-f44.google.com with SMTP id u76so11844628uau.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5u585wGCFvffT6ZpVDKH8s7FQKzx7RBic/rFZXeRNwQ=;
 b=mMYx+0wizL5BZJ4E3nalu4vvalzpXyaizZtyxf350xsPR3LLP1e/2C7mIOyGhHjNh/
 NgVJckG+qg3VhgjYEeHGsQjagN+hIvIMGYpDemAMdNJFLuxOLHZdK1qs3zMTU1p6kTry
 ecF8gJgegLnOZtFk9MFrhaLjTX/0xZzm0NkowBOG99Tjqxo17aU08SBq22kjp38jXPV3
 ZxjHKnqCDUneJ3fdzttiTfRcIWqTJqsWN+eSncdFqVXn9uYw3C82JZg0QUF/WmPY7l7D
 VbEiZmNpnteg67lqDBkqtAZrn9Qbp3Rc1y9taeIJpxHGXavnR1kJw8rXBJSa9I5yyUIc
 QW4A==
X-Gm-Message-State: AOAM530xSEDHxYVTC0YAbkFba1o5x2ZiV2uTpmvkbyVnfEBRpCyJIHF9
 h2V9Rs368YJcW8uXkec0M7Hzm/OIka6+3g==
X-Google-Smtp-Source: ABdhPJwZZm2upVssZ6KCV37/X/u9JtDPH7SQe1pyhZutEuiwxfpL07v1mltT7X5QPn8GiYxGi7TXrw==
X-Received: by 2002:ab0:6642:: with SMTP id b2mr8244384uaq.99.1643635684060;
 Mon, 31 Jan 2022 05:28:04 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id p74sm4139600vke.36.2022.01.31.05.28.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 05:28:02 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id l14so11779048vsm.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:28:02 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr7426160vsb.68.1643635682152; 
 Mon, 31 Jan 2022 05:28:02 -0800 (PST)
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
 <CAAhSdy03QnZAxuKODA3MGWpRtKJio-19Nea+QM_KrBuye7opSw@mail.gmail.com>
In-Reply-To: <CAAhSdy03QnZAxuKODA3MGWpRtKJio-19Nea+QM_KrBuye7opSw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Jan 2022 14:27:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX781o5g7ezk3TFQsfFPsjf=hZKvgN0VdK1XyxV8rvFJQ@mail.gmail.com>
Message-ID: <CAMuHMdX781o5g7ezk3TFQsfFPsjf=hZKvgN0VdK1XyxV8rvFJQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Anup Patel <anup@brainfault.org>
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
X-CRM114-CacheID: sfid-20220131_052806_516543_606C8AC3 
X-CRM114-Status: GOOD (  57.52  )
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

Hi Anup,

On Mon, Jan 31, 2022 at 1:09 PM Anup Patel <anup@brainfault.org> wrote:
> On Fri, Jan 28, 2022 at 2:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jan 28, 2022 at 1:13 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > On Thu, Jan 27, 2022 at 12:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> On Thu, Jan 27, 2022 at 2:02 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >> > On Wed, Jan 26, 2022 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> > > On Wed, Jan 26, 2022 at 9:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> > > > On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >> > > > > On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > >> > > > > > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> > >> > > > > > > Currently, SBI APIs accept a hartmask that is generated from struct
> > >> > > > > > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > >> > > > > > > is not the correct data structure for hartids as it can be higher
> > >> > > > > > > than NR_CPUs for platforms with sparse or discontguous hartids.
> > >> > > > > > >
> > >> > > > > > > Remove all association between hartid mask and struct cpumask.
> > >> > > > > > >
> > >> > > > > > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > >> > > > > > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > >> > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > >> > > >
> > >> > > > > I am yet to reproduce it on my end.
> > >> > > > > @Geert Uytterhoeven: can you please try the below diff on your end.
> > >> > > >
> > >> > > > Unfortunately it doesn't fix the issue for me.
> > >> > > >
> > >> > > > /me debugging...
> > >> > >
> > >> > > Found it: after this commit, the SBI_EXT_RFENCE_REMOTE_FENCE_I and
> > >> > > SBI_EXT_RFENCE_REMOTE_SFENCE_VMA ecalls are now called with
> > >> > > hmask = 0x8000000000000001 and hbase = 1 instead of hmask = 3 and
> > >> > > hbase = 0.
> > >> > >
> > >> > > cpuid 1 maps to  hartid 0
> > >> > > cpuid 0 maps to hartid 1
> > >> > >
> > >> > >     __sbi_rfence_v02:364: cpuid 1 hartid 0
> > >> > >     __sbi_rfence_v02:377: hartid 0 hbase 1
> > >> > >     hmask |= 1UL << (hartid - hbase);
> > >> > >
> > >> > > oops
> > >> > >
> > >> > >     __sbi_rfence_v02_call:303: SBI_EXT_RFENCE_REMOTE_FENCE_I hmask
> > >> > > 8000000000000001 hbase 1
> > >> > >
> > >> >
> > >> > Ahh yes. hmask will be incorrect if the bootcpu(cpu 0) is a higher
> > >> > hartid and it is trying to do a remote tlb flush/IPI
> > >> > to lower the hartid. We should generate the hartid array before the loop.
> > >> >
> > >> > Can you try this diff ? It seems to work for me during multiple boot
> > >> > cycle on the unleashed.
> > >> >
> > >> > You can find the patch here as well
> > >> > https://github.com/atishp04/linux/commits/v5.17-rc1
> >
> > >> > @@ -345,13 +368,21 @@ static int __sbi_rfence_v02(int fid, const
> > >> > struct cpumask *cpu_mask,
> > >> >       unsigned long arg4, unsigned long arg5)
> > >> >  {
> > >> >   unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> > >> > - int result;
> > >> > + int result, index = 0, max_index = 0;
> > >> > + unsigned long hartid_arr[NR_CPUS] = {0};
> > >>
> > >> That's up to 256 bytes on the stack. And more if the maximum
> > >> number of cores is increased.
> > >>
> > >
> > > Yeah. We can switch to dynamic allocation using kmalloc based on
> > > the number of bits set in the cpumask.
> >
> > Even more overhead...
> >
> > >> > - if (!cpu_mask)
> > >> > + if (!cpu_mask || cpumask_empty(cpu_mask))
> > >> >   cpu_mask = cpu_online_mask;
> > >> >
> > >> >   for_each_cpu(cpuid, cpu_mask) {
> > >> >   hartid = cpuid_to_hartid_map(cpuid);
> > >> > + hartid_arr[index] = hartid;
> > >> > + index++;
> > >> > + }
> > >> > + max_index = index;
> > >> > + sort(hartid_arr, max_index, sizeof(unsigned long), cmp_ulong, NULL);
> > >> > + for (index = 0; index < max_index; index++) {
> > >> > + hartid = hartid_arr[index];
> > >>
> > >> That looks expensive to me.
> > >>
> > >> What about shifting hmask and adjusting hbase if a hartid is
> > >> lower than the current hbase?
> > >
> > > That will probably work for current systems but it will fail when we have hartid > 64.
> > > The below logic as it assumes that the hartids are in order. We can have a situation
> > > where a two consecutive cpuid belong to hartids that require two invocations of sbi call
> > > because the number of harts exceeds BITS_PER_LONG.
> >
> > If the number of harts exceeds BITS_PER_LONG, you always need multiple
> > calls, right?
> >
> > I think the below (gmail-whitespace-damaged diff) should work:

[...]

> >
> > Another simpler solution would be to just round hbase down to a
> > multiple of 32/64 (gmail-whitespace-damaged diff):

[...]

> > But that means multiple SBI calls if you have e.g. hartids 1-64.
> > The shifted mask solution doesn't suffer from that.
> > Both solutions don't sort the CPUs, so they are suboptimal in case of
> > hartid numberings like 0, 64, 1, 65, ...
>
> In most cases, the hartids will be in sorted order under /cpus DT node
> but it is not guaranteed that boot_cpu will be having smallest hartid
>
> This means hartid numbering will be something like:
> 0, 1, 2, .....,
> 64, 0, 1, 2, ....
> 31, 0, 1, 2, .....
>
> >
> > What do you think?
>
> Assuming hartids under /cpus DT node are ordered, I think your
> approach will only have one additional SBI call compared to Atish's
> approach but Atish's approach will require more memory with
> increasing NR_CPUS so I suggest we go with your approach.
>
> Can you send a patch with your approach ?

Sure, done.
https://lore.kernel.org/r/cover.1643635156.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
