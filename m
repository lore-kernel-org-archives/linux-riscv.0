Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE9C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nX7t8uF4LBRjaMOBiviTvPHEri9reYBjThRa2tMJMk=; b=jK5C8PuDbFDIFYHiLXalG8D7Nv
	Dj8oeeo4YfHG4Qv5gKhb3F+uOrAFNFTgYQwGImxlgIaawdmf42q9rpp8mLxV39sDPXAd1GRY4fMRl
	UaA72YI007n8B2iKCwcAPKu/TORKcGQatDGIjCjVJzEKesGfBQx/jqRlhGfx/ANiFtMp4cNWw70DZ
	HXteBg2YMVc0JBuSDPv+l3BhTZv4fxggOeIKdUua84RtUW5L4i8E8tTnp/OoIyG8keNewgMGbEagq
	xZdemAiOxAWKeBp67vvcY/fUvKA2zuoDwNnBd2oXkxM7QkWaWY5cwd2Ppx5MCENiWCOIPW1Yn5FHB
	i9PdAhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzMX-00000001Em4-0jfg;
	Thu, 25 Jul 2024 14:22:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzMU-00000001ElN-0T6c
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 179A561426;
	Thu, 25 Jul 2024 14:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5341C32782;
	Thu, 25 Jul 2024 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917348;
	bh=Xr7gwIkEtfygg5zDHKVTVXXd8+oxncye9yOKYkaCVy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REUUdLqIyoeSYhmWzkbITk+xAAkWffbxWAah6GwSlP/RmvesVWI0DCdssNefjCA44
	 rsAsvhhyTlip8ypB18FsjBBeNJrRe55Qh7H/qsZ6tNf1EWJyRPT1YMgE+6aEhMOy7D
	 /XVMrDWxQ54LdkqWjDmIHlrx/m+R6+uX1vS5UYpwIvT5iu98TnUwOqAU1GbO+MZqNE
	 UPNIsXO6H930srHPnFRFRYElOhuc6rGIp9+3vrub+a14j+lRzcZkYNlzYKP9SRaKtW
	 0Fe84o8hTFqhuNUjX5isLyxE59yTS+dD2ZN5IFO9gDxcDDKxpFXyJKnauAhlL1Cl6Q
	 VB5D6nQoU5WNg==
Date: Thu, 25 Jul 2024 15:22:24 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: clock: mpfs-clkcfg: Add PIC64GX
 compatibility
Message-ID: <20240725-upstream-smokeless-6d0eb847a594@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-9-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-9-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_072230_299717_9B16EF15 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: multipart/mixed; boundary="===============0566615062972040419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0566615062972040419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oUQL6fU2J0AJLRVY"
Content-Disposition: inline


--oUQL6fU2J0AJLRVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:16:00PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX has a clock controller compatible whith mpfs-clkcfg
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcf=
g.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> index e4e1c31267d2..ca889f5df87a 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> @@ -19,7 +19,11 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-clkcfg
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-clkcfg
> +          - const: microchip,mpfs-clkcfg
> +      - const: microchip,mpfs-clkcfg

Ditto here, the mpfs binding is wrong and I don't want the pic64gx to
ape that. Instead, we should take the opportunity to fix the binding.
You're gonna need to do that so that the pinctrl driver can access the
IOMUX registers correctly. As with the mailbox, either simplemfd or
syscon are needed here. I mocked something up a few weeks ago while
talking to someone about a hwmon driver, I'll dig it up when I am back
to work.

Cheers,
Conor.

> =20
>    reg:
>      items:
> --=20
> 2.30.2
>=20
>=20

--oUQL6fU2J0AJLRVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJfoAAKCRB4tDGHoIJi
0suUAQC/tzIWQ+Mg2NnvUYdGhSkTvOGO4cDGQ05zxeqfGSiiWgEA7Rwx2eJ2o5Ny
E6x8AuEC/cU5wHg6AoUfsPnTv8QKGw4=
=tflQ
-----END PGP SIGNATURE-----

--oUQL6fU2J0AJLRVY--


--===============0566615062972040419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0566615062972040419==--

