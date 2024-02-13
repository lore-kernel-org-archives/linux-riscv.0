Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2100C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9/yIjsjPFRPDleNhLOpQ4aRqAfdUvhKeYG7/4VvvP0=; b=GKEocrCP49Yy/Ht2MyzLBmO1sA
	iPCjPDudSJgsrxu034qgNC6XicMEt/c07dtii7gPGycLcq4Ii2u7VVHWT7pVhTq7mkNzPpWdYQivf
	xc4RPCBv79cja/JLg/3AR/E7R1IOmFNY5FYMM3zIoPBgiRYnKsgF4iqSE7zbM7l0hS6kkQpaj020x
	Kv4OLzOMTnW055zRkJ996I08Uz6bWowHFaHkOqFy+kDE+LavDPG/MHeyQfEgtfR+Bo+lAVQLVPHi+
	1yTxZ0rFBbwFqp43s1OsbpWDUBVIUxcqxOw/XFdUP25xISAoNEegKJkbCRsBXFY2p2l+jcff/KLkv
	Wtvf7+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwFt-0000000A5SZ-0ZoG;
	Tue, 13 Feb 2024 17:07:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwFq-0000000A5R7-3dzw
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 17:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9EC4615BC;
	Tue, 13 Feb 2024 17:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C257C43399;
	Tue, 13 Feb 2024 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707844053;
	bh=8xJ6K3YxeTLXM/pbjDu4CB5rW5SThx69MqqZcbcYC0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qslBWslzQ5gumYuJoCGE2B3dgzVw7zZdW+CiWRsYhGSx6QwqVv8wx5D9IGYFufFrh
	 Z+HI6bkKVaoLUrvAKP1CxP6pOMsVlAx40TrJW5OM9zoJjPihzvpAnO7JW80AyMkD+l
	 5fGUv5d8JetNS1TXqMeQEZlt4BLRQxCpTAzuy91ZSwgoeN8jI6qFuRaozkX2xtwaEp
	 OpLuWDfFTLYCRfM9gbeX9FxhS7V2rp6o3gllPgfyVhDUjlpQLYKsW3sVTKRZt6hwqm
	 4pDoFktD5756W/lQjajtriFNnEZFZXNiO72OfKqu0faTLI+7IWYAhncJoADla8QixL
	 SBx18ySlG45Uw==
Date: Tue, 13 Feb 2024 17:07:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified
 privileged ISA versions
Message-ID: <20240213-cilantro-operator-acbf40493bbd@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
 <20240213-limping-ether-adbdc205ebc6@spud>
MIME-Version: 1.0
In-Reply-To: <20240213-limping-ether-adbdc205ebc6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_090734_972630_EED04EF3 
X-CRM114-Status: GOOD (  20.86  )
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
Content-Type: multipart/mixed; boundary="===============2221566908417656577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2221566908417656577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2GAsATBmAnP+sFu"
Content-Disposition: inline


--u2GAsATBmAnP+sFu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 05:03:46PM +0000, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
> > The baseline for the RISC-V privileged ISA is version 1.10. Using
> > features from newer versions of the privileged ISA requires the
> > supported version to be reported by platform firmware, either in the ISA
> > string (where the binding already accepts version numbers) or in the
> > riscv,isa-extensions property. So far two newer versions are ratified.
> >=20
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >=20
> > Changes in v2:
> >  - New patch for v2
> >=20
> >  .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 63d81dc895e5..7faf22df01af 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -121,6 +121,16 @@ properties:
> >              version of the privileged ISA specification.
> > =20
> >          # multi-letter extensions, sorted alphanumerically
>=20
> > +        - const: sm1p11
>=20
> Why are we beholden to this "1p11" format of RVI's? We have free choice
> of characters here, what's stopping us using "machine-v1.11", for
> example?

We could also choose to communicate this using a specific property, but
I have not really thought that one through yet.

--u2GAsATBmAnP+sFu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcuh0QAKCRB4tDGHoIJi
0kU0AP9uxqhi6Z2+S2utazinjy8ljsSHNNck/QoB6/noAi95sgEAwXNwzyDHMqVL
OfP6NZnX2lys3JrbYHWSXQjvFwxgCgU=
=Eqbk
-----END PGP SIGNATURE-----

--u2GAsATBmAnP+sFu--


--===============2221566908417656577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2221566908417656577==--

