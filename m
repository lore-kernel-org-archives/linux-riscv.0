Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E2AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 04:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VtNu4QWUhU6sOHz7LCOeFldq0GQ0CuysydonIBtMOQA=; b=JJ1
	c1ZTjEWoVQ7GQfXB4zSiCiDoIWKdCd3SKWdi1SJrGxg2EuiJL20dWlEKrAza0DcQOd1AeFHJtoGNC
	HmM04+7I2pwwFgxEWDx+IKEYHt2DakhVitYQnYvb5Q0LJe7PhEFYCeVRf61qJHvz2ndDUg3cEu9tt
	9UB7CTthdczQug1uZ95s9Z0x/3U0eGlOpVdF1aVe9JqSmsHix+Kco93SwJ1N/u/qYiuv6kC1RQiH6
	nty0H0zJRVpqbTdRBcE2b6GXX8z6A44Pd3dQpLlVw6DdQOEzr+yyFMjmw3GsVPEQCkBY9e1OCD3Kp
	828xOcjB+YMeYjXEzvF2Kc9YscKD8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8YJd-009t7G-04;
	Thu, 30 Nov 2023 04:06:17 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WOi-009ixr-2H
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 02:03:26 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7b3b819f8a3so9212739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701309802; x=1701914602; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CMHvFiMROSG+UECf9EDgEvz9utpLKQRQIUCySBf/XdM=;
        b=ensCd9bQ45y5d7Beef16Y7VFi9jaY8xFnmuwO4Oi8rIz+MsP8za14aHISzi3kiEWOx
         tbOWDUb52wlmmuTEBGp2sONagrYI7iPvPc3KIi5BT1Rqb7mO2vJMT8OJfOeeFu3gElTW
         hOmd6OOCq8K2o++iS50URLPAM1iEL62o58kA+qYeUZFs0Z9SZG5xCdH2r+fqbYzeNptx
         v8ueiA1ezzDfLINLyh+i1RVpiyaOI5MmTj0cEM1fDf9E+loNnM78KcmLyt8sFmoctipK
         qyJdRAxaK79jg18m0qV2UKi1aqPW8iJeBn0Mn5QauozIq9uqIsWkM6+NUUB8PyvKTwKj
         d1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701309802; x=1701914602;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMHvFiMROSG+UECf9EDgEvz9utpLKQRQIUCySBf/XdM=;
        b=bErLeh/m/e2RNw/lviQRw1oGba1o2w9op2nxBBdWLFiTeGce3aFogbj52AXhhVKKnu
         wt8p4fCJ4W1zACBI/1skOSfr0dHceAnoyVFN3i6v9iIBpWJQaGIjhxz2QFd2mNVPBV3r
         Gf+qchq3OPuHRI5727TZeUHcU+bw2pemQKW30xM3XtOLxfUtFUM4JsyXcsXWyUzQJT3Z
         AzT8rcrPC/vILKcHWwaWoXMkIBFoASnWi0zr31y77ed2+acLjDJg+ulJGgVTOFr+nMlO
         6tUX0uMdX9mrYaBVJV0uo/6BYWBHwX/bdiAPWjA4vcMTkvhPHz5017bMWRHWoxEVnpC4
         CoBw==
X-Gm-Message-State: AOJu0YzP2HE45bIeXUwSoLLw5WKxVUYntCO4aU5zIocI43SM84QnWhwl
	r1N2+Y0+eeAq+2M1IL1uoSoKEIauw52EHY7m+vBVHw==
X-Google-Smtp-Source: AGHT+IGHdHZ22CvUdt56tBi04dJ6xajGniHBuy2DMTqBS9U2zF1Nunoe8hZn2GjICroWye5/VnxpTjVuzljCoi9q3MM=
X-Received: by 2002:a05:6602:2285:b0:79f:dbec:ac4d with SMTP id
 d5-20020a056602228500b0079fdbecac4dmr21483885iod.19.1701309802205; Wed, 29
 Nov 2023 18:03:22 -0800 (PST)
MIME-Version: 1.0
From: Zong Li <zong.li@sifive.com>
Date: Thu, 30 Nov 2023 10:03:11 +0800
Message-ID: <CANXhq0rm0eTX8Ze8KdB-jqrw6Q3WC-jepqOCaZKgkSEKnQ-OFg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Invalid instruction cache after copy the xol area
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_180324_773714_353EF73F 
X-CRM114-Status: GOOD (  30.79  )
X-Mailman-Approved-At: Wed, 29 Nov 2023 20:06:15 -0800
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

> On Wed, 18 May 2022 01:17:53 PDT (-0700), po-kai.chi@sifive.com wrote:
> > We need to invalid the relevant instruction cache after
> > copying the xol area, to ensure the changes takes effect.
> >
> > Signed-off-by: Po-Kai Chi <po-kai.chi@sifive.com>
> > ---
> >  arch/riscv/kernel/probes/uprobes.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> > index 7a057b5f0adc..9d52beeac73c 100644
> > --- a/arch/riscv/kernel/probes/uprobes.c
> > +++ b/arch/riscv/kernel/probes/uprobes.c
> > @@ -165,6 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
> >       /* Initialize the slot */
> >       void *kaddr = kmap_atomic(page);
> >       void *dst = kaddr + (vaddr & ~PAGE_MASK);
> > +     unsigned long addr = (unsigned long)dst;
> >
> >       memcpy(dst, src, len);
> >
> > @@ -177,10 +178,9 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
> >       kunmap_atomic(kaddr);
> >
> >       /*
> > -      * We probably need flush_icache_user_page() but it needs vma.
> > -      * This should work on most of architectures by default. If
> > -      * architecture needs to do something different it can define
> > -      * its own version of the function.
> > +      * Flush both I/D cache to ensure instruction modification
> > +      * takes effect.
> >        */
> >       flush_dcache_page(page);
> > +     flush_icache_range(addr, addr + len);
> >  }
>
> This brings up a handful of issues:
>
> * This always inserts a 32-bit breakpoint, but that's not quite correct.
>   This should really be checking the _next_ instruction as well to
>   insert a 16-bit breakpoint if it's a 16-bit instruction as otherwise
>   userspace might jump into the middle of the breakpoint.
> * These instructions can be concurrently executing, which relies on some
>   instruction fetch ordering that's very lightly specified.  We don't
>   rely on that elsewhere (see stop_machine() in kprobes), but we
>   probably should.  It's probably worth adding something to probe the HW
>   to make sure this is supported.
> * Adding the icache flush defeats a uprobes advantage in that we'll now
>   be triggering remote execution (to do the remote fence.i).  One option
>   could be to defer the fence and wait on it, but not sure if that's
>   sane and it'd likely require a lot of
>
> This also leaves a bit undefined WRT icache aliasing, at least in terms
> of the API used.  IMO it'd be
>
>     diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
>     index 9d52beeac73c..c857346864fc 100644
>     --- a/arch/riscv/kernel/probes/uprobes.c
>     +++ b/arch/riscv/kernel/probes/uprobes.c
>     @@ -165,7 +165,6 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>         /* Initialize the slot */
>         void *kaddr = kmap_atomic(page);
>         void *dst = kaddr + (vaddr & ~PAGE_MASK);
>     -   unsigned long addr = (unsigned long)dst;
>
>         memcpy(dst, src, len);
>
>     @@ -179,8 +178,10 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>
>         /*
>          * Flush both I/D cache to ensure instruction modification
>     -    * takes effect.
>     +    * takes effect.  We don't need to flush the whole icache, but that's
>     +    * all RISC-V defines so rather than worry about aliasing this just
>     +    * flushes everything.
>          */
>         flush_dcache_page(page);
>     -   flush_icache_range(addr, addr + len);
>     +   flush_icache_all();
>      }
>
> which will end up doing the same thing but avoids the ambiguity.  I went
> ahead and put this at palmer/riscv-uprobe_fencei with that and some
> other minor things fixed up, LMK if that looks OK and I'll take it on
> fixes.
>

Hi Palmer,
Could I know if you have plans to include this fix in the upcoming RC
versions? Thanks

> Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
