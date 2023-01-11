Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB9CC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfqt+FV4gAr6mKrLsMXHGanePLaAjlaCRDL88ZRk9S4=; b=d1oQYUDUs9y/uD
	gE9ZWt9k0mEf2JmXBLbZxox92UEHMwx2sTAgeZgBPrPDg6Y9RYLt4oYDVGmSdacCu3nURKvoMR+U3
	4B2zox0nifaSvlhR9FVfeCPdqV1xD05Mn/OgqMy6vp8gDAy6fqT2BSD8Rx9bpmyToei7ajHsrlAAU
	qLL8WJ42d08n2nkejVrFiIo46z5wyRLdvPitdQYwJnqTthDQmteaxmqEhW8oUGZxn6YDth8yXISXN
	6RpcfasnfvgGbqxYElpmZCNAC+pQp75ADgRXyqW/YdWOQbkaRPCgpC5wUNe8nvdhMM/ggV6chZHhl
	9nAa0RNyjBbLS3ZsyFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVtN-00A9i3-P9; Wed, 11 Jan 2023 07:51:25 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVpB-00A7CV-Uy
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 07:47:08 +0000
Received: by mail-qt1-f178.google.com with SMTP id a25so5971648qto.10
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 23:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ff8KS3khOYar4Nle3jIhF96wcx/W/4K8Mw+Y8wHR3io=;
        b=h+8YtoCaargDSA2OlSzdIRGhSUYO5BbTkeTwm17m7zchtAO/dsswui9M00p/amNyW9
         nK/geAArFgOgx7H6jwdxDRH9IYT+IeP8jp2CeanmyUOPz4KaXu+RFd4gUgWLWiIHbjyv
         Q7xk/+mTonEULxrfSWt/fKBTrILBI1nKNiOdc3avBrymZaFOrXqtGrmj9D4eRLzdkcWv
         Ocl4hN1ifGYmmHGok5SnZWqirEsTBVIi9u057L41tjksl9lix1PYVqfFEasuLQUkvdcA
         lJWuFuc2t965aQ/dAnkcmTePYcveBkzLGVtBCXsi+39TtMgBTjLqg3WYhJajIHht3OvY
         4gww==
X-Gm-Message-State: AFqh2koC/clRQP+9+beLIFO33H6oD3VbXfdoMzM6qIimgkKtUkHm9TT+
	a2ZYApzjUDvLu0++WjUyKeoWqqfmlmRPXQ==
X-Google-Smtp-Source: AMrXdXuIjVoI6KOFsvIQxIbetXixJj+t4vlUs3wfaM7EEt2An7Tb+fBwJ4/D/hrSDUzpbjXP89FSdg==
X-Received: by 2002:ac8:7310:0:b0:39c:da21:6c06 with SMTP id x16-20020ac87310000000b0039cda216c06mr93851964qto.8.1673423221741;
        Tue, 10 Jan 2023 23:47:01 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id g19-20020a05620a40d300b006cec8001bf4sm8788282qko.26.2023.01.10.23.47.00
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 23:47:01 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 16so14256736ybc.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 23:47:00 -0800 (PST)
X-Received: by 2002:a25:d095:0:b0:7b6:daae:ad50 with SMTP id
 h143-20020a25d095000000b007b6daaead50mr2405273ybg.89.1673423220633; Tue, 10
 Jan 2023 23:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20221121221414.109965-1-conor@kernel.org> <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com> <Y73bJ/kKYo1xJPDK@spud>
In-Reply-To: <Y73bJ/kKYo1xJPDK@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2023 08:46:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiE81kjQhRG3iLe-BSZyXp3mfuvFGddBYg1KSBboM2iQ@mail.gmail.com>
Message-ID: <CAMuHMdUiE81kjQhRG3iLe-BSZyXp3mfuvFGddBYg1KSBboM2iQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234706_020785_F12EFDF4 
X-CRM114-Status: GOOD (  46.28  )
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

On Tue, Jan 10, 2023 at 10:40 PM Conor Dooley <conor@kernel.org> wrote:
> On Tue, Jan 10, 2023 at 10:14:51PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > To facilitate a transfer from SOC_FOO to ARCH_FOO, over a release cycle,
> > > introduce some aliases so that drivers etc that use the SOC_FOO symbols
> > > can be converted.
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch, which is now commit fc43211939bb6874
> > ("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to
> > ARCH_CANAAN") in riscv/for-next
>
> I see this and I immediately know it is going to be bad news!
>
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> >
> > > @@ -73,6 +91,9 @@ config SOC_CANAAN_K210_DTB_BUILTIN
> > >           This option should be selected if no bootloader is being used.
> > >           If unsure, say Y.
> > >
> > > +config ARCH_CANAAN_K210_DTB_SOURCE
> > > +       def_bool SOC_CANAAN_K210_DTB_SOURCE
> >
> > This is not correct, as SOC_CANAAN_K210_DTB_SOURCE below is
> > not a bool, but a string.
> >
> > > +
> > >  config SOC_CANAAN_K210_DTB_SOURCE
> > >         string "Source file for the Canaan Kendryte K210 builtin DTB"
> > >         depends on SOC_CANAAN
> >
> > Hence
> >
> >     obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o,
> > $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
> >
> > will do the wrong thing later, and I get a non-bootable system (no output)
> > on my MAiX-BiT.
> >
> > Unfortunately there is no def_string, so I don't think we can fix this
> > in a backwards-compatible way, and have to replace all
> > SOC_CANAAN_K210_DTB_SOURCE by ARCH_CANAAN_K210_DTB_SOURCE,
> > and urging users to update their .config manually.
>
> That sucks. I'm not sure how I missed this - I had tested originally on
> my k210, but evidently there was something wrong with how I had done it.
> I must have not tested a subsequent revision on the k210. Mea cupla.
>
> As it wasn't my intention to inflict this change without time for the
> symbols to appear in configs, my immediate feeling is that this part of
> the change should be reverted.
>
> Of course, we could so something like:
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 34a54e5310a1..d36a5f39f13a 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -79,7 +79,8 @@ config SOC_CANAAN_K210_DTB_BUILTIN
>           If unsure, say Y.
>
>  config ARCH_CANAAN_K210_DTB_SOURCE
> -       def_bool SOC_CANAAN_K210_DTB_SOURCE
> +       string
> +       default SOC_CANAAN_K210_DTB_SOURCE

Thanks, that works!
I guess it was too late in the evening for me, to realize that the lack of
"def_string" can be worked around using "string" and "default".

>  config SOC_CANAAN_K210_DTB_SOURCE
>         string "Source file for the Canaan Kendryte K210 builtin DTB"
>
> But I am not sure of how that interacts with the various methods of
> updating ones config.
> From, admittedly limited, testing it does get updated if
> SOC_CANAAN_K210_DTB_SOURCE is changed using menuconfig. Similarly, if
> one alters that symbol and does olddefconfig it also gets updated.

With the above, the value of SOC_CANAAN_K210_DTB_SOURCE in existing
config files will be copied to ARCH_CANAAN_K210_DTB_SOURCE when running
"make oldconfig".
Hence in v6.4 you can drop the old SOC_CANAAN_K210_DTB_SOURCE.  As that
symbol is not present in defconfigs, there is nothing to update there,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
