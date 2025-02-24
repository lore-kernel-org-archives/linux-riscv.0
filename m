Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F51C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2Wtaq2qQr1hVd8r7Be9cM8c65u8kjOyD11tKhiYGRc=; b=TZNFt5ijP1trzfnSIR32oTSdiH
	sKJopUgwo+s9VGehjv8SY42S/J8L9W1lBE040OBHmiQwehEVlNes3TAz6mFezidtIWejMnEZIC16Y
	31UdRLokDYjqL7/VY7EbcAOeZDYWCnxZ1ukwp+SzCTgOQ7GgOOkQfL5vXs1236hakw49t5DKJyMzs
	fHhKKi/Cmum2Kyvas7z9okjgIrzwn8YEQMTi3ZGsadgvkxzwKio3fr/QSdA+FxvncxPeDP8d7ogpl
	2SKEUuBFlq9EwfGV6VQVDwlUuDcA8JO/AGqxGpBipZTeAJpY7KelzmeR9cpNS9djY0RXD6DQm60bJ
	jGFT3sfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdbg-0000000EtNd-18x9;
	Mon, 24 Feb 2025 18:55:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdbY-0000000EtLH-2jUQ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 18:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9705A5C4688;
	Mon, 24 Feb 2025 18:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF4FC4CED6;
	Mon, 24 Feb 2025 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740423298;
	bh=rVPeC5mli/1j43LuHoG3PNlmHNErM72hIXBxgKKPqkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emIq/Vl3E2OwY+6+v4gj+ccn7N7qHNSVsBl7o3EtRKI899Jx8bZ42IS+pnn7I6bXY
	 J4U3eVMBb1M3zMyX22+z84AkQRkRg7yVbwyFer/q24CJfkt4LgxGkBVEBtFWROI7LT
	 VklI4xu4iodLJHllFqkevZnruOhHTwVVcn1iv3LwK6rSPOFBGdXhui6gdzGz8P/b4V
	 Z0JLN+2sDZHL+ECOddLd+flANvQDrVMQj4sxoCT6+dy6o+zyqVCndYM6yU/nR8u2CY
	 bmia8xiDiU8QbNA7QnVRKGo/vUT6FelVkNVNk5J+pWqlXat519L3csa4taJkx5cNIp
	 cjuFHEojP2tzw==
Date: Mon, 24 Feb 2025 18:54:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <20250224-enable-progress-e3a47fdb625c@spud>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
MIME-Version: 1.0
In-Reply-To: <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_105500_782000_70745674 
X-CRM114-Status: GOOD (  23.44  )
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
Content-Type: multipart/mixed; boundary="===============2251887180751689686=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2251887180751689686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nEmMIcx09OhU3DPI"
Content-Disposition: inline


--nEmMIcx09OhU3DPI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > The pcie controller on the SG2044 is designware based with
> > > custom app registers.
> > >=20
> > > Add binding document for SG2044 PCIe host controller.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++=
++
> > >  1 file changed, 125 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg20=
44-pcie.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie=
=2Eyaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > new file mode 100644
> > > index 000000000000..040dabe905e0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > @@ -0,0 +1,125 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > +
> > > +description: |+
> > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys D=
esignWare
> > > +  PCIe IP and thus inherits all the common properties defined in
> > > +  snps,dw-pcie.yaml.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sophgo,sg2044-pcie
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Data Bus Interface (DBI) registers
> > > +      - description: iATU registers
> > > +      - description: Config registers
> > > +      - description: Sophgo designed configuration registers
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: dbi
> > > +      - const: atu
> > > +      - const: config
> > > +      - const: app
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: core clk
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +
> > > +  dma-coherent: true
> >=20
> > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > used to indicate systems/devices that are not.
>=20
> The PCIe is dma coherent, but the SoC itself is marked as
> dma-noncoherent.

By "the SoC itself", do you mean that the bus that this device is on is
marked as dma-noncoherent? IMO, that should not be done if there are
devices on it that are coherent.

> So I add dma-coherent to the binding. I
> wonder whether dma-coherent is necessary even in this case?


--nEmMIcx09OhU3DPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7zAewAKCRB4tDGHoIJi
0tHFAP90UC8I2j/g5PJgPzzQmwCvjacmi9hAbI+pK4XrrteVtAD/c51IWVKh5nvr
YkNyy6zZ/5H8GwW0TxvOKWhT8Q8jXAo=
=qPA6
-----END PGP SIGNATURE-----

--nEmMIcx09OhU3DPI--


--===============2251887180751689686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2251887180751689686==--

