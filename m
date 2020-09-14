Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B0AC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 11:52:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4FC21741
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 11:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PV+B8sBY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YalQb9qX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4FC21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C/+klHWJUuE3yNY+O9bZHzu331o30xpkfiWz9TumOT4=; b=PV+B8sBYs8Ug21DteG1LTFOib
	gCp4WFy/VdXYSJgYgA3CgrW+9XZyqak5AzoE923fiE+Q737kdFiPmMBPmVvIB1QtrA4LYMaRQEfZQ
	ExeUJhaFB+n+qp/hkgpeTIO9g8wKUg3EIbD8tS0eBmadp1n5TzBZNFgWj0e1JKvZE2rk2f+q84XlH
	okRTdE1B5BrUoE1dSoKn1BWqjoKbvxylwgRR1rDJz6HTIsXGeiNwZz0JljvIpAfudzts4MLkHfyiq
	TDCm39TV9s0U4qXd34h397p3IEmqp3Qf1z9xAkk6dJo+LY1sCosAqMfC4VITkX8qNM9HgGe+hqUsc
	BVFrjKBRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHn2L-0007ew-GI; Mon, 14 Sep 2020 11:52:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHn2K-0007eR-4L
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 11:52:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so10918277wmj.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJ7iJNVDDaND4zplndsbl4Uby21iiMEjNanabMHyNa8=;
 b=YalQb9qXnij3jA+z9DcxOA6IfyTifBTo3+5ciDzFu0EX8HtYUQWiH1DfbNzkQ5E4Wg
 n9tEwxvm65+rVwSYeQMc2Aeh/gYDYfUiZN0Pn1sNa+UWyQH3JerLbfdSWlfaqGboTyxk
 cx3klAP3OoD3zNPoXyDGb7iQc4jb276bpjW/piZZahi+ZdAaHXAPMRzwePA2V73YOOi8
 YeF+3dio/BlVTJ9VLcik8+RQmy+l6AQFnUSvJQzDppohujPTTJT+i8wYKFDzOs/x3aQ4
 ZCHX3caFgONUgL5jSFttJNsV5c+i+7BQbP92MTWKyiAK/xiitzOqpv0wjUVqqur0EfGU
 QroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJ7iJNVDDaND4zplndsbl4Uby21iiMEjNanabMHyNa8=;
 b=qheBNVNohAZRFyy4zWb1SNFaC+UwZf3NJI0v/cR7zNJj4pRa+kn4mYBMHHj3hFSA/I
 +V4grVHvO1BVRa1oTWQetgkRzkKZM0l89fzTeVczBnmpCj3MplrLKTtb8ubd4gS4n+xN
 AuvRbaLIfXRdYHIkyL3Ucn+z4gJU+Ft4lFdS13C8o54AvfWoTp0rFffkZ5lYgWYBsmb0
 0893o00YqaTk2yR5dHXv3cITVpw7hc95oh71HkKXJqRX/C7vJLAAMKcHH8RH7C9t3hty
 QHH+cZBQcsgimEsZnqozrc+7eFkbLeDXkuz/Z/sW2PX0hpgJIhjS69xF0L44YDjy4/gv
 nf4w==
X-Gm-Message-State: AOAM530GJgoKY9IzMz+BvKdiEuQWRy4EMH2HWBMOkZ5AURsCuECJpxcI
 I7gy0i374nPvmL8X0ONON8JRXIo+GhSVZ5kHlg7IUA==
X-Google-Smtp-Source: ABdhPJxRyS8Ai4E8v9nf+FcXijbMUkAsU+Eigzaf0copkXWk29uviSgjKvIWApV4fAHRX2LCjI94vgVq+VQJ/1zXIU0=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr14501327wmh.152.1600084362966; 
 Mon, 14 Sep 2020 04:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200912002341.4869-1-atish.patra@wdc.com>
 <20200912104502.GF2142832@kernel.org>
 <CAOnJCU+yK8uxFU-zv5BPTzmtxwiVpiPxGsNkVEtnTQ+64UU-ug@mail.gmail.com>
In-Reply-To: <CAOnJCU+yK8uxFU-zv5BPTzmtxwiVpiPxGsNkVEtnTQ+64UU-ug@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2020 17:22:31 +0530
Message-ID: <CAAhSdy0cudvf4Lc3YaSc7MH5oGH1V60C3rToMUZU01LPxRWLKQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Consider sparse memory while removing unusable
 memory
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_075244_194547_6A1F7D84 
X-CRM114-Status: GOOD (  31.99  )
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

On Mon, Sep 14, 2020 at 5:18 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Sep 12, 2020 at 3:45 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > Hello Atish,
> >
> > On Fri, Sep 11, 2020 at 05:23:41PM -0700, Atish Patra wrote:
> > > Currently, any usable memory area beyond page_offset is removed by adding the
> > > memory sizes from each memblock. That may not work for sparse memory
> > > as memory regions can be very far apart resulting incorrect removal of some
> > > usable memory.
> >
> > If I understand correctly, the memory with physical addresses larger
> > than (-PAGE_OFFSET) cannot be used. Since it was aready
> > memblock_add()'ed during device tree parsing, you need to remove it from
> > memblock.
> >
>
> IIRC, the original intention was to fix MAXPHYSMEM_2GB option for RV64
> for the medlow model.
> That's why the patch removed any memory beyond -PAGE_OFFSET.
>
> > For that you can use memblock_enforce_memory_limit(-PAGE_OFFSET).
> >
> Thanks. I think we can just call memblock_enforce_memory_limit without
> tracking the total memory size
> and whether maximum memory described in DT is greater than  -PAGE_OFFSET.
>
> @Anup Patel Was there any other reason for this change originally?

No other reason. We just wanted to ensure that amount of memory addressable
by kernel (i.e. -PAGE_OFFSET) is also considered when removing memblock.

Regards,
Anup

>
> > > Just use the start of the first memory block and the end of the last memory
> > > block to compute the size of the total memory that can be used.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/riscv/mm/init.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 787c75f751a5..188281fc2816 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -147,7 +147,6 @@ void __init setup_bootmem(void)
> > >  {
> > >       struct memblock_region *reg;
> > >       phys_addr_t mem_size = 0;
> > > -     phys_addr_t total_mem = 0;
> > >       phys_addr_t mem_start, end = 0;
> > >       phys_addr_t vmlinux_end = __pa_symbol(&_end);
> > >       phys_addr_t vmlinux_start = __pa_symbol(&_start);
> > > @@ -155,18 +154,17 @@ void __init setup_bootmem(void)
> > >       /* Find the memory region containing the kernel */
> > >       for_each_memblock(memory, reg) {
> > >               end = reg->base + reg->size;
> > > -             if (!total_mem)
> > > +             if (!mem_start)
> > >                       mem_start = reg->base;
> > >               if (reg->base <= vmlinux_start && vmlinux_end <= end)
> > >                       BUG_ON(reg->size == 0);
> > > -             total_mem = total_mem + reg->size;
> > >       }
> > >
> > >       /*
> > >        * Remove memblock from the end of usable area to the
> > >        * end of region
> > >        */
> > > -     mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> > > +     mem_size = min(end - mem_start, (phys_addr_t)-PAGE_OFFSET);
> > >       if (mem_start + mem_size < end)
> > >               memblock_remove(mem_start + mem_size,
> > >                               end - mem_start - mem_size);
> > > --
> > > 2.24.0
> > >
> >
> > --
> > Sincerely yours,
> > Mike.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
