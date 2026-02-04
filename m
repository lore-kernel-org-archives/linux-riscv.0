Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D13CE83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWnFJy1vxYBVUsMTv31tEF+l2ptE7XQDFYQxX8vZJVs=; b=1+XxKB74dGV2+UYwwjiVNAJawt
	mS482ZSC/ceSYa3mp/aWnOU+ZPDYd2KaYWyPiSpL7GRLjLAAgBdSmZX9UYHysa6/AuIW7sKu24Ft2
	YiGS/0wNEyyPCGmqXTutuDcX3GSfPAQ+c2OYr2mlHVHW0G9o+rTS7N+EC5JtBVcqRUxDWkb6GYei1
	XZUldS80/uGAQBrKocf9mD5VPJDhNir/A3/LiORYWs33g28SHeQxFlut4ItM4CEuL4CRTsRkpxbQJ
	OxbXgLysxmjM/HeURIvW12nVhNr5AfDRWV0pG5w6937G/D8hTVsIcQJpxUDCKGkGf3FODECiJqV2a
	jScoegEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhHX-00000008uQE-1puQ;
	Wed, 04 Feb 2026 18:07:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhHW-00000008uQ6-2Bu5
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 18:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1A3A60010;
	Wed,  4 Feb 2026 18:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C2CC4CEF7;
	Wed,  4 Feb 2026 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228433;
	bh=gUKiYi54MPXOa8OLr2IikMwDAGcFOielFJYFN7kyy48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CO8637w7pGh4pR/NtccsmsLcizq9hT/ISyNTQdwK5YNKBV4NyKbJl5+H7tEU5NIdH
	 Jr0+GIS1QsJfTBrNy0rqNOy8zo/YYDy+muFeTcCNwfXi6E5hrZ4CHU51V1lhzCsqGf
	 p1fM5MFDp8ibuKmaTtmMSyc7Angh9Bt16LxE1VewMedEiozZql2YfvBFB5W8V2RzUx
	 LfQjmokERq7IVuhvEA78mj3na7ijnwTtb/GUN7XsbhPK0j58hVR/plNp6DgnuGeWK3
	 igVDDJD91rjL6gImYYetAtZgbfVHx58rnT8p5KQmr4ce3SGYQsJ6ymuYBwdCgyl92+
	 b57dlM3E7qGuA==
Date: Wed, 4 Feb 2026 18:07:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260204-unlucky-raven-1ca0ed8f3392@spud>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
 <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============7035695884906360901=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7035695884906360901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5CCiEoC65J3zMOc"
Content-Disposition: inline


--I5CCiEoC65J3zMOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 09:23:01PM +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
>=20
> The existing "vin-supply" is marked as deprecated to avoid warnings
> as dts and dt-bindings go via different trees.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: Mark vin-supply as deprecated.
> v2: Remove providers from the dts example.
>     Pass the 'make dt_binding_check' test.
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 ++++++++++++++++=
+++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Doc=
umentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6a..41f784408e29 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -28,7 +28,46 @@ properties:
>      maxItems: 1
> =20
>    vin-supply:
> -    description: Input supply phandle.
> +    deprecated: true
> +    description:
> +      Main power input (deprecated). Use individual vin1-6, aldoin,
> +      dldoin1, and dldoin2 supply properties instead.

What's the point documenting the deprecated version if it doesn't work
anymore?

--I5CCiEoC65J3zMOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKywAKCRB4tDGHoIJi
0hPvAQDNhaGRPloJVhFrnHIbYInImXvLdwwaaEw4mhDkuUwL8gEAh71m/l08p23U
4VuiK+wznUTz8EhMAUZdJpENMVEa5wo=
=eTr7
-----END PGP SIGNATURE-----

--I5CCiEoC65J3zMOc--


--===============7035695884906360901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7035695884906360901==--

