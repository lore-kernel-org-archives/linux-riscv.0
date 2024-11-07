Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B523D4337D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIya/TxCT7LWtsAUX0EcKptAGZ+75g9YvptkNdzsxKA=; b=xCcCYt5V8Lyvicq7g8KAb+pJVq
	NgTLVyJezQ9bNO6HjqNWX8zEn8eZlCAAtbPf8CGYFPEmw9Cev3YgJRddpWQ6v2jTNn6VJE8Qe1tHx
	nEZZTm8GukCtaF4mI20SC1rpixMojhJMjNq7EYiHUW55xG7t8xa6QKRZ0f4qTVmtI15Ju721RuU7g
	tpqxGs8If/zdNf0KYSvmYQEN4tynmPiVkYRGfEHpncLUQuPcFRcioTAO959sC5w8U3XOBeAIliR4e
	dOpkjOM3J9wAUhXlOnz9nBVsBBwLUaN+uRNeK4pvb2DMha905f3Ip8e6GTlyV6WJdEALxGJCkCFQ7
	LbbQ6n5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95q3-00000007jd8-0fWy;
	Thu, 07 Nov 2024 16:58:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95mf-00000007jEh-2s6s
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C21E5C0C36;
	Thu,  7 Nov 2024 16:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA10C4CECC;
	Thu,  7 Nov 2024 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730998500;
	bh=9bVTUTo6hUtl0dlQL9IxRNnDbOUzfDaASJK3yyh/JI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRcUnqksED2hZ2drRPZJtktHOyttKgZOZASoLIiB0GIfk7ac4XWExOpJ3cvC7cNbg
	 M9LaiPKrtNy2TNDAEhQfAkQXK53kj16bIjdufe4QbDk1IuGYmWMGDygokA6xLxr6OQ
	 QPatfQK1hqCpJVQyGPjQxhvVAmmpX/gTDUSEK8QK8gQWtqHD2c7UjkUFMBi1hL3AoD
	 93gMtNyfOXRGsrcLOstQVCRb36RjORGii/4J7hv05ATCA5UOpcIldSrsThVVeUt0aI
	 QKTO3v0q7NrlU8/WguLe8eYf/PSA9agPT7b81Qrsu6EUKNhrgPzClQyyZ9cfPZYC5/
	 4hDjPLTKz5Fjg==
Date: Thu, 7 Nov 2024 16:54:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <20241107-applied-landscape-18094319130e@spud>
References: <20241107-aqueduct-petroleum-c002480ba291@spud>
 <20241107145715.GA1613568@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20241107145715.GA1613568@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_085501_892272_1E1D596C 
X-CRM114-Status: GOOD (  24.47  )
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
Content-Type: multipart/mixed; boundary="===============5869201269081413600=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5869201269081413600==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FRuOnas6CTShxO8U"
Content-Disposition: inline


--FRuOnas6CTShxO8U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 08:57:15AM -0600, Bjorn Helgaas wrote:
> On Thu, Nov 07, 2024 at 10:59:33AM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The current driver and binding for PolarFire SoC's PCI controller assume
> > that the root port instance in use is instance 1. The second reg
> > property constitutes the region encompassing both "control" and "bridge"
> > registers for both instances. In the driver, a fixed offset is applied =
to
> > find the base addresses for instance 1's "control" and "bridge"
> > registers. The BeagleV Fire uses root port instance 2, so something must
> > be done so that software can differentiate. This series splits the
> > second reg property in two, with dedicated "control" and "bridge"
> > entries so that either instance can be used.
> >=20
> > Cheers,
> > Conor.
> >=20
> > v6:
> > - rework commit messages to use Bjorn's preferred "root port" and "root
> >   complex" wording
> >=20
> > v5:
> > - rebase on top of 6.11-rc1, which brought about a lot of driver change
> >   due to the plda common driver creation - although little actually
> >   changed in terms of the lines edited in this patch.
> >=20
> > v4:
> > - fix a cocci warning reported off list about an inconsistent variable
> >   used between IS_ERR() and PTR_ERR() calls.
> >=20
> > v3:
> > - rename a variable in probe s/axi/apb/
> >=20
> > v2:
> > - try the new reg format before the old one to avoid warnings in the
> >   good case
> > - reword $subject for 2/2
> >=20
> > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > CC: Krzysztof Wilczy=C5=84ski <kw@linux.com>
> > CC: Rob Herring <robh@kernel.org>
> > CC: Bjorn Helgaas <bhelgaas@google.com>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: Conor Dooley <conor+dt@kernel.org>
> > CC: linux-pci@vger.kernel.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > CC: linux-riscv@lists.infradead.org
> >=20
> > Conor Dooley (2):
> >   dt-bindings: PCI: microchip,pcie-host: fix reg properties
> >   PCI: microchip: rework reg region handing to support using either root
> >     port 1 or 2
> >=20
> >  .../bindings/pci/microchip,pcie-host.yaml     |  11 +-
> >  .../pci/plda,xpressrich3-axi-common.yaml      |  14 ++-
> >  .../bindings/pci/starfive,jh7110-pcie.yaml    |   7 ++
> >  .../pci/controller/plda/pcie-microchip-host.c | 116 +++++++++---------
> >  4 files changed, 87 insertions(+), 61 deletions(-)
>=20
> Thanks!  The patches themselves are unchanged between v5 and v6.  I
> replaced the v5 patches on pci/controller/microchip with these.
>=20
> I also capitalized "Root Port" and "Root Complex" to give a hint that
> they are proper nouns defined by the PCIe spec.

Cool, thanks for doing that.

--FRuOnas6CTShxO8U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyzw3wAKCRB4tDGHoIJi
0hKaAP0eI4OJu6eAnIhYs5EB0myLZemCviOCG5VvSEEUOr6DIAD/Ze/bWXtn4dWz
D4SL/qEAL9/a0aBYc3Cb92DSBvIHMQU=
=ZkCM
-----END PGP SIGNATURE-----

--FRuOnas6CTShxO8U--


--===============5869201269081413600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5869201269081413600==--

