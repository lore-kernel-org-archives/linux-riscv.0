Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC6EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeN+kWscaFUxplzx3DiJVk0gGeFSuVb4bbWYmwalqW0=; b=U9TBFPJ7tG/aZILUwIPkJ++o2+
	CkGdeZ/L+jTGgy+7iJQEJFZVWiJqgM6HbrPpYhF2j5+TwW7T+ySIBPi3CJbhqgJyNUODwNcQ88TKp
	xx87V2qbk7QWHdfY9RWFHFaE7xKRa4+56tATDvLVNGltez6tgvmu0BtuWmGVLce7OjjbevyLuqd90
	SNdwZ2ZGatlareVy4SbYKIVmittFj0XrIn+pWs4QlAP0uBbB+YGDV+QN6pvslR0Mtso3umo660XBn
	2hwOr9OVwTmjQzsZjbytj/ELpZEm6OjegJOMCTCojahxTaWrG79ejfiFgGYczxzE/YM9vNw4I16P4
	94P8QZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYcI-00BvTb-11;
	Thu, 20 Jul 2023 18:43:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYcG-00BvSp-0X
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 18:43:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A38F561BF5;
	Thu, 20 Jul 2023 18:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42364C433C8;
	Thu, 20 Jul 2023 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689878587;
	bh=CftVQWk9Ijln5SVTcZMMv33xaJ0bY8lCQxLn3uWe+u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWOLF1qZRL5dRGzrRnnBDYpuKqqusqAOMnAksX3CZSt2fOKP7D6z6RPQcXQhIaTqo
	 cjnztL8x8ghDIZ12l5IMpd4qMC9edIXDhe2ZbOYtm+tXiObFWfhl/cVJh9YykknmGg
	 QFyX18cwCd4dB+WugtRgoIUi0E2/ycIPjg3ek0uITg0g+QStf1QhWXRI4swhpoaqzC
	 AZsEuGk5Fbu3AQbRMtatg9znWxftPqKTLsxWzzFYL28euQ87Wg5okOonIW1vDVv/iT
	 JlhnVfu7nIlrqm11+P3Tx3pMz9RD/jgsSnuB1rGXcIVqDVyBjwIkavAlifczeMt0Om
	 c7UnWdHQheo/Q==
Date: Thu, 20 Jul 2023 19:43:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
Message-ID: <20230720-heftiness-refill-465b3d122049@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr>
 <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_114308_287954_4B365467 
X-CRM114-Status: GOOD (  20.16  )
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
Content-Type: multipart/mixed; boundary="===============1115070419464877547=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1115070419464877547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="41cqKGBWt2/BBb8/"
Content-Disposition: inline


--41cqKGBWt2/BBb8/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 11:00:10AM -0700, Tomasz Jeznach wrote:
> On Wed, Jul 19, 2023 at 8:12=E2=80=AFPM Nick Kossifidis <mick@ics.forth.g=
r> wrote:
> > On 7/19/23 22:33, Tomasz Jeznach wrote:
> > The description doesn't match the subject nor the patch content (we
> > don't jus enable interrupts, we also init the queues).
> >
> > > +     /* Parse Queue lengts */
> > > +     ret =3D of_property_read_u32(pdev->dev.of_node, "cmdq_len", &io=
mmu->cmdq_len);
> > > +     if (!ret)
> > > +             dev_info(dev, "command queue length set to %i\n", iommu=
->cmdq_len);
> > > +
> > > +     ret =3D of_property_read_u32(pdev->dev.of_node, "fltq_len", &io=
mmu->fltq_len);
> > > +     if (!ret)
> > > +             dev_info(dev, "fault/event queue length set to %i\n", i=
ommu->fltq_len);
> > > +
> > > +     ret =3D of_property_read_u32(pdev->dev.of_node, "priq_len", &io=
mmu->priq_len);
> > > +     if (!ret)
> > > +             dev_info(dev, "page request queue length set to %i\n", =
iommu->priq_len);
> > > +
> > >       dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> > >
> >
> > We need to add those to the device tree binding doc (or throw them away,
> > I thought it would be better to have them as part of the device
> > desciption than a module parameter).

Aye, I didn't notice these. Any DT properties /must/ be documented.
To avoid having to make the comments on v2, properties should also not
contain underscores.

> We can add them as an optional fields to DT.
> Alternatively, I've been looking into an option to auto-scale CQ/PQ
> based on number of attached devices, but this gets trickier for
> hot-pluggable systems. I've added module parameters as a bare-minimum,
> but still looking for better solutions.

If they're properties of the hardware, they should come from DT/ACPI,
unless they're auto-detectable, in which case that is preferred.
To quote GregKH "please do not add new module parameters for drivers,
this is not the 1990s" :)

--41cqKGBWt2/BBb8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLmANQAKCRB4tDGHoIJi
0h1LAP4qwV/U4fkdeNz/O5eIUZiTgJRLrGctJ7hxwjCOtnYH2QD/UrUGAZU83zSg
IC1ocFNxT4sq0rSSzdqwA6y4crpD3g0=
=fI39
-----END PGP SIGNATURE-----

--41cqKGBWt2/BBb8/--


--===============1115070419464877547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1115070419464877547==--

