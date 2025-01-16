Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB49C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N8LLCjtY9+FX2nO4BLIydxoF+g4wZfaeKKw6l/1yfo=; b=PKLPQWJ1jA6ZIU6hyluY9sS/me
	AfsT0EA1PrSkMozPOLEMP1VFYHOafQMHlZyabIldlJUSPuOkY/3wqHzZed/PdddD7dXPGInEAY1Kk
	Je7W9RSG2U3FEL/gd0Q/BOhq3lNjcfeVF18RcRSmfYXjyiynVnJqTPkmrnHuolv5YZzs9zCea27U9
	v5Uw89oaGuNXSg0baB7lATlj2yiskDY7rXCcSMnvrDHlXpspJQYEuOPuLt8/48ie33ncAdNZuxiHW
	dJCBI7Xqljv+mfY7MnR7J2KrrJ/fCQaMhM5vfoW4XQyitSHBVojy+8zJKjCXKN1fwmFEopZDMwmwm
	tvx7cmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT0l-0000000FZAH-409p;
	Thu, 16 Jan 2025 16:46:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT0j-0000000FZ8y-0slE
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 16:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 056685C4ED1;
	Thu, 16 Jan 2025 16:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A581DC4CED6;
	Thu, 16 Jan 2025 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737045984;
	bh=L/KZG4Pm9PuHsf+j03WeS+nOje6TuEkm+2ySm7d+8gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOfFT6hzINfBNG2t5Ib7U6Py9ZdRmVfFv4p5E5ARNWl0UfYKz+JM87qYpw114/8v7
	 +OM7BfMT183k0cdGd6LHwGhxgZmUY+rO/OeOiNM221osCENMeW2mfIwdVCYj235ZEA
	 CQgCTLnmrB+XOQXQinlOsrRxxWKGN3tEvHL1Er1dnRrycMJ0VcKeqYHL+uwFWXltKC
	 vXgGHMG9+4GtMN1LqLStiFDs7bYVq1/e/oVp4K9Xt03l/0DyvbEzlBDj2i2gDczd0S
	 ZhyY/jPEyrdgM6ISRnREe77DVAOIm4CYrKwKFrwi3oA9Pr58m8+9c22zz9C57K78xO
	 NRdOteiiOwIJA==
Date: Thu, 16 Jan 2025 16:46:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, conor.dooley@microchip.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20250116-debatable-hazelnut-6501986373fa@spud>
References: <20250115001309.GA508227@bhelgaas>
 <20250116154253.GA584488@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20250116154253.GA584488@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_084625_340937_5283058E 
X-CRM114-Status: GOOD (  32.53  )
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
Content-Type: multipart/mixed; boundary="===============5469574870533706291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5469574870533706291==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dISYL3zSj/IQb+CW"
Content-Disposition: inline


--dISYL3zSj/IQb+CW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 09:42:53AM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 14, 2025 at 06:13:10PM -0600, Bjorn Helgaas wrote:
> > On Fri, Oct 11, 2024 at 03:00:41PM +0100, daire.mcnamara@microchip.com =
wrote:
> > > From: Daire McNamara <daire.mcnamara@microchip.com>
> > >=20
> > > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind on=
e of
> > > three general-purpose Fabric Interface Controller (FIC) buses that
> > > encapsulate an AXI-M interface. That FIC is responsible for managing
> > > the translations of the upper 32-bits of the AXI-M address. On MPFS,
> > > the Root Port driver needs to take account of that outbound address
> > > translation done by the parent FIC bus before setting up its own
> > > outbound address translation tables.  In all cases on MPFS,
> > > the remaining outbound address translation tables are 32-bit only.
> > >=20
> > > Limit the outbound address translation tables to 32-bit only.
> >=20
> > I don't quite understand what this is saying.  It seems like the code
> > keeps only the low 32 bits of a PCI address and throws away any
> > address bits above the low 32.
> >=20
> > If that's what the FIC does, I wouldn't describe the FIC as
> > "translating the upper 32 bits" since it sounds like the translation
> > is just truncation.
> >=20
> > I guess it must be more complicated than that?  I assume you can still
> > reach BARs that have PCI addresses above 4GB using CPU loads/stores?
> >=20
> > The apertures through the host bridge for MMIO access are described by
> > DT ranges properties, so this must be something that can't be
> > described that way?
>=20
> Ping?  I'd really like to understand this before the v6.14 merge
> window opens on Sunday.

Daire's been having some issues getting onto the corporate VPN to send
his reply, I've pasted it below on his behalf:

There are 3 Fabric Inter Connect (FIC) buses on PolarFire SoC - each of
these FIC buses contain an AXI master bus and are 64-bits wide. These
AXI-Masters (each with an individual 64-bit AXI base address =E2=80=93 for =
example
FIC1=E2=80=99s AXI Master has a base address of 0x2000000000) are connected=
 to
general purpose FPGA logic. This FPGA logic is, in turn, connected to a
2nd 32-bit AXI master which is attached to the PCIe block in RootPort mode.
Conceptually, on the other side of this configurable logic, there is a
32-bit bus to a hard PCIe rootport.  So, again conceptually, outbound addre=
ss
translation looks like this:

                 Processor Complex =C3=A0 FIC (64-bit AXI-M) =C3=A0 Configu=
rable Logic =C3=A0 32-bit AXI-M =C3=A0 PCIe Rootport
		 (This how it came to me from Daire, I think the =C3=A1 is meant to
		 be an arrow)

 This allows a designer two broad choices:

    Choice of FIC (effectively choice of AXI bus)
    Ability to offset the AXI address of any peripherals they add in the
    Fabric.

=20

So, for the case of an outbound AXI address, from the processors=E2=80=99 p=
oint
of view (or Linux=E2=80=99 point of view if you prefer), the processor uses=
 a
64-bit AXI address, then =E2=80=93 in a very general way of viewing the pro=
cess
and thinking only about accessing the PCIe device =E2=80=93 the FPGA logic =
can
be configured to adjust that AXI-M address to any arbitrary =E2=80=9Caddres=
s=E2=80=9D
before it passes that new =E2=80=9Caddress=E2=80=9D to the Root Port over a=
 second 32-bit
AXI bus (the main constraint is that the FPGA logic can only use a 32-bit
address on that AXI-M interface to the Root Port).

=20

To manage this complexity, Microchip have design rules for customers
building their FPGA logic where we strongly recommend that they only
interact with  the upper 32 bits of the 64-bit address in the FPGA logic
and pass the lower 32 bits through (unmodified) to the AXI-M side of the
PCIe Root Port. This allows them to =E2=80=9Cmove=E2=80=9D a 64-bit AXI-M w=
indow for their
PCIe Root Port (as viewed by the processor) for their particular design =E2=
=80=93
if they need to - so that they can also access any other AXI-M windows
associated with any other peripherals they might add to their design.

=20

In practise, so far, all customers, and our own internal boards have all
started by using one of two major reference designs from us (one using FIC1
where the AXI-M window destined for the PCIe Root Port starts at 0x20000000=
00
and one using FIC2 where its AXI-M window, again destined for the PCIe Root
Port starts at 0x3000000000).

best,

daire

--dISYL3zSj/IQb+CW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4k32wAKCRB4tDGHoIJi
0r8aAP9OljF2t/djmQEXjTcwQv5O/kjOlC4cmIz8YFYInFE7uQEAir30agpuqLBv
IoeWvvIUCLBDbl111pYfb88kL/pz0gY=
=NBkU
-----END PGP SIGNATURE-----

--dISYL3zSj/IQb+CW--


--===============5469574870533706291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5469574870533706291==--

