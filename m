Return-Path: <SRS0=wdrm=CW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97625C433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2020 23:48:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D4721D1A
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2020 23:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVLheIos";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iIKSQgHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D4721D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyKOLh/wiO5cpgsEjyfHjK5CGbgTw4lGD3EUcQCZkek=; b=NVLheIosSprxl9FNUp3RlfB+F
	Y62BAoym8XApd2tKufgHA4stU3644MbnvJSlbgHpI1Xu7qhOol95z2MeSkaJLWrs/Z2xQnG1n2yj0
	uoQHQD45vrHPGedjgBG6osfv6pibCwaehGDmHhDm4fnnRTIihXNkt/+dGERJqSPMNHEntn0M3TQOZ
	2zwN7PVxX2NX9sncGguBBrdGKeeybAtJrpJT/pVemJfkf34P4CUFvOS1GxRlm4gEcWenax0iP3RCr
	6OSlHq+hkYNT36r3L61t22vX8Sstgdzqh83HAlVBIUP2ULycWoCNKDAx9PmQxkf5Tucog+Xj3zpNo
	thQTTIorQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHbj6-0007Ei-Io; Sun, 13 Sep 2020 23:48:08 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHbj2-0007Dq-UI
 for linux-riscv@lists.infradead.org; Sun, 13 Sep 2020 23:48:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id b79so9477787wmb.4
 for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2020 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzb4SDNhfhKuOAH2aTFB3ctXAAaT+cISGh+UPXFnYd4=;
 b=iIKSQgHrnqvxkICTPyxQchFi/Ywy8k/fbBjQkBw7PIqw9AwjZVzB6N5B+qqiud8is/
 G+tIlUHrDTIcu2hZitlR871CfiKHd2wHX4C0sMwttj0JmIfa53b2B2t3MpwoXr0VX5ZN
 Qij8W+M6S9SAtx1bwaQsTYErc5/ZWc7FuBPO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzb4SDNhfhKuOAH2aTFB3ctXAAaT+cISGh+UPXFnYd4=;
 b=PHtEclOLvpQNBd1ei/gkBlyL/jpVVNeZ3VbZLBnfVRbx+PlOcOKALxz6b81+3xZlVe
 K/obE2Gem962OhsawjzhRRithAZ5Nq2QDc9svU0aGcr3cl+I5qAuD18JDTvoBbMyIrfQ
 NEhF7a+EaiuN5WRMsXpvEESm3jpmcZRF/nftdR4h+CeCP5zofxZAZ0eJQS8U/r95+Jv2
 19QiDUJaHp/Jvcx56opnUHVQLvpQAEgmqdNVbFUIXK4NrrJuajiEMZzKgmIqf5lymIkf
 NtgH9J/GUFMjwo1RmjL45CZtecjulAPHCr1a7jH5KZpSj8sb6ZyNwwWZ9i/2mT90tCtM
 no5g==
X-Gm-Message-State: AOAM531x9lYh2sugWEC40LYgJUfZ9POY2rTMojuXdHrhB1QVDwYj/CTZ
 oLJABobC17Fr+81wXMad0nbWKh5GA0kndX0kK0vVCmlHJuBQY14=
X-Google-Smtp-Source: ABdhPJxgsRJWJfwm1VDVQWEIJcFvF7Fds8by50d7+KnmIFBk1mo0ysWPB710OqN7Ebv/cp6TY8xJUx0Wf42NnUaPd6Q=
X-Received: by 2002:a05:600c:2cc1:: with SMTP id
 l1mr12074737wmc.78.1600040882110; 
 Sun, 13 Sep 2020 16:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200912002341.4869-1-atish.patra@wdc.com>
 <20200912104502.GF2142832@kernel.org>
In-Reply-To: <20200912104502.GF2142832@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 13 Sep 2020 16:47:50 -0700
Message-ID: <CAOnJCU+yK8uxFU-zv5BPTzmtxwiVpiPxGsNkVEtnTQ+64UU-ug@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Consider sparse memory while removing unusable
 memory
To: Mike Rapoport <rppt@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_194805_098336_92FC78CE 
X-CRM114-Status: GOOD (  28.02  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2020 at 3:45 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> Hello Atish,
>
> On Fri, Sep 11, 2020 at 05:23:41PM -0700, Atish Patra wrote:
> > Currently, any usable memory area beyond page_offset is removed by adding the
> > memory sizes from each memblock. That may not work for sparse memory
> > as memory regions can be very far apart resulting incorrect removal of some
> > usable memory.
>
> If I understand correctly, the memory with physical addresses larger
> than (-PAGE_OFFSET) cannot be used. Since it was aready
> memblock_add()'ed during device tree parsing, you need to remove it from
> memblock.
>

IIRC, the original intention was to fix MAXPHYSMEM_2GB option for RV64
for the medlow model.
That's why the patch removed any memory beyond -PAGE_OFFSET.

> For that you can use memblock_enforce_memory_limit(-PAGE_OFFSET).
>
Thanks. I think we can just call memblock_enforce_memory_limit without
tracking the total memory size
and whether maximum memory described in DT is greater than  -PAGE_OFFSET.

@Anup Patel Was there any other reason for this change originally?

> > Just use the start of the first memory block and the end of the last memory
> > block to compute the size of the total memory that can be used.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 787c75f751a5..188281fc2816 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -147,7 +147,6 @@ void __init setup_bootmem(void)
> >  {
> >       struct memblock_region *reg;
> >       phys_addr_t mem_size = 0;
> > -     phys_addr_t total_mem = 0;
> >       phys_addr_t mem_start, end = 0;
> >       phys_addr_t vmlinux_end = __pa_symbol(&_end);
> >       phys_addr_t vmlinux_start = __pa_symbol(&_start);
> > @@ -155,18 +154,17 @@ void __init setup_bootmem(void)
> >       /* Find the memory region containing the kernel */
> >       for_each_memblock(memory, reg) {
> >               end = reg->base + reg->size;
> > -             if (!total_mem)
> > +             if (!mem_start)
> >                       mem_start = reg->base;
> >               if (reg->base <= vmlinux_start && vmlinux_end <= end)
> >                       BUG_ON(reg->size == 0);
> > -             total_mem = total_mem + reg->size;
> >       }
> >
> >       /*
> >        * Remove memblock from the end of usable area to the
> >        * end of region
> >        */
> > -     mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> > +     mem_size = min(end - mem_start, (phys_addr_t)-PAGE_OFFSET);
> >       if (mem_start + mem_size < end)
> >               memblock_remove(mem_start + mem_size,
> >                               end - mem_start - mem_size);
> > --
> > 2.24.0
> >
>
> --
> Sincerely yours,
> Mike.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
