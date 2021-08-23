Return-Path: <SRS0=1I3Q=NO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214FFC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 13:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA186126A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 13:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFA186126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMZOwW43gyiG6xKhafWWYC3mZhR1X7aiLmRduBJXLhw=; b=wQYdxg29Ee1CvQ
	uxqeaFghaRD66FHmkbBb6TvXOpp/SmZMNN7oy16YQc/deD3jF6IFAwLJDW35ddE+CrssT8TCeQgtI
	AuG12h9makv6GHbUHUyliieStqJJhL09Vrl++ZwvmULdZDYwDJF6OuYsnx/V2del9cM8dJYQpXj8T
	SmJC6vtA3Fw9z3pFaKXUtGpev2NkteJsEiQPNoK5ZdD0qQr+gtCcpZYxqaftlM9Uu1h4TTU94TAna
	RxxlMikqPM9ratvLP9o/v7OXNqZyPs3QblJVrPc3HfEkJEQy7LV1h/Kd3D6mqiJLFdGz3uMP2tmZc
	KUALEs4jvPYn+X1tZxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9lM-00Gytv-Pn; Mon, 23 Aug 2021 13:13:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9iN-00GxEd-IV; Mon, 23 Aug 2021 13:10:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 780CB6124B;
 Mon, 23 Aug 2021 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629724200;
 bh=18IORdqVvusrH0Fj0VVDXtKaaRMxUkPef6MJrsmm2qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zr/Om5YQvfTbx5iZSQxSvUT2T4TP0mok/H3UYcEwfBFV4uY7Wkhaa91+Q3D7RnEJr
 Q6q7RTdllb5TzFks6JcP2UE0M+/ejY3Qg+bxzd/ZOSxsfJnZ3VNzlKaTpW+rmufNLE
 D+ELrwjJX6EgXuse3vsn4/6mIUzwGzZ5UQR26icKafYCEyYmti8/9zcdo/pBzLhuT+
 /Wa/AbHAnL34jRH/QzcoCyu72OfTvH8ky4A5Lrpk+M63+F6UUnTVIsu3XqLRGB2zoC
 NVQ7i1fp4Z2AC15e5q3E2MyAF+qjJSrq6CfOnw15O2cm+S7DTPyA7fzDAEO4FGIbQv
 44kKLojONqI8Q==
Date: Mon, 23 Aug 2021 16:09:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kexec@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header
 reservation
Message-ID: <YSOeGzowhV/R9QS/@kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
 <YRn9DHlB/pdNPJyP@kernel.org>
 <CAMuHMdVdqR7gw+2O2v=qv_BB=+X2wEXN9jXV=np=jRayadwj7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVdqR7gw+2O2v=qv_BB=+X2wEXN9jXV=np=jRayadwj7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_061011_688896_E4504756 
X-CRM114-Status: GOOD (  40.47  )
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

On Mon, Aug 23, 2021 at 12:17:50PM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Mon, Aug 16, 2021 at 7:52 AM Mike Rapoport <rppt@kernel.org> wrote:
> > On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> > > Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> > > occupied by an elf core header described in the device tree.
> > > As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> > > mips_reserve_vmcore(), the latter needs to check if the memory has
> > > already been reserved before.
> >
> > Doing memblock_reserve() for the same region is usually fine, did you
> > encounter any issues without this patch?
> 
> Does it also work if the same region is part of an earlier larger
> reservation?  I am no memblock expert, so I don't know.
> I didn't run into any issues, as my MIPS platform is non-DT, but I
> assume arch/arm64/mm/init.c:reserve_elfcorehdr() had the check for
> a reason.

The memory will be reserved regardless of the earlier reservation, the
issue may appear when the reservations are made for different purpose. E.g.
if there was crash kernel allocation before the reservation of elfcorehdr.

The check in such case will prevent the second reservation, but, at least
in arch/arm64/mm/init.c:reserve_elfcorehdr() it does not seem to prevent
different users of the overlapping regions to step on each others toes.

Moreover, arm64::reserve_elfcorehdr() seems buggy to me, because of there
is only a partial overlap of the elfcorehdr with the previous reservation,
the non-overlapping part of elfcorehdr won't get reserved at all.

> Thanks!
> 
> >
> > > Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> > > systems use DT.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v5:
> > >   - New.
> > > ---
> > >  arch/mips/kernel/setup.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > > index 23a140327a0bac1b..4693add05743d78b 100644
> > > --- a/arch/mips/kernel/setup.c
> > > +++ b/arch/mips/kernel/setup.c
> > > @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
> > >       pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
> > >               (unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
> > >
> > > -     memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > > +     if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)
> > > +             memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > >  #endif
> > >  }
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

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
