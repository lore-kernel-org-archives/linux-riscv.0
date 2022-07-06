Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE461C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XReOa4wbaoKuiPiWTsG/jhRhcZFRNBcmOIOzht32ojQ=; b=HCeU5jznm3DEy9
	SvoB61kOJpSfiUQwtrf+T9m1JEuHGzzXZ1hnzb/0aJhs3XS1lh4ob/rRsup16AgCFYVH838m2OjJh
	G8vUVtGis/D4o1NTzEjLpNxh0v5/kebMheeripHxoLqLB6UDKC4sCIcdBB27/kO6O48wHx6Oy6rja
	3+7E/DWfysdlHtsjEjeUfUYz5a5JAAY/7FYhMXcfQAG8uMOJTGBXuvZ2gYzxssjKgpRSh0sBYT1F6
	kEWEauQRbKYXiSNMkCc/E7Bwvk5LlX1fk6wfsYEgUt3nhvHEJljkztu9gP8OjHIhJR/muo9Qb6z/e
	OR1b8jvZaXN4WPEjl56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zTJ-0076ah-Ty; Wed, 06 Jul 2022 07:29:17 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zTG-0076Yc-Q7
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:29:16 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 64so16635049ybt.12
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EnTYqjrjBR+7+2kKZfXHsxrb/Kk0mP3AD0EQkfCVCJw=;
        b=OZXgpXMIrfSJeVcKc+v378sVaKdo6cBWNkRKzs5WG5mwMa/IKUTJ7HhYu7WsSYp9NW
         mL17ZhRvsUwbQTnvEY1CbMM3Cu7bZdn0Etixxqy7jGNDCwHm3YKyGIhOwSTwkd7YbR5C
         Pd6PcbDmg4WoTh4qJqrl8ic1mplNRWKc9QClS5UGfu1ODSS0WMcBeFREMJ/Gxy4j2rGO
         FikTdxxmYTDIbz3+LaVQM3zVxzHlMuy8tkwmosYumaeYtJcdlDIYCZijhl9Dhs7r4a2r
         kNgilrzI7akS94o+dvs/KKoxej8K1lNQnHn3d4ZqohaRGd3/c+IObX3ar5K3txUX27o1
         0Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnTYqjrjBR+7+2kKZfXHsxrb/Kk0mP3AD0EQkfCVCJw=;
        b=FFTF+CKMPVPAKsUQ7FhG8nXLSCYmjKjy70zm7MFozL3+b0432QrSVZIVsYmzvl2f/p
         BDXZAskQTF1eTQG7voCUDlxYm0HY9z4PXa7LywuFoS/S6UgVnyipQFrRuLBvzd6fL0hO
         cvHo2HM9JFSGBbAd8hHU5hMPZgCiybTRa/dhNZHqgTzpnN+aXuu2SEeE0hnCLdyNKSU6
         RX8ExT1rnseK8q6lLDsepv5YkoCMvX233NfvmQElhIaaB8MRS70vU6F6e8UoRWz/XjL5
         S4TPua734WO65sZ+qiloNv3maAbtwBAl6nPApnpS2enCnMjo85AarlT0sVWFrvshTM4M
         cRdw==
X-Gm-Message-State: AJIora89nV8Jr1jLxOqNl6iBEaMfV7dpsK5Oz4ciNeS3PB7KOoFw5ZPH
	lxHIkpJ/85u+8rHdCglBx+J9KXNAejX7b5w6LvBsSw==
X-Google-Smtp-Source: AGRyM1u7ReDfgvySBbkzI7c9Zdpyuc4u+9JbhW9Gjcsd9qOl9Td8Y+UaebC6ukmQwplXBmWYRcEjb+Eoogh2XqDsBPc=
X-Received: by 2002:a25:6913:0:b0:66e:3700:4235 with SMTP id
 e19-20020a256913000000b0066e37004235mr18618348ybc.240.1657092552492; Wed, 06
 Jul 2022 00:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220518081753.29589-1-po-kai.chi@sifive.com> <mhng-296c3110-5e5d-48a4-bd41-1d46bf7987cd@palmer-ri-x1c9>
In-Reply-To: <mhng-296c3110-5e5d-48a4-bd41-1d46bf7987cd@palmer-ri-x1c9>
From: Po-Kai Chi <po-kai.chi@sifive.com>
Date: Wed, 6 Jul 2022 15:28:37 +0800
Message-ID: <CABZ18H++ETn08TrDLL5YRsrr2z7rQfdxsjUudVFG=yB_KPg+Dw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Invalid instruction cache after copy the xol area
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_002914_902803_C6B2C640 
X-CRM114-Status: GOOD (  32.82  )
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

Hello Palmer,

Replacing flush_icache_range() with flush_icache_all() looks good to me.
And I think this is the necessary evil because we don't know whether
hardware is performing speculative access to the XOL area or not.


On Fri, Jun 17, 2022 at 6:04 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
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
> Thanks!



-- 
BR,
Po-Kai Chi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
