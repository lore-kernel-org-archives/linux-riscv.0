Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3BBCA0FE1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Zewk/Im0TPlUvsMQp4AfzDSHo4LejmKSlKODgZOTtY=; b=qefRmgs9OhCT/aILX5bDRGoCF6
	8irOq84EtJQxsIUpAmvpyv085PYFMM2loooijiHiGc6Vh9esBS1FruZrvAP5uBzlgAmk9MiSh4x7c
	dOt7hBMy5drb/GYP3tGS75n2Ob67jDnztdD94B47P4qVINUi6cmQxrchKsTmUVf7ilGpp6JjAOIh4
	Nz10WoFjuF2Q3len1EhryeGbRG9xl6XMl/VT5zZP4tfYvN8zoCrspaQV1c1mT9PImu27olrsdTnAG
	CBp/cfqu0wp77jjhFiNwAs5IHR9VhEnrwoIcaW0TFaM2Jdo5vX4fnzheDaVNHgIEZTvhI1Z+hHkuW
	12N4ZbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEoI-00000000wh0-09cI;
	Thu, 21 Aug 2025 23:35:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9qw-000000009WH-3HzN
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 18:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE5E6601F8;
	Thu, 21 Aug 2025 18:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F39C4CEEB;
	Thu, 21 Aug 2025 18:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755800253;
	bh=sdpk9kvumjyelyuunnszIrhJPZRwr5hdsLnxeXdH7BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIJT2L0FSMpseoLQ0+azuxnY7re9vD45CWlyFkUf5KGOjSs11ay6BXQ2J5P7NDh9r
	 ujfEASp89P0CMuf5YLOXV4DnWzF6zD52AWHvx5pXUkbrVCif3WDR6QQ3RC4OhQM7ID
	 PPocC+Nw3hnzR6liRsVPae/W0KEIQL6CqQtUBp9CcDacjXIo4CS5lwstTmtxXO4EBw
	 22PYMKalPeitWjNSgp0T+L/fTEeWS4oJcBXm2Q3TRxs4m5NyBGDNdyvKnb1UEgSoOh
	 2v9YDj8qLHNr9aolk8wQpNpy1ExwLjQBTBBeSUyxm2oLJt69sXinsoAdausPY+9tvW
	 xnP7B8M9KITew==
Date: Thu, 21 Aug 2025 19:17:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/3] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
Message-ID: <20250821-pencil-anguished-6b8467adbd38@spud>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20250821100930.71404-2-hal.feng@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============4285733964666227227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4285733964666227227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogk02xgAdtyg13R4"
Content-Disposition: inline


--ogk02xgAdtyg13R4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 06:09:28PM +0800, Hal Feng wrote:
> Add device tree bindings for the StarFive JH7110S SoC
> and the VisionFive 2 Lite board equipped with it.
>=20
> JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigra=
de
> and up to 1.25GHz. Its CPU cores and peripherals are mostly similar to
> those of the JH7110 SoC.

How "mostly" is mostly? Are there memory map or capability differences?

>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Docu=
mentation/devicetree/bindings/riscv/starfive.yaml
> index 7ef85174353d..a2952490709f 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -33,6 +33,11 @@ properties:
>                - starfive,visionfive-2-v1.3b
>            - const: starfive,jh7110
> =20
> +      - items:
> +          - enum:
> +              - starfive,visionfive-2-lite
> +          - const: starfive,jh7110s
> +
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.43.2
>=20

--ogk02xgAdtyg13R4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdiuQAKCRB4tDGHoIJi
0uloAQCW8zYJBmp+5pFUy5+K9wGBKt53uvd5revzwEq1efJRGgEA7Z3tBRMUIB5I
+Kok+f96PccyQMWOqm32iMRzqMSjBAE=
=VGHm
-----END PGP SIGNATURE-----

--ogk02xgAdtyg13R4--


--===============4285733964666227227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4285733964666227227==--

