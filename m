Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BEEC43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:37:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A3220874
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0rUA56Ob";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="hcApZKpW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A3220874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=p7ocgICDpw/qzYYVEorxqqEY1V5koqjg8iql5hjuuYA=; b=0rUA56ObTossYpX+pD86izoKJ
	rpahEdr7/b5cYqL91GHOB8RiYYsS7JJyd2gJ8IJTBSD8jasmmtJ+awbw9akvcMiYyFIe/QUvIXodA
	C28RdkUrDI/kxnz6WuWRbxpc2xIRkzwQJ2HLl/hlLvGBU25garf2JihEN0qwWpLvLaVwdrSh3LaHj
	n6ntQgjOB9nq3QsTT9Xx4AvxMEvYmm4Ic3eC/Hc1J0yB0yMIxr8Ef05Ak1S+fwcEUCln+BeBJPxEe
	5jhXzhFr9lkbijUHo5F2qmJhphWbdrmv4uL1Ccz4UMuJ8dU8MiSJad6mjHZU1y13xu+fteYxkg8OZ
	QUYGY2iJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJUcI-0003Vb-P9; Sat, 19 Sep 2020 04:36:54 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJUcF-0003Up-JC
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 04:36:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id y1so4648931pgk.8
 for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2020 21:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iBAjLo5KQwXh/uUEYAw1PaihuDMcnng1VyJnNmAsWSM=;
 b=hcApZKpWtzBmAA9hZlRbdy4zimcUTVe+n+djFNx3W18TectGMddq4NG8EUyyEElypH
 fUiwmvjafXHutPfM17Sm2swMBHhRvKq+SN1ZvXHz2mXmU1VbV2jUtlwbIqkZFtU/5uWf
 1dPIryNA5vz6tuh0kHbWiBy+4zxmBVfQsIRESiVwyCg/0yMN4wrRVyjRoTjKsIWJbuzB
 qm9XfV8AMygJDUqCMJm/NbYBaipelsf/mbH0dx5s0W3M/grcv5wE4O485IwDk49RwQGI
 faAS/E5gySn5uoT4EKkCWLrOCpx6ooGaHLK5SJgy3jczdn79BQrCRo8FQCA0ZKDxH1Si
 gbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iBAjLo5KQwXh/uUEYAw1PaihuDMcnng1VyJnNmAsWSM=;
 b=I1Vi1h93hGdwW0QwR6PucKWVZzObd87T7XA2dPJM4I0u3kCItYX754I/ZBVhBMi+Fb
 gfmuxLyXR8hcPveW/gFFPMRixCkj+oYIAspstf1AJxkDsWcVIg44n6SOqUAtkRsxFvqo
 cfSj61/2/utaG73hDd5CaXwvlSedDowqb/8AVzx5BDcOSBcf6TX7a8LKUq/yd8CW0W5z
 dYl3+xSFpg709VnOrNVHinPr+s6/N0VmPTo3fCs5bHGEVK0KZOFoZOViCYlUbDmGw8UN
 k/GaNadGY6ktXkLGNtomQ7ZovJKqV2EVF2U1QFP2fWV1bUlnZ/7+/5/+Xrt+iRJ1WwqR
 jn8w==
X-Gm-Message-State: AOAM533ZGX88nTG3JOF7PJT9zhRBjXLonnhdz4a2aPDylq2fUqYGxHj8
 1mh+4l/W5IXNPgb7a5F3DaDsq9D5fuvA+rKk
X-Google-Smtp-Source: ABdhPJwpd4VEE6iZN8arL1rmeVd3nSO0oFxZU9SyosryHOGP+sWe+I+p9VjCZZOqgm37FK8b8X0jbA==
X-Received: by 2002:aa7:9635:0:b029:142:2501:3980 with SMTP id
 r21-20020aa796350000b029014225013980mr18853606pfg.69.1600490205733; 
 Fri, 18 Sep 2020 21:36:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q5sm4995294pfn.109.2020.09.18.21.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 21:36:44 -0700 (PDT)
Date: Fri, 18 Sep 2020 21:36:44 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Sep 2020 21:36:42 PDT (-0700)
Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
In-Reply-To: <DM6PR04MB62013EB500376B0B7EFDFCAB8D3C0@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-79ded15c-f87f-410f-875d-dc8457958f65@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_003651_707471_0F7AD029 
X-CRM114-Status: GOOD (  41.40  )
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
Cc: Christoph Hellwig <hch@infradead.org>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2020 20:32:12 PDT (-0700), Anup Patel wrote:
> 
> 
>> -----Original Message-----
>> From: Palmer Dabbelt <palmerdabbelt@google.com>
>> Sent: 19 September 2020 08:24
>> To: Anup Patel <Anup.Patel@wdc.com>
>> Cc: linux-riscv@lists.infradead.org; hch@infradead.org; kernel-
>> team@android.com; anup@brainfault.org
>> Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
>> M-mode systems
>> 
>> On Mon, 14 Sep 2020 19:11:46 PDT (-0700), Anup Patel wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Palmer Dabbelt <palmerdabbelt@google.com>
>> >> Sent: 14 September 2020 22:27
>> >> To: linux-riscv@lists.infradead.org
>> >> Cc: hch@infradead.org; Anup Patel <Anup.Patel@wdc.com>; Palmer
>> >> Dabbelt <palmerdabbelt@google.com>; kernel-team@android.com
>> >> Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
>> >> M- mode systems
>> >>
>> >> The K210 doesn't implement rdtime in M-mode, and since that's where
>> >> Linux runs in the NOMMU systems that means we can't use rdtime.  The
>> >> K210 is the only system that anyone is currently running NOMMU or
>> >> M-mode on, so here we're just inlining the timer read directly.
>> >>
>> >> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> >> ---
>> >> I don't actually have a K210 so I haven't tested this.  If nobody
>> >> else has the time to I'll put together a QEMU that doesn't support
>> >> rdtime in M-mode, but I've yet to mess around with the !MMU stuff so
>> that might take a little while.
>> >> This certainly doesn't seem worse than what's there right now,
>> >> though, as rdtime isn't valid in M-mode on the K210 (our only M-mode
>> platform).
>> >
>> > I think you missed my comments in the previous email thread.
>> >
>> > I would request to make this patch bit more CLINT independent.
>> >
>> > Please see inline below.
>> >
>> >> ---
>> >>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>> >>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>> >>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>> >>  3 files changed, 70 insertions(+)
>> >>  create mode 100644 arch/riscv/include/asm/clint.h
>> >>
>> >> diff --git a/arch/riscv/include/asm/clint.h
>> >> b/arch/riscv/include/asm/clint.h new file mode 100644 index
>> >> 000000000000..0789fd37b40a
>> >> --- /dev/null
>> >> +++ b/arch/riscv/include/asm/clint.h
>> >> @@ -0,0 +1,26 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0-only */
>> >> +/*
>> >> + * Copyright (C) 2020 Google, Inc
>> >> + */
>> >> +
>> >> +#ifndef _ASM_RISCV_CLINT_H
>> >> +#define _ASM_RISCV_CLINT_H
>> >> +
>> >> +#include <linux/types.h>
>> >> +#include <asm/mmio.h>
>> >> +
>> >> +#ifdef CONFIG_RISCV_M_MODE
>> >> +/*
>> >> + * This lives in the CLINT driver, but is accessed directly by
>> >> +timex.h to avoid
>> >> + * any overhead when accessing the MMIO timer.
>> >> + *
>> >> + * The ISA defines mtime as a 64-bit memory-mapped register that
>> >> +increments at
>> >> + * a constant frequency, but it doesn't define some other
>> >> +constraints we depend
>> >> + * on (most notably ordering constraints, but also some simpler
>> >> +stuff like the
>> >> + * memory layout).  Thus, this is called "clint_time_val" instead of
>> >> +something
>> >> + * like "riscv_mtime", to signify that these non-ISA assumptions must
>> hold.
>> >> + */
>> >> +extern u64 __iomem *clint_time_val;
>> >> +#endif
>> >> +
>> >> +#endif
>> >> diff --git a/arch/riscv/include/asm/timex.h
>> >> b/arch/riscv/include/asm/timex.h index a3fb85d505d4..7f659dda0032
>> >> 100644
>> >> --- a/arch/riscv/include/asm/timex.h
>> >> +++ b/arch/riscv/include/asm/timex.h
>> >> @@ -10,6 +10,31 @@
>> >>
>> >>  typedef unsigned long cycles_t;
>> >
>> > The entire asm/clint.h can be avoided by adding "extern u64 __iomem
>> > *riscv_mmio_time_val;"
>> > here in n asm/timex.h
>> >
>> > Also, this will make it bit more CLINT independent.
>> 
>> Except that, as per the comments, it's not CLINT independent.
> 
> We just need some 64bit MMIO register. It could be CLINT TIME register
> or some other timer. I don't see anything CLINT specific apart from the
> variable name "clint_time_val".

No, clint_time_val has other constraints.  The comment I added to describe
these after you asked the first time is only a few lines above this:

    +#ifdef CONFIG_RISCV_M_MODE
    +/*
    + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
    + * any overhead when accessing the MMIO timer.
    + *
    + * The ISA defines mtime as a 64-bit memory-mapped register that increments at
    + * a constant frequency, but it doesn't define some other constraints we depend
    + * on (most notably ordering constraints, but also some simpler stuff like the
    + * memory layout).  Thus, this is called "clint_time_val" instead of something
    + * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
    + */
    +extern u64 __iomem *clint_time_val;
    +#endif

To be more detailed, there's two issues:

* The ISA doesn't define a memory layout.  This one is a bit pedantic, as
  there's an example of how to use the mtime/mtimeh split that would only work
  for this layout, but those sorts of things tend to be non-canonical in the ISA
  manual.
* The ISA doesn't define any ordering constraints on mtime.  This one is way
  more important, as right now we have a big pile of implicit ordering
  constraints on IO regions that are required to make systems actually work.
  IIUC the argument right now is that we're just relying on the various device
  specifications to provide these (ie, if you have PCI then you better respect
  their memory ordering consraints for your system), but I'm not sure that's as
  strong of a position as we should be taking.

  RISC-V defines no orderings, however, for mtime.  IIRC there are some
  implicit orderings on rdtime that we depend on (though I can't dig the text out
  of the ISA tonight) but those aren't guaranteed by the ISA for mtime.  This all
  works on SiFive's systems because the CLINT provides these guarntees, but
  that's not generally the case for mtime as defined by RISC-V.

  Since mtime is a RISC-V specific thing we can't rely on some other
  specification like we do for other devices.  We could, of course, fence
  around this but that's likely to be way more expensive than the predictable
  indirection that was called out as being too slow in the first place.

So this really is a CLINT-specific register.  That all seems a bit too much for
the commit text, though, so I'm inclined to leave it as is.

> 
> Regards,
> Anup
> 
>> 
>> >> +#ifdef CONFIG_RISCV_M_MODE
>> >> +
>> >> +#include <asm/clint.h>
>> >> +
>> >> +#ifdef CONFIG_64BIT
>> >> +static inline cycles_t get_cycles(void) {
>> >> +	return readq_relaxed(clint_time_val); } #else /* !CONFIG_64BIT */
>> >> +static inline u32 get_cycles(void) {
>> >> +	return readl_relaxed(((u32 *)clint_time_val)); } #define get_cycles
>> >> +get_cycles
>> >> +
>> >> +static inline u32 get_cycles_hi(void) {
>> >> +	return readl_relaxed(((u32 *)clint_time_val) + 1); } #define
>> >> +get_cycles_hi get_cycles_hi #endif /* CONFIG_64BIT */
>> >
>> > Use riscv_mmio_time_val instead of clint_time_val above.
>> >
>> >> +
>> >> +#else /* CONFIG_RISCV_M_MODE */
>> >> +
>> >>  static inline cycles_t get_cycles(void)  {
>> >>  	return csr_read(CSR_TIME);
>> >> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)  }  #endif /*
>> >> CONFIG_64BIT */
>> >>
>> >> +#endif /* !CONFIG_RISCV_M_MODE */
>> >> +
>> >>  #define ARCH_HAS_READ_CURRENT_TIMER
>> >>  static inline int read_current_timer(unsigned long *timer_val)  {
>> >> diff --git a/drivers/clocksource/timer-clint.c
>> >> b/drivers/clocksource/timer-clint.c
>> >> index 8eeafa82c03d..d17367dee02c 100644
>> >> --- a/drivers/clocksource/timer-clint.c
>> >> +++ b/drivers/clocksource/timer-clint.c
>> >> @@ -19,6 +19,11 @@
>> >>  #include <linux/interrupt.h>
>> >>  #include <linux/of_irq.h>
>> >>  #include <linux/smp.h>
>> >> +#include <linux/timex.h>
>> >> +
>> >> +#ifndef CONFIG_RISCV_M_MODE
>> >> +#include <asm/clint.h>
>> >> +#endif
>> >
>> > As-per, above suggestion drop this #include.
>> >
>> >>
>> >>  #define CLINT_IPI_OFF		0
>> >>  #define CLINT_TIMER_CMP_OFF	0x4000
>> >> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;  static
>> >> unsigned long clint_timer_freq;  static unsigned int clint_timer_irq;
>> >>
>> >> +#ifdef CONFIG_RISCV_M_MODE
>> >> +u64 __iomem *clint_time_val;
>> >> +#endif
>> >
>> > Define and export "u64 __iomem *riscv_mmio_time_val" in
>> > arch/riscv/kernel/time.c
>> >
>> > This way no "clint_time_val" definition required here as well and
>> > other MMIO timers can also set riscv_mmio_time_val.
>> >
>> >> +
>> >>  static void clint_send_ipi(const struct cpumask *target)  {
>> >>  	unsigned int cpu;
>> >> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct
>> >> device_node *np)
>> >>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>> >>  	clint_timer_freq = riscv_timebase;
>> >>
>> >> +#ifdef CONFIG_RISCV_M_MODE
>> >> +	/*
>> >> +	 * Yes, that's an odd naming scheme.  time_val is public, but
>> >> hopefully
>> >> +	 * will die in favor of something cleaner.
>> >> +	 */
>> >> +	clint_time_val = clint_timer_val;
>> >> +#endif
>> >> +
>> >
>> > Just set " riscv_mmio_time_val = clint_timer_val" here.
>> >
>> >>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>> >>
>> >>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>> >> --
>> >> 2.28.0.618.gf4bc123cb7-goog
>> >
>> > Regards,
>> > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
