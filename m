Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD54BC5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Olvkri/qCHYg1jokb+U6vTTKjAs8xx4bf7pzx6pagao=; b=a2k0iGjR1LAz2O
	ALDoqiy/UKWCtpDY14DTreDKkz2kh0p2mv3iPbLctyI79Ru3HWeRu3Jr27aQicslLTwCPhki0Xa8P
	VZ/tdhnCtqqgaO37K0kBqPDbLbLCrCyQKkS0H9VsBK3T+rCX9WsThB6hgGBoZf4e3HUP3h6Dd2DAX
	1XLIQe0JVvkbWKESCQ/Kngc4eqwSnErHn7p16kTk7JLlGCb/uwsxB2QcXLmyO9VxnvW3c393Oc305
	2PuAL2tccznWQzfmYXBNzYcVCamcASUXrN/X0SMxVhfUakQStt1ix6mo/m5bVKDXfTFb67L1aJJSq
	Xd3UpVcU8JsNcCDeB6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqt6-0019IP-0i; Mon, 09 Jan 2023 12:04:24 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqsy-0019Gh-NS
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 12:04:22 +0000
Received: by mail-qk1-x729.google.com with SMTP id pa22so3998414qkn.9
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 04:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVNn+YWwJiRPXNtsBieyEVWKNIb/zkrUFPfCeEPxMWw=;
        b=lVpGq0jRiH44fjieSWWDZP5itmNjimKwXoQjLA1EN74wGirOQjNnMTLfiYkb6HM4nU
         nzOiEF75i37tGplMLvwTJs6FiJtQ5Z4nActSx6jbLudKWge3rJFSdxC6PJtEWRAo953m
         GU9mVKdUaN03GRIkjLdeXSbrgtVzPHIhHFQBITbKJtH8EqrVohn1wN1Iqn5TRtw7vFCX
         Nn5Tp2CDucUfAeu0h25UZuZPUWt7a5qCppBRRILLJoOmPocn1Utvhhcz8Vi4HT3M3aAy
         6LY8RXVzInyCeWRvc2Rp+v3eFHGDequzembAnK+UmHGh/bpemH33EHzxJoBVaTaZYAsF
         xzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVNn+YWwJiRPXNtsBieyEVWKNIb/zkrUFPfCeEPxMWw=;
        b=tVOQbVOVUhp9BoVjFzxqc2BPouE4QmOaUCj6sv4zP6+bjIxvJ0NNwFXxcOq+G1Vf3p
         BQn20ToPxCoDFQ4TkT20f1+LnWsHr+t8w+/+nFMTV9gKWx4MiixSG+ibTJNw8Z6PKWM5
         Sa03VwO0BurpibJZhIrthu/qVejceAMXvzFn4NTS1pYNKQWalZsolUPDpPraLCFqUJti
         fp3EsgaGquZbHmG/kY1+D4XCNEveQ/XS2pIIjuLBxo/oQY+ulr1X7BxvqjGM0Nzwrobw
         9M9peqEqgeMutWKrsz29VpGazy442S06rcFHNK9oM0DTIEjJ0lhArrGUl3A5G8Ztlfxz
         XHKA==
X-Gm-Message-State: AFqh2kpxnzu1BnFh7en5mS00B0GIYICugV4oD0bR1qwnoDIokG2JmbCv
	AhmyLI2mZqGbnke5vUBisC6eAEbltcRMQMpxMq4=
X-Google-Smtp-Source: AMrXdXtab23RPB/2ZXMcLY+PmC+jyscFXBJ8G2+xrfC95CqdAo2Wg45jeC1lnEQ0GwjR0BdWjHn+PJpw//FCdU9RsGI=
X-Received: by 2002:a05:620a:1001:b0:6ff:7b95:633e with SMTP id
 z1-20020a05620a100100b006ff7b95633emr2573684qkj.689.1673265851185; Mon, 09
 Jan 2023 04:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com> <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com>
 <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
In-Reply-To: <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Jan 2023 12:03:44 +0000
Message-ID: <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	devicetree@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_040420_813096_4DF84B7B 
X-CRM114-Status: GOOD (  30.53  )
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

On Sun, Jan 8, 2023 at 12:08 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jan 7, 2023, at 23:10, Lad, Prabhakar wrote:
>
> >> > +
> >> > +     memset(&thead_cmo_ops, 0x0, sizeof(thead_cmo_ops));
> >> > +     if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO)) {
> >> > +             thead_cmo_ops.clean_range = &thead_cmo_clean_range;
> >> > +             thead_cmo_ops.inv_range = &thead_cmo_inval_range;
> >> > +             thead_cmo_ops.flush_range = &thead_cmo_flush_range;
> >> > +             riscv_noncoherent_register_cache_ops(&thead_cmo_ops);
> >> > +     }
> >>
> >> The implementation here looks reasonable, just wonder whether
> >> the classification as an 'errata' makes sense. I would probably
> >> consider this a 'driver' at this point, but that's just
> >> a question of personal preference.
> >>
> > zicbom is a CPU feature that doesn't have any DT node and hence no
> > driver and similarly for T-HEAD SoC.
>
> A driver does not have to be a 'struct platform_driver' that
> matches to a device node, my point was more about what to
> name it, regardless of how the code is entered.
>
> > Also the arch_setup_dma_ops()
> > happens quite early before driver probing due to which we get WARN()
> > messages during bootup hence I have implemented it as errata; as
> > errata patching happens quite early.
>
> But there is no more patching here, just setting the
> function pointers, right?
>
Yes that's right.

> >> > +struct riscv_cache_ops {
> >> > +     void (*clean_range)(unsigned long addr, unsigned long size);
> >> > +     void (*inv_range)(unsigned long addr, unsigned long size);
> >> > +     void (*flush_range)(unsigned long addr, unsigned long size);
> >> > +     void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
> >> > +                                           enum dma_data_direction dir,
> >> > +                                           enum dma_noncoherent_ops ops);
> >> > +};
> >>
> >> I don't quite see how the fourth operation is used here.
> >> Are there cache controllers that need something beyond
> >> clean/inv/flush?
> >>
> > This is for platforms that dont follow standard cache operations (like
> > done in patch 5/6) and there drivers decide on the operations
> > depending on the ops and dir.
>
> My feeling is that the set of operations that get called should
> not depend on the cache controller but at best the CPU. I tried to
> enumerate how zicbom and ax45 differ here, and how that compares
> to other architectures:
>
>                   zicbom      ax45,mips,arc      arm           arm64
> fromdevice      clean/flush   inval/inval   inval/inval   clean/inval
> todevice        clean/-       clean/-       clean/-       clean/-
> bidi            flush/flush   flush/inval   clean/inval   clean/inval
>
> So everyone does the same operation for DMA_TO_DEVICE, but
> they differ in the DMA_FROM_DEVICE handling, for reasons I
> don't quite see:
>
> Your ax45 code does the same as arc and mips. arm and
> arm64 skip invalidating the cache before bidi mappings,
> but arm has a FIXME comment about that. arm64 does a
> 'clean' instead of 'inval' when mapping a fromdevice
> page, which seems valid but slower than necessary.
>
> Could the zicbom operations be changed to do the same
> things as the ax45/mips/arc ones, or are there specific
> details in the zicbom spec that require this?
>
I'll let the RISC-V experts respond here.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
