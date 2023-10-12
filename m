Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E3CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqAoKzq6C7KaBDAvsLij7tlnnXUpMe9AE1D0Ji//Oww=; b=manWSfklgR4C1cBosRV4RIvtAO
	PRZ5/BHPB7FK11JTxZ5w++Pd3HSB2Xj+rV7v1QwHvZEiRSh5aHkif2BvHCdMZCyk15pWEH5dw97f6
	mFI6WOs8XewtlkcNO4OeTbozhs3WekseTRcStiBwmMdZKQxnp7DmQBa6wc7sVPw5Q3DbQPkyu5RSD
	17vuuQ7DG6UEwnHtmLYAf2TuXLUGTbZ28rDRq12Gpj/EFs+Q88DcgypGbFP/YP54/6v8fkNvO3zMi
	jaBDKbkCKcKL5RK3mswQDkMlaw7qE/64/JGnDH8eYbb8BW1pJZ0cKxX8lPx7/Sh+1l8+qhoUtZGYX
	G+bag2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqz5F-001TYS-0g;
	Thu, 12 Oct 2023 17:02:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqz5C-001TXh-0D
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 17:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E2958B82570;
	Thu, 12 Oct 2023 17:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC8AC433C7;
	Thu, 12 Oct 2023 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697130162;
	bh=Mxx5xcDsCdeHHNTDsB4EsynTeEaTi2VxqTq/qxZ1S0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScSnOHsFzxZVMTMB77NzTWdaLQRQPZEpheOs+3tQ0u4F1MReD2gAZL4TpACxgwzRV
	 29xRH1BVTX8+C00H8ZFrg2BB465HuSi2sZCmS+Gq68XuZnGXc7he7D8YG72gipZydd
	 lyPod/igZlt7FTFsEbPLj1+jEq3UMTv2120aK/C1ewOjoE1FpHNl/kRX1LPv0/HHcb
	 U4QP0Of01bKl/e5Q4m99PJ+OFTQB46cRqZXrV/w1FLSGisNYTA7ibyI1ejqqDP1s4v
	 lrUuVfob2gfJF68jj15rLUqPGUkMGRbyJTd+wE8bw3jXIbgCaFJhBrMGJ3tWW+3xL6
	 X+snySnije1EA==
Date: Thu, 12 Oct 2023 18:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231012-unflawed-unison-cdb6921776c6@spud>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com>
 <20231012-geologist-ramp-71c76a4305c7@spud>
 <20231012-3dc2e811d6a57ffe90719d2a@orel>
 <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_100246_382211_02DD9A7A 
X-CRM114-Status: GOOD (  23.73  )
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
Content-Type: multipart/mixed; boundary="===============2003986264433351470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2003986264433351470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YOWcimuW/i6Dugie"
Content-Disposition: inline


--YOWcimuW/i6Dugie
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 09:42:39AM -0700, Evan Green wrote:
> On Thu, Oct 12, 2023 at 9:11=E2=80=AFAM Andrew Jones <ajones@ventanamicro=
=2Ecom> wrote:
> >
> > On Thu, Oct 12, 2023 at 02:45:14PM +0100, Conor Dooley wrote:
> > > On Wed, Oct 11, 2023 at 03:56:13PM +0200, Andrew Jones wrote:
> > >
> > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > @@ -0,0 +1,276 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * The hwprobe interface, for allowing userspace to probe to see w=
hich features
> > > > + * are supported by the hardware.  See Documentation/riscv/hwprobe=
=2Erst for more
> > > > + * details.
> > > > + *
> > > > + * Copyright (C) 2012 Regents of the University of California
> > > > + * Copyright (C) 2014 Darius Rad <darius@bluespec.com>
> > > > + * Copyright (C) 2017 SiFive
> > >
> > > So uh, this is all new(ish) code, originally written last September,
> > > that is being moved, right?
> >
> > Yeah, I just pulled the Copyrights over by standard practice of code
> > movement, but I agree they don't make much sense for the code I moved.
> > I suck at copyright management and would be happy for suggestions here.
> > If Rivos would like to put one here for the work Evan did, then I'll be
> > happy to add it. Or, if people prefer, I could add a Ventana copyright.
>=20
> I probably would have stuck a Rivos banner on it if I had written it
> as a new file myself, as I think they "own" the work I do. But it all fee=
ls
> a bit like vanity license plates given it's GPL, so I imagine whatever
> you do will get no real complaints.

Aye, that's how I see it too. I've not bothered adding that stuff where
I could help it. The git history shows who made copyrightable changes to
the file anyway, but obv. I am no lawyer.
Just in this case, since as far as I could tell this code was written
=66rom LPC onwards, it made little sense to copy over some 2012 era
copyright information.

Thanks,
Conor.

--YOWcimuW/i6Dugie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgmrgAKCRB4tDGHoIJi
0riHAP9HQGTqFMMcRQc/8aJ+ZyATeMnFwy8nqkWeh9pPzYkbWQD9EZc6m5o7fRPo
0rvHrrd2wYohOUUbPuzxzeVZrKQ2yw4=
=uKof
-----END PGP SIGNATURE-----

--YOWcimuW/i6Dugie--


--===============2003986264433351470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2003986264433351470==--

