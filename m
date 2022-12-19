Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4436C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9jPca/GY0FFvNxSk8NPRDCgM1fTwhudBLUrRlzDRUI=; b=klzv3BkABd3fUM
	fzilBstr+A/+b0y36SSw5B7JH5deNJqQO+p9IQi1BZgnUDqy6yJ9rpbajtAGeAZ/19AhGFBps3jUY
	32lYtUi9ZwmXCabWiQ+NB+2jL7qKvK1F2Rex8F4cILC5PqnwXPkW0taxVZebmVbiqC95ZoUdWcCG6
	ZqvMjeBPN8/0HwlPBcAHj3RggADNEytzl3Zrf/JGn06NG2t9fpHP+WaiW29GcN4GL/+V7aHHRtV/T
	LA9WuP6Pbu5tM5UrhNOSRlW9GOUKMNJTcMPH2zbOaFpMqIUCY+BnSHCQ/+7gRjHgXPuIIj5Z59dNT
	iON1/CrtpxYSNI1y0Mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7FVA-00DISw-Kx; Mon, 19 Dec 2022 12:44:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7FV6-00DIPN-9A
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 12:44:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id t17so21222097eju.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 04:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxV7u7RRZGTufLc/md9pxkp/T9u0Ezh5oQMEVPe6YoE=;
        b=NXZBQcYCFN6W7FZJnt2A0RGQ67TR1ahrG9Il9h7nLhG41ek3IlOG5ncHGcpvDsgYYi
         wGPBvRPnhbbsdeGYPZSE6kp8mwDpreWGjVAv2C/2OwGnYkkVJKGOdp8SZb+vbL/qtyFU
         Nt6SF2tW0efcm36MpHVmZWcsI6rrkzPPtLEUsdQnn4+6IcLMWnEWtmt1mT8MTjRAPsYZ
         v3TFOMh8gs/NcWWIZxoHgSKd/vhauHrCBqIG4kzFA2hwG2H0oE29kqpilZR2Pf9qdP9R
         TXho41ZtENKaJhpNTjGnSoqu2cb70bvgvUqcgB6DEn09XGgHSd0ekPM/TMeT2hJZ5YXe
         SqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxV7u7RRZGTufLc/md9pxkp/T9u0Ezh5oQMEVPe6YoE=;
        b=gx5sox4s7PX9BPd0nRvtHV3jqLQ4+HJY/SxwZ8A/pwa0G+rGqjvLjkg3VQOFiCrovn
         PKtj/mjG91b07qFqHy3btTARh8Ytj25CPTFktAesS3aguv+H7bDLx4If+uQWaw2i/pBM
         jHgpKCBxvU+GNBIAjcSBUOdgkSlLrZgXLaUOLC0Ama94+Db5vLWMNz7U5779eHRx6UMM
         /7YU/Hg/PqlayyLRKIkGpzQcjG3QoTsTt9Td0+GNw2l9S9RQky+2GFJZxooYq6cck1w+
         ZFZDTIfXmA/LSZABuC3wu9/w/F9E60qVNK9umuLERvSNgfimzzRgri8do9OhH4u8sbWT
         M7aw==
X-Gm-Message-State: ANoB5pngh7CPePJAL/lAtPRE/9/RObTodGLTiCrkbAJ8GAlsKL+FHRlx
	2PmY2qq8OjMcQUAboBliFDSajrkrD9pFezgic8k=
X-Google-Smtp-Source: AA0mqf5uBgvc3EA96bzK5dHrHzFiUTyMSkm7/ctkGB9XyGfleg5xEJDmeYdEobBRDxbJ6jWt4l6SYB5GKW3s9lK5HRk=
X-Received: by 2002:a17:906:3e41:b0:78d:bc9f:33da with SMTP id
 t1-20020a1709063e4100b0078dbc9f33damr80689032eji.80.1671453850556; Mon, 19
 Dec 2022 04:44:10 -0800 (PST)
MIME-Version: 1.0
References: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
 <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com> <Y55IQIxXw/twcxFx@spud>
In-Reply-To: <Y55IQIxXw/twcxFx@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Dec 2022 12:43:44 +0000
Message-ID: <CA+V-a8utcKKp81UTxQSvD6WsHgjO_7gSz33eedaE0+VxrR3f4w@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, soc@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	guoren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_044412_364663_30502324 
X-CRM114-Status: GOOD (  39.77  )
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

Hi Conor,

On Sat, Dec 17, 2022 at 10:52 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Dec 16, 2022 at 09:04:20PM +0100, Arnd Bergmann wrote:
> > On Fri, Dec 16, 2022, at 17:32, Palmer Dabbelt wrote:
> > > On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> > >> On Thu, Dec 15, 2022 at 01:40:30PM -0800, Palmer Dabbelt wrote:
> > >>> Given that we already moved the SiFive one out it seems sane to just start
> > >>> with the rest in drivers/soc/$VENDOR.  Looks like it was Christoph's idea to
> > >>> do the move, so I'm adding him in case he's got an opinion (and also the SOC
> > >>> alias, as that seems generally relevant).
> > >>
> > >> Well, it isn't an integral architecture feature, so it doesn't really
> > >> beloing into arch.  Even the irqchip and timer drivers that are more
> > >> less architectural are in drivers/ as they aren't really core
> > >> architecture code.
> > >
> > > That makes sense to me, it just looks like the SiFive ccache is the only
> > > one that's in drivers/soc/$VENDOR, the rest are in arch.  It looks like
> > > mostly older ports that have vendor-specific cache files in arch (ie,
> > > arm has it but arm64 doesn't).  Maybe that's just because the newer
> > > architectures sorted out standard ISA interfaces for these and thus
> > > don't need the vendor-specific bits?  I think we're likely to end up
> > > with quite a few of these vendor-specific cache management schemes on
> > > RISC-V.
> > >
> > > I'm always happy to keep stuff out of arch/riscv, though.  So maybe we
> > > just buck the trend here and stick to drivers/soc/$VENDOR like we did
> > > for the first one?
> >
> > I don't particularly like drivers/soc/ to become more of a dumping
> > ground for random drivers. If there are several SoCs that have the
> > same requirement to do a particular thing, the logical step would
> > be to put them into a proper subsystem, with a well-defined interface
> > to dma-mapping and virtualization frameworks.
> >
> > The other things we have in drivers/soc/ are usually either
> > soc_device drivers for identifying the system, or they export
> > interfaces used by soc specific drivers.
>
> Sounds like that's two "not in my back yard" votes from the maintainers
> in question..
> Doing drivers/cache would allow us to co-locate the RISC-V cache
> management bits since it is not just going to be the ax45mp l2 driver
> that will need to have them.
>
> Would it be okay to put this driver in soc/andestech for now & then move
> it, and the SiFive one, once we've got patches posted for cache
> management with that?
>
I think to start with it would be better if we place the Andes cache
driver in the proposed "drivers/cache" folder. We would avoid
unnecessary movement of code?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
