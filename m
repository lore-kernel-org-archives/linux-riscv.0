Return-Path: <SRS0=jyaq=RR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D851AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2019 17:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1E02184C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2019 17:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jIabXJLY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="iNoDmqx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1E02184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfWxrkzrz8Up1d8X+JY1mU/B7oaXVHTDCjP0+SgbarY=; b=jIabXJLYouh0xk
	vtGWew3PwOYeLRxwK1Z1iH3lt/ctEuNZYNVR1m0dVWg4Hvw9aGSKoqhbP483g+ajy1qAfXXxo82eu
	1L2Hl82jJbHgrhyi/lbqLdGhYq2pH8qDa7QXmIyyi9fUM5bTgSCpuz4ZTdTmePPAPGYUXLL3teHug
	bIsQfA6m4qBle6dnzZlIgXe/Tey4d08I4+6ZQHUNQHTnFYaXgcH8kYXuyuKuLvuH20O+ytyKwlD6Y
	6+touTprLKdwEVWyt5IhMSUeCcZmshj6l/q9CK/EYpT8YTqNtDmWq2hwQrp4WWCH63kbjAuJSUefe
	+pmjUTo4Q05gZEfF3wxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Ucy-0000RN-6m; Thu, 14 Mar 2019 17:58:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Ucw-0000Qb-5u
 for linux-riscv@lists.infradead.org; Thu, 14 Mar 2019 17:58:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id t124so3608235wma.4
 for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2019 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eIGC0C5In0SH1lK8Am1FXe/fvjtgabXZQmRnvk65lLs=;
 b=iNoDmqx3l8Mo1FKmw3iL9Z819dRDQ6vpPRKnKIX11LvHcKTzD1B0Xxy0P08UIatPVS
 /SLutMfSdqIDIBreSEjcv2y2SqQcHbaOkYH1/JcSodRJWZjsXkiz2ay14YUtj3WCSE7A
 pS4TW7GRbuiV9d+2LAdWgZ+XuIKrjiLUhGvdRgsWqzJdr/kBU0PpZumRLONER5wLaHZv
 WEQfqe2Ht5tvR35RxxnYcKNybLG7Fp7v18/4wtE8IpGOhjEj5nKOOsaqqDjxHk3JzE5U
 bZwLrX5weCeqznAQgWPRES3gmwz2I5dCzpow+S13QiD28slsnHhhLGXaszKxtIqYCKeO
 tEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eIGC0C5In0SH1lK8Am1FXe/fvjtgabXZQmRnvk65lLs=;
 b=ehCK5Fgarz6lLpzMQarbrCGCZwjb2Rq455uyBFwGBa45oMMa67Gi0b6otWIRm3vbvp
 09wm2yBnQs3+bRYexfg+Jp6si9PgE/8Ap6JKBRZQgH+V5L6Oabm+D+tH7zwgED1kdLxc
 Ntt8F0iOef3yt7eNqPARwNd9I9hdm0AF85Ini0h1ZDY5j1XCokxI7/uaf/71NkHMK9rF
 l877kU6f+Vl+jjl5RFpj3GEgjraUnYNaq+E5k4CCzyhNaSV9vknO614KSBJeHeDpNCM5
 9IikZxgfkfPUN1+rBhWoo6Pqko7LRWG1T456RZmiGWGQx+LK9MfXD26Vb25fH5gOGQQV
 aUfA==
X-Gm-Message-State: APjAAAWVVbYx63/r2QX2todnJrRCuFTdM1h2FcpmoxFEANUqUv9AnbcW
 pb8YLv1Dmu9j6hafuNtCZvlWqMo4RbYiEyPuiyvs2A==
X-Google-Smtp-Source: APXvYqx+mp8SrxWThkSu4UUCKQe4xP/dBIPqf4BT2wptCL1bzVxZ+N1EZjCzzyf2BMK/dbEE/ZzCSaWV6HfUbbTm13k=
X-Received: by 2002:a1c:9c12:: with SMTP id f18mr3465802wme.16.1552586324060; 
 Thu, 14 Mar 2019 10:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
 <20190314065311.GC24380@rapoport-lnx>
In-Reply-To: <20190314065311.GC24380@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Mar 2019 23:28:32 +0530
Message-ID: <CAAhSdy2uEgyvs=5NdoZ3H208qeDGJ9OrTOeaz6HQ+1va+R3dUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_105846_287336_98B4CDD0 
X-CRM114-Status: GOOD (  23.68  )
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

On Thu, Mar 14, 2019 at 12:23 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Mar 14, 2019 at 02:36:01AM +0530, Anup Patel wrote:
> > On Thu, Mar 14, 2019 at 12:01 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > >
> > > On Tue, Mar 12, 2019 at 10:08:22PM +0000, Anup Patel wrote:
> > > > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > > > address and RISCV32 kernel from a 4MB aligned physical address. This
> > > > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > > > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > > > 2-level pagetable).
> > > >
> > > > Further, the above booting contraint also results in memory wastage
> > > > because if we boot kernel from some <xyz> address (which is not same as
> > > > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > > > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > > > will be reserved/unusable.
> > > >
> > > > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > > > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> > > >
> > > > This patch re-writes the initial pagetable setup code to allow booting
> > > > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> > > >
> > > > To achieve this:
> > > > 1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
> > > >    mappings in setup_vm() (called from head.S)
> > > > 2. Once we reach paging_init() (called from setup_arch()) after
> > > >    memblock setup, we map all available memory banks using 4KB
> > > >    mappings and memblock APIs.
> > >
> > > I'm not really familiar with RISC-V, but my guess would be that you'd get
> > > worse TLB performance with 4KB mappings. Not mentioning the amount of
> > > memory required for the page table itself.
> >
> > I agree we will see a hit in TLB performance due to 4KB mappings.
> >
> > To address this we can create, 2MB (or 4MB on 32bit system) mappings
> > whenever load_pa is aligned to it otherwise we prefer 4KB mappings. In other
> > words, we create bigger mappings whenever possible and fallback to 4KB
> > mappings when not possible.
> >
> > This way if kernel is booted from 2MB (or 4MB) aligned address then we will
> > see good TLB performance for kernel addresses. Also, users are still free to
> > boot Linux RISC-V kernel from any 4KB aligned address.
> >
> > Of course, we will have to document this as part of Linux RISC-V booting
> > requirements under Documentation/ (which does not exist currently).
> >
> > >
> > > If the only goal is to utilize the physical memory below the kernel, it
> > > simply should not be reserved at the first place, something like:
> >
> > Well, our goal was two-fold:
> >
> > 1. We wanted to unify boot-time alignment requirements for 32bit and
> > 64bit RISC-V systems
>
> Can't they both start from 4MB aligned address provided the memory below
> the kernel can be freed?

Yes, they can both start from 4MB aligned address.

>
> > 2. Save memory by allowing users to place kernel just after the runtime
> > firmware at starting of RAM.
>
> If the firmware should be alive after kernel boot, it's memory is the only
> part that should be reserved below the kernel. Otherwise, the entire region
> <physical memory start> - <kernel start> can be free.
>
> Using 4K pages for the swapper_pg_dir is quite a change and I'm not
> convinced its really justified.

I understand your concern about TLB performance and more page
tables.

Not just 2MB/4MB mappings, we should be able to create even 1GB
mappings as well for good TLB performance.

I suggest we should use best possible mapping size (4KB, 2MB, or
1GB) based on alignment of kernel load address. This way users can
boot from any 4KB aligned address and setup_vm() will try to use
biggest possible mapping size.

For example, If the kernel load address is aligned to 2MB then we 2MB
mappings bigger mappings and use fewer page tables. Same thing
possible for 1GB mappings as well.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
