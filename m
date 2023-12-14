Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvbOvA9wUqx3LvFBETIiY3L7H67kdnzDyudwCBcFFk8=; b=IJFT1SxQPUvDmEsKRk3McEr8Vn
	IFDNdT8nKOf4A0aKlnxtst5nyjQGpUQtVSVkfdvAI8NVAKgu+oc71ETzL8of2K5RHQDJZshJjAY3L
	eJxlUQomWuzWOqt/vUw3AKNlEBeI1UCY8Omq1wTvcFQdMHkSnGGORH3bzaQxS/1nV6n979AvtjDe4
	pEA6ENwxLdn/CMZNfXvLvM50ciUEpxdOovb84l4zhQchAtb06XzcIeLJPeU01W2Pn1Fzb5p/t4F1H
	28IO41ZXj5XcTaSo5hQV1JnXXFoq+rAM9dnEa5GZPEOI1acLifDBTiV5JOknhtBHIoqUrusJVxMxS
	mCspDZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmRG-000Vit-0A;
	Thu, 14 Dec 2023 14:11:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmRD-000VhB-13
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 14:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B52FCCE248E;
	Thu, 14 Dec 2023 14:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EC3C433C7;
	Thu, 14 Dec 2023 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702563097;
	bh=GyMtscGKySvG9oLYQyEiY2lUC4Sczcyl7+D4n6Kuh68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbNVZtIBC0vNUoSOfQzYky2npa/M9t2bWxKOFls89F2AM7500dj21eY2ZedF1g74S
	 BDAt/l8O6XXt6sjY4AlBSHNIdVHoERPlQ1cVV9hc+IzaAvXtYTGDDUSVx4L9M0vdOy
	 F/qQVrs1sfxmL/PBeDNkppUoTCqCA+opvwYgL7nGb1ESaobz84zwvN0Zt+9cuoxXEf
	 uJXWpYKEHvXIko+v1hf9SBkyuSQbMOvxc5czneQikTmztS0OD14gCFh2KDLUaDny89
	 z3J07WYjFCGfeVI1l9s4ceP0vJU0vK7f1CUv+nJITUDIV+Gtu1U5QE61imQEo7fqkC
	 bJd+Q2IJwGIIA==
Date: Thu, 14 Dec 2023 14:11:32 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
Message-ID: <20231214-headed-credible-f94ffb712e91@spud>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-4-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231213113308.133176-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_061143_540345_444AED83 
X-CRM114-Status: GOOD (  16.06  )
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
Content-Type: multipart/mixed; boundary="===============6067113769453522517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6067113769453522517==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZDap9bRO8g0/XW1"
Content-Disposition: inline


--IZDap9bRO8g0/XW1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:32:59PM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zam ISA extension.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 3574a0b70be4..912cc6a42eb4 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,11 @@ properties:
>              memory types as ratified in the 20191213 version of the priv=
ileged
>              ISA specification.
> =20
> +        - const: zam
> +          description: |
> +            The standard Zam extension for misaligned atomics is support=
ed as
> +            ratified in version 20191213 of the riscv-isa-manual.

Is "20191213" an actual tag in that repo? Looking at that version of the
spec (because it is a spec version, but I don't think it is a valid
reference to that repo) Zam is listed as Draft. In fact, in the most
recent thing I could find, Zam was still listed as draft.

Are you sure this is ratified?

--IZDap9bRO8g0/XW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsNFAAKCRB4tDGHoIJi
0n4WAP0UHU+PgvrzVtz+qD0YcBNQ5QVXPk4viQc73jWiaOWDpQEAoUmgwnWN5N5k
kXnIAgVh6XBqwvDr3kxU571dBisUywc=
=q1/2
-----END PGP SIGNATURE-----

--IZDap9bRO8g0/XW1--


--===============6067113769453522517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6067113769453522517==--

