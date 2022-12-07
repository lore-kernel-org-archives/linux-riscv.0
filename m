Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE6C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Csv5s+rveGRYkAG0kkEIo0jRPc789V0lwqhvwzggA4=; b=4MnQIyj9dY1e4S
	fNecuJ0GkWbRV9W86JOCuQochnd+LbF6mx9lJSk1kUbUL5XiG6Dp5NW5Td/IrsPOtBFo5jhKb9Kzf
	g7xVIDqxJe5dC6Um/00HK+XBRi4kl698cOkpBXz5MH8b8FXvZ7remCwLg92X8G1S51DeSdUFnQmhZ
	H1z4MS1EjV0mYQkLoJun7+YQ63HoOAzUTaCO/LLPnVEBO3gCcIbY7nkzWP5goBWyGD8A0Makk7LwZ
	7rup2IV1MVaSPSHnCmff3N/sLrkcgFolqIxgJbB4wbKmLJl/Pg3l9DZqbCSoWC6VLh+LbdvwwCY7L
	tJsyFB40B/ipWsq6UG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qXB-00FwWg-ST; Wed, 07 Dec 2022 09:16:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qX7-00FwUm-Qc; Wed, 07 Dec 2022 09:16:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2045860F18;
	Wed,  7 Dec 2022 09:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52B6C4314F;
	Wed,  7 Dec 2022 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670404563;
	bh=M6Ekm/pBdbN2VgTeBU6QuIeBCliKnzJIhys71gOS+d0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SBj3erXrpM7SKu2ifbOUpX3wKID68lmLvBnU0RGS2/++cQNasZXKvMM2OJ9LTK1eh
	 gc8Ub8ieF6mOax/guLupkvNN6UCV9Mlz86F13PIukxhrLZGPGKnk4zG2kpPmEC5Hws
	 AVdIYQLv09SWsTNXr+6/3iv66otl/zTN+ac2d1BPO1ZREPcEAGbXCKW88gm/jAnON9
	 uSsr2h5EBygWTHNAoFmrj2uiPvmrUAs6uOc9JFBFpEuzElQvo4tzB1EWvZ8l7LUTpK
	 TGS71hUMTk9TFeTQU7+lGkMAqzsXcPRhYRnBmXZkFwhojgKS2+ihPibqENF75FZoCc
	 lPOvHVd3/8j9g==
Received: by mail-ej1-f47.google.com with SMTP id vv4so12507696ejc.2;
        Wed, 07 Dec 2022 01:16:03 -0800 (PST)
X-Gm-Message-State: ANoB5pm3wHbDL58R1aHUi7REpklbUB88WecMuy6lAD7wPwXfUGejI9N4
	cvLTG2QP+BGJEOEXdcymEWZT4HEFqVnrc7t0lZY=
X-Google-Smtp-Source: AA0mqf67yTNxeGO6KdbhCdkH31rJ/Paiugzi9lc5kAdca+uBigxLbwyxQZlYijCAZ9E2wUfKATEqoUcb5D3fczCp98c=
X-Received: by 2002:a17:906:8309:b0:7c0:dab0:d722 with SMTP id
 j9-20020a170906830900b007c0dab0d722mr13703762ejx.353.1670404561525; Wed, 07
 Dec 2022 01:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
 <167002857934.4256.16584443879212253129.b4-ty@rivosinc.com>
 <Y4/KoiFhdvRBDdzH@spud> <CAJF2gTQX6361ME9UkOykvUEQifqioLMqovbfpqugkk174pKqfA@mail.gmail.com>
 <Y5BJ/EeBTEJK2QLF@spud>
In-Reply-To: <Y5BJ/EeBTEJK2QLF@spud>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Dec 2022 17:15:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRFif+Ntkq0MUekRy74uFn1gnzZcGNOAdQakNi68djS_g@mail.gmail.com>
Message-ID: <CAJF2gTRFif+Ntkq0MUekRy74uFn1gnzZcGNOAdQakNi68djS_g@mail.gmail.com>
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	mick@ics.forth.gr, corbet@lwn.net, alexandre.ghiti@canonical.com, 
	vgoyal@redhat.com, bhe@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, bagasdotme@gmail.com, dyoung@redhat.com, 
	Palmer Dabbelt <palmer@dabbelt.com>, heiko@sntech.de, anup@brainfault.org, 
	aou@eecs.berkeley.edu, hschauhan@nulltrace.org, yixun.lan@gmail.com, 
	kexec@lists.infradead.org, heinrich.schuchardt@canonical.com, 
	linux-doc@vger.kernel.org, crash-utility@redhat.com, 
	linux-kernel@vger.kernel.org, k-hagio-ab@nec.com, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_011605_957832_9F2D0788 
X-CRM114-Status: GOOD (  31.84  )
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

On Wed, Dec 7, 2022 at 4:08 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Dec 07, 2022 at 11:34:57AM +0800, Guo Ren wrote:
> > On Wed, Dec 7, 2022 at 7:05 AM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > Hey Palmer, Xianting,
> > >
> > > On Fri, Dec 02, 2022 at 04:49:39PM -0800, Palmer Dabbelt wrote:
> > > > On Wed, 26 Oct 2022 22:42:06 +0800, Xianting Tian wrote:
> > > > > As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
> > > > > need to update according to Bagas's comments.
> > > > > https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/
> > > > >
> > > > > As others patches in above patch set already applied, so this patch set only contains below two
> > > > > patches.
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
> > > >       https://git.kernel.org/palmer/c/649d6b1019a2
> > >
> > > So this patch seems to be causing issues for the nommu build:
> > > https://lore.kernel.org/oe-kbuild-all/202212062250.tR0otHcz-lkp@intel.com/
> > >
> > > I had a bit of a poke at trying to see if there were some headers we
> > > could pull in before actually checking the .config only to see:
> > > # CONFIG_MMU is not set
> > >
> > > Do we have to wrap the whole thing in a `#ifdef CONFIG_MMU` to fix
> > > compilation here?
> > The problem does not belong to the patch.
> >
> > Could I send a fixup patch? like this?
>
> That seems like a sane dependancy, but did you build that config?
> This doesn't fix the problem for me :/
Sorry, It's the wrong fixup. Here is the new version, and tested. Thx
for the report.

https://lore.kernel.org/linux-riscv/20221207091112.2258674-1-guoren@kernel.org/

>
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ef8d66de5f38..d8c07999426c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -512,6 +512,7 @@ config ARCH_HAS_KEXEC_PURGATORY
> >
> >  config CRASH_DUMP
> >         bool "Build kdump crash kernel"
> > +       depends on KEXEC
> >         help
> >           Generate crash dump after being started by kexec. This should
> >           be normally only set in special crash dump kernels which are
> >
> > >
> > > Thanks,
> > > Conor.
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
