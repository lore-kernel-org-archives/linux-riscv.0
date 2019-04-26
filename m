Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E476DC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 18:43:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE71E20B7C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 18:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p29JiMme"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE71E20B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61mfmpEtr9dijifnnaPTwMFOLToMvjq6jlsxIzgOnz0=; b=p29JiMme5Vff39
	BNqauOq0sfwbtUNxYubvSzN3VA7Jh28KySb+rXsWvWJSwmmequH+urwH3Q/zuSwiGzshpCvSqLG4t
	9jifUPnPJoQA/aD08Aka3wAir3gW34karTjOf6gUX9PGBR1I19vynxM04UN9nO91fbEYuto2utBSv
	rHSn1zMNM4EJb+VdhaudLrJL9z/yj6230DL67WNVCBqoT2JY7yMtNjyhKaB2lQqsA3S84PiofXNvg
	ffOONvwOeWEeU6QKOtLg9f3UgGSjse/kQGvanB4H99vWAPMffQXttx/CtOKqt73bZtQY/hWm4wI36
	14Ho/wSJuFur9qXsgpBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK5oO-0005oP-QZ; Fri, 26 Apr 2019 18:43:04 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK5oM-0005nc-1p
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 18:43:03 +0000
Received: by mail-qt1-f193.google.com with SMTP id k38so5263478qtk.2
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 11:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+WijXhsv6/Jv9J1vWUI/spfYQQ6sFmzaS3I18sGJBE=;
 b=JkV3RSW/SRDoNPLGb3aRqHVUW58tYly8cf03hfMbK1X2GN0sABtW20RJq6vzKF2bfI
 JbUEf8GdxRjIXeEZP6Lr6NGj0skmENlxqFjlnuLEfWaMYs56htIFcavMukJe7mkUiNeq
 LIPiSRjK1BarDNRSM8CRMGjrAo8cZLK0kz3BFf8eyBfuJ8L4U9T/Kv+ixGygvjJ6eCdb
 uVubwmkLHWnLU0zg8g7OaTC6zW1isKeBaFxtzyNBiVqIQeaaukFteldcKdez846Z6Ny6
 oAdtc+RAUHUAysI4RH4BIusGiS2/Jxz1ZAuTmqADCkbJuMpQJ+HjlN87GXLOVg1P4M3y
 WnKw==
X-Gm-Message-State: APjAAAVI8uhsT9feVYWVnXBaxC/2NKERZmQv0GfYAgGm+Jc0NnmnnRfX
 mDebwFke+OZtGZ1COLCT7YGWJIRtg0SbPdsvQZs=
X-Google-Smtp-Source: APXvYqwkz7sLNRz6nM5GTfEzeyWyPg/S+2Namakb1a1AJPUlLmKnkSTU8tbWod0e0yvkmgBkqmfpQb7YXWBG/+GbpYU=
X-Received: by 2002:ac8:8cd:: with SMTP id y13mr26650331qth.96.1556304180530; 
 Fri, 26 Apr 2019 11:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de>
 <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190424055703.GA3417@guoren-Inspiron-7460>
 <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
 <20190424142306.GB20974@lst.de>
 <CAK8P3a36V93mKLuR-6hZzNX+j0HVpR_9bM41653PQuD+1xMTVw@mail.gmail.com>
 <20190426160558.GA10540@guoren-Inspiron-7460>
In-Reply-To: <20190426160558.GA10540@guoren-Inspiron-7460>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Apr 2019 20:42:42 +0200
Message-ID: <CAK8P3a2CvvBMZ8UkkgyrczgUccSGZ35RpG8V2dGUXbuOh9AZ5A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_114302_090471_4A4A8114 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Anup Patel <anup.patel@wdc.com>, Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 "ren_guo@c-sky.com" <ren_guo@c-sky.com>, Greentime Hu <green.hu@gmail.com>,
 Gary Guo <gary@garyguo.net>, Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 26, 2019 at 6:06 PM Guo Ren <guoren@kernel.org> wrote:
> On Thu, Apr 25, 2019 at 11:50:11AM +0200, Arnd Bergmann wrote:
> > On Wed, Apr 24, 2019 at 4:23 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > You could probably get away with allowing uncached mappings only
> > for huge pages, and using one or two of the bits the PMD for it.
> > This should cover most use cases, since in practice coherent allocations
> > tend to be either small and rare (device descriptors) or very big
> > (frame buffer etc), and both cases can be handled with hugepages
> > and gen_pool_alloc, possibly CMA added in since there will likely
> > not be an IOMMU either on the systems that lack cache coherent DMA.
>
> Generally attributs in huge-tlb-entry and leaf-tlb-entry should be the
> same. Only put _PAGE_CACHE and _PAGE_BUF bits in huge-tlb-entry sounds
> a bit strange.

Well, the point is that we can't really change the meaning of the existing
low bits, but because of the alignment contraints on hugepages, the extra bits
are currently unused for hugepage TLBs.
There are other architectures that reuse the bits in clever ways, e.g.
allowing larger physical address ranges to be used with hugepages than
normal pages.

> The gen_pool_alloc only 256KB by default, but a huge tlb entry is 4MB.
> Hardware couldn't setup vitual-4MB to a phys-256KB range mapping in TLB.

I expect the size would be easily changed, as long as there is sufficient
physical memory. If the entire system has 32MB or less, setting 2MB aside
would have a fairly significant impact of course.


> > - you need to decide what is supposed to happen when there are
> >   multiple conflicting mappings for the same physical address.
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> What's the mulitple confilcing mappings ?

I mean when you have the linear mapping as cacheable and another
mapping for the same physical page as uncacheable, and then access
virtual address in both. This is usually a bad idea, but architectures
go to different lengths to prevent it.

The safest way would be for the CPU to produce a checkstop as soon
as there are TLB entries for the same physical address but different
caching settings. You can also do that if you have a cache-bypassing
load/store that hits a live cache line.

The other extreme would be to not do anything special and try to come
up with sane behavior, e.g. allow accesses in both ways but ensure that
a cache-bypassing load/store always flushes and invalidates cache
lines for the same physical address before its access.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
