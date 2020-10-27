Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9DFC4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 18:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD17120780
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 18:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ov4tPdsM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="AsmYr51y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD17120780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fEeb1mCOYQAsJKZ9/OCGkp84OOsx5nyKHV28EgF7OOo=; b=ov4tPdsM+I2xFOYMzcFb2QmXP
	et7/B4RmRjKpgeAkaKPv8YUkmQAvcJ/wPTHwW/suMd4FpBJVYiYFB2N5GjP+g3ras/i+aBkmvI6yw
	P1VvjhBoYEjRn3Dm/9kUCtScBmLV7rtr1KrPzG7irsFd8q5v06eRcxI8UmNt3vN9n8YWi4+SzwUsc
	W35wzjRLvoxP+SDMSWjvpxV+Hf8C8RYXSBUvldwzxegjD8fmKxzoy3FInCeA2Vevke1/UiINde+Fk
	OBmMw7ntiTeQFsAdbSvAsCKmJwezHQpU1/E40xtLb8EaudiKClPSeDFjMj0OQBLuGK45CjDvf+1Zv
	AZ1VaLGVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXTrS-0005ZK-MP; Tue, 27 Oct 2020 18:38:22 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXTrQ-0005XD-41
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 18:38:21 +0000
Received: by mail-io1-xd41.google.com with SMTP id y20so2654348iod.5
 for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2020 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCeV65unwsLYxOzTOB3BRBkP8Z2XdKf6EfIzJhCT1+U=;
 b=AsmYr51yPBIwfMHIO8petPXL7JfYJ/VpHAqJUCOiePh7YLDW9yeflIYyEePpVi6D8L
 DUoEnKk8yKtjNmtua8cbgA0D5i5EJ8+XkMq33W/koUqI2J32mtfcXE0UInxQnmPz9h85
 mL+A+mDokZlYLofHxoj5QVBcdu858LsuKYaAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCeV65unwsLYxOzTOB3BRBkP8Z2XdKf6EfIzJhCT1+U=;
 b=GaMN4GqQJanzyGKCUcmM9Nr9S9eQjFAIcVAR4VODtHD367X7Vju4UnJ9VdR+XwOYXZ
 lrQcU5HNUuqPNA6LtjwqCo8GckOO4m/kkLnsN+bS3a848eTGmbHMNhoKgbWIHU3ZMk4l
 96h+E4AJHodunAH9AkR+p/OsToeeHaXPOU9GC7uELttXcdMbY0GOIO6OgaGtYyq1hhXE
 jH+Fv0vuD6WCCGUCeRbp8SBeyUBl/FYq2L7M4Y19vQEHRjKFOssbz0sbZK/f6TmUd8jj
 jpnSvhceolbUZq7DMXN8aWCaz11Vg17s+t0kpvIegcBGmButdc1N6B4Sz5xmifPc+tgR
 F1BA==
X-Gm-Message-State: AOAM531Ei+P7mB4gyQYm9NVsLLWtIcLg8LTCr6bw6W/V0U83fExHZtzt
 8j0Z7lHv5wFetf4TS4VXUO1itifxg1Eedf7U49rBh0sz2BNz
X-Google-Smtp-Source: ABdhPJzYNAKvjSpI/al4RHJT8K76IJtKOIqYle65oB1uWQwnl9Os1FT4XM7ZLKVnKT5CDKCl7DBXldaCSvKzwlTUvwE=
X-Received: by 2002:a05:6638:f81:: with SMTP id
 h1mr3813165jal.115.1603823896557; 
 Tue, 27 Oct 2020 11:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-4-atish.patra@wdc.com>
 <20201027100040.GK1154158@kernel.org>
In-Reply-To: <20201027100040.GK1154158@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 27 Oct 2020 11:38:03 -0700
Message-ID: <CAOnJCU+KS+0OtKLwURx-y=NAZZ9QWPk7Kg5pkB5fp1bG8pO9EA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] RISC-V: Enforce protections for kernel sections
 early
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_143820_273122_AAFCCAF7 
X-CRM114-Status: GOOD (  24.29  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 3:01 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 04:02:51PM -0700, Atish Patra wrote:
> > Currently, all memblocks are mapped with PAGE_KERNEL_EXEC and the strict
> > permissions are only enforced after /init starts. This leaves the kernel
> > vulnerable from possible buggy built-in modules.
> >
> > Apply permissions to individual sections as early as possible.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/include/asm/set_memory.h |  2 ++
> >  arch/riscv/kernel/setup.c           |  2 ++
> >  arch/riscv/mm/init.c                | 11 +++++++++--
> >  3 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> > index 4c5bae7ca01c..4cc3a4e2afd3 100644
> > --- a/arch/riscv/include/asm/set_memory.h
> > +++ b/arch/riscv/include/asm/set_memory.h
> > @@ -15,11 +15,13 @@ int set_memory_ro(unsigned long addr, int numpages);
> >  int set_memory_rw(unsigned long addr, int numpages);
> >  int set_memory_x(unsigned long addr, int numpages);
> >  int set_memory_nx(unsigned long addr, int numpages);
> > +void protect_kernel_text_data(void);
> >  #else
> >  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> > +static inline void protect_kernel_text_data(void) {};
> >  #endif
> >
> >  int set_direct_map_invalid_noflush(struct page *page);
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 7d6a04ae3929..b722c5bf892c 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -22,6 +22,7 @@
> >  #include <asm/cpu_ops.h>
> >  #include <asm/early_ioremap.h>
> >  #include <asm/setup.h>
> > +#include <asm/set_memory.h>
> >  #include <asm/sections.h>
> >  #include <asm/sbi.h>
> >  #include <asm/tlbflush.h>
> > @@ -92,6 +93,7 @@ void __init setup_arch(char **cmdline_p)
> >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> >       sbi_init();
> >  #endif
> > +     protect_kernel_text_data();
> >  #ifdef CONFIG_SWIOTLB
> >       swiotlb_init(1);
> >  #endif
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index ea933b789a88..5f196f8158d4 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -608,7 +608,7 @@ static inline void setup_vm_final(void)
> >  #endif /* CONFIG_MMU */
> >
> >  #ifdef CONFIG_STRICT_KERNEL_RWX
> > -void mark_rodata_ro(void)
> > +void protect_kernel_text_data(void)
> >  {
> >       unsigned long text_start = (unsigned long)_text;
> >       unsigned long text_end = (unsigned long)_etext;
> > @@ -617,9 +617,16 @@ void mark_rodata_ro(void)
> >       unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> >
>
> A comment about that rodata permissions are set later would be nice
> here.
>

Sure. I will add that.

> >       set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
> > -     set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> >       set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> >       set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> > +}
> > +
> > +void mark_rodata_ro(void)
> > +{
> > +     unsigned long rodata_start = (unsigned long)__start_rodata;
> > +     unsigned long data_start = (unsigned long)_data;
> > +
> > +     set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> >
> >       debug_checkwx();
> >  }
> > --
> > 2.25.1
> >
>
> --
> Sincerely yours,
> Mike.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
