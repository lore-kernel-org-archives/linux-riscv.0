Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED14C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:42:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DC16101D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16DC16101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eUMXBgSzJmz04bLe4t2DuJbEsRA8HJOEWdYX8VZ8BQc=; b=VMxR7ACr71oJ3YaiRFIbS64yS
	Kyjq9O7WrNP3hpvgEFvPZLMaGToy1926ZbAuyPs+CgLuYo1ENjKStNhiTB/FdwO+h4przcA6dI5Mn
	iqw5BGEvueaeRWvVyFM7ESUwfeNrS2eBQZKA2JiibpsQiTuE37HjVGI7sjTYSWwV88U3hmdUg9/CY
	f3kq/XBC6rNaDE+BxqWnef3Aeatvnlt6XsDd15RySR8eYboICig8CXcqSMj5mmjlREKGBRc/jOfhs
	CWetAQmJUtg3pIl+hvMlKhYGIoKC9sfnShFVF3+dtCUA6EOqXB1LxQM3VDCyZ8H2lX5s19UnoMrid
	NcZJxhjyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUsL9-000wVH-4N; Fri, 09 Apr 2021 14:42:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUsL6-000wUn-L7
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 14:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mgWegSwhOpcGml0uML3IWUn1X3Z+AH0MFZdCHi/93PY=; b=tRHYcuPLqSon7YteYysCoEzg1t
 6GNOtdFwkx2tknilmSYyEfpaUgwafy39EgsW4IBXPoX4Rs4PP4NIPQWR2RfI37N/MAntsGLhOjRuM
 Dj8rx3M3UogSFiuDrm5FMR1eQi6QRNioxbM3ZHonVwbOVba2O/qAaLLDaVqeLAzGtYpzT3uGO9ZUJ
 9CMVvkyC9Z/sroK3sNjp+S6kx8nMku8HOWlEd0SPn/SFH44okc9fEGSmkCAwB0memtNXdlXwFOndl
 q/MpmptX3Y8lLGKsEwFLPXWIBrJ0yebGw9/9h30n/JRyNFaxN7bwXCliAaHUr3JDTmRHYKSsvvkG6
 SDPzQGow==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUsL3-004b30-Pz
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 14:42:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id r20so6757605ljk.4
 for <linux-riscv@lists.infradead.org>; Fri, 09 Apr 2021 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgWegSwhOpcGml0uML3IWUn1X3Z+AH0MFZdCHi/93PY=;
 b=o7eFJ30qOzBa3dgRnh/WcCN0kX49sPw9maR/6OuBKUPp5AJKAFmoQDa74vCSyYhlXn
 hXJeJrBR3C5NdSpTtex/aViY9q5M/fbQ4/Z9GR18hYJendIm2ZSEhhp48Syfl2xDKuD7
 d6uhhhrmy+ADPRbj2wNKbzG2BqQoEEVnbG5DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgWegSwhOpcGml0uML3IWUn1X3Z+AH0MFZdCHi/93PY=;
 b=CnWnSZpCELgWn2H+J3dV9W5xSpOsPI6KXPJ8WSppl01qMpDhqSWR1HC7t64jbPbiei
 oXgij57s4d6CcftKxZvhV9SWPkoBOaFfg7ikZMecmExnh07TW71IU0LXoAaPD7fJ6cag
 LKJJdd5m2+l17PxqT0DUJHWyLL3FLzqUKnfsI0J0s7gSjpsCWowOsyKf0XQtuGSekeXg
 oQ99g9VSDCLDOlhdkFZ/HgqGLuIkgTQ1RDzVZohqUNBXeBfAGcv0QK9I9RDhO8tVymAZ
 DYVGKjoXbrCIEjy7nsMxCN6p1u6Eg4rz1MJUcXDg4f6O7wQ49PxBEkdIB+ZEy6XWR8n/
 VVhg==
X-Gm-Message-State: AOAM530L1ci+NgMxzDKBL35gOcahKqiOuAL9Vaq7dcO0uBa5vhiTx6LI
 o5gwcf1uvSXsP2ReVNtRl4gMEu9A2YSVMZIVqA9lcw==
X-Google-Smtp-Source: ABdhPJyLql3K0BO+oWb/9QvOTKYKMmjccNLMOLeXWEEXD3jfxsO8N+MD+HIzwc0FZJ18L7cYPrFgQ7ScHDtmwE+wAss=
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr9267330ljj.173.1617979343021; 
 Fri, 09 Apr 2021 07:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <YHBEsDuEvPAnL8Vb@linux.ibm.com>
 <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
 <YHBdzPsHantT9r8t@linux.ibm.com>
In-Reply-To: <YHBdzPsHantT9r8t@linux.ibm.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Fri, 9 Apr 2021 16:42:12 +0200
Message-ID: <CAM4kBBKyHSYz+NNDpT=fWseWccsQ4HZ3teBc01jYT2g8j7Ze2A@mail.gmail.com>
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Alex Ghiti <alex@ghiti.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org, 
 Linux-MM <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_074225_867701_4FDC1B98 
X-CRM114-Status: GOOD (  32.13  )
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

On Fri, Apr 9, 2021 at 3:59 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Fri, Apr 09, 2021 at 02:46:17PM +0200, David Hildenbrand wrote:
> > > > > Also, will that memory properly be exposed in the resource tree as
> > > > > System RAM (e.g., /proc/iomem) ? Otherwise some things (/proc/kcore)
> > > > > won't work as expected - the kernel won't be included in a dump.
> > > Do we really need a XIP kernel to included in kdump?
> > > And does not it sound weird to expose flash as System RAM in /proc/iomem? ;-)
> >
> > See my other mail, maybe we actually want something different.
> >
> > >
> > > > I have just checked and it does not appear in /proc/iomem.
> > > >
> > > > Ok your conclusion would be to have struct page, I'm going to implement this
> > > > version then using memblock as you described.
> > >
> > > I'm not sure this is required. With XIP kernel text never gets into RAM, so
> > > it does not seem to require struct page.
> > >
> > > XIP by definition has some limitations relatively to "normal" operation,
> > > so lack of kdump could be one of them.
> >
> > I agree.
> >
> > >
> > > I might be wrong, but IMHO, artificially creating a memory map for part of
> > > flash would cause more problems in the long run.
> >
> > Can you elaborate?
>
> Nothing particular, just a gut feeling. Usually, when you force something
> it comes out the wrong way later.

It's possible still that MTD_XIP is implemented allowing to write to
the flash used for XIP. While flash is being written, memory map
doesn't make sense at all. I can't come up with a real life example
when it can actually lead to problems but it is indeed weird when
System RAM suddenly becomes unreadable. I really don't think exposing
it in /proc/iomem is a good idea.

> > > BTW, how does XIP account the kernel text on other architectures that
> > > implement it?
> >
> > Interesting point, I thought XIP would be something new on RISC-V (well, at
> > least to me :) ). If that concept exists already, we better mimic what
> > existing implementations do.
>
> I had quick glance at ARM, it seems that kernel text does not have memory
> map and does not show up in System RAM.

Exactly, and I believe ARM64 won't do that too when it gets its own
XIP support (which is underway).

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
