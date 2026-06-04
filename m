Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D247FCD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HrZ92it5yCy3aA5rP7yfz+nqBcnjj3cX0yRonVDr4U=; b=I25cO1XZFZQe40JYDle3NpMd6r
	OB5GCyXWy2XgJ47KZ6fNAe9PLRnGMcMfUIrCUrxq8za/Pyilvfmma1eePbFsOiS0Yz9V5+DGCaqPG
	Qpuu3ewkz3pznfZK+1+6gYq+JVTXXNiYOoE32KVA5IhTceWWcpJEwZhX+xTL5VQ2n7DfRaVVPRSL1
	CsO53mMux00wWCJgIW+LTSw3WhYmqa2HSUyRzrDMg32NYU97rnT49ivJtWkNj+yFK0Swlp6PKeP5+
	l9ImqXqNFZ8PEKgiP9Dozd0UP5IWyx/T56FT+5Dp7rWz0BjiJmnwFyTdQOOQ0nuCf9y435JWjW3nZ
	J0jxwIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9tE-0000000GzHQ-1rlw;
	Thu, 04 Jun 2026 15:21:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9tD-0000000GzHK-2UaT
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 15:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 020FB43D71;
	Thu,  4 Jun 2026 15:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653ED1F00893;
	Thu,  4 Jun 2026 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780586506;
	bh=rNXu5vlyUp20j0lkuwA02imfoYsYySZFap+UN2578YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jSwUD/vx03k97gkxf73hmsULtntt+AB0U9F5ztPshiUgpci4SY0Snt1TbQZNDucJz
	 tAGxb107U8gMULWBHrHa/P6ABa72f9wmw1pj2uebDEQ+P/TVZYko6nNj6wJ5xfaGGq
	 L+h9cm/Nz51ZlDhUy8e1Tb1pbNig9ZZnqZeAYaOcUvoNdzY402vbfDXcBWoNXU8APq
	 XLo0iDppmAljwjf/Rni+LxGl2IEc5PAF3aYtGSiH1esZLocOfJuFZffgP3IM3OUE8d
	 hOK7OM2Wj6x+Yt5fadUORbAXiA8AY2oVMRdWDZqLa0AIC2gVdkf9KqGZHWQxyGYk+k
	 FznWG8ZGWYJ8g==
Date: Thu, 4 Jun 2026 16:21:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Message-ID: <20260604-phonics-venue-48a4f241aed0@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-5-joel@jms.id.au>
 <20260603-tadpole-slept-8b6eeae9cd47@spud>
 <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1347608196323042153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1347608196323042153==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8AdWtpYdmztO+Y3B"
Content-Disposition: inline


--8AdWtpYdmztO+Y3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 12:09:06AM +0930, Joel Stanley wrote:
> On Wed, 3 Jun 2026 at 18:53, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Jun 03, 2026 at 05:12:16PM +0930, Joel Stanley wrote:
> > > Document the bindings for the RISC-V ACLINT.
> > >
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  MAINTAINERS                                   |  1 +
> > >  .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++=
++
> > >  2 files changed, 53 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,acl=
int-mtimer.yaml
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 2fb1c75afd16..43dd9873bbc5 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -23005,6 +23005,7 @@ M:    Joel Stanley <jms@oss.tenstorrent.com>
> > >  L:   linux-riscv@lists.infradead.org
> > >  S:   Maintained
> > >  T:   git https://github.com/tenstorrent/linux.git
> > > +F:   Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > >  F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-pr=
cm-rcpu.yaml
> > >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> > >  F:   arch/riscv/boot/dts/tenstorrent/
> > > diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mti=
mer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > > new file mode 100644
> > > index 000000000000..192ff3fcf79f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V Advanced Core Local Interruptor (ACLINT)
> > > +
> > > +maintainers:
> > > +  - Joel Stanley <jms@oss.tenstorrent.com>
> > > +
> > > +description:
> > > +  This RISC-V ACLINT specification defines a set of memory mapped de=
vices which
> > > +  provide inter-processor interrupts (IPI) and timer functionalities=
 for each
> > > +  HART on a multi-HART RISC-V platform. The specification can be fou=
nd at
> > > +  https://github.com/riscvarchive/riscv-aclint/
> >
> > This is a draft specification, so having a "riscv,aclint-mtimer"
> > compatible is not appropriate. Ordinarily I would say that you should be
> > able to do this once frozen, but this spec is archived and unlikely to
> > have that happen.
>=20
> I've reworked the binding to reference the privileged spec, which is
> ratified and has a section on the timer registers:
>=20
>  https://docs.riscv.org/reference/isa/priv/machine.html#3-1-2-1-machine-t=
imer-mtime-and-mtimecmp-registers
>=20
> I'll post a v2 now for review.

To be clear, the problem isn't referencing the draft spec (that is what
you implemented after all). It's the "riscv,aclint-mtimer" compatible
that's the problem.

Cheers,
Conor.

--8AdWtpYdmztO+Y3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGX7QAKCRB4tDGHoIJi
0vTRAQDzvkqDvDBgmW8zVUGKP1vRoOqB+GdXBl9ycZaE4Cw41AD/fN2KfKHUuPj5
yozlcb1Ufz4WJdqX8+Sckw6bhX1MegM=
=N2dA
-----END PGP SIGNATURE-----

--8AdWtpYdmztO+Y3B--


--===============1347608196323042153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1347608196323042153==--

