Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34250C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00SPn2zQDWBIVe1dlvV1aXC6UHqsE3p0Twu07TdU5YA=; b=Vqqep4X6iGRsuV
	YHRXvK2sMyGrRnr4PwspVmSWZLnLhw0Ge7jRnJY34mF9fgVn0/DlrCE9ZvU6UnvPqq36bIV3+xuy4
	4j/BKg3ua5VS/ITBBY4ixtnH+fO8FutlMfnBX2pwygenDGId65XSJOm2hPzwqO9r8LGr8HydbOmk5
	PLAO9D4aavSZW1K9yY+X/Lt/jcsZZUKbLeSxWSnhz8w+P0CIzSdhYX2F9wQEaqenHwiX89QPTW82h
	/+CdOoL4r6k0wWfnK1QbXPNcHNW6AFmJdqce+lsXRkE3UiuwZHKompBb+Plx8w4+7g35hmuVV6n+P
	RVxcXWcctcWHf+GNiq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDMnY-0012EH-Sf; Fri, 28 Jan 2022 08:40:00 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDMnW-0012DI-34
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 08:40:00 +0000
Received: by mail-ua1-f47.google.com with SMTP id 2so7220313uax.10
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 00:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngAtlyrBVFbX3g/GOrsusL4Ps8Vz8+ZUnXuzFFZeu+o=;
 b=RGL3jcIX5fhgFxRU/CFwSIOxZlMNntEGkc+smNQfhXl66GDjxqC+KnU/mWkovhecYL
 VgcjIeE8lGBjgG1R+PFd57QzFqpVY/VW6IxuWC78ZJtmxn+YZUFmETljgq5biX2AFupL
 fs5cuKJ0BmMmqjtJFCItUO+v8m7QpH4k3B9XkHrsW0q6pUgqjlQ2pVcnbqcy1iVibHYf
 fjDGDqW153R/jiay/pTD9+RENamcBDSGukHEgxwC3J4VyFaH/E6NCY/GizWJOGiuEtIk
 +jBhKOTBfuhMqfsAeYYI+Xf82suHoUdY8LOahdVtB/LlFhLoIMTY3fRzFVH22V/X5H44
 PSyg==
X-Gm-Message-State: AOAM531Sv/WrERqZwWXIxkFvBaW7YP6+LhEEgsRa2fjKg5c+o73+0OQP
 j84yQXeS7w/pbGJdKHrka1hP1U9zA7HfHby/
X-Google-Smtp-Source: ABdhPJzIo95byTRofKhM+6HotffIvfPYpx6qVBAkteUO2RC7uZGsCrirzLEIJFU7WdXaQy69AyS6+g==
X-Received: by 2002:a9f:24a4:: with SMTP id 33mr3660925uar.42.1643359195444;
 Fri, 28 Jan 2022 00:39:55 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id g25sm1189821vsj.6.2022.01.28.00.39.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 00:39:53 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id az20so2125097vsb.8
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 00:39:53 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr3295923vsb.68.1643359193361; 
 Fri, 28 Jan 2022 00:39:53 -0800 (PST)
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
In-Reply-To: <CAOnJCU+U0xmw-_yTEUo9ZXO5pvoJ6VCGu+jjU-Sa2MnhcAha6Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jan 2022 09:39:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
Message-ID: <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Atish Patra <atishp@atishpatra.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_003958_173208_6AB9EF5D 
X-CRM114-Status: GOOD (  54.59  )
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

Hi Atish,

On Fri, Jan 28, 2022 at 1:13 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Thu, Jan 27, 2022 at 12:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Thu, Jan 27, 2022 at 2:02 AM Atish Patra <atishp@atishpatra.org> wrote:
>> > On Wed, Jan 26, 2022 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > > On Wed, Jan 26, 2022 at 9:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > > > On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
>> > > > > On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> > > > > > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
>> > > > > > > Currently, SBI APIs accept a hartmask that is generated from struct
>> > > > > > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
>> > > > > > > is not the correct data structure for hartids as it can be higher
>> > > > > > > than NR_CPUs for platforms with sparse or discontguous hartids.
>> > > > > > >
>> > > > > > > Remove all association between hartid mask and struct cpumask.
>> > > > > > >
>> > > > > > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
>> > > > > > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
>> > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > > >
>> > > > > I am yet to reproduce it on my end.
>> > > > > @Geert Uytterhoeven: can you please try the below diff on your end.
>> > > >
>> > > > Unfortunately it doesn't fix the issue for me.
>> > > >
>> > > > /me debugging...
>> > >
>> > > Found it: after this commit, the SBI_EXT_RFENCE_REMOTE_FENCE_I and
>> > > SBI_EXT_RFENCE_REMOTE_SFENCE_VMA ecalls are now called with
>> > > hmask = 0x8000000000000001 and hbase = 1 instead of hmask = 3 and
>> > > hbase = 0.
>> > >
>> > > cpuid 1 maps to  hartid 0
>> > > cpuid 0 maps to hartid 1
>> > >
>> > >     __sbi_rfence_v02:364: cpuid 1 hartid 0
>> > >     __sbi_rfence_v02:377: hartid 0 hbase 1
>> > >     hmask |= 1UL << (hartid - hbase);
>> > >
>> > > oops
>> > >
>> > >     __sbi_rfence_v02_call:303: SBI_EXT_RFENCE_REMOTE_FENCE_I hmask
>> > > 8000000000000001 hbase 1
>> > >
>> >
>> > Ahh yes. hmask will be incorrect if the bootcpu(cpu 0) is a higher
>> > hartid and it is trying to do a remote tlb flush/IPI
>> > to lower the hartid. We should generate the hartid array before the loop.
>> >
>> > Can you try this diff ? It seems to work for me during multiple boot
>> > cycle on the unleashed.
>> >
>> > You can find the patch here as well
>> > https://github.com/atishp04/linux/commits/v5.17-rc1

>> > @@ -345,13 +368,21 @@ static int __sbi_rfence_v02(int fid, const
>> > struct cpumask *cpu_mask,
>> >       unsigned long arg4, unsigned long arg5)
>> >  {
>> >   unsigned long hartid, cpuid, hmask = 0, hbase = 0;
>> > - int result;
>> > + int result, index = 0, max_index = 0;
>> > + unsigned long hartid_arr[NR_CPUS] = {0};
>>
>> That's up to 256 bytes on the stack. And more if the maximum
>> number of cores is increased.
>>
>
> Yeah. We can switch to dynamic allocation using kmalloc based on
> the number of bits set in the cpumask.

Even more overhead...

>> > - if (!cpu_mask)
>> > + if (!cpu_mask || cpumask_empty(cpu_mask))
>> >   cpu_mask = cpu_online_mask;
>> >
>> >   for_each_cpu(cpuid, cpu_mask) {
>> >   hartid = cpuid_to_hartid_map(cpuid);
>> > + hartid_arr[index] = hartid;
>> > + index++;
>> > + }
>> > + max_index = index;
>> > + sort(hartid_arr, max_index, sizeof(unsigned long), cmp_ulong, NULL);
>> > + for (index = 0; index < max_index; index++) {
>> > + hartid = hartid_arr[index];
>>
>> That looks expensive to me.
>>
>> What about shifting hmask and adjusting hbase if a hartid is
>> lower than the current hbase?
>
> That will probably work for current systems but it will fail when we have hartid > 64.
> The below logic as it assumes that the hartids are in order. We can have a situation
> where a two consecutive cpuid belong to hartids that require two invocations of sbi call
> because the number of harts exceeds BITS_PER_LONG.

If the number of harts exceeds BITS_PER_LONG, you always need multiple
calls, right?

I think the below (gmail-whitespace-damaged diff) should work:

--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -249,7 +249,7 @@ static void __sbi_set_timer_v02(uint64_t stime_value)

 static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 {
-       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
+       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
        struct sbiret ret = {0};
        int result;

@@ -258,16 +258,27 @@ static int __sbi_send_ipi_v02(const struct
cpumask *cpu_mask)

        for_each_cpu(cpuid, cpu_mask) {
                hartid = cpuid_to_hartid_map(cpuid);
-               if (hmask &&
-                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
-                       ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
-                                       hmask, hbase, 0, 0, 0, 0);
-                       if (ret.error)
-                               goto ecall_failed;
-                       hmask = 0;
+               if (hmask) {
+                       if (hartid + BITS_PER_LONG <= htop ||
+                           hartid >= hbase + BITS_PER_LONG) {
+                               ret = sbi_ecall(SBI_EXT_IPI,
+                                               SBI_EXT_IPI_SEND_IPI, hmask,
+                                               hbase, 0, 0, 0, 0);
+                               if (ret.error)
+                                       goto ecall_failed;
+                               hmask = 0;
+                       } else if (hartid < hbase) {
+                               /* shift the mask to fit lower hartid */
+                               hmask <<= hbase - hartid;
+                               hbase = hartid;
+                       }
                }
-               if (!hmask)
+               if (!hmask) {
                        hbase = hartid & -BITS_PER_LONG;
+                       htop = hartid;
+               } else if (hartid > htop) {
+                       htop = hartid;
+               }
                hmask |= 1UL << (hartid - hbase);
        }

@@ -344,7 +355,7 @@ static int __sbi_rfence_v02(int fid, const struct
cpumask *cpu_mask,
                            unsigned long start, unsigned long size,
                            unsigned long arg4, unsigned long arg5)
 {
-       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
+       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
        int result;

        if (!cpu_mask || cpumask_empty(cpu_mask))
@@ -352,16 +363,26 @@ static int __sbi_rfence_v02(int fid, const
struct cpumask *cpu_mask,

        for_each_cpu(cpuid, cpu_mask) {
                hartid = cpuid_to_hartid_map(cpuid);
-               if (hmask &&
-                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
-                       result = __sbi_rfence_v02_call(fid, hmask, hbase,
-                                                      start, size, arg4, arg5);
-                       if (result)
-                               return result;
-                       hmask = 0;
+               if (hmask) {
+                       if (hartid + BITS_PER_LONG <= htop ||
+                           hartid >= hbase + BITS_PER_LONG) {
+                               result = __sbi_rfence_v02_call(fid, hmask,
+                                               hbase, start, size, arg4, arg5);
+                               if (result)
+                                       return result;
+                               hmask = 0;
+                       } else if (hartid < hbase) {
+                               /* shift the mask to fit lower hartid */
+                               hmask <<= hbase - hartid;
+                               hbase = hartid;
+                       }
+               }
+               if (!hmask) {
+                       hbase = hartid;
+                       htop = hartid;
+               } else if (hartid > htop) {
+                       htop = hartid;
                }
-               if (!hmask)
-                       hbase = hartid & -BITS_PER_LONG;
                hmask |= 1UL << (hartid - hbase);
        }

Another simpler solution would be to just round hbase down to a
multiple of 32/64 (gmail-whitespace-damaged diff):

--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -258,16 +258,16 @@ static int __sbi_send_ipi_v02(const struct
cpumask *cpu_mask)

        for_each_cpu(cpuid, cpu_mask) {
                hartid = cpuid_to_hartid_map(cpuid);
-               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
+               if (hmask &&
+                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
                        ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
                                        hmask, hbase, 0, 0, 0, 0);
                        if (ret.error)
                                goto ecall_failed;
                        hmask = 0;
-                       hbase = 0;
                }
                if (!hmask)
-                       hbase = hartid;
+                       hbase = hartid & -BITS_PER_LONG;
                hmask |= 1UL << (hartid - hbase);
        }

@@ -352,16 +352,16 @@ static int __sbi_rfence_v02(int fid, const
struct cpumask *cpu_mask,

        for_each_cpu(cpuid, cpu_mask) {
                hartid = cpuid_to_hartid_map(cpuid);
-               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
+               if (hmask &&
+                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {
                        result = __sbi_rfence_v02_call(fid, hmask, hbase,
                                                       start, size, arg4, arg5);
                        if (result)
                                return result;
                        hmask = 0;
-                       hbase = 0;
                }
                if (!hmask)
-                       hbase = hartid;
+                       hbase = hartid & -BITS_PER_LONG;
                hmask |= 1UL << (hartid - hbase);
        }

But that means multiple SBI calls if you have e.g. hartids 1-64.
The shifted mask solution doesn't suffer from that.
Both solutions don't sort the CPUs, so they are suboptimal in case of
hartid numberings like 0, 64, 1, 65, ...

What do you think?
Thanks!

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
