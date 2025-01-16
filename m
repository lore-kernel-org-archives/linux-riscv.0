Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF92C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHIFUEovvgFCTfDddO9S22XCtxpM4HTMhRZd4tXGbTc=; b=RJXy1pArLhza81EeKrA/6VxES7
	apDX3mRIz8JKIFzXX3F0odeGl05gNf7cHoxaUwkD8ZS4bMwFtTts3Na4XfHVfMVsP9lttfRluP5Dp
	+qCoeM6lDFcSjH7vHdyvIMt0o2HfZUq/TYAYcaerDMrGCcyIEglXARKzDTzFUj1wI9A41CVnt1pku
	zB7C1SG8Rz3bVFL3Bs5lBFUXosdG+7/wGKt80RsgPK6APbN531jWd0qN1MUci0Ie32Q11FQ4GxORN
	XKCadeZvHgVK3940ZAdFzk0DBetnxtQSM+b7yGAl4OdDRxQCa8EdGuCFofA88bLQkE7zUeJkpHz/T
	RlC19fjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYU0B-0000000FjJJ-0sD9;
	Thu, 16 Jan 2025 17:49:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTw3-0000000FiiF-2LI9
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 17:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5973C5C5EF9;
	Thu, 16 Jan 2025 17:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB72C4CEE3;
	Thu, 16 Jan 2025 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737049538;
	bh=qOP/8quEcjkZRdzXe+Lb3c+dZNV8PtSVtkdwFebc86U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ucq6Fxsp3FaH9qF1zKC7O752HhKjVflCMr7HG6CEY28cdgbyyGfIj90PidSNJ9X8K
	 LdrloCEKQNLLcihvhXUDdj0Snb2k5oNExy1Dd9bihoNkRaFnp4YB02HO01Yn3205GY
	 R6dpXDb7+lRfsrQWEHtjXSC9vYFbSq9qgLa/U2RqeXaGX9/xAoxV56NY8U9XRu6zbP
	 MODAVVfE2OKoEqZLEU1KLW3PHjrk0EhONL0vI1A9y5csqNaMKNKdfj9qEyd7RFUlBz
	 haDVmJ7EQ1FnzAh3Z3lQgU9BrG2Zx81zMypJMgA6+R4z4LGG2+bomk21cmJ/EAFgkJ
	 z79sGq50Wi4vg==
Date: Thu, 16 Jan 2025 17:45:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, conor.dooley@microchip.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v10 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20250116-removed-evoke-1908811ab92a@spud>
References: <20250116-debatable-hazelnut-6501986373fa@spud>
 <20250116170722.GA589558@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20250116170722.GA589558@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094539_690682_C66B6202 
X-CRM114-Status: GOOD (  44.02  )
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
Content-Type: multipart/mixed; boundary="===============5035361410441653762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5035361410441653762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yFBjah3xDxz6Ta9d"
Content-Disposition: inline


--yFBjah3xDxz6Ta9d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:07:22AM -0600, Bjorn Helgaas wrote:
> [+cc Frank, original patch at
> https://lore.kernel.org/r/20241011140043.1250030-2-daire.mcnamara@microch=
ip.com]
>=20
> On Thu, Jan 16, 2025 at 04:46:19PM +0000, Conor Dooley wrote:
> > On Thu, Jan 16, 2025 at 09:42:53AM -0600, Bjorn Helgaas wrote:
> > > On Tue, Jan 14, 2025 at 06:13:10PM -0600, Bjorn Helgaas wrote:
> > > > On Fri, Oct 11, 2024 at 03:00:41PM +0100, daire.mcnamara@microchip.=
com wrote:
> > > > > From: Daire McNamara <daire.mcnamara@microchip.com>
> > > > >=20
> > > > > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behin=
d one of
> > > > > three general-purpose Fabric Interface Controller (FIC) buses that
> > > > > encapsulate an AXI-M interface. That FIC is responsible for manag=
ing
> > > > > the translations of the upper 32-bits of the AXI-M address. On MP=
FS,
> > > > > the Root Port driver needs to take account of that outbound addre=
ss
> > > > > translation done by the parent FIC bus before setting up its own
> > > > > outbound address translation tables.  In all cases on MPFS,
> > > > > the remaining outbound address translation tables are 32-bit only.
> > > > >=20
> > > > > Limit the outbound address translation tables to 32-bit only.
> > > >=20
> > > > I don't quite understand what this is saying.  It seems like the co=
de
> > > > keeps only the low 32 bits of a PCI address and throws away any
> > > > address bits above the low 32.
> > > >=20
> > > > If that's what the FIC does, I wouldn't describe the FIC as
> > > > "translating the upper 32 bits" since it sounds like the translation
> > > > is just truncation.
> > > >=20
> > > > I guess it must be more complicated than that?  I assume you can st=
ill
> > > > reach BARs that have PCI addresses above 4GB using CPU loads/stores?
> > > >=20
> > > > The apertures through the host bridge for MMIO access are described=
 by
> > > > DT ranges properties, so this must be something that can't be
> > > > described that way?
> > >=20
> > > Ping?  I'd really like to understand this before the v6.14 merge
> > > window opens on Sunday.
> >=20
> > Daire's been having some issues getting onto the corporate VPN to send
> > his reply, I've pasted it below on his behalf:
> >=20
> > There are 3 Fabric Inter Connect (FIC) buses on PolarFire SoC - each of
> > these FIC buses contain an AXI master bus and are 64-bits wide. These
> > AXI-Masters (each with an individual 64-bit AXI base address =E2=80=93 =
for example
> > FIC1=E2=80=99s AXI Master has a base address of 0x2000000000) are conne=
cted to
> > general purpose FPGA logic. This FPGA logic is, in turn, connected to a
> > 2nd 32-bit AXI master which is attached to the PCIe block in RootPort m=
ode.
> > Conceptually, on the other side of this configurable logic, there is a
> > 32-bit bus to a hard PCIe rootport.  So, again conceptually, outbound a=
ddress
> > translation looks like this:
> >=20
> >                  Processor Complex =C3=A0 FIC (64-bit AXI-M) =C3=A0 Con=
figurable Logic =C3=A0 32-bit AXI-M =C3=A0 PCIe Rootport
> > 		 (This how it came to me from Daire, I think the =C3=A1 is meant to
> > 		 be an arrow)
> >=20
> >  This allows a designer two broad choices:
> >=20
> >     Choice of FIC (effectively choice of AXI bus)
> >     Ability to offset the AXI address of any peripherals they add in the
> >     Fabric.
> >=20
> > So, for the case of an outbound AXI address, from the processors=E2=80=
=99 point
> > of view (or Linux=E2=80=99 point of view if you prefer), the processor =
uses a
> > 64-bit AXI address, then =E2=80=93 in a very general way of viewing the=
 process
> > and thinking only about accessing the PCIe device =E2=80=93 the FPGA lo=
gic can
> > be configured to adjust that AXI-M address to any arbitrary =E2=80=9Cad=
dress=E2=80=9D
> > before it passes that new =E2=80=9Caddress=E2=80=9D to the Root Port ov=
er a second 32-bit
> > AXI bus (the main constraint is that the FPGA logic can only use a 32-b=
it
> > address on that AXI-M interface to the Root Port).
> >=20
> > To manage this complexity, Microchip have design rules for customers
> > building their FPGA logic where we strongly recommend that they only
> > interact with  the upper 32 bits of the 64-bit address in the FPGA logic
> > and pass the lower 32 bits through (unmodified) to the AXI-M side of the
> > PCIe Root Port. This allows them to =E2=80=9Cmove=E2=80=9D a 64-bit AXI=
-M window for their
> > PCIe Root Port (as viewed by the processor) for their particular design=
 =E2=80=93
> > if they need to - so that they can also access any other AXI-M windows
> > associated with any other peripherals they might add to their design.
> >=20
> > In practise, so far, all customers, and our own internal boards have all
> > started by using one of two major reference designs from us (one using =
FIC1
> > where the AXI-M window destined for the PCIe Root Port starts at 0x2000=
000000
> > and one using FIC2 where its AXI-M window, again destined for the PCIe =
Root
> > Port starts at 0x3000000000).
>=20
> Is there something special about this that cannot be described by a DT
> 'ranges' property?  This sounds conceptually similar to Frank's nice
> picture at
> https://lore.kernel.org/r/20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.c=
om


Aye, it is similar, it is described using ranges properties, will end
up looking something like:

	fabric-pcie-bus@3000000000 {
		compatible =3D "simple-bus";
		#address-cells =3D <2>;
		#size-cells =3D <2>;
		ranges =3D <0x0 0x40000000 0x0 0x40000000 0x0 0x20000000>,
			 <0x30 0x0 0x30 0x0 0x10 0x0>;
		dma-ranges =3D <0x0 0x0 0x0 0x80000000 0x0 0x4000000>,
			     <0x0 0x4000000 0x0 0xc4000000 0x0 0x6000000>,
			     <0x0 0xa000000 0x0 0x8a000000 0x0 0x8000000>,
			     <0x0 0x12000000 0x14 0x12000000 0x0 0x10000000>,
			     <0x0 0x22000000 0x10 0x22000000 0x0 0x5e000000>;

		pcie: pcie@3000000000 {
			compatible =3D "microchip,pcie-host-1.0";
			#address-cells =3D <0x3>;
			#interrupt-cells =3D <0x1>;
			#size-cells =3D <0x2>;
			device_type =3D "pci";

			dma-noncoherent;
			reg =3D <0x30 0x0 0x0 0x8000000>, <0x0 0x43008000 0x0 0x2000>, <0x0 0x43=
00a000 0x0 0x2000>;

			ranges =3D <0x43000000 0x0 0x9000000 0x30 0x9000000 0x0 0xf000000>,
				 <0x1000000 0x0 0x8000000 0x30 0x8000000 0x0 0x1000000>,
				 <0x3000000 0x0 0x18000000 0x30 0x18000000 0x0 0x70000000>;
			dma-ranges =3D <0x3000000 0x0 0x80000000 0x0 0x0 0x0 0x4000000>,
				     <0x3000000 0x0 0x84000000 0x0 0x4000000 0x0 0x6000000>,
				     <0x3000000 0x0 0x8a000000 0x0 0xa000000 0x0 0x8000000>,
				     <0x3000000 0x0 0x92000000 0x0 0x12000000 0x0 0x10000000>,
				     <0x3000000 0x0 0xa2000000 0x0 0x22000000 0x0 0x5e000000>;

		};
	}

--yFBjah3xDxz6Ta9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4lFvQAKCRB4tDGHoIJi
0qtcAP49fmVAgECTuswfawK4vHkMxyczR291gBQanA8nSsCuPAD/aWEAeO/P2KKi
U+3aGKeRF4LybysHe9WUxd2mcXFQHwo=
=66OP
-----END PGP SIGNATURE-----

--yFBjah3xDxz6Ta9d--


--===============5035361410441653762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5035361410441653762==--

