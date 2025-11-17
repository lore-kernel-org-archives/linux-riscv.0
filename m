Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB07ECEBF8D
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SATEke9JXmrKsvIVywGsVCw3djfujMh6l8cZKrQaqkc=; b=umr5uG0o1WfNjT89eTZDgMTftu
	U9yKXRZM+HoRrwlLifHi3srrdNeGsjpW7hWnj/fwBDqdfFmoRR7GrMc7K7UnYW7WKY1TWvgNn9yrp
	6iVtM0hwh2jCCxdt60T4YEj7Ae7Mklfdf0lwewzienJlDZn/eD/Hs4hMRBNBh4ODqQbTUJ0kjeQ4H
	NcG0Xg+AQT341GMeWfL35M87WDDCCjq+czicgct22pkUvB11VIdPBGFVHZDQlX8lGjAVFiQugBaIk
	nEO5YOO7Kk/F5SAif0Wjh2bt/vu4EIgEAXo74Yx11nfGwkXlKy3r0IEJbvsGx8ax4gGX5KBi8G/WH
	o1OARXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3zH-0000000GcOS-0GvR;
	Mon, 17 Nov 2025 18:30:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3zF-0000000GcOK-21Kf
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 18:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98D5860140;
	Mon, 17 Nov 2025 18:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DF0C19423;
	Mon, 17 Nov 2025 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763404200;
	bh=vS2qoZFaDwTz47Zow58QbyqMl1Lvm3hLFL8m9IyE1T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPHcpXOFPsnvK8Yo6l71yPqBmGdNVKVmLiLsIEYZcfn+ZsQwwPECJlVhFJt9pQ0n4
	 lZPwoLyGRHLkNf9LgRAlFcx93RSTSggdTO+JPj/TMYBKuVAfIxHePQyoiy6VM24PsX
	 YR5AxU+DO2tAABSoPc61mhN6xkbICE2iaKxo+OjsO/NfrqUg8fpnjUWXUQwqJ1w9bM
	 lwF2lCrqpAH3AWlWcUMhjkZaC1L5qfKlkjctTfA1rpEfmI0yrCTX57qRcjABkWj9PA
	 WpaiTjuAtdymQZYNrrCWf07vQ63IJIbHIMvu7cJRqGQgL9SXz7fIGdycD19PDSyNlT
	 b+5lJnUoXreXQ==
Date: Mon, 17 Nov 2025 18:29:55 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [net-next v1] dt-bindings: can: mpfs: document resets
Message-ID: <20251117-example-spoiled-6b098fb9fdcc@spud>
References: <20251117-twitter-sternness-f2b3a1506a6f@spud>
 <176340406423.422791.14985477842686606616.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <176340406423.422791.14985477842686606616.robh@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7226849635902331084=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7226849635902331084==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oRJEmGRROVbDJnx"
Content-Disposition: inline


--3oRJEmGRROVbDJnx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 12:27:44PM -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 17 Nov 2025 16:38:18 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The CAN cores on Polarfire SoC both have a reset. The platform firmware
> > brings both cores out of reset, but the linux driver must use them
> > during normal operation. The resets should have been made required, but
> > this is one of the things that can happen when the binding is written
> > without driver support.
> >=20
> > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN con=
troller")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > This is the second mistake in this binding, both spotted because of the
> > driver being written (although this one sat downstream for a while for
> > w/e reason). I wish I could say that I'd send the driver soon, but I am
> > busy upstreaming things I wrote and therefore understand at the moment,
> > so a driver that I'd have to go understand and review before sending is
> > low priority, sorry!
> >=20
> > CC: Conor Dooley <conor.dooley@microchip.com>
> > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > CC: Marc Kleine-Budde <mkl@pengutronix.de>
> > CC: Vincent Mailhol <mailhol@kernel.org>
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: linux-riscv@lists.infradead.org
> > CC: linux-can@vger.kernel.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml       | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/can/microchip,mpfs-can.example.dtb: can@2010c000 (microchip,mpfs-can): '=
resets' is a required property
> 	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-ca=
n.yaml

Two issues in the same branch now, there's something weird going on with
my test script. /sigh guess that's my evening gone.

--3oRJEmGRROVbDJnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRtpoAAKCRB4tDGHoIJi
0kh6AQDMah2x5pv9Jzm5qa7f0RyDe8XjE7XPyOd57IzKk9dJkwD+IxCrlcQTptpQ
nFJQ8qoKO1RnWBRPhwCx/w6xxgbCiQE=
=Xgh5
-----END PGP SIGNATURE-----

--3oRJEmGRROVbDJnx--


--===============7226849635902331084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7226849635902331084==--

