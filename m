Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1355BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGfm84UeR+kobqYrSdOPtv8qkYoZ67YjYEkuKpGmOeA=; b=XJcyMIFuzBa2eA
	ZV/JC9U12FTft37kYPp+Nu1zdGisRmWGIIRWYdVOCHpWPBNejL6GIRU0CkrLDQNE11lCIW78miM5l
	YpA/2Z9qkbRmuytwJSDT/LCMFBEUZUkJiwo3pJ4aM4Vo86k+L0pFmL5P76LuQmTyRXrQ6C8CKPMa6
	sJv94dQ+fzsEpQL1gSwLREwMmnPQgvs4Or3ff67O7YE9gBdhfs83nWy/zLWe3Wd48yierk3gLie3m
	lwTEHymrCCRZew5Z351nBJSL8L6ND7x02IfxIEP+uvbJVOg7rDzs4sQsAoVt2S0Yp44wbVVF9YuYM
	g6UMrRMbmn0FOj/TCpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxBZI-00F607-Lc; Tue, 14 Dec 2021 17:26:24 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxBZG-00F5z4-5k
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 17:26:23 +0000
Received: by mail-qt1-f178.google.com with SMTP id f20so19097676qtb.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 09:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=826lo/OFrJk222r+sN9o+DWKehRdrydX6E4AepnaF0s=;
 b=CGSBS6MDE+ijojpL5hwQOpDcaK2AkX764fmfm9P9V4AA9OvRBka8OZGZc5CDQQRVRb
 HHysWwkg6m90vs+xewSELU9L1EwoTYgPXZosTazP5hhUTmMZaSfROJ+gZE9l+nJKa7W7
 I3C4vKW6lJ0ra3FSYDyhXSD6bbsomBMexxAkxH+QXEWgRJO1lCMppm6ts3sQXVKj4v/e
 tMbd+vnZeCkNmZzr0rSWTW0DfJPsKSGdv4u91SNOOtrBhr4GcA4HJNvIUik0Y8ztx4gD
 tbDOz3Hz42tVlD5Zch1N54wH9OiPk+VsdJQiG0XB3aBa5b1n9Xobr4I0xC7763fiKn4P
 hA2Q==
X-Gm-Message-State: AOAM532ndrX1Dji9jCnA6AJvyGYJ5xurHnSvkdVLI1IWJaFJYiYtPi5r
 jv6O2UxgtBFJGnO4ER3hNRVGVvpKdM4=
X-Google-Smtp-Source: ABdhPJzssn55vxdoSsLT8NneKqIz7PCLs3RZ2yix4ovt3oIj6BFwXJ6bRiipof1/EM41W7TkUADNNQ==
X-Received: by 2002:ac8:588e:: with SMTP id t14mr7408245qta.437.1639502778434; 
 Tue, 14 Dec 2021 09:26:18 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id a16sm367167qta.94.2021.12.14.09.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:26:17 -0800 (PST)
Date: Tue, 14 Dec 2021 12:26:16 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arch-owner@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
Message-ID: <YbjTuOhNxaPirK1L@fedora>
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com>
 <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
 <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_092622_251997_64CB86F8 
X-CRM114-Status: GOOD (  43.65  )
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

Hello,

On Tue, Dec 14, 2021 at 05:29:22PM +0100, Geert Uytterhoeven wrote:
> Hi Vladimir and Dennis,
> 
> On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> > >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> > >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> > >>
> > >> * may lead to broken build [1]
> > >> * ...or not working runtime due to [2]
> > >>
> > >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> > >> use percpu allocator on UP too") so restore that.
> > >>
> > >> [1]
> > >> For ARM SMP+NOMMU (R-class cores)
> > >>
> > >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> > >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> > >>
> > >> [2]
> > >> static inline
> > >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> > >> {
> > >>        return -EINVAL;
> > >> }
> > >>
> > >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> > >> ---
> > >>  mm/Kconfig | 3 +--
> > >>  1 file changed, 1 insertion(+), 2 deletions(-)
> > >>
> > >> diff --git a/mm/Kconfig b/mm/Kconfig
> > >> index d16ba92..66331e0 100644
> > >> --- a/mm/Kconfig
> > >> +++ b/mm/Kconfig
> > >> @@ -425,9 +425,8 @@ config THP_SWAP
> > >>  # UP and nommu archs use km based percpu allocator
> > >>  #
> > >>  config NEED_PER_CPU_KM
> > >> -    depends on !SMP
> > >>      bool
> > >> -    default y
> > >> +    default !SMP || !MMU
> > >>
> > >
> > > Should this be `depends on !SMP || !MMU` with default yes? Because with
> > > SMP && MMU, it shouldn't be an option to run with percpu-km.
> >
> > IIUC these are equivalent, truth table would not change if is under "depends"
> > or "default"
> >
> > SMP    MMU   NEED_PER_CPU_KM
> >  y      y    !y || !y => n || n => n
> >  y      n    !y || !n => n || y => y
> >  n      y    !n || !y => y || n => y
> >  n      n    !n || !n => y || y => y
> >
> > >
> > >>  config CLEANCACHE
> > >>      bool "Enable cleancache driver to cache clean pages if tmem is present"
> > >> --
> > >> 2.7.4
> > >>
> > >
> > > It's interesting to me that this is all coming up at once. Earlier this
> > > month I had the same conversation with people involved with sh [1].
> > >
> > > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> > >
> > > I can pull this shortly once I see whatever happened to linux-sh.
> >
> > Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
> > to the same conclusion, right?
> >
> > IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> 
> I had seen the j-Core thread, but completely forgot about
> Canaan K210 (RV64 SMP+NOMMU).
> 
> This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
> with NOMMU (either UP or SMP)").  And now booting K210 prints:
> 
>     percpu: wasting 10 pages per chunk
> 
> a) Is this bad?

It's not great.. Can you share the line on boot with the following
prefix: pcpu-alloc [1].

I'm a little surprised here because this means it's allocating not
against the right atomic size. I don't necesarily think it's an issue of
switching from percpu-vm to percpu-km.

> b) What exactly was this fixing, and how would I trigger the bad case
>    on K210 before, if it was affected at all?
> 

In v5.14, I merged Roman's request for percpu depopulation [2]. This
required calls to flush the tlb. There is an abstraction layer:
percpu-vm vs percpu-km. So if an architecture is using percpu-vm but
doesn't have an MMU AND doesn't map out appropriately the tlb flush
call, then it fails. This happened on arm + sh architectures. Now RV
might be mapping it out appropriately so they never saw the issue.

Now, there is also a bigger caveat with using percpu-vm without an MMU.
In percpu-vm, we allocate pages on demand and map them in into
pre-allocated vmas. This means there are 2 scenarios that I haven't
looked into deeper. 1, the vma alloc maps to allocating physical pages.
2, we're lucky percpu allocates backwards in the vma so we haven't had a
collision problem yet.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git/tree/mm/percpu.c#n2507
[2] https://lore.kernel.org/lkml/20210419225047.3415425-1-dennis@kernel.org/

Thanks,
Dennis

> >
> > [0] https://lore.kernel.org/linux-mm/20211130172954.129587-1-vladimir.murzin@arm.com/T/
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
