Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC8EC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 06:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3132176B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 06:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXFAvBNE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6CsRWmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3132176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vMjQN4IelqVH2hf/Qcf5CiBQZEjVX3v4IEnKrG2T6vQ=; b=jXFAvBNEHHoPjjrXHNAj0ba4E
	6kuH2LdLSlNPvSOC67buEU2sHHH5ToZszGHDHMsr32XO35p/D9mwUmIRHbLY1cCGbhB/1ScQtKwd6
	uDxNk+meabMeU0HhiMc30FR5neolbQEQ2LoeHx905TUcD1L52OwEtN2aPCjJ0JuwTWGTThkivbPNe
	l+2TyiNE5Q+4LOQ97hKYPH3uH9xzAE+IghRYegxw8pYbZW9qSLXUpR8ZGoP/wM2dr7yw+W8HvY/kx
	GcH/s3i3UzOwG/GcEYI/0AIdRckm8DjeIQ19GCAFnG2njdcT8u3Uwm0bCBSxKR0p6IFHOXAzFe3uE
	MJKEz+OYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxPDE-0005pe-AH; Mon, 20 Jul 2020 06:23:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxPDB-0005ol-Gx
 for linux-riscv@lists.infradead.org; Mon, 20 Jul 2020 06:23:42 +0000
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B97BA2176B
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595226220;
 bh=FWQE8h03YB9otNyLDGP6oLxadjk+HVDXF0TxF12WqIA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E6CsRWmFx27wtggInTT+Eq+PnmXSOe5CsXBg3NBRz61gGiaIMdiV76/qiUkgmi+h1
 c0sRMJ9XLnRa7w3G/x6xd/GtE1Bcw/PRr4L+DuHDfsM3mdIRc4/8GqQJ1WhgtV/txG
 6oVh8G/RIIXd1O52ajeHlosg3+uAtckpswC7Cocg=
Received: by mail-oi1-f177.google.com with SMTP id l63so13548398oih.13
 for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2020 23:23:40 -0700 (PDT)
X-Gm-Message-State: AOAM533RMoCygZaOO0QoUdl/KyLLyed9O1N1vB1DhoYqbqHkkVDgf9Re
 TXqO5CIlLA3y/eUP0KuGPKLlZUb+L9JCmoXHl7E=
X-Google-Smtp-Source: ABdhPJx2eZPX+Du0h3MntSi8Lx2ZwOblQJP5TQZfjG06lTvBIQu5Px4XC0ruV12geeyFMovJ9du/6fBwtK0/5GNoES4=
X-Received: by 2002:aca:f257:: with SMTP id q84mr17293654oih.174.1595226220136; 
 Sun, 19 Jul 2020 23:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200708054354.25283-1-maochenxi@eswin.com>
 <mhng-8695bbb1-2ef2-409f-a458-3eb68d87495f@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-8695bbb1-2ef2-409f-a458-3eb68d87495f@palmerdabbelt-glaptop1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 20 Jul 2020 09:23:28 +0300
X-Gmail-Original-Message-ID: <CAMj1kXEAwuuR_tENNQ-_fTFHkh7g+hiH38SM=yYmoOu6ipU3tw@mail.gmail.com>
Message-ID: <CAMj1kXEAwuuR_tENNQ-_fTFHkh7g+hiH38SM=yYmoOu6ipU3tw@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: Enable compiler optimizations
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_022341_723446_7F497121 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, maochenxi@eswin.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chenxi.mao2013@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 19 Jul 2020 at 07:45, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 07 Jul 2020 22:43:54 PDT (-0700), maochenxi@eswin.com wrote:
> > Enable ARCH_HAS_FAST_MULTIPLIER and ARCH_SUPPORTS_INT128 for better
> > code generation.
> > These 2 configurations works fine on GCC-9.3 and GCC-10.1
> >
> > Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> > ---
> >  arch/riscv/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 128192e14ff2..f21b7e5188ca 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -26,6 +26,8 @@ config RISCV
> >       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> >       select ARCH_WANT_FRAME_POINTERS
> >       select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> > +     select ARCH_HAS_FAST_MULTIPLIER
> > +     select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000 || CC_IS_CLANG
>
> IIRC int128 is only supported on 64-bit targets, and we already have this under
> RV64I but with a different set of requirements.  It looks like everyone has a
> different set of requirements, but I feel like CC_HAS_INT128 is the right way
> to go.  I'm not sure why we have the version check there.  Ard: do you know why
> we would need both?
>

That looks like copy/paste from the arm64 tree to me, where the names
of the libgcc routines were changed at some point, and we only support
the newer ones in the kernel.

> The fast multiplier one looks fine to me.  They're supposed to stay
> alphabetical, though.
>
> >       select CLONE_BACKWARDS
> >       select COMMON_CLK
> >       select EDAC_SUPPORT

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
