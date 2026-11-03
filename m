Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F0606A31B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifLLnpTe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYwtomkS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MfKUbx95xfWTl42fpgNfOntmpRVuyQy+eJQPiwT8CmI=; b=ifLLnpTeVlRzamZ5FyYxIuZfTp
	0nbXv4SdqfAAEyx6xLg2rXSBLud9/S39bwtHU4oNEv6H9hZc1PZl0SVzp6WaxIxxQKMYCOtaqw0U0
	vdkAOx+i04HYUWspuOlSi1qgDu1iCOgYnT955eZO/2GLhpvsSwryHmFkpyWhtGnpokhX1p6bprf2m
	mwzvdYXM8vRT8IAxyL3AXA6qPiMmbIdiQnYp/0Mehdc/2qi1IF3874k4Fq1OdJEdw98PZXX+HrJcT
	/0V8+lc5SJcqYs8y/08+fKi9fhXvkM6oPjvLOqFVFdYlDqp+SGi/rL1llaPY3RWepK7uzON6waj9M
	BhG9izuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMKk-00000003lns-0QLD;
	Tue, 03 Nov 2026 21:46:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMKj-00000003lnm-0QZ8
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:46:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7B3E40453;
	Tue,  3 Nov 2026 21:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1957A1F000C1;
	Tue,  3 Nov 2026 21:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742380;
	bh=0DNLLjSttti2OQSih1kTXZgEXGm357f1EA6dDkr6z5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYwtomkS/1VYXxTOzT31d7QR4zUOKxpye6LygxNbHb+8Jj3nDdpgqbEOUrzn3Mx7p
	 uCb7U6IX1aY9LOsrE65b1ZFk9Qo44PjPInFKyoI4NDpU2HXu3kTsZh1QU5Xe4lC1PU
	 1rVw2GqHGlPPDvQJVeFVtTYGADyQFDhFJMY+r7u2f4XIABklH3AHpr0Mx90ur9Z37x
	 sCu4wbZJTXUkHOJwYZhn5dW/3UKPEwCWGA5ITqitIE0lBh2osKwwEhCJBr5eoF+lar
	 DciNd1tW33XQRgswy037GWTVgbpxIe+R2ASv/gbE5CPezX7x2OWhp02yTR8X6UQD2u
	 KRt4hltnhLHZA==
Date: Tue, 3 Nov 2026 21:46:15 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Message-ID: <20261103-palm-stand-5f54657140f7@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2170355313564918309=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2170355313564918309==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DoJrlLmBCVXxxwh0"
Content-Disposition: inline

--DoJrlLmBCVXxxwh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:28PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aplic compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe5=
35075111601b80e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -27,6 +27,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - gf,mips-p8700-aplic

tbh, I don't like this because other devices on this "soc" are using
mips,p8700-aplic and so I think this should be gf,p8700-aplic but I
don't really care that much.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>            - qemu,aplic
>            - spacemit,k3-aplic
>        - const: riscv,aplic
>=20
> --=20
> 2.43.0
>=20
>=20

--DoJrlLmBCVXxxwh0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWJwAKCRB4tDGHoIJi
0ouyAQDJ+wUgUc04yCoAMVTPXDadsJZrrjNC74GrjwNAVDDwBgD9Fdx4gjR/QuhF
oaDNIvt0fRWflgAUJp7oXfdoMfO90w0=
=b4BH
-----END PGP SIGNATURE-----

--DoJrlLmBCVXxxwh0--


--===============2170355313564918309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2170355313564918309==--

