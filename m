Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79860CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWd3EdFUa8dB7ur/iZDNlunk294jNDpYRkttHiMtLCU=; b=YUannQvBfZn51yxHyU9FXvnutT
	/JKM9Wmj7mV+lRDQN9vBihYRC+KlvA6rqrVHWK0t5wsrsy/XVH4PRJ3WlClVwK34lo4+B2LcQKBrW
	88nRQk1bbiSl7r0OL2aLvLfPmFGo/UhZTx4LM3rSrk8/up5fNTkaXZTbMhKB0hksX4jeGz7w5HzYO
	9tEW4Qwau8XYmPbvYVXNSWoYM1ANSBokd1v6/1Pba8FIDstq5kkj9azbHWVBnG5YiG7JGUFGe8OLA
	v+GvPQMEB4KCwIjur6GYmolu4jhoJShybqxwGs79DnpoVrYj6r3NSKI6pQ2HW4GZoPppZzr/VjqMG
	rZP0RRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Au-0000000Gcxr-3u0Y;
	Mon, 17 Nov 2025 18:42:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4At-0000000Gcxj-1pUm
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 18:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 860F0601F1;
	Mon, 17 Nov 2025 18:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E5EC4CEF5;
	Mon, 17 Nov 2025 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763404921;
	bh=JZPvJG4H9TtURVS4KR4gxr5gf352lFKsvwgszLWc4oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijsTdrG2Ikg8KgFdoRtI7ulj6jVyS1KWCGCJgvBa1yf7t6CRz6FojOhQF0A6JuAPZ
	 /mUhZNBrN4zla8f5jiM/SlJW2zNVZ4rJI4a866fH3kMqRDoX3622ehfhSyMop4LlzN
	 q0fgLl/jeWED9IGi55wLJBFUfRRGssqloNdKiPL8TPoCwrfamcK2TdfBqfIOzM9K4m
	 ZjFEGxVrp0cs+bIjOizIGnE8Cy1dxumxqPoi2KWO0yi9UBa5QS7qeYJJuJGRyBIKgJ
	 j+uGT+fWugqhNwQIkOuPboYKpTSuu0IrS/h70FB1tRg+OKZVAwya6Bg/0niW6groHK
	 K5Dx1yubgO1hg==
Date: Mon, 17 Nov 2025 18:41:56 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [net-next v1] dt-bindings: can: mpfs: document resets
Message-ID: <20251117-edgy-extenuate-6850a9440802@spud>
References: <20251117-twitter-sternness-f2b3a1506a6f@spud>
 <176340406423.422791.14985477842686606616.robh@kernel.org>
 <20251117-example-spoiled-6b098fb9fdcc@spud>
MIME-Version: 1.0
In-Reply-To: <20251117-example-spoiled-6b098fb9fdcc@spud>
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
Content-Type: multipart/mixed; boundary="===============7308062725157530235=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7308062725157530235==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jacpcMD8tGHOEF2"
Content-Disposition: inline


--9jacpcMD8tGHOEF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 06:29:55PM +0000, Conor Dooley wrote:
> On Mon, Nov 17, 2025 at 12:27:44PM -0600, Rob Herring (Arm) wrote:
> >=20
> > On Mon, 17 Nov 2025 16:38:18 +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > The CAN cores on Polarfire SoC both have a reset. The platform firmwa=
re
> > > brings both cores out of reset, but the linux driver must use them
> > > during normal operation. The resets should have been made required, b=
ut
> > > this is one of the things that can happen when the binding is written
> > > without driver support.
> > >=20
> > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN c=
ontroller")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > This is the second mistake in this binding, both spotted because of t=
he
> > > driver being written (although this one sat downstream for a while for
> > > w/e reason). I wish I could say that I'd send the driver soon, but I =
am
> > > busy upstreaming things I wrote and therefore understand at the momen=
t,
> > > so a driver that I'd have to go understand and review before sending =
is
> > > low priority, sorry!
> > >=20
> > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > > CC: Marc Kleine-Budde <mkl@pengutronix.de>
> > > CC: Vincent Mailhol <mailhol@kernel.org>
> > > CC: Rob Herring <robh@kernel.org>
> > > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > CC: linux-riscv@lists.infradead.org
> > > CC: linux-can@vger.kernel.org
> > > CC: devicetree@vger.kernel.org
> > > CC: linux-kernel@vger.kernel.org
> > > ---
> > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml       | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> >=20
> > My bot found errors running 'make dt_binding_check' on your patch:
> >=20
> > yamllint warnings/errors:
> >=20
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/net/can/microchip,mpfs-can.example.dtb: can@2010c000 (microchip,mpfs-can):=
 'resets' is a required property
> > 	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-=
can.yaml
>=20
> Two issues in the same branch now, there's something weird going on with
> my test script. /sigh guess that's my evening gone.

I can spend my evening playing poe after all, I am pretty sure this was
caused by running my test script and then immediately switching windows
back and doing a rebase... I'll send a v2 tomorrow or w/e.
pw-bot: changes-requested

--9jacpcMD8tGHOEF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRtsdAAKCRB4tDGHoIJi
0l5hAQCJe0ZHxyl8cOcnZUgbfN4pt45YDPzZtSMoGnQ2vaE2hAD6AuUA/GHPm7hf
J04T840JoYUU8iCQaeqglW7vXrmShAs=
=e8ps
-----END PGP SIGNATURE-----

--9jacpcMD8tGHOEF2--


--===============7308062725157530235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7308062725157530235==--

