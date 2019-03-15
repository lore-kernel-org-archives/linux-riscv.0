Return-Path: <SRS0=KlHB=RS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423EAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 23:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F858218A1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 23:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gP8zYwNs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JhT22P9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F858218A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWlRnhVUric2Fn7uIcu5rzIhURyvtp5sSf8Bd4AyB8c=; b=gP8zYwNsgHGh1e
	ienaucvBYbBhw4zR7aFjNHgTrfG1/e7ZdBoubfWoC+IJK4SgYRs+0a1qA1agSDr34n9f+piJTevQx
	LLy3PjbgMgDuQvtYk9Ee15Lj7T5iBEV/F6YBIeTi98NMq5dn2Q8G24abYknb+cKKi1K/+x0GGoA58
	0VOh50P2tpH9bzFrGl9+sQnQ11GEI0ZmNq9b4CvX7eKq/VQz2icyDo6LmrycSQhfXwp4OVkZvFSri
	vT5VhmSnv7JOazueCMGnd/rmYY9Z7vzNg0YwjJIqYnO5p/XtDw/NpxT27njiISq5DrXNf4sJXTJe1
	yEtdXe5AsORUvNK3CZEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4wCz-00024Y-Uu; Fri, 15 Mar 2019 23:25:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4wCv-00023e-Qu
 for linux-riscv@lists.infradead.org; Fri, 15 Mar 2019 23:25:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id g12so11223544wrm.5
 for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2019 16:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VhmV0Ym8zTNoxl16iSULzSsU9aIBHAEGCcVFmXC8SdE=;
 b=JhT22P9GAYy/4Fcetb6OJfrhyX5aA9QhL75pJ5GdWNu33WiuUbDz9m4D2YYRtn/6+g
 jq3j/xO+kFzWicHSH4I2BBq1M94KZiCJmcccv4vUiz4XXsrErT59TntIEK+gIGehPktx
 rgWg7GN1nIMJK6bU4rY7vsyFvtGmO2y8HmVSrmMNQbKf6f+aJCq+aahjD3Tr5ayJ365c
 fxZGP2d5k+rnzdmm5Wag80B++5wjhqxaVjHPfVX9D79hzYMZ6QYp9tca2U8Dy43zfUcz
 8YYPHPCViwT+BsJvYJ+svSCYQMj/TT/IxCWMEvJv42E8A1NjmGwf00Er6IpKGoiw05uO
 Kgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VhmV0Ym8zTNoxl16iSULzSsU9aIBHAEGCcVFmXC8SdE=;
 b=B4hH+FtEKLKCvsGXXZqE/8cgU1qEUQ9HbnOF0SFtm81V8WdAsb/w8CUn+5YoIKB1oC
 qQkK3wT9XxsWl8iMn/oFA5zpj7HdcbFlFzzFTPClAWfC42Bi0PcU8kMT1guFbJLHsASj
 0PPVMCOWxe3FLKAEtZG+VV9/pAg2hT7ERDgXQ6/pcVaenF9vyaslUbcnLNwfXVsbZci8
 2LMS7mFtkxqk+dLNi++Tp3+zqIcFuG01Hx+shhX4MrK/91b/dEOkOqH+T/On+26Nl24l
 HvEyTMDJJ8FzN6JtWSaUyaYlFAc7eGkSvwdR8s+YZn1f9qxC4B/0JoV8tbpvsh6d29jZ
 QvEw==
X-Gm-Message-State: APjAAAVUg/3gH/OqHRkCwTicKrFXtuXc8yjuOcBKNbszkvT3RWbHu9my
 BQdNWNGNkkZar3NFkBlXIcGW0pYjHvb6CehIM+hni0SdXb0=
X-Google-Smtp-Source: APXvYqxZSzviY9Gni1dRQMhn9BJcAmTqEM3/nDlW/9elnlYJqrajZO+Ulp+TUgmk11UCi0KX2NKeBa8wr6qR5z2B6Ns=
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr4186703wrv.187.1552692342409; 
 Fri, 15 Mar 2019 16:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
 <20190314065311.GC24380@rapoport-lnx>
 <CAAhSdy2uEgyvs=5NdoZ3H208qeDGJ9OrTOeaz6HQ+1va+R3dUA@mail.gmail.com>
 <20190315155828.GB920@rapoport-lnx>
 <CAAhSdy0HoTTccyy203Y9m3kdAjCOzjjMdrb670huU71pjOMw4A@mail.gmail.com>
In-Reply-To: <CAAhSdy0HoTTccyy203Y9m3kdAjCOzjjMdrb670huU71pjOMw4A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 16 Mar 2019 04:55:30 +0530
Message-ID: <CAAhSdy0D6JpySExCG7ziSSDmQ_88=paiMwjjXTTR1gbKCEOs3g@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_162546_011384_A022A767 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, Mar 15, 2019 at 9:52 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Mar 15, 2019 at 9:28 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Thu, Mar 14, 2019 at 11:28:32PM +0530, Anup Patel wrote:
> > > On Thu, Mar 14, 2019 at 12:23 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > >
> > > > On Thu, Mar 14, 2019 at 02:36:01AM +0530, Anup Patel wrote:
> > > > > On Thu, Mar 14, 2019 at 12:01 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > > > >
> > > > > > On Tue, Mar 12, 2019 at 10:08:22PM +0000, Anup Patel wrote:
> > > > > > > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > > > > > > address and RISCV32 kernel from a 4MB aligned physical address. This
> > > > > > > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > > > > > > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > > > > > > 2-level pagetable).
> > > > > > >
> > > > > > > Further, the above booting contraint also results in memory wastage
> > > > > > > because if we boot kernel from some <xyz> address (which is not same as
> > > > > > > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > > > > > > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > > > > > > will be reserved/unusable.
> > > > > > >
> > > > > > > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > > > > > > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> > > > > > >
> > > > > > > This patch re-writes the initial pagetable setup code to allow booting
> > > > > > > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> > > > > > >
> > > > > > > To achieve this:
> > > > > > > 1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
> > > > > > >    mappings in setup_vm() (called from head.S)
> > > > > > > 2. Once we reach paging_init() (called from setup_arch()) after
> > > > > > >    memblock setup, we map all available memory banks using 4KB
> > > > > > >    mappings and memblock APIs.
> > > > > >
> > > > > > I'm not really familiar with RISC-V, but my guess would be that you'd get
> > > > > > worse TLB performance with 4KB mappings. Not mentioning the amount of
> > > > > > memory required for the page table itself.
> > > > >
> > > > > I agree we will see a hit in TLB performance due to 4KB mappings.
> > > > >
> > > > > To address this we can create, 2MB (or 4MB on 32bit system) mappings
> > > > > whenever load_pa is aligned to it otherwise we prefer 4KB mappings. In other
> > > > > words, we create bigger mappings whenever possible and fallback to 4KB
> > > > > mappings when not possible.
> > > > >
> > > > > This way if kernel is booted from 2MB (or 4MB) aligned address then we will
> > > > > see good TLB performance for kernel addresses. Also, users are still free to
> > > > > boot Linux RISC-V kernel from any 4KB aligned address.
> > > > >
> > > > > Of course, we will have to document this as part of Linux RISC-V booting
> > > > > requirements under Documentation/ (which does not exist currently).
> > > > >
> > > > > >
> > > > > > If the only goal is to utilize the physical memory below the kernel, it
> > > > > > simply should not be reserved at the first place, something like:
> > > > >
> > > > > Well, our goal was two-fold:
> > > > >
> > > > > 1. We wanted to unify boot-time alignment requirements for 32bit and
> > > > > 64bit RISC-V systems
> > > >
> > > > Can't they both start from 4MB aligned address provided the memory below
> > > > the kernel can be freed?
> > >
> > > Yes, they can both start from 4MB aligned address.
> > >
> > > >
> > > > > 2. Save memory by allowing users to place kernel just after the runtime
> > > > > firmware at starting of RAM.
> > > >
> > > > If the firmware should be alive after kernel boot, it's memory is the only
> > > > part that should be reserved below the kernel. Otherwise, the entire region
> > > > <physical memory start> - <kernel start> can be free.
> > > >
> > > > Using 4K pages for the swapper_pg_dir is quite a change and I'm not
> > > > convinced its really justified.
> > >
> > > I understand your concern about TLB performance and more page
> > > tables.
> > >
> > > Not just 2MB/4MB mappings, we should be able to create even 1GB
> > > mappings as well for good TLB performance.
> > >
> > > I suggest we should use best possible mapping size (4KB, 2MB, or
> > > 1GB) based on alignment of kernel load address. This way users can
> > > boot from any 4KB aligned address and setup_vm() will try to use
> > > biggest possible mapping size.
> > >
> > > For example, If the kernel load address is aligned to 2MB then we 2MB
> > > mappings bigger mappings and use fewer page tables. Same thing
> > > possible for 1GB mappings as well.
> >
> > I still don't get why it is that important to relax alignment of the kernel
> > load address. Provided you can use the memory below the kernel, it really
> > should not matter.
>
> Irrespective to constraint on kernel load address, we certainly need
> to allow memory below kernel to be usable but that's a separate change.
>
> Currently, the memory below kernel is ignored by
> early_init_dt_add_memory_arch() in
> drivers/of/fdt.c
>

I explored the possibility of re-claiming memory below kernel but then
we have an issue in this case.

For RISC-V kernel, PAGE_OFFSET is mapped to kernel load address
(i.e. load_pa in this code). The va_pa_offset is based on load_pa so linear
conversion of VA-to-PA and PA-to-VA won't be possible on the memory
below kernel. I guess this is why early_init_dt_add_memory_arch() is
marking memory below kernel as reserved. Is there better way to do it??

We started exploring ways to re-claim memory below kernel because
we are trying to get Linux working on Kendryte K210 board
(https://kendryte.com/). This board has dual-core 64bit RISC-V but it
only has 8MB RAM.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
