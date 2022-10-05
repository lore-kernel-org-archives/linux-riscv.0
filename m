Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F436C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXKEJhWnzuPF1L6hbsHMu1W16lXu/xTiSIfkEQ7FQK8=; b=DJ98hJQ4mqrQRU
	+vP1idsghF6NDFkr7zHIY/+I/H1lc8WTbK/nPaI1GZHcaLGYlOaLbmNbPg7c9Z7cWgROX441JZXMG
	Ubr3rmRBWyWa3UXTlmTRxAdndmAT79+fnZRE1+cWvoXei8FmN+3eHBcNcGJQo8vIj+KTFLmXOMIOS
	1pRUhx34xExv4h14nOcQaBa0kVqgxXRka9ZmtnKrUaNZZ8jbw2lvotMd6YQuDmJQLUH+fRWmsSX6+
	bqJv0eWgFyJoC6k3mrG4BNjGIBVASY62cMFHJttqjrxlxL+Qi53KkAbNzGJj/ce2hySa/5id1q2t9
	WZnaCIqclax4CIrNnrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5JD-00EUrw-6r; Wed, 05 Oct 2022 14:23:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5JB-00EUrQ-79
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:23:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0508B81E37
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 14:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60416C433B5
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664979814;
	bh=WFaYi+X3bwztuZypZNGHha7U7CNiw0AMJpnPHzXpFJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X6P1+ilsTVaYaESYTCbKcfVD/ZBr0JiVSV8A0kBpux8OIUbZhcCbAC3XttnPwEGYr
	 sIGNEHtLbjjMRj9DDqY7PEF4nKOuHdq7kyxfjo/xsInvA+HUdZHe3FMTsHROVFWKms
	 fbAfere5gNLL1ACirQm9YDHA4bRw3+SHp/Mkapf/6f7V8sAuHL7oDNEaEkB6qul/pT
	 Cx/jFckJB3rTnRysbcdiGfUvja32NB1ccF7OJNyzyAAKRogcpsWKiEedx9mBTy8d0W
	 Id0x4lMOhleqENi5HN2sxqI4nOqKczbJP3vYAyVFs7bvhDIzYaWXJayGf3BHVTlTSB
	 dQ6dzWj6vDyyA==
Received: by mail-oi1-f173.google.com with SMTP id w127so3159301oiw.8
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 07:23:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf37u4QWyHf6nllSHj5BdQc6LhlcnGAJIhNw/mw1CzUbrWUJAI1k
	0Ones5CUvDlG2pc4yg77Jfm20k45cK+ywWOMcp8=
X-Google-Smtp-Source: AMsMyM5V+IXDM3tjlKjKLDlYZALnWctuGFs1B162NHLsEjt/VmV8U+oCRfhZJoy8o8aONZZ/gJ6Z967ZWbeH+tGHt08=
X-Received: by 2002:aca:6155:0:b0:353:e740:ce01 with SMTP id
 v82-20020aca6155000000b00353e740ce01mr2320511oib.19.1664979813453; Wed, 05
 Oct 2022 07:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQuSX9idEyNmGRwpAsSP8V=+QKQ7UAp28T-seM8rbkwOA@mail.gmail.com> <CA+V-a8smkDmQbz76sTA5XfUm7bkY4Ee-L5xYW+-xRWkE1TYiAw@mail.gmail.com>
In-Reply-To: <CA+V-a8smkDmQbz76sTA5XfUm7bkY4Ee-L5xYW+-xRWkE1TYiAw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 5 Oct 2022 22:23:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ4G-j3p_pHvVQ82R2DFQZq70xgE3ZhoRkxiSzrHnU2og@mail.gmail.com>
Message-ID: <CAJF2gTQ4G-j3p_pHvVQ82R2DFQZq70xgE3ZhoRkxiSzrHnU2og@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_072337_564980_5AD2268B 
X-CRM114-Status: GOOD (  29.03  )
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

On Wed, Oct 5, 2022 at 8:54 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Guo,
>
> On Wed, Oct 5, 2022 at 2:29 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Oct 4, 2022 at 6:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > On the AX45MP core, cache coherency is a specification option so it may
> > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > allocate a global dma coherent pool from which DMA allocations are taken
> > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > in the device tree. Synchronization callbacks are implemented to
> > > synchronize when doing DMA transactions.
> > >
> > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > It contains a configurable amount of PMA entries implemented as CSR
> > > registers to control the attributes of memory locations in interest.
> > >
> > > Below are the memory attributes supported:
> > > * Device, Non-bufferable
> > > * Device, bufferable
> > > * Memory, Non-cacheable, Non-bufferable
> > > * Memory, Non-cacheable, Bufferable
> > > * Memory, Write-back, No-allocate
> > > * Memory, Write-back, Read-allocate
> > > * Memory, Write-back, Write-allocate
> > > * Memory, Write-back, Read and Write-allocate
> > Seems Svpbmt's PMA, IO, and NC wouldn't fit your requirements, could
> > give a map list of the types of Svpbmt? And give out what you needed,
> > but Svpbmt can't.
> >
> Sorry I didn't get what you meant here, could you please elaborate.
I know there is no pbmt in AX45MP, I am just curious how many physical
memory attributes you would use in linux? It seems only one type used
in the series:
cpu_nocache_area_set -> sbi_ecall(SBI_EXT_ANDES,
SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);

I'm not sure how you make emmc/usb/gmac's dma ctrl desc work around
without pbmt when they don't have cache coherency protocol. Do you
need to inject dma_sync for desc synchronization? What's the effect of
dynamic PMA in the patch series?

Thx.

>
> > Here is the Linux dma type to Svpbmt map:
> > PMA -> Normal
> > IO -> ioremap, pgprot_noncached
> > NC -> pgprot_writecombine
> >
> > How about AX45MP?
> >
> Svpbmt extension is not supported on AX45MP (reported by
> riscv_isa_extension_available())
>
> Cheers,
> Prabhakar



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
