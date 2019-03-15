Return-Path: <SRS0=KlHB=RS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF1EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 16:17:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC4021871
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 16:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3ES8clE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rFiLa2+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC4021871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2/4D1mlaYUOStnNieocHSzrWFzIPIfd2iDNW4Ta4nw=; b=d3ES8clEJwn8kl
	1nFd2FEJk3wWADaE1vIOFuqVkzbc0NJ/mVmKyL1NLtAhg0jvF/nQwhhe1OOf9TvCeTEo4qLU6BrJm
	wLllEYhzX9GPV8yrUzlb+rlUd2IkoeoVJiPH5PqzTRBbMS0RQbCoC2kUaeqfNOnHx7Ip/N/ID+b0A
	uAzmewgjzDFWHGZkycIRwdHDR+kPjNUnFN6dZGPuYducR06DNNAR0zNy94HE9C7xdchJp5T3nKNIc
	Rs9zw05IkOt+Zxi5XpI7g5gGGW2tsneHGuUWRTR3X24hv4mBRNfV7rcDrOa6QHLlU50G01S+aDMrv
	D0cCrNlyKA/hj4S1WPlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4pWZ-0004E3-Pl; Fri, 15 Mar 2019 16:17:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4pWX-0004BQ-1K
 for linux-riscv@lists.infradead.org; Fri, 15 Mar 2019 16:17:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id o10so9549666wmc.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2019 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FR3ymEwaOQWaM0T4tUv4W9g3CTkqvHROaGu4usCQP6g=;
 b=rFiLa2+43GYFDwqkjOi49TmLE0vcaImDfv4W1nfg/0rORnbvinsgsV43JHcCZej5vz
 3DWkg/gENTf/9YyRv2jFpfStVrYQ7XPs913neaaY/IifIcAZ8rtzB+6FgoD5yk0KJmnr
 NYQLmBm+eGhMBFS9pEPbRlFYq4YdACwQZYIoDG0pWiUmVjedxzTadLrxjZ/R5mAAPLlV
 Z9Wstk35w9giFSEgGd+RG1jGzBrqTdmLUiu40nEjgCzOHxPbYELQd9cpVXaatYwODB4k
 IXR7MR9IDSAlcB8lAhbQdFBDSchZQy/8vLS+2tSud963CWAN9tOnWTD29F5s4TcV7fKF
 +gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FR3ymEwaOQWaM0T4tUv4W9g3CTkqvHROaGu4usCQP6g=;
 b=QWm7IORYQDzvG1nVoo7Cho7FOn92BRQ8kH539YtPIkvEpeP3oG8N6tebKudKA9UP8p
 kCJ5vC1sUuU0/fEK7UakYjIEYT+/W9cmB4GNErNwQ9Mj/MkxtN5rQhJtodDOwGNWuYy9
 vL1rH3rRlqZnSNXr0CXZAtKPac/pLL2U28ksfJnl1F6N08Mx88ojL+DNFdCUKYO2IPBx
 QB+wFg/f0Qam2fkL0SUT3i8uvSpxA6ytKuQTTs9GNBcwt4zFRJSFukPjCSy2hinXeLVA
 KIvsS7NrAwXsZf0V8b3k6ZgG0qS9aM9fBrf1BRpKnDwkPRBlrcaL3IKH/Tpoutdz3ofM
 4uMA==
X-Gm-Message-State: APjAAAVl4dAK4OlVPNs2T7FEgo0BjA5g/kIXufKWJMuUUrt82gU6scHv
 jZK+P/Oo23RGiwCjCL/C5lYHJjXXBwY4SCdnsdKGOQ==
X-Google-Smtp-Source: APXvYqx6P1sabSzGYXkgCA4Qry+VLCvHYyFpvcrZ4pzYtQjdokVzfX5H2H1uNHcvs0FUNp+GqzZNpQsffBiI+OYm310=
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr2905659wmh.153.1552666648608; 
 Fri, 15 Mar 2019 09:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
 <20190314065311.GC24380@rapoport-lnx>
 <CAAhSdy2uEgyvs=5NdoZ3H208qeDGJ9OrTOeaz6HQ+1va+R3dUA@mail.gmail.com>
 <20190315155828.GB920@rapoport-lnx>
In-Reply-To: <20190315155828.GB920@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Mar 2019 21:47:17 +0530
Message-ID: <CAAhSdy33bDaEB9u+rqkD3a=-OZaN+7x1NHNf3Tws=7fAw0-vLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_091733_131490_1D9628B0 
X-CRM114-Status: GOOD (  26.85  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 15, 2019 at 9:28 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Mar 14, 2019 at 11:28:32PM +0530, Anup Patel wrote:
> > On Thu, Mar 14, 2019 at 12:23 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > >
> > > On Thu, Mar 14, 2019 at 02:36:01AM +0530, Anup Patel wrote:
> > > > On Thu, Mar 14, 2019 at 12:01 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > > >
> > > > > On Tue, Mar 12, 2019 at 10:08:22PM +0000, Anup Patel wrote:
> > > > > > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > > > > > address and RISCV32 kernel from a 4MB aligned physical address. This
> > > > > > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > > > > > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > > > > > 2-level pagetable).
> > > > > >
> > > > > > Further, the above booting contraint also results in memory wastage
> > > > > > because if we boot kernel from some <xyz> address (which is not same as
> > > > > > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > > > > > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > > > > > will be reserved/unusable.
> > > > > >
> > > > > > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > > > > > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> > > > > >
> > > > > > This patch re-writes the initial pagetable setup code to allow booting
> > > > > > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> > > > > >
> > > > > > To achieve this:
> > > > > > 1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
> > > > > >    mappings in setup_vm() (called from head.S)
> > > > > > 2. Once we reach paging_init() (called from setup_arch()) after
> > > > > >    memblock setup, we map all available memory banks using 4KB
> > > > > >    mappings and memblock APIs.
> > > > >
> > > > > I'm not really familiar with RISC-V, but my guess would be that you'd get
> > > > > worse TLB performance with 4KB mappings. Not mentioning the amount of
> > > > > memory required for the page table itself.
> > > >
> > > > I agree we will see a hit in TLB performance due to 4KB mappings.
> > > >
> > > > To address this we can create, 2MB (or 4MB on 32bit system) mappings
> > > > whenever load_pa is aligned to it otherwise we prefer 4KB mappings. In other
> > > > words, we create bigger mappings whenever possible and fallback to 4KB
> > > > mappings when not possible.
> > > >
> > > > This way if kernel is booted from 2MB (or 4MB) aligned address then we will
> > > > see good TLB performance for kernel addresses. Also, users are still free to
> > > > boot Linux RISC-V kernel from any 4KB aligned address.
> > > >
> > > > Of course, we will have to document this as part of Linux RISC-V booting
> > > > requirements under Documentation/ (which does not exist currently).
> > > >
> > > > >
> > > > > If the only goal is to utilize the physical memory below the kernel, it
> > > > > simply should not be reserved at the first place, something like:
> > > >
> > > > Well, our goal was two-fold:
> > > >
> > > > 1. We wanted to unify boot-time alignment requirements for 32bit and
> > > > 64bit RISC-V systems
> > >
> > > Can't they both start from 4MB aligned address provided the memory below
> > > the kernel can be freed?
> >
> > Yes, they can both start from 4MB aligned address.
> >
> > >
> > > > 2. Save memory by allowing users to place kernel just after the runtime
> > > > firmware at starting of RAM.
> > >
> > > If the firmware should be alive after kernel boot, it's memory is the only
> > > part that should be reserved below the kernel. Otherwise, the entire region
> > > <physical memory start> - <kernel start> can be free.
> > >
> > > Using 4K pages for the swapper_pg_dir is quite a change and I'm not
> > > convinced its really justified.
> >
> > I understand your concern about TLB performance and more page
> > tables.
> >
> > Not just 2MB/4MB mappings, we should be able to create even 1GB
> > mappings as well for good TLB performance.
> >
> > I suggest we should use best possible mapping size (4KB, 2MB, or
> > 1GB) based on alignment of kernel load address. This way users can
> > boot from any 4KB aligned address and setup_vm() will try to use
> > biggest possible mapping size.
> >
> > For example, If the kernel load address is aligned to 2MB then we 2MB
> > mappings bigger mappings and use fewer page tables. Same thing
> > possible for 1GB mappings as well.
>
> I still don't get why it is that important to relax alignment of the kernel
> load address. Provided you can use the memory below the kernel, it really
> should not matter.

The original idea was just to relax the alignment constraint on the kernel
load address.

What I am suggesting now is to improve this patch so that we can
dynamically select mapping size based on kernel load address. This
will achieve both:
1. Relaxed constraint on kernel load address
2. Better TLB performance whenever possible

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
