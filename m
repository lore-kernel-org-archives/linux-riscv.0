Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F24606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADYQwvbN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt7x0p4J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4o2YBJvi3O6KBREjmSIUYIfeCY//q2xwACkmzRfBng0=; b=ADYQwvbNujBlBETl2AKHxtgG6S
	D2QVXz7/nYwBWB5JQJssn51AG+vd7lAOUhS8/24MOvdGmlt7fXIPpz0e1hTpT1QtBGvKMIiEwF49P
	G6XlTY1GEu8WpexAgb+4WIZfmI02wgtA6aeTR3VfwNd0bGwfPa5UwrLWw1LkHkxVJvRl6+u59yrZ0
	GQbrhcWXS6NQSTMr3GCn9qGs7x8/Rk9s0BN+KZ/Ze8yJ3i88rKMs1+VRgoheUK2ixXwd3NF3jZ4mO
	VnnjQ3VZqBRO2oK3QhlS56hIUPXR0LWCDBwbCH1MIB3EZRu9Q9B5cqOF9dR/gzHckMPlF3kN8Gdkq
	frlQnGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Pd-00000003Y4b-1SlL;
	Mon, 16 Nov 2026 18:26:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Pc-00000003Y4I-1P5V
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 18:26:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9771461E41;
	Mon, 16 Nov 2026 18:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F821F000C9;
	Mon, 16 Nov 2026 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853599;
	bh=xU8Zv6Q9zSZob8EAaOmEe2n7yaNYuwxo2NXfjqN+WAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt7x0p4JJo8g/3xKlFUnlgI0KDdow44LpJZVjhKSbGUe5kQv4lWDhbGteSToeZDBX
	 Ye3nm7hm4SCGc7Vz5AvfQeeOp4dGnoLlQeKmB70L9b5yazwUk2wdAMA7OQ/S5qYWBh
	 toRKVEIsEpBWWCfSuLhtJvhVU+dcaLUhpwDKKaJl6M2DLXxACwJlSsRZr7mgodI9Hl
	 UZ98ABOWZtbKKX3IDEAb3SvMULs7RRCN/kse/nSSJiXZZ5Hh+UJY3/ugQcAWRl4lzh
	 9h2RY4Eg2dCxBpfvlwdOowVKJ8k8Um9B6ZKyKEtBMLXQVTCtO8r1cuTS3Zq93toJxl
	 BwZmi6psAKWmw==
Date: Mon, 16 Nov 2026 18:26:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <20261116-dreamless-matador-3163d4abbf0b@spud>
References: <20261116003937.1776888-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116003937.1776888-1-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6268327249221734132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6268327249221734132==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FfymeufmoUF60Lg0"
Content-Disposition: inline

--FfymeufmoUF60Lg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> Add the compatible string for the Andes A27L2 CPU core, which is used
> in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
> separately by Allwinner.

I'm going to apply this, on the basis that it will be used elsewhere.
Ordinarily, it should come with the allwinner series.

>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769..fbe8f0625e76 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,6 +46,7 @@ properties:
>            - enum:
>                - amd,mbv32
>                - amd,mbv64
> +              - andestech,a27l2
>                - andestech,ax45mp
>                - canaan,k210
>                - nuclei,ux900
> --=20
> 2.34.1
>=20

--FfymeufmoUF60Lg0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtK2QAKCRB4tDGHoIJi
0ryVAP9W43QUwLeP0Px1uPAyZV3Aq9OKHhjCmTsoQo5pxt7MSgEA4tJF9qwL/7L6
ii/PIC5KXUrbOBvtmlVKZop5d7nR0QE=
=EoEb
-----END PGP SIGNATURE-----

--FfymeufmoUF60Lg0--


--===============6268327249221734132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6268327249221734132==--

