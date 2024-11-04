Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92833D132B0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXNX6RhpoJy7CI9ZJyMTnjMdDoBpbqJlnF8CwKWcG1E=; b=awZRr5qo0dsXYXnqotFAgJcoWK
	9LUSHgOnPgmKICnB42E5wJUF1hrBksDbveh+uckS1QFevPpjkr4v8oboh4O+VTCSQa7B+CBTv4Kcn
	EcYFI68aMfZ81yqeg44uNCAWwpwkcO5vo3r0anh0h9F16bgrr+uzCBRGscYE6PTvsC7ZkKYi2HwyB
	lC6DZEg/c2BKsqyJSguKoBDoEYvFwJV61adpknn3WBVpoyohmHT8jO4UzVWBCjjlCO+uizOt/tdz/
	cUwUAyJ+tvuy5NdEQyLMkth2Mgnynv/ryiApDsYu4Ro2ftRZTYp+z1FO3sFBNUnRDngelD+E9kcx5
	ZuorUALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vFh-0000000DWAN-2AK5;
	Mon, 04 Nov 2024 11:28:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v6f-0000000DTp9-33o0
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 11:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8033BA42A31;
	Mon,  4 Nov 2024 11:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB53EC4CECE;
	Mon,  4 Nov 2024 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730719128;
	bh=dPYBbaZDduNI0r2YV+lknaETuYjrZTPFY+763BUwGkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhPiOPq/MAF8Mgv5z5c4nAv+K8Ik4BEZpQjtnrhmvqQyuNX8cCKcOpodWGW9nZzbC
	 5Lw4uqvaC40QVKSsifKjEPR4EsQyGDK3gdJ8DaBu+XYeoOYQoJ7SeeCNa5il9fl8ye
	 hy181fS9Ea1zvX4xW46q/Bt91sREIC9jqvgmDyDym8foGP7bw2AtT7zGNuFeCM2IlS
	 DhPlhYXwwmw/Fad6wM73qKYUnYAEPTVyutMMoUs6wUW4gF3lFff+4yChlZqU5fnEKb
	 DMQ//FpswkWeAG29nUamJDziZhp06JmCNLCFdE7ljDVjOj2jrVYJk6GrMF361g9A/u
	 PsRz7WQzSF9tA==
Date: Mon, 4 Nov 2024 11:18:43 +0000
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
Subject: Re: [PATCH v5 2/2] PCI: microchip: rework reg region handing to
 support using either instance 1 or 2
Message-ID: <20241104-stabilize-friday-94705c3dc244@spud>
References: <20240814-outmost-untainted-cedd4adcd551@spud>
 <20241101195129.GA1318063@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20241101195129.GA1318063@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031849_915084_24C37FD0 
X-CRM114-Status: GOOD (  31.20  )
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
Content-Type: multipart/mixed; boundary="===============0963364968077217029=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0963364968077217029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TfnHo0vXNK+c6Gwh"
Content-Disposition: inline


--TfnHo0vXNK+c6Gwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 02:51:29PM -0500, Bjorn Helgaas wrote:
> On Wed, Aug 14, 2024 at 09:08:42AM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The PCI host controller on PolarFire SoC has multiple "instances", each
> > with their own bridge and ctrl address spaces. The original binding has
> > an "apb" register region, and it is expected to be set to the base
> > address of the host controllers register space. Defines in the driver
> > were used to compute the addresses of the bridge and ctrl address ranges
> > corresponding to instance1. Some customers want to use instance0 however
> > and that requires changing the defines in the driver, which is clearly
> > not a portable solution.
>=20
> The subject mentions "instance 1 or 2".
>=20
> This paragraph implies adding support for "instance0" ("customers want
> to use instance0").
>=20
> The DT patch suggests that we're adding support for "instance2"
> ("customers want to use instance2").
>=20
> Both patches suggest that the existing support is for "instance 1".
>=20
> Maybe what's being added is "instance 2", and this commit log should
> s/instance0/instance 2/ ?  And probably s/instance1/instance 1/ so the
> style is consistent?

Hmm no, it would be s/instance1/instance 2/ & s/instance0/instance 1/.
The indices are 1-based, not 0-based.

> Is this a "pick one or the other but not both" situation, or does this
> device support two independent PCIe controllers?
>=20
> I first thought this driver supported a single PCIe controller, and
> you were adding support for a second independent controller.
>=20

I don't know if they are fully independent (Daire would have to confirm)
but as far as the driver in linux is concerned they are. As far as I
know, you could operate both instances at the same time, but I've not
heard of any customer that is actually doing that nor tested it myself.
Operating both instances would require another node in the devicetree,
which should work fine given the private data structs are allocated at
runtime. I think the config space is shared.

> But the fact that you say "the [singular] host controller on
> PolarFire", and you're not changing mc_host_probe() to call
> pci_host_common_probe() more than once makes me think there is only a
> single PCIe controller, and for some reason you can choose to operate
> it using either register set 1 or register set 2.

The wording I've used mostly stems from conversations with Daire. We've
kinda been saying that there's a single controller with two root port
instances. Each root port instance is connected to different IOs,
they're more than just different registers for accessing the same thing.

--TfnHo0vXNK+c6Gwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyitkwAKCRB4tDGHoIJi
0tNQAP9ldG40/6k9HNbXDTXUEnTF1pjijRt/gdkaj938jXDjRgD/cJ24UOeT9ncp
xClPvRUyDFamEevdesGEqLyarnTIzg0=
=TAA0
-----END PGP SIGNATURE-----

--TfnHo0vXNK+c6Gwh--


--===============0963364968077217029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0963364968077217029==--

