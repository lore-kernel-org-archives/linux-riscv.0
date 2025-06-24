Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA6EC7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dL6dKpf/wCJLrLSMoZr0ijYBK1E69HjCO9NVDzyRHxQ=; b=dAu2sKsIvAJwhW
	wWRdt9FGjJ1DcDBrQzQzcBj4gvoakNp0TwsZ+EluvkJhX3eVizJoV0QLnew5kvWXJvpi8VS7g8Bph
	3Ty0pOEmc3H8W2ipGtxqr66F3p1aI6J27t/2oU2tCWjVCCmtBzxQGDXM42508+PTnqcaYpyIafuM9
	wKxpdbwbOx1LXkRyRBX5AjFpYpEAUkri/c5o0pp965LpbAVXRrvnFphfnLw2QlREDyulcOnOCruVi
	scZUYDllJeA7KURw4TRAIsBtXvbBUPeB2vP2HqGGr3zAVX2Rpv+W/USeotH3hqlnnsWwI+3oINwkO
	8jAnPJ05gJxYpyrVd0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64S-00000006D7C-2804;
	Tue, 24 Jun 2025 16:00:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Jw-00000005ppb-3MmP
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Jun 2025 14:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LJ52+yqkREKU2n9YRiyK+/2J+b9eohTa6Rk0szUFEOE=; b=LWuD3VSWymEY53n/WlHmdkJc/b
	YzK3kQa/G79T7gG+xtXFq2WZipwh5UpGA0W0fv0YtNLauDcMNjOnBv1btZyeFtV47UJun+SZwUEXV
	uDI0vzvMP0wy/8jEW/w0jQ/fDClDP3IEx+LUUiLQOFT0uNwf9zUcb6H8gGMHv4YFN7hiBj7I8hs/W
	Qj3vvnez6pTwAY1sUw30W3AVI3NbRi9TCjvVxAuwKxRiliZRkCWUz01DxPxWiuB31Nu3R0+k94OrY
	pgrjcuyCsoZewvIJ2Xsks3X7KduKPHK7se76aexBvCpHZga1JxgBiSe3YGu8Pcox0h6x6PNnuqr/v
	w87ENWuw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Js-00000005SFZ-33Ob;
	Tue, 24 Jun 2025 14:08:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 905AB307E51; Tue, 24 Jun 2025 16:08:15 +0200 (CEST)
Date: Tue, 24 Jun 2025 16:08:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Nam Cao <namcao@linutronix.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
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

On Tue, Jun 24, 2025 at 03:48:21PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 24/06/2025 15:17, Nam Cao wrote:
> > On Tue, Jun 24, 2025 at 01:37:13PM +0200, Cl=E9ment L=E9ger wrote:
> >> On 24/06/2025 04:09, Maciej W. Rozycki wrote:
> >>> On Mon, 23 Jun 2025, Palmer Dabbelt wrote:
> >>>> I'm kind of split on a Fixes tag here.  One could argue it's a regre=
ssion, as
> >>>> having interrupts disabled during exceptions is going to cause all s=
orts of
> >>>> performance issues for users.  Seems a bit risk to just backport, th=
ough...
> >>>>
> >>>> That said, if nobody noticed then it's probably a good sign nobody i=
s really
> >>>> paying attention and we should just backport it before anyone notice=
s...
> >>>
> >>>  Oh, someone did notice and it's not only performance, cf. =

> >>> <https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.=
orcam.me.uk/>.
> >>
> >> I also had a series which was doing so for misaligned accesses handlin=
g,
> >> but after discussion, it was not ok to do so.:
> >>
> >> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.progr=
amming.kicks-ass.net/
> > =

> > If I understand that right, exceptions from kernel should be treated as
> > NMI, so that lockdep can tell us if exception handlers touch locks.
> > =

> > But (conditionally) enabling interrupts does not lose us that benefit. =
It
> > is still considered NMI by lockdep.
> > =

> > Unless I miss something, the patch is fine as is.

I'm confused, you're wanting to conditionally enable interrupts from a
kernel exception while its NMI like? *WHY* ?!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
