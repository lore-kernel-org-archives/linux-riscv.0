Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6706C2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 03:13:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6245361432
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6245361432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03it8NVPP/BV66uQEY6nIMSWnDCX7ksPKnnmyNlaXaE=; b=uLKOPdNSDFmyue
	nAqHfN1AYBTwEFBxkEOZrgG1QcMEq4emeWHdsjn7oq0g/yNcG6OtWpihh0V4nx9qi4euFtUEKwpeh
	PoL+KUed2OTyZMeP5X1uM4j44oFn2ylPDXdxp8bnqveiFNHUmDbcRWPdtVeNEoSloknSrT1hjCr4P
	PsK111gg93sT39FnAfg1QcmBDHoOKS8Xef3mRbxBdnqcKcYLdivblXRE8U6tI0Vw5Dm58lM28bFxC
	tVx7BYKmrigMKU/81k2ZBtD/R9FQk9B2LdWG0XCKo2VLAb9bxf3WBnXzUfdqkVjJsjAp6BK3FDY+0
	OH4q2yxyJf7O+6BCliGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljyZ-00ASsU-Hb; Wed, 26 May 2021 03:12:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljyX-00ASr3-GS
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 03:12:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18EEC61436
 for <linux-riscv@lists.infradead.org>; Wed, 26 May 2021 03:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621998773;
 bh=MXpvYaTxrBbMYL5TsCq9ZgmO4Fjlx82C4mGQi4aVHMQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RDS16tZOAnUn3k9cCdeS2YltDG71HjGjF6DshnjdQerRxKvMbluLiTGgeKMxti/HG
 7aKfQDnvbRY3cSrRZK+yXr6iuD8WR5/SRnfFqMSe44afXIsBS2Z1t6xEXTYCDPBATs
 E87XsLrS8I6B0/n3jVVRThZrNOUSRVY3D/qk2yfygT2s7KZpyKz9VDAKsBZTLZ7Aoo
 +3xGTx54NhFKpj3TJdNXy3znpnsv8gv6jYMUh+Owo7BDQfeHqo1LpBAgKoCTvfddYy
 6EhEnBQaMhzLO5EfCyV9KgzVCtYPjHNWJ1lPNjwbaVRqJUAXpbjwkTLUbJd303vhgd
 V5ksjA8Rh0m6g==
Received: by mail-lf1-f47.google.com with SMTP id q3so308603lfu.2
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 20:12:53 -0700 (PDT)
X-Gm-Message-State: AOAM530BjPdWtYgQvtAwQ7YCDAcoSaAdOPGCwlcQTzlKQ6Bz4YuS6I4c
 4Xu6ih4HaanLfqUxJvwEYejqDt/obtFnVwncJlA=
X-Google-Smtp-Source: ABdhPJxKd0AZEQrvaUMDv5kZQPzNDqbPCo1Mhq9I+ttONfouWDsr+H6nCx4ue2MWBb0o0jMYAc3c4zelSHKaO+tByNU=
X-Received: by 2002:a19:c49:: with SMTP id 70mr579450lfm.555.1621998771385;
 Tue, 25 May 2021 20:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
 <1621945447-38820-3-git-send-email-guoren@kernel.org>
 <20210525123556.GB4842@lst.de>
In-Reply-To: <20210525123556.GB4842@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 26 May 2021 11:12:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSa3LJKTRBv6NOvg0HtoKPL-5YyP6wY2=AJhQtAZwBBzg@mail.gmail.com>
Message-ID: <CAJF2gTSa3LJKTRBv6NOvg0HtoKPL-5YyP6wY2=AJhQtAZwBBzg@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] riscv: Use use_asid_allocator flush TLB
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_201253_619140_8AF6132E 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, May 25, 2021 at 8:35 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, May 25, 2021 at 12:24:07PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Use static_branch_unlikely(&use_asid_allocator) to keep the origin
> > tlb flush style, so it's no effect on the existing machine. Here
> > are the optimized functions:
> >  - flush_tlb_mm
> >  - flush_tlb_page
> >  - flush_tlb_range
> >
> > All above are based on the below new implement functions:
> >  - __sbi_tlb_flush_range_asid
> >  - local_flush_tlb_range_asid
>
>
> This mentiones what functions you're changing, but not what the
> substantial change is, and more importantly why you change it.
>
> > +static inline void local_flush_tlb_range_asid(unsigned long start, unsigned long size,
> > +                                           unsigned long asid)
>
> Crazy long line.  Should be:
>
> static inline void local_flush_tlb_range_asid(unsigned long start,
>                 unsigned long size, unsigned long asid)
>
> > +{
> > +     unsigned long tmp = start & PAGE_MASK;
> > +     unsigned long end = ALIGN(start + size, PAGE_SIZE);
> > +
> > +     if (size == -1) {
> > +             __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> > +             return;
>
> Please split the global (size == -1) case into separate helpers.
Do you mean:
        if (size == -1) {
                __asm__ __volatile__ ("sfence.vma x0, %0"
                                :
                                : "r" (asid)
                                : "memory");
        } else {
                for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE) {
                        __asm__ __volatile__ ("sfence.vma %0, %1"
                                        :
                                        : "r" (tmp), "r" (asid)
                                        : "memory");
                        tmp += PAGE_SIZE;
                }
        }

>
> > +     while(tmp < end) {
>
> Missing whitespace befre the (.
>
> Also I think this would read nicer as:
>
>         for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE)
>
> > +static void __sbi_tlb_flush_range_asid(struct cpumask *cmask, unsigned long start,
> > +                                    unsigned long size, unsigned long asid)
>
> Another overly long line.
>
> Also for all thee __sbi_* functions, why the __ prefix?
I just follow the previous coding convention by __sbi_tlb_flush_range.
If you don't like it, I think it should be another coding convention
patchset.
This patchset is only to add the functions of tlb_flush_with_asid.

>
> > +     if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
> > +             local_flush_tlb_range_asid(start, size, asid);
> > +     } else {
> > +             riscv_cpuid_to_hartid_mask(cmask, &hmask);
> > +             sbi_remote_sfence_vma_asid(cpumask_bits(&hmask), start, size, asid);
>
> Another long line (and a few more later).



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
