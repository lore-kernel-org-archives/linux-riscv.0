Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA884C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v21nG0kfa52xg/GyRjSyFKjCRFO+uoUHDL6qQn53E4E=; b=Osut+2/nhozJB6bxgt5b5OHIV/
	rPm9yo4zmzc1hyU4qYpKnKGXl4aBMnQ/ye7X16l/XYbAbpESf8xFzX4cTuUPJ+iE1rDMNCT/EqHmx
	D6YDNTMqpS/gZt+vBnUAFmSfPwk3SwRtc1zcQDlm2wERLWZkWDxtbcgcbC7gapTYe7+/KEL6xvdOI
	M39ltKsbR+JB1zZGvWpUFmVKManjYW5BzZ7qvjm+00g5vs6QgxlNjMMZbYQ8ZKXOtc3mVGGhDanrm
	IOLh2v/id6LNBO0TbeEEXbWG6eYC9t0qlGXyTTEcqtoFb30MUbTueeiA3ggSq1aII0Lr7MvZfWD39
	dm5vLeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbyU-0000000FWcp-16Io;
	Mon, 27 May 2024 15:09:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbyR-0000000FWcG-1Z1J;
	Mon, 27 May 2024 15:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DB0B6198C;
	Mon, 27 May 2024 15:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D29C2BBFC;
	Mon, 27 May 2024 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716822558;
	bh=YuKxD3bWQ8aYWzULrWddjuARczonPYhNEB+CaCLpbT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbtSOJS5A0pxbhhg/T2QRACi/3qELIIl8uDyGzpJ3dNKNbzcNWSr1VSk3Bq+S71KQ
	 //wLknjrjCT3MPDI9Z0TuqVRrwd/nAllBflc5Cfs+g1CtRc2di7xgxJ8reDR+HBrNT
	 h1z5IIKT5V919t72iKuNeAElyVwOr3G0ya5mWiRnl8GsZ49TLpZR8o7zHsMwVw2IRG
	 zmEtR3AG5NgtNbxL9EQU1kBUYNLUk2qaHg8a9dn6GRJ0KNBfcetBxHw2nIkqmDCJuE
	 04Ho9cLZezkdeoXMGmPJzXkX4ck/JWvbCk4UC4PIJg6NtfsdE9IWJm7EYiO68i5jLD
	 nMsUxBi+WcFSA==
Date: Mon, 27 May 2024 16:09:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, greentime.hu@sifive.com,
	vincent.chen@sifive.com, cleger@rivosinc.com, alex@ghiti.fr,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 2/5] dt-bindings: riscv: Add Svadu Entry
Message-ID: <20240527-widely-goatskin-bb5575541aed@spud>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240524103307.2684-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_080919_482754_B3DDE150 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============2006312678041821968=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2006312678041821968==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="39tUOd5aicq+YFEC"
Content-Disposition: inline


--39tUOd5aicq+YFEC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 06:33:02PM +0800, Yong-Xuan Wang wrote:
> Add an entry for the Svadu extension to the riscv,isa-extensions property.
>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I'm going to un-ack this, not because you did something wrong per se,
but because there's some discussion on the OpenSBI list about what is
and what is not backwards compatible and how an OS should interpret
svade and svadu:
https://lists.infradead.org/pipermail/opensbi/2024-May/006949.html

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..598a5841920f 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,12 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
> =20
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware u=
pdating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull r=
equest
> +            #25 from ved-rivos/ratified") of riscv-svadu.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-gra=
ined
> --=20
> 2.17.1
>=20

--39tUOd5aicq+YFEC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlSiGAAKCRB4tDGHoIJi
0rsyAQDVctvH18CS7Wmm09E45EARmF5ZCi1dVq5wi3eKs6RM2gEA4XNa7WqLM3B8
qQI+GhZGvFqrbLnnav9sXWDnIHogkQU=
=AIHm
-----END PGP SIGNATURE-----

--39tUOd5aicq+YFEC--


--===============2006312678041821968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2006312678041821968==--

