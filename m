Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF9CC27C75
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5xx8pqNT05A+TKIqlrvtP1sOX8uDWyw4yowMByrhNU=; b=CWzvJr9DzpBruHyHnLgupj+JoR
	g4qXg5q5RM27fKOXkYNpkk3pvQLZASIrIkQx6ShMWEKdSM8JbkvyopzVEgvfRx14jU60OsuUwErEo
	zeZE0J9GS1OrPD0+mJFU0k53dxKUa5iDaaqRGHfY+Vt7lM2+o0yFeHJV4jnU3ie6NX6p2IgS6hjcn
	ouPCSYjQ0SmvYo0NiITDjpjm4Fw4pcOm+dsg39c1a9nPRdgNk9irf1FGNSslGJ1x+Y8R+zhGp18Wx
	oq/r+y1rJDx64mF0MZ2GxoOnkHAUQcj1ewxvBD688qhGwnsE8O1m0RZtwVgcEWYLNXW3s/EmJyKu9
	8pFPV6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5jz-00000009kVR-3OAm;
	Tue, 11 Jun 2024 17:57:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5jv-00000009kTV-0iyE
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 17:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74146610A5;
	Tue, 11 Jun 2024 17:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A21C2BD10;
	Tue, 11 Jun 2024 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128618;
	bh=UERodzDXvGbnqLdrOtjYNb9Mfs0u0k6LIAWwfXfiCS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unaY0FjaN+ovVHS0qx4c9gkXG9iRwNE3bo9Evgwar48vk3rTi+8i+JTMjrRw7bxzV
	 OUTsWMUrtxLzyOuybd0zSupPbNKSym471d6foZo24A/vAMDWHKJgw5HI1Ei7JDjPtw
	 WT94Bz5k4H1PxL3O5dpFh96fTziX4WdhbyAi4x6aO5+qePH6vw/LWU1q++35C3PRoR
	 1lJUpVUQ2h55SzYEUT3CG7f4Vu9BQuvnQTEvx/psRQtO3XFzrXWy4PU/xTqvDFNSLB
	 S0nn4jCQJLNlSb+QuLOPozz1h3uHTzridRNJDOu3ElJMbJ6ktT/deBI/Yry1HDmBKw
	 y8HgQvF8ftVQw==
Date: Tue, 11 Jun 2024 18:56:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/2] PCI: microchip: rework reg region handing
Message-ID: <20240611-retorted-variety-cd69c39238eb@spud>
References: <20240527-flint-whacky-4fb21c38476b@wendy>
 <20240611171054.GA989979@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20240611171054.GA989979@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_105659_379059_6C00B0EB 
X-CRM114-Status: GOOD (  24.52  )
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
Content-Type: multipart/mixed; boundary="===============6304856636948479556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6304856636948479556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yrv/4CxhjMg6gFq+"
Content-Disposition: inline


--Yrv/4CxhjMg6gFq+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:10:54PM -0500, Bjorn Helgaas wrote:
> On Mon, May 27, 2024 at 10:37:17AM +0100, Conor Dooley wrote:
> > The PCI host controller on PolarFire SoC has multiple "instances", each
> > with their own bridge and ctrl address spaces. The original binding has
> > an "apb" register region, and it is expected to be set to the base
> > address of the host controllers register space. Defines in the driver
> > were used to compute the addresses of the bridge and ctrl address ranges
> > corresponding to instance1. Some customers want to use instance0 however
> > and that requires changing the defines in the driver, which is clearly
> > not a portable solution.
> >=20
> > The binding has been changed from a single register region to a pair,
> > corresponding to the bridge and ctrl regions respectively, so modify the
> > driver to read these regions directly from the devicetree rather than
> > compute them from the base address of the abp region.
> >=20
> > To maintain backwards compatibility with the existing binding, the
> > driver retains code to handle the "abp" reg and computes the base
> > address of the bridge and ctrl regions using the defines if it is
> > present. reg-names has always been a required property, so this is
> > safe to do.
>=20
> When you update this, can you add something about the objective to the
> subject line?  "rework reg region handling" just says "we did
> something", but not why or what the benefit is.
>=20
> The cover letter ("support using either instance 1 or 2") has good
> information that could be part of this.

Ye, sure.

--Yrv/4CxhjMg6gFq+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmiP5QAKCRB4tDGHoIJi
0r7KAP93yL6qKBVlWqUGW4RwUK9tkjCiHyW61h74yRHyxSwQzQD/Zp0LhXPVtVgq
4CzQDZSafRaOf1ALkyXbSFJG2YFS8AI=
=tgsL
-----END PGP SIGNATURE-----

--Yrv/4CxhjMg6gFq+--


--===============6304856636948479556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6304856636948479556==--

