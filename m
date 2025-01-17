Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0084CC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juyoKDl4MihZ+CK2LvPm7zl0lLTCRJ1efZtZ63VqOyM=; b=PM5gZi+iZLstI/qcYs+LKN6HB9
	u59+D0VYR+eU7csnOr/mERNaW4fcUYkbthdGyJ8l3tjMkk5oJm/+1yLhU/bESZOTvSJLiRjVZgYz7
	PeQsYUgrKfNrv08AD8Y5bMPVMdfG3oKYKVnLhsesvM0fmnvXARSJzEQsTL2S4O5LdPWmMO9vH8c/h
	YzD+W1WfJmV2PxXPWNbqZZCbiyl5OvNEd9I4KDg+xHAQvMpZD6m3yubG8O4xowjlWHdo26HVF4O3n
	Hib3n2lRx2tdxWMHnhpywPexqsgLH7tAjEeJIY5McZDEiwBq5p8tYkvx9NLf7oFwTupeA8uf4MvfE
	qLegG5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjyQ-000000004mu-3nvq;
	Fri, 17 Jan 2025 10:53:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjyO-000000004mB-0w7U
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 10:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15229A42BD1;
	Fri, 17 Jan 2025 10:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC224C4CEE2;
	Fri, 17 Jan 2025 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737111186;
	bh=clfmPsDnhw+wE0upSIEwc6wMMI+dZgv1+mZMbJmb82g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQ5DSdcEkUPFYvHlXHE2A3iioHbUm8cVXx7u1kaT7Q4abfLBMul8QHLM+H2CrzTwG
	 CQPn9ykaK3DoxKpj/p3PaPfli9VfxF8SZ8hCXhqRiF4UpKgG2cYbqCn09M7Bz6GQtM
	 /cycsAhuI07gz5fGKLirnUrQYpvLGkA8DvCgABOSgdSP3/Nf/2T25oXYf49z7FjUUv
	 HxC5EriEIOsFfPxHXXULyjjGHv6qct9NEQHDayaGFHUn7CiZ5YVuB1/UJBcucq5hoC
	 oiBTn7cLIxPGBlf6C7e5hi0chkCkNjtUw/3VxSngzPzVJpl/2Vd2gnkj4bpFWyws8O
	 o8TllyWw8ENAg==
Date: Fri, 17 Jan 2025 10:53:01 +0000
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
Message-ID: <20250117-curliness-flashback-83519e708b52@spud>
References: <20250116-removed-evoke-1908811ab92a@spud>
 <20250116180255.GA593378@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20250116180255.GA593378@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_025308_388153_79E820EE 
X-CRM114-Status: GOOD (  50.90  )
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
Content-Type: multipart/mixed; boundary="===============3783947251229432325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3783947251229432325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="naCVrCOd0vJ9L2aC"
Content-Disposition: inline


--naCVrCOd0vJ9L2aC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 12:02:55PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 16, 2025 at 05:45:33PM +0000, Conor Dooley wrote:
> > On Thu, Jan 16, 2025 at 11:07:22AM -0600, Bjorn Helgaas wrote:
> > > [+cc Frank, original patch at
> > > https://lore.kernel.org/r/20241011140043.1250030-2-daire.mcnamara@mic=
rochip.com]
> > >=20
> > > On Thu, Jan 16, 2025 at 04:46:19PM +0000, Conor Dooley wrote:
> > > > On Thu, Jan 16, 2025 at 09:42:53AM -0600, Bjorn Helgaas wrote:
> > > > > On Tue, Jan 14, 2025 at 06:13:10PM -0600, Bjorn Helgaas wrote:
> > > > > > On Fri, Oct 11, 2024 at 03:00:41PM +0100, daire.mcnamara@microc=
hip.com wrote:
> > > > > > > From: Daire McNamara <daire.mcnamara@microchip.com>
> > > > > > >=20
> > > > > > > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be b=
ehind one of
> > > > > > > three general-purpose Fabric Interface Controller (FIC) buses=
 that
> > > > > > > encapsulate an AXI-M interface. That FIC is responsible for m=
anaging
> > > > > > > the translations of the upper 32-bits of the AXI-M address. O=
n MPFS,
> > > > > > > the Root Port driver needs to take account of that outbound a=
ddress
> > > > > > > translation done by the parent FIC bus before setting up its =
own
> > > > > > > outbound address translation tables.  In all cases on MPFS,
> > > > > > > the remaining outbound address translation tables are 32-bit =
only.
> > > > > > >=20
> > > > > > > Limit the outbound address translation tables to 32-bit only.
> > > > > >=20
> > > > > > I don't quite understand what this is saying.  It seems like th=
e code
> > > > > > keeps only the low 32 bits of a PCI address and throws away any
> > > > > > address bits above the low 32.
> > > > > >=20
> > > > > > If that's what the FIC does, I wouldn't describe the FIC as
> > > > > > "translating the upper 32 bits" since it sounds like the transl=
ation
> > > > > > is just truncation.
> > > > > >=20
> > > > > > I guess it must be more complicated than that?  I assume you ca=
n still
> > > > > > reach BARs that have PCI addresses above 4GB using CPU loads/st=
ores?
> > > > > >=20
> > > > > > The apertures through the host bridge for MMIO access are descr=
ibed by
> > > > > > DT ranges properties, so this must be something that can't be
> > > > > > described that way?
> > > > >=20
> > > > > Ping?  I'd really like to understand this before the v6.14 merge
> > > > > window opens on Sunday.
> > > >=20
> > > > Daire's been having some issues getting onto the corporate VPN to s=
end
> > > > his reply, I've pasted it below on his behalf:
> > > >=20
> > > > There are 3 Fabric Inter Connect (FIC) buses on PolarFire SoC - eac=
h of
> > > > these FIC buses contain an AXI master bus and are 64-bits wide. The=
se
> > > > AXI-Masters (each with an individual 64-bit AXI base address =E2=80=
=93 for example
> > > > FIC1=E2=80=99s AXI Master has a base address of 0x2000000000) are c=
onnected to
> > > > general purpose FPGA logic. This FPGA logic is, in turn, connected =
to a
> > > > 2nd 32-bit AXI master which is attached to the PCIe block in RootPo=
rt mode.
> > > > Conceptually, on the other side of this configurable logic, there i=
s a
> > > > 32-bit bus to a hard PCIe rootport.  So, again conceptually, outbou=
nd address
> > > > translation looks like this:
> > > >=20
> > > >                  Processor Complex =C3=A0 FIC (64-bit AXI-M) =C3=A0=
 Configurable Logic =C3=A0 32-bit AXI-M =C3=A0 PCIe Rootport
> > > > 		 (This how it came to me from Daire, I think the =C3=A1 is meant =
to
> > > > 		 be an arrow)
> > > >=20
> > > >  This allows a designer two broad choices:
> > > >=20
> > > >     Choice of FIC (effectively choice of AXI bus)
> > > >     Ability to offset the AXI address of any peripherals they add i=
n the
> > > >     Fabric.
> > > >=20
> > > > So, for the case of an outbound AXI address, from the processors=E2=
=80=99 point
> > > > of view (or Linux=E2=80=99 point of view if you prefer), the proces=
sor uses a
> > > > 64-bit AXI address, then =E2=80=93 in a very general way of viewing=
 the process
> > > > and thinking only about accessing the PCIe device =E2=80=93 the FPG=
A logic can
> > > > be configured to adjust that AXI-M address to any arbitrary =E2=80=
=9Caddress=E2=80=9D
> > > > before it passes that new =E2=80=9Caddress=E2=80=9D to the Root Por=
t over a second 32-bit
> > > > AXI bus (the main constraint is that the FPGA logic can only use a =
32-bit
> > > > address on that AXI-M interface to the Root Port).
> > > >=20
> > > > To manage this complexity, Microchip have design rules for customers
> > > > building their FPGA logic where we strongly recommend that they only
> > > > interact with  the upper 32 bits of the 64-bit address in the FPGA =
logic
> > > > and pass the lower 32 bits through (unmodified) to the AXI-M side o=
f the
> > > > PCIe Root Port. This allows them to =E2=80=9Cmove=E2=80=9D a 64-bit=
 AXI-M window for their
> > > > PCIe Root Port (as viewed by the processor) for their particular de=
sign =E2=80=93
> > > > if they need to - so that they can also access any other AXI-M wind=
ows
> > > > associated with any other peripherals they might add to their desig=
n.
> > > >=20
> > > > In practise, so far, all customers, and our own internal boards hav=
e all
> > > > started by using one of two major reference designs from us (one us=
ing FIC1
> > > > where the AXI-M window destined for the PCIe Root Port starts at 0x=
2000000000
> > > > and one using FIC2 where its AXI-M window, again destined for the P=
CIe Root
> > > > Port starts at 0x3000000000).
> > >=20
> > > Is there something special about this that cannot be described by a DT
> > > 'ranges' property?  This sounds conceptually similar to Frank's nice
> > > picture at
> > > https://lore.kernel.org/r/20241119-pci_fixup_addr-v8-2-c4bfa5193288@n=
xp.com
> >=20
> > Aye, it is similar, it is described using ranges properties, will end
> > up looking something like:
>=20
> So is this patch a symptom that is telling us we're not paying
> attention to 'ranges' correctly?

Sounds to me like there's something missing core wise, if you've got
several drivers having to figure it out themselves.

> The whole point of Frank's patches is to get rid of hard-coded masks
> like MC_OUTBOUND_TRANS_TBL_MASK because because 'ranges' should
> already contain that information.
>=20
> If 'ranges' is sufficent to describe the address spaces and
> translations between them, the driver wouldn't need to be concerned
> with FIC and AXI-M addresses; they would just be described in a
> generic way in the DT 'ranges'.

Daire seems to think what Frank's done should work here, but it'd need
to be looked into of course. Devicetree should look the same in both
cases, do you want it as a new version or as a follow up?

Cheers,
Conor.

--naCVrCOd0vJ9L2aC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4o2jQAKCRB4tDGHoIJi
0hSSAP0fEWQvc3fUi1kJp3+GUXrZ4y7lgnUcHMqA08pU14t3eQEAnPJd7wB6gOtp
/WWYI7OeLb1eK2w4ioOJM1NSePWCCgk=
=ioTQ
-----END PGP SIGNATURE-----

--naCVrCOd0vJ9L2aC--


--===============3783947251229432325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3783947251229432325==--

