Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3C606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MwOCMs6I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1jGmjkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=83lZK/Z2kyPHsY4RtkARX8pcgVAbbtRY0i0QAq2yspw=; b=MwOCMs6IIlYw8lczdcuHeP+HHY
	ptjXgfQLvKC/9fYEctiMZJNyHAuZEtYGv3sUSRH/2mr0R/2Wu4WMv2O6NtBIYeue61KmKOf6x3v9o
	t71otVdW7VhpV/dhjViA45uO6CGz+QTBvDEzpdITgBFr6A6brTBO6DNnaYL83Rv5whvZazsX88A+f
	K4lo0zrtQEKN7yiIKUqmiS0l9CZreXVgItZ3bTFyQSsj8dzuABgjfUk95VVkIcVX7a8dv6wix1Aqi
	P1GFX9ijLFKSfqecM9bEjWksWnURMGfmJNcpd/05jUxfOAY8aADzzLD2VvF4lZIC+7Yui/1vy2biO
	B0yM4mSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMNm-00000003mIZ-2yLq;
	Tue, 03 Nov 2026 21:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMNl-00000003mIT-0V8v
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:49:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66F4160254;
	Tue,  3 Nov 2026 21:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBDE1F000C1;
	Tue,  3 Nov 2026 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742568;
	bh=FJgcBT3yUspZwomLITUHEv0rgME0CFKs4q1Bs4VNORM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1jGmjkW/El3Tva6vihe8cxVRUPbg2hY5HjUM4mkhSCk8vNr9wBC52vmIo4SeyXqz
	 zU00jiRxv105FYDCrxtYJd8vfQlshOvlZ2cx1h6PH1ePSl9EnU9uqJhQFFY/IiYUAv
	 4eKBsLTi9/+13AwbiSDbF8OGA8uelmiazKJOxdW6nqFlDxqh7NOLKV02bVsRSkQP/r
	 V27mMQmODaGZT7EqVPlkQHsP7PtR9h/I0kcb5XVKaL/GEPzpJtYzdk7sg52lNteP+Y
	 GSkkWl4s2R46Ix0tz69OGEdQ6/chKg5xIqGACH6yDzvbCwBRZN7hWbCdimxd/i+mEn
	 8t2OTDZ5yM4Zg==
Date: Tue, 3 Nov 2026 21:49:22 +0000
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
Subject: Re: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261103-charm-ending-efe2b7081ca7@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0083161076094717723=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0083161076094717723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zB/wqLxM1r6PbqUO"
Content-Disposition: inline

--zB/wqLxM1r6PbqUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:30PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Same comments here too.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..40acb651c27b7eaa8a20caa8b=
bc225b350088810 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -21,14 +21,19 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - const: gf,mips-p8700-aclint-mtimer
> =20
>    reg:
> +    minItems: 1
>      items:
>        - description: MTIMECMP Registers
> +      - description: MTIME Registers
> =20
>    reg-names:
> +    minItems: 1
>      items:
>        - const: mtimecmp
> +      - const: mtime
> =20
>    interrupts-extended:
>      minItems: 1
> @@ -42,6 +47,25 @@ required:
>    - reg-names
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: gf,mips-p8700-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +
>  examples:
>    - |
>      timer@ac000000 {
> @@ -53,4 +77,15 @@ examples:
>        reg =3D <0xac000000 0x00010000>;
>        reg-names =3D "mtimecmp";
>      };
> +
> +  - |
> +    timer@16154000 {
> +        compatible =3D "gf,mips-p8700-aclint-mtimer";
> +        reg =3D <0x16154000 0x7ff8>, <0x16108050 0x8>;
> +        reg-names =3D "mtimecmp", "mtime";
> +        interrupts-extended =3D <&cpu1intc 7>,
> +                              <&cpu2intc 7>,
> +                              <&cpu3intc 7>,
> +                              <&cpu4intc 7>;
> +    };
>  ...
>=20
> --=20
> 2.43.0
>=20
>=20

--zB/wqLxM1r6PbqUO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupW4gAKCRB4tDGHoIJi
0tBmAQCRIIS3LK3kIk683cX88JVgQMAIB2a2Eg4xoiGAWzuF1QEAjZk3AD06su9q
TUaxj84yuk7WH4tO+RnQj6h7foIK1gk=
=51DL
-----END PGP SIGNATURE-----

--zB/wqLxM1r6PbqUO--


--===============0083161076094717723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0083161076094717723==--

