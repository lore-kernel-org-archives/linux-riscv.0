Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB41CE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pgqwLo19cOm1oYEg2JrES6KU6wssy2tut6ny8VRK/o=; b=nt4aOzgxIz4WepjXyMsI4Gz/Dl
	klSdTTgnLHlrflppWTFydHD+LoiNWPEQOXrl+GxaZ2DC0x57xZkYv/i6dHN+ffQJ+gV7b82zpibOm
	v0onXM1foGdkT8E5buKTi/xZx9iHJLf+WsZ8WZFM4Disko7oCYM8tRv8BJwc56OegMk+3wxN5d2kv
	UbZl7JV7eCZz5S8KMzkk9hTV5XXlxAvq+DdIbf0nnvpCvHnlFVjXERQYOanpkk7Qs2tAlozr59yY4
	kI7omIExyyM/liYKhqay2zkaFRwhUYdJm9EFCj1xA8bcd5qFt7bi6vbAfCUhjx3R66oNnQQYjqjgQ
	jnqrESxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkWY-00000009A1R-2iQ9;
	Tue, 14 Jan 2025 17:16:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkWW-00000009A0w-0apV
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA32A5C57B2;
	Tue, 14 Jan 2025 17:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F51C4CEDD;
	Tue, 14 Jan 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736874975;
	bh=vakzlSu8gGyMeYuYAvXAQVD+/c7CpXnXrkt59ASXPew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shZOKpVBYQa62bI8IntW9zBsf97gRfuVtWhZt8pSFxXwiAAWhxpRheU51X6vGr5JA
	 Sqj5ftYNSTZjypDBwVOIcmoLnTm7XxqclH+UYyPtg/Jf7lcRHiqAeZe+N/sZ781DJE
	 RQ6czJBLYags8XtgB8IXNDW3kAtgXqFBJhsc2uj9HLmOvIwIJGxVttUu2pEAhaMxJn
	 MZUiwCO0LZIoAxYa+W+2cthNPkzsZLsGOwXvsDIooJLkM6NQae6GD4LEsHdBNky6mp
	 Pn3V3lFGQTUu1aOKCZmyo5l4ClVaIddNyJnIgSNdD6oiZzFxdUMjF+jHWwh4R1RANT
	 j+GHfCjvKVdQw==
Date: Tue, 14 Jan 2025 17:16:10 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 0/3] Fix address translations on MPFS PCIe controller
Message-ID: <20250114-espresso-display-846f670d2088@spud>
References: <20241011140043.1250030-1-daire.mcnamara@microchip.com>
 <20241113-unified-humongous-cda4f06a6240@spud>
MIME-Version: 1.0
In-Reply-To: <20241113-unified-humongous-cda4f06a6240@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_091616_264591_3A17EB35 
X-CRM114-Status: GOOD (  27.36  )
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
Content-Type: multipart/mixed; boundary="===============8910232412522310409=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8910232412522310409==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DWPIzAWKXiqE8nuk"
Content-Disposition: inline


--DWPIzAWKXiqE8nuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

Has this patchset fallen through the cracks?

Cheers,
Conor.

On Wed, Nov 13, 2024 at 11:50:44AM +0000, Conor Dooley wrote:
> On Fri, Oct 11, 2024 at 03:00:40PM +0100, daire.mcnamara@microchip.com wr=
ote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> >=20
> > Hi all,
> >=20
> > On Microchip PolarFire SoC (MPFS), the PCIe controller is connected to =
the
> > CPU via one of three Fabric Interface Connectors (FICs).  Each FIC pres=
ent
> > to the CPU complex as 64-bit AXI-M and 64-bit AXI-S.  To preserve
> > compatibility with other PolarFire family members, the PCIe controller =
is
> > connected to its encapsulating FIC via a 32-bit AXI-M and 32-bit AXI-S
> > interface.
> >=20
> > Each FIC is implemented in FPGA logic and can incorporate logic along i=
ts 64-bit
> > AXI-M to 32-bit AXI-M chain (including address translation) and, likewi=
se, along
> > its 32-bit AXI-S to 64-bit AXI-S chain (again including address transla=
tion).
> >=20
> > In order to reduce the potential support space for the PCIe controller =
in
> > this environment, MPFS supports certain reference designs for these add=
ress
> > translations: reference designs for cache-coherent memory accesses
> > and reference designs for non-cache-coherent memory accesses. The preci=
se
> > details of these reference designs and associated customer guidelines
> > recommending that customers adhere to the addressing schemes used in th=
ose
> > reference designs are available from Microchip, but the implication for=
 the
> > PCIe controller address translation between CPU-space and PCIe-space ar=
e:
> >=20
> > For outbound address translation, the PCIe controller address translati=
on tables
> > are treated as if they are 32-bit only.  Any further address translatio=
n must
> > be done in FPGA fabric.
> >=20
> > For inbound address translation, the PCIe controller is configurable fo=
r two
> > cases:
> > * In the case of cache-coherent designs, the base of the AXI-S side of =
the
> >   address translation must be set to 0 and the size should be 4 GiB wid=
e. The
> >   FPGA fabric must complete any address translations based on that 0-ba=
sed
> >   address translation.
> > * In the case of non-cache coherent designs, the base of AXI-S side of =
the
> >   address translation must be set to 0x8000'0000 and the size shall be =
2 GiB
> >   wide.  The FPGA fabric must complete any address translation based on=
 that
> >   0x80000000 base.
> >=20
> > So, for example, in the non-cache-coherent case, with a device tree pro=
perty
> > that maps an inbound range from 0x10'0000'0000 in PCIe space to 0x10'00=
00'0000
> > in CPU space, the PCIe rootport will translate a PCIe address of 0x10'0=
000'0000
> > to an intermediate 32-bit AXI-S address of 0x8000'0000 and the FIC is
> > responsible for translating that intermediate 32-bit AXI-S address of
> > 0x8000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
> >=20
> > And similarly, for example, in the cache-coherent case, with a device t=
ree
> > property that maps an inbound range from 0x10'0000'0000 in PCIe space to
> > 0x10'0000'0000 in CPU space, the PCIe rootport will translate a PCIe ad=
dress
> > of 0x10'0000'0000 to an intermediate 32-bit AXI-S address of 0x0000'000=
0 and
> > the FIC is responsible for translating that intermediate 32-bit AXI-S a=
ddress
> > of 0x0000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
> >=20
> > See https://lore.kernel.org/all/20220902142202.2437658-1-daire.mcnamara=
@microchip.com/T/
> > for backstory.
> >=20
> > Changes since v9:
> > - Dropped plda_setup_inbound_address_translation() from StarFive driver
>=20
> Since I had some success bumping the other series for this driver, any
> chance of some attention here?
> AFAIK, Daire's addressed what's been pointed out by reviewers and
> exempted the StarFive driver from overwriting the firmware-set values
> with once calculated from DT as they requested.


--DWPIzAWKXiqE8nuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4ab2gAKCRB4tDGHoIJi
0vhRAPwNhrvfDp89x6F228OGP2dYlqrqBn1VL3af3DOMXUZC0AEAzAOHwIrkkYhl
VJQeznMVIiXmNutqnmdW0BBG4n8vQAg=
=/mvA
-----END PGP SIGNATURE-----

--DWPIzAWKXiqE8nuk--


--===============8910232412522310409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8910232412522310409==--

