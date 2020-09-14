Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8BAC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 17:53:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A82BB20EDD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 17:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDLptkar";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="LSYBezCb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A82BB20EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5vNCkWcY1LELJeyoBdWgWjoDWIa+de2rl3MFgdXNrAk=; b=VDLptkarfMVfnWL9L+eaNJu7G
	ImA5/TwNXRpJqhA/h8uSYb4AbmNSb/0n0CpccQNNXtYAQZzcQJ92OjkNdOHoiaJW046ocgYJZFdUo
	letYj35hB1zyFRn4P7uro9dgBdxCaDNs6dOVcVUcJNqXtHHRrK5lPXf9iHXD8e12Yo93kzethu+32
	dwLiJgtneuipL+6VZQCp7j2GjHjz8w6geC0wmOmhimTfa6CAFOzmN8LcHYzgpvwaaiF363zMx93ls
	6NhWxFnr3344+QWHNh7QGAzXFYSRqfUax4iIOoyy5nLqsiy+UcgweY6YHNIpqpzsjGW2ZxPn1NZb6
	YY68FzRMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHsfE-00072w-7J; Mon, 14 Sep 2020 17:53:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHsfB-00072P-Jd
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 17:53:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so907604wmj.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKhv5rTCRwwZYJ4fJZiFA0QJHdmQ369d7Ye56iqS39I=;
 b=LSYBezCbF3qD2J1/hnvedLtI3NNJxjkCI3H7K3OpFvBX9JZU0AhCfLK8/EptPQIA1x
 AzWCI/TnXymeOP930uBLk0o6wdCrYsuqj1ik1lCEEVx3QSZI4XJkHJ61lRT4e5wbGq9z
 hlCIWs01gU+mS+7JoC9yORjrjQkPCTlgo2oho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKhv5rTCRwwZYJ4fJZiFA0QJHdmQ369d7Ye56iqS39I=;
 b=Hg3dCsGewmtAtLb0AjdAoJ9TUzjVM4uyrc18m5naGMepFRy9kSYRB6ouFMXCDad6RI
 gqOTtGSNkWboCZXixnIvcP6nahyayHIONhWN/yR4cIKDrgTpQpRpxUAZ3FSkjllbTYeH
 G/7fnLg9hN6Dgrx6719KNIl+Z/XIp8v85Aj7qzOowj+LvzyXXs0SGjNF9yksxF+qK33K
 JhLxwhbRQDYGpPWno+0WKAnZ1xWP8b1e5HTMyDDjiK+P6LsjytF4rmcw7UbOcgg73Qjk
 d2W/v87lsb8rMGN+JwHAT2QUW9UTPwWs3Xl9EE0CI19DehHqtngfBTNdbeKStYHtyxWB
 ZmXA==
X-Gm-Message-State: AOAM530oxlyHNX8guhfX+gKzyg6T7uTDhM7IChbfEZ4hO90gnx8bcIfG
 usYdGgd1oz0AZW4Pmw5pTRJQI6MlDVAxBz8Endrj
X-Google-Smtp-Source: ABdhPJxw1Qpj5A7GWHWLHZ09ZPMi/B/UvNz/rjGtLMnwaH4Nhx+vHKTB51J5Q9V4CbzLicMUN+/4uZ5UPpaX2uHHBfE=
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr531634wml.176.1600105992277; 
 Mon, 14 Sep 2020 10:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200912002341.4869-1-atish.patra@wdc.com>
 <20200912104502.GF2142832@kernel.org>
 <CAOnJCU+yK8uxFU-zv5BPTzmtxwiVpiPxGsNkVEtnTQ+64UU-ug@mail.gmail.com>
 <CAAhSdy0cudvf4Lc3YaSc7MH5oGH1V60C3rToMUZU01LPxRWLKQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0cudvf4Lc3YaSc7MH5oGH1V60C3rToMUZU01LPxRWLKQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 14 Sep 2020 10:53:00 -0700
Message-ID: <CAOnJCUKqUZVTKzgjK0=Kj_WCZU+hP27SX8V0mvT+2AVk_MMC5w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Consider sparse memory while removing unusable
 memory
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_135313_747777_B59EAD54 
X-CRM114-Status: GOOD (  33.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 4:52 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Sep 14, 2020 at 5:18 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Sat, Sep 12, 2020 at 3:45 AM Mike Rapoport <rppt@kernel.org> wrote:
> > >
> > > Hello Atish,
> > >
> > > On Fri, Sep 11, 2020 at 05:23:41PM -0700, Atish Patra wrote:
> > > > Currently, any usable memory area beyond page_offset is removed by adding the
> > > > memory sizes from each memblock. That may not work for sparse memory
> > > > as memory regions can be very far apart resulting incorrect removal of some
> > > > usable memory.
> > >
> > > If I understand correctly, the memory with physical addresses larger
> > > than (-PAGE_OFFSET) cannot be used. Since it was aready
> > > memblock_add()'ed during device tree parsing, you need to remove it from
> > > memblock.
> > >
> >
> > IIRC, the original intention was to fix MAXPHYSMEM_2GB option for RV64
> > for the medlow model.
> > That's why the patch removed any memory beyond -PAGE_OFFSET.
> >
> > > For that you can use memblock_enforce_memory_limit(-PAGE_OFFSET).
> > >
> > Thanks. I think we can just call memblock_enforce_memory_limit without
> > tracking the total memory size
> > and whether maximum memory described in DT is greater than  -PAGE_OFFSET.
> >
> > @Anup Patel Was there any other reason for this change originally?
>
> No other reason. We just wanted to ensure that amount of memory addressable
> by kernel (i.e. -PAGE_OFFSET) is also considered when removing memblock.
>

It looks like we have an agreement here then. I will update the patch
to directly call
memblock_enforce_memory_limit as suggested by Mike.

> Regards,
> Anup
>
> >
> > > > Just use the start of the first memory block and the end of the last memory
> > > > block to compute the size of the total memory that can be used.
> > > >
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > ---
> > > >  arch/riscv/mm/init.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > index 787c75f751a5..188281fc2816 100644
> > > > --- a/arch/riscv/mm/init.c
> > > > +++ b/arch/riscv/mm/init.c
> > > > @@ -147,7 +147,6 @@ void __init setup_bootmem(void)
> > > >  {
> > > >       struct memblock_region *reg;
> > > >       phys_addr_t mem_size = 0;
> > > > -     phys_addr_t total_mem = 0;
> > > >       phys_addr_t mem_start, end = 0;
> > > >       phys_addr_t vmlinux_end = __pa_symbol(&_end);
> > > >       phys_addr_t vmlinux_start = __pa_symbol(&_start);
> > > > @@ -155,18 +154,17 @@ void __init setup_bootmem(void)
> > > >       /* Find the memory region containing the kernel */
> > > >       for_each_memblock(memory, reg) {
> > > >               end = reg->base + reg->size;
> > > > -             if (!total_mem)
> > > > +             if (!mem_start)
> > > >                       mem_start = reg->base;
> > > >               if (reg->base <= vmlinux_start && vmlinux_end <= end)
> > > >                       BUG_ON(reg->size == 0);
> > > > -             total_mem = total_mem + reg->size;
> > > >       }
> > > >
> > > >       /*
> > > >        * Remove memblock from the end of usable area to the
> > > >        * end of region
> > > >        */
> > > > -     mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> > > > +     mem_size = min(end - mem_start, (phys_addr_t)-PAGE_OFFSET);
> > > >       if (mem_start + mem_size < end)
> > > >               memblock_remove(mem_start + mem_size,
> > > >                               end - mem_start - mem_size);
> > > > --
> > > > 2.24.0
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
> > --
> > Regards,
> > Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
