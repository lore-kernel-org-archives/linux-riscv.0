Return-Path: <SRS0=1I3Q=NO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46D5C432BE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 10:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0FD6138B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 10:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B0FD6138B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MytbOX436EcJqMNfBZwZ4db83kwwZ2aLU10wnFpAFYU=; b=nyrmRQFVMGsLqj
	xTfvM8IFZD+naDm+En5qm9RKhFrgirlVTRuc2a6JXV+UAbvTNTK3KkULMhdomzrDklg9QIYkz6Rew
	Dno6QKw6muGb14hpw2Mgfw2/vHe/eW85SH8RdT51CXeDql4DmE8hFMPMHnag/mnOfES/s09SVeocB
	uP9oWZ4X0d+NBAqDLotOfdPd42Shs1K37sidoOhd/08Hk+PtFYwLo52cTotmAq614wwDFNvykZkUp
	U2Pw463KddHzGOMnGjx2A247EDytWU40a6p0IzzN9Rrq6vLugYeCa0D8aQTgq9ya53cIiqnIkZ+N7
	mPSHDmL7m11wz5ny55NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI6xv-00GIWc-VV; Mon, 23 Aug 2021 10:14:03 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI6xf-00GIPU-Oe; Mon, 23 Aug 2021 10:13:49 +0000
Received: by mail-vs1-f53.google.com with SMTP id h29so8396976vsr.7;
 Mon, 23 Aug 2021 03:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGWlxXbqp4C9V0pOALutj8L5f0IIEa5u3E7vAfklyGo=;
 b=XTJVfyO/aJHGCAT6g0PbK9tuiMlp2mhJmVSbfa+9XF94oFs9FsMoKM7+YF+/fnxhYA
 5VIhyO4TYxno1vuYisb3wwfHY+t6n28qsX9ZSFMCgdB9VJSX37g9FEHfAxf4Y8kkVWgB
 TF3DV6VlhXf3WlEy5JHcbrSpwPMeZvOteADMgeAbVpv8IZSNXxJt5sk2QlCiv73hjsKd
 daaTnD05Y71C1CscLQzF4fEhvz/0xSkXIQJEGer2VnSBMwF+7f+cbsUkBJz0SjgALrFv
 CrhF84LMzzpEx3AbMn+SGoRSXK57W03bwIyBV5R4i1zzubU9x+eRyKLAOM06TDhBntY/
 kJjQ==
X-Gm-Message-State: AOAM533LXbqcbtLfsuVa3cimjPLVbklFUNQtCJjzNlPEMZNoWD6VWGJ6
 7P1I32hCUNzQ+RBvhB1EXjXIA2ckqbfe2E1jJdo=
X-Google-Smtp-Source: ABdhPJyH0E1pyhC89wWPYYQoaEHA/nfpaJPSksxoQnbMkworBUBLdcC7hq0D2zToet9d4s7ykx8MrywnipUtR++lG+Q=
X-Received: by 2002:a67:6e86:: with SMTP id j128mr22666984vsc.26.1629713621125; 
 Mon, 23 Aug 2021 03:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be>
 <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
In-Reply-To: <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Aug 2021 12:13:29 +0200
Message-ID: <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, 
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand <frowand.list@gmail.com>, 
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 kexec@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_031347_875587_DF73B6FD 
X-CRM114-Status: GOOD (  35.78  )
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

Hi Rob,

On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > This patch series adds generic support for parsing DT properties related
> > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > the "/chosen" node), makes use of it on arm32, and performs a few
> > cleanups.  It is an evolution of the combination of [1] and [2].
>
> The DT bits look fine to me. How do you expect this to be merged? I'm
> happy to take it if arch maintainers can ack it.

I had hoped you could take the series...

> > The series consists of 6 parts:
> >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> >      to avoid duplicating elf core header reservation later.
> >   2. Patch 2 prepares the visibility of variables used to hold
> >      information retrieved from the DT properties.
> >   3. Patches 3-5 add support to the FDT core for handling the
> >      properties.
> >      This can co-exist safely with architecture-specific handling, until
> >      the latter has been removed.
>
> Looks like patch 5 doesn't have any dependencies with the series?

Indeed. So you can take it independently.

> >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> >      riscv.
>
> I thought this should be applied for 5.14?

Me too, but unfortunately that hasn't happened yet...

> >   5. Patches 7-8 convert arm64 to use the generic handling instead of
> >      its own implementation.
> >   6. Patch 9 adds support for kdump properties to arm32.
> >      The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
> >      DT properties to crash dump kernel's DTB"[3], which is still valid.
>
> This one can be applied on its own, right?

While that wouldn't break anything (i.e. no regression), it still
wouldn't work if the DT properties are present, and the now-legacy
"mem=" kernel command line parameter is not.

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
