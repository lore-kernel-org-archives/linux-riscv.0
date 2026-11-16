Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06917606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tTOJshUM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WHEHMQSK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NUcVrvPJd7W5Y/JKfmaxCncdude7E6yIgwsyXU9Ofzk=; b=tTOJshUMP3OELCYWeAGwUGPYN6
	RWQ15xr4qb1DoAXsanPLqs8cZA+HAkRDqh5EpjW0ZymjfsdoQCJKF2VF5Cepdv68W0RP1vWoDx7ia
	IiqyJrGJ9P0m+BwTjAZHTCOsDpHeuixqUa7pQbFt8PDT6BtU8Ego1koDU86d8LrjEjIUNJu84ZXJK
	R2mnQOCVGZCvEHZEZiTxFkZkKeZ4dhvUXWY9LgdZl1kOr7c41uZwgcaCzeUdBboJTHvqqYxjCNogT
	fsYr5BYL0V6rrJ9qkaU6eQeqZJsAjb8YD2murA6sdoeCRP1dihNN6odKK8tr55/7eZWtldf1229k8
	wCTE/O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0XI-00000003Pba-19no;
	Mon, 16 Nov 2026 17:30:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0XH-00000003Pb4-2F71
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 17:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E73E840C10;
	Mon, 16 Nov 2026 17:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04581F000CA;
	Mon, 16 Nov 2026 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794850230;
	bh=6YyjGsuK+qsmWUW6iOiYpmAGFCmyQyZ9NbxIpIgGTg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHEHMQSKaxgr4dNnoQCnCtY2RQ1dZNB2PirO2DGGsoZjShp0jnioomSdBcgSlbP+S
	 S8CURBOykelBClBbJkMqA+eNubpWaxIiCatWsqRql2kyhwyCMspy7tM+owhE5bnUTK
	 c3rEwZYMf+XJFkvCdYSIKPWjTBbN0X+Ok4OsgwDIhtQ6QVhUD/wQsAhcqQ4hRQ91Zn
	 fkw69JFT8NkQIiHpnMjI8ACNt0/h5UXaCwhQ2ySccPjunMvqp/T61tEEyyC3IAZYXZ
	 s119D7JhV+zmYWjijjRhPDgzcIxFGB0I6lt6IGVVFhdC5mXT/GVObXCM/cqo6QtVSj
	 kYTpBTGzRz4tw==
Date: Mon, 16 Nov 2026 17:30:24 +0000
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
	Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261116-exquisite-taco-e48371fe6912@spud>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
 <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5978413581648500286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5978413581648500286==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVnCqKmtYuCXL2ot"
Content-Disposition: inline

--CVnCqKmtYuCXL2ot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55:12PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Perhaps worth mentioning that we are doing this this way because opensbi
expects this behaviour, as does u-boot, for the riscv,aclint-mtimer
compatible and we wish to align this device with it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

(If I end up applying this, I will amend the commit message)

Cheers,
Conor.

> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..a5ebe04ade9ed61c8beac5017=
aab94ab12afa9ea 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -21,13 +21,19 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - const: mips,p8700-aclint-mtimer
> =20
>    reg:
> +    minItems: 1
>      items:
> +      - description: MTIME Registers, or MTIMECMP Registers if only one
> +          region is present
>        - description: MTIMECMP Registers
> =20
>    reg-names:
> +    minItems: 1
>      items:
> +      - enum: [ mtime, mtimecmp ]
>        - const: mtimecmp
> =20
>    interrupts-extended:
> @@ -42,6 +48,26 @@ required:
>    - reg-names
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mips,p8700-aclint-mtimer
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
> +          items:
> +            - const: mtimecmp
> +
>  examples:
>    - |
>      timer@ac000000 {
> @@ -53,4 +79,15 @@ examples:
>        reg =3D <0xac000000 0x00010000>;
>        reg-names =3D "mtimecmp";
>      };
> +
> +  - |
> +    timer@16108050 {
> +        compatible =3D "mips,p8700-aclint-mtimer";
> +        reg =3D <0x16108050 0x8>, <0x16154000 0x7ff8>;
> +        reg-names =3D "mtime", "mtimecmp";
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

--CVnCqKmtYuCXL2ot
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavs9sAAKCRB4tDGHoIJi
0s5EAQCSUQ4DdcvwqeBYb+HrksHy7xGNiAQ1VyEPqGiIFKuuYQEAgVGb9xosFIMM
h2HmXwz1L8sUNsduaLdiHG3jbCEJBw4=
=ArEc
-----END PGP SIGNATURE-----

--CVnCqKmtYuCXL2ot--


--===============5978413581648500286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5978413581648500286==--

