Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A18606A331
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yc6NbD16;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icoKQxZI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yrPbtPVI3zzA6s8Vuc/qUJU8vp9hvT3QwS7L64KxG6U=; b=Yc6NbD16Ing9sZt3LWBP6TfQXE
	cX2g5lMEoMXQX8FHTFJQKmKQQFz5N2jrb38W5A4UmW+mPNQOZfL43uQpgLnC704wyrGrVyw8BkgsB
	kQgnhS/3qFfv4IH95C7z9HgPmcSe05wL0U7V4w56ypnkZ2+LitVRuv7KrNmyW2L4ghcAhs856hxiX
	nrRP6+6CBKxy13mJOz6Q+lIrGglKkxmY0011MbyuSa24X30E/bMS3z3QlK7I/Mg1Px/HwqrkOYpX3
	VEdFNU0OieHQ9L2fi5c/dXjr0xC73yyUycosaJeliyxV7NKYbRNC6F+Pb1yd0UP5YFZrM82ASh8B0
	r2pxe/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMQ3-00000003mXL-0Ifs;
	Tue, 03 Nov 2026 21:51:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMQ1-00000003mX3-291W
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:51:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4E4760136;
	Tue,  3 Nov 2026 21:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DF01F000C1;
	Tue,  3 Nov 2026 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742708;
	bh=qMfzSFB0OroJMmPBnBqKVEnv9fzY7GHzp2GhXqpM3mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=icoKQxZIqkaP0akUtRsQbRO6KTR0laJIKdG6couGqtlpsJb+0fpoSWEs94wXYdoOt
	 OCRX+fhkyDr5YQ8RmzF6ULcOCtiLUg8vnSEc8BfQluomnfaX3KiMQ/fGkY+9d9uQM5
	 4CNiw+U5uQcZd98uo5h70pm08TXui1PRjvEKnc+7SV8J7du9hurl/yZLl16dGe6dPf
	 brsheO4RemIcTiE96yY8sQ/SZ32kS7OAOavKd1KN8fhHZpt+pGC8ljJLR43Nci08nT
	 bhaKpQGGHBLai4TJfcBkjwLSazWmGm1V6aKuZmn976LmA8/wSjOUrlue+dLxSAyymr
	 obGri9r6XY2OQ==
Date: Tue, 3 Nov 2026 21:51:42 +0000
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
Subject: Re: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
Message-ID: <20261103-ammonia-bonanza-dd6212357a3e@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1810162292029647646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1810162292029647646==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tH29625J/yAJgHij"
Content-Disposition: inline

--tH29625J/yAJgHij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:29PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aclint mswi compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Again, same comment :)

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead=
,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-contro=
ller/thead,c900-aclint-mswi.yaml
> index 62fd220e126e650e3800d8eee2a749fdbbde6108..ca91b650caab8927b3a4ed91f=
1f7f142e3790a97 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> @@ -21,6 +21,7 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mswi
>            - const: nuclei,ux900-aclint-mswi
> +      - const: gf,mips-p8700-aclint-mswi
> =20
>    reg:
>      maxItems: 1
> @@ -46,4 +47,14 @@ examples:
>                              <&cpu4intc 3>;
>        reg =3D <0x94000000 0x00010000>;
>      };
> +
> +  - |
> +    mswi@16150000 {
> +        compatible =3D "gf,mips-p8700-aclint-mswi";
> +        reg =3D <0x16150000 0x4000>;
> +        interrupts-extended =3D <&cpu1intc 3>,
> +                              <&cpu2intc 3>,
> +                              <&cpu3intc 3>,
> +                              <&cpu4intc 3>;
> +    };
>  ...
>=20
> --=20
> 2.43.0
>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--tH29625J/yAJgHij
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupXbgAKCRB4tDGHoIJi
0ro6AQCerbghjDIlBOLIboHDuekV1p4da16UBOHEghcjMtCuggD/WZOimiIwBuT7
NyQ+YYhTVm4SaEHlUuhIhSKSYODNAwI=
=QGKB
-----END PGP SIGNATURE-----

--tH29625J/yAJgHij--


--===============1810162292029647646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1810162292029647646==--

