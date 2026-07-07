Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5E3C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 06:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNViIKYHSMWmfymyZbaF0N+Xnl5nxxcNOwKqlPaS79k=; b=Iw6FcCYR+bWVAt
	cwHRTK+btKT9XkYTv9TadlXfWXOHSRr700gjowjY0i5Xw/xDsCQ1p8S3aRu9GP3rPXLZL7AdSeQRB
	qKcx1ewFK6CnTg4xm/UkQKvvIvM6buwUJt4U0iGmtqb07oqhJTDWjqQL171Hya9J2qDzP4JPlDhwR
	X1ZGsOMdB5g/7hLgo/ko/XT8+2GKYxd7UGAUv+LN4Z4dQx3fJkvp+/5MKfzMTOJyigHlVGbbRLhqu
	kTOpt9lUB5WB0Z1Mv+jpVrsOFtMMTJK9JAQKvzEIbxIDWsbTGyliZQHAXUs1IdjPLzxZ1ET1lyQGf
	yJeGoVP/nwi5RkuVDMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz0k-0000000EAnL-2giE;
	Tue, 07 Jul 2026 06:10:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz0i-0000000EAmt-2V5r
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 06:10:26 +0000
Date: Tue, 7 Jul 2026 08:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783404619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0G9aukPV8pHjfG+rgqcQ/xQgpRWVh1vDYEUguo9B9Ag=;
	b=ZwmlMDRN9xRHfKOH5ruRR1URwK7dGw9QLIo/Qh0p5RPvQiLOMmbvkJHa+C1B/tAF1xi7OC
	20fO60M/VWCv1vtHjBCf52h+pqyXJ/5toDs0w07W0z7YpSyhRmEM7KkA9HwCNBcHKApK4C
	etG9k7ICTkBGR0zg3mNq6YQUUwfkDdeJNuOs4AccYHNfqIwn9AGL52TPKzdDXInSOBTIqM
	RGQ64SNvm57vbngaxCUM6O/xCVcLxboCaXCd1W91xOKwLtpxLRdQ1si92oJOAaCUZkUBPu
	gV6Jbb5haelguk1Q8vJfZT/rdvFonH4uvUAVlR64Uyfm8uV8lc1n/ROAtmc7qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783404619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0G9aukPV8pHjfG+rgqcQ/xQgpRWVh1vDYEUguo9B9Ag=;
	b=sy2kZwDTxAMLzqOr8h49dlNPDrKsyK/x6j4NGuclLiX5Jz+hKAwucdCw92/wYzD7GQORNZ
	iQTynay+/hT3JeAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: vdso: Do not use LTO for the vDSO
Message-ID: <20260707080753-4e88aca1-b88d-4f6c-b37a-f7f3064bda5e@linutronix.de>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
 <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
 <20260706210158.GA73349@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706210158.GA73349@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_231024_803825_A1D6098C 
X-CRM114-Status: GOOD (  18.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2026 at 02:01:58PM -0700, Nathan Chancellor wrote:
> On Wed, Jul 01, 2026 at 11:21:22AM +0200, Thomas Wei=DFschuh wrote:
> > With LTO enabled the compiler assumes that the vDSO functions are not
> > used and optimizes them away completely. Currently this happens to
> > __vdso_clock_getres(), __vdso_clock_gettime(), __vdso_getrandom(),
> > __vdso_gettimeofday() and __vdso_riscv_hwprobe().
> > =

> > Disable LTO for the vDSO, as these functions are hand-optimized anyways.
> > =

> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202606301855.WvkSC4kD-lkp=
@intel.com/
> =

> While this change seems correct, is this really the fix for that report?
> It seems like that error happens in clang but I would expect this sort
> of issue to only appear once LTO has run through ld.lld?

At this point the vDSO userspace library has already run through ld.lld.
That has optimized away the futex symbols, which means their offsets are not
defined when building the regular vDSO *kernel* code.

> > Fixes: 021d23428bdb ("RISC-V: build: Allow LTO to be selected")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/riscv/kernel/vdso/Makefile | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > =

> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/M=
akefile
> > index a842dc034571..43ee881f6c6f 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -69,9 +69,9 @@ CPPFLAGS_$(vdso_lds) +=3D -DHAS_VGETTIMEOFDAY
> >  endif
> >  =

> >  # Disable -pg to prevent insert call site
> > -CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> > -CFLAGS_REMOVE_getrandom.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> > -CFLAGS_REMOVE_hwprobe.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> > +CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $=
(CC_FLAGS_LTO)
> > +CFLAGS_REMOVE_getrandom.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_=
FLAGS_LTO)
> > +CFLAGS_REMOVE_hwprobe.o =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FL=
AGS_LTO)
> >  =

> >  # Force dependency
> >  $(obj)/$(vdso_o): $(obj)/$(vdso_so)
> > =

> > -- =

> > 2.55.0
> > =

> =

> -- =

> Cheers,
> Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
