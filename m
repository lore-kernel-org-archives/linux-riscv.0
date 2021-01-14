Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504E8C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A135C23436
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A135C23436
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9FJ3rn+pSidT/gbEdFrIGMV709jxaQNE8UcXb6FZoR0=; b=H9or0Fdsfe5L4RHJmHHgp5wg1
	/Kpt4o845AYEKWT2fUplk3g8bY3RD1ZTzU6HQYxbPlx6GqJKzXZKEbsa9+z/A0vtKBBk3nEf1IUqR
	9ceh0ksHMiHBJEUkfzX+05ujN+O3A5tqSVPF0SUY1sTXJ/N9Qlx+CC5p5MQaEFXZIHyaSFUr0HLUZ
	AWzmWNr/R15sIzlmTgM8CIPDpCnJ1uKKOTgvKwKfnGt+usutioUJlKvkDt2ogMMKn0U4xOhVEJN60
	QaZmlyIdt1SupPZI9U/Mq8sipTa3/3GPr+JCEIDcPJIhrFrMRvDDE5YGorP4irDrTf1hQoE9qeREw
	clPQAyGkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l09tx-0003hH-8q; Thu, 14 Jan 2021 21:11:29 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l09tv-0003gm-AP
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 21:11:28 +0000
Received: by mail-io1-xd35.google.com with SMTP id q2so12441774iow.13
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 13:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M8WYmU1OYy2bAwdAfp39SgsoayoGxiD9AS0X3mtcrDU=;
 b=e3m26mYJjCGBBdtqDDHsBYwE7TbY6swQ2IwrVvIrw742/+Pc51y1VHryFH/8mkKHa3
 r0i9z+Qm5krgPVFtetMDbxdLKAgZgAQoESA5W5DExpgIUL2QvmbPeIiM86+4GQKkW0vw
 cfF8R78HLM3uNjYI6HetbcovnaWzijtUJzZ/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8WYmU1OYy2bAwdAfp39SgsoayoGxiD9AS0X3mtcrDU=;
 b=lw42f3zyjWD1xvbFzClJ8pW2AzEk8UA1hsSmBHRorNoHJ+vSsWsvWbbgvVcqLNRCvj
 ZB8+zpf3QTYP8nBCO8ctfSmlGuLzwrW1lNZJlqrSnfrmbSVCqXkbBIQxNGcGKju8suEz
 hMZYWiP+hV2wRaxZdmKWVuDVE2tPME966bia3HQFQWDcl9BFai+XAJ+QbFrwP1B33qe5
 F1FiEEqXk3gq5nlt9XhFCqb/k8j7UcjGb/J89EVvNVl6tAMkos7ifV/IylmPQuuqSBPu
 nxZKIIsD0kHLaHHADKSok5CZB5j6bEhF2oOSiKHSHNLewvc9ADnrH+Gwm0ltHKODfGin
 bkog==
X-Gm-Message-State: AOAM5305mHb5cGYVBAF6atc97wQKKy7NPSmlkG2BCmTz1DWLOEFj5NBc
 ViF2dXS73jHDoUN5J6RL0QWEi0fHkbmIpHUm+cLk
X-Google-Smtp-Source: ABdhPJyRJhPjAGjwKf+7QRz7LzAj+ARJ1RCho5T78E0d2vC821Cj5/V5y/gXoeFDnOHUkU3yGgT1ZaZOqJBkk2z3zhs=
X-Received: by 2002:a05:6638:13c6:: with SMTP id
 i6mr6096314jaj.141.1610658685204; 
 Thu, 14 Jan 2021 13:11:25 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
 <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
In-Reply-To: <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 14 Jan 2021 13:11:14 -0800
Message-ID: <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_161127_485658_C82FF074 
X-CRM114-Status: GOOD (  36.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> >> >
> >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> > ---
> >> >  arch/riscv/include/asm/cache.h | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >> >
> >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> >> > index 9b58b104559e..c9c669ea2fe6 100644
> >> > --- a/arch/riscv/include/asm/cache.h
> >> > +++ b/arch/riscv/include/asm/cache.h
> >> > @@ -7,7 +7,11 @@
> >> >  #ifndef _ASM_RISCV_CACHE_H
> >> >  #define _ASM_RISCV_CACHE_H
> >> >
> >> > +#ifdef CONFIG_64BIT
> >> >  #define L1_CACHE_SHIFT               6
> >> > +#else
> >> > +#define L1_CACHE_SHIFT               5
> >> > +#endif
> >> >
> >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> >>
> >> Should we not instead just
> >>
> >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
> >>
> >> like a handful of architectures do?
> >>
> >
> > The generic code already defines it that way in include/linux/cache.h
> >
> >> The cache size is sort of fake here, as we don't have any non-coherent
> >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> >> cache lines in RISC-V implementations as software may assume that for
> >> performance reasons.  Not really a strong reason, but I'd prefer to just make
> >> these match.
> >>
> >
> > If it is documented somewhere in the kernel, we should update that. I
> > think SMP_CACHE_BYTES being 64
> > actually degrades the performance as there will be a fragmented memory
> > blocks with 32 bit bytes gap wherever
> > SMP_CACHE_BYTES is used as an alignment requirement.
>
> I don't buy that: if you're trying to align to the cache size then the gaps are
> the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
> there's really no reason for these to be different between the base ISAs.
>

Got your point. I noticed this when fixing the resource tree issue
where the SMP_CACHE_BYTES
alignment was not intentional but causing the issue. The real issue
was solved via another patch in this series though.

Just to clarify, if the allocation function intends to allocate
consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
This will lead to a #ifdef macro in the code.

> > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> > without this patch.
> > I didn't see anything in Qemu though.
>
> Something like that is probably only going to show up on real hardware, QEMU
> doesn't really do anything with the cache line size.  That said, as there's
> nothing in our kernel now related to non-coherent memory there really should
> only be performance issue (at least until we have non-coherent systems).
>
> I'd bet that the change is just masking some other bug, either in the software
> or the hardware.  I'd prefer to root cause this rather than just working around
> it, as it'll probably come back later and in a more difficult way to find.
>

Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
you were saying ?
We may need to change an alignment requirement to 32 for RV32 manually
at some place in code.

> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
