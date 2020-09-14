Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CD4C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 11:50:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB06221741
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 11:50:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLZLp2eK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FqbYrnRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB06221741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wuYpjorqEYG0diKhwV4L+1vK59jbJ/gkh2AEzihrfog=; b=tLZLp2eKWt9Le5i7pNHLCExKi
	lLrl7rD2G5/KWqPbK5a+acF55odaD9+i9xeUkO1AV/5JtY90912+CgWwaSTpLai9QoKJoq8qQmOb1
	YB6lRxcB5+9NmPqIOdmY2J2Titul2bzLdXPhdUhyuz8K6auRDFvT868PpNsPlpHzymxBYfdWdJxhO
	t+lO6l1gPKSOFqFgNwsoryTb3Ele4QbynDsd1okFVjHdLIJgPodn7Sds/sX4k7M0ewx8Cip1D6/0L
	6lIe1Q0zdAMug2Zw7zqjoVNOPxPlfzlVC5gkWu47dM8NSy1n/m/LaZAbzgtIZkSMBI521qvqjuD+d
	w9MHH00pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmzn-0007RV-85; Mon, 14 Sep 2020 11:50:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmzl-0007R4-IM
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 11:50:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id x14so18340059wrl.12
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8iJIrFiPrthxhWR/A1W4z3Dcqg+LQz4AuT3GYaAloBA=;
 b=FqbYrnRQxKtvT4FZdy8KmgpIW72P0WkrZEi2B7ArJtMBbSoRZflgSaJAXYG/zwTnU+
 QLtnMCMTZQ3EmMhMGAWP8vk0KHeffvl9kHstfSZi0ZCLaog7Xu6jnyCgM8J3maTU9JQV
 9G2t3RB/ZyialxoMtxnjhVqZ/Yz5D7M7qB+epat9cWSN1/fyRrEHd81t/Gxr8P2ja8lL
 Ky4e/ACib+0SodL8CDuBNdT0EmEvzDM74RllOsoa1DxI6E7DIyx32bmXsefayTzUm8Mz
 DJibCIphznDl0cMKQZpeNVCTRqadEL6PLO2+dHNvk0LKMoE9t60VbDrPFHSJ1SPcA+yl
 VN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8iJIrFiPrthxhWR/A1W4z3Dcqg+LQz4AuT3GYaAloBA=;
 b=VK/4BVzBSpzNyDjvr7jyU1LQYvkGWIwMJMJrMh8Uk1vrGpQVnPufZWITz+dL65BuU7
 YD92YKLNSx6ZNp+07Zvj9/BwQy3SNnnxJYyZAMP7MasLqiqUSFhBegUKVpKzGJmLSeVL
 B647LiLWfHB9ST/yCRxzcscVWgeniGjzxKxXz1k7UJCT8Mbt6GuhzKvtpG1MvChbqo/4
 75+LTK4MggSZQaOLSse9NAq6w9VLx8lapMnvaPYe56fOWJIEfYiSbfwRYTgHMEciODbA
 ayytLQpnFjr/oUzYy9Sjr0EeeYstEibgNRRbmjTxvX/ZPah6gyk78SSarDL9tj8zQjej
 8uNg==
X-Gm-Message-State: AOAM530vATLIzLL53XlFsBwB1MdKbjRjXWg7TFWWrnhDpC3+bWPRoYlA
 x1i3ax0/oe5VMkWaoYwH1aTBlzA+ZhYRGUII/Dtocw==
X-Google-Smtp-Source: ABdhPJy6MIIdbvLYKBOQIzmZLcO7OWcE4uQ0vDEm/jLOAh6B4JGz5ZPiZggdqVLrP+uq6zNUPFLurlO2Qnos9mx+P/g=
X-Received: by 2002:adf:db48:: with SMTP id f8mr16058134wrj.144.1600084204302; 
 Mon, 14 Sep 2020 04:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200912002341.4869-1-atish.patra@wdc.com>
 <20200912104502.GF2142832@kernel.org>
In-Reply-To: <20200912104502.GF2142832@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2020 17:19:52 +0530
Message-ID: <CAAhSdy1D2BC4Z=nf7Tv6znQMMGwaVNH0QhO0Oj6gqYwwbnLt_g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Consider sparse memory while removing unusable
 memory
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_075005_722472_93DAA95C 
X-CRM114-Status: GOOD (  25.25  )
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
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2020 at 4:15 PM Mike Rapoport <rppt@kernel.org> wrote:
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

-PAGE_OFFSET represents the size of memory addressable by the kernel and
not the last physical address.

mem_start + (-PAGE_OFFSET) will be the last physical address usable by kernel.

>
> For that you can use memblock_enforce_memory_limit(-PAGE_OFFSET).

I think we should use memblock_enforce_memory_limit(mem_start - PAGE_OFFSET).

Regards,
Anup

>
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
