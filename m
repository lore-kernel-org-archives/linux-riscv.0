Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74CC369D7
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1x586uTp5UUTEvXHOpWJ4Dv5e93NL4U/4puQuopeos=; b=MjMGn4ykVpVfr0v8VG/7uK7+et
	ddU7Hy4sR6b3qALW7//9zj3AtWD19b3G4m7uYJxeaI3lJZ5HLyj0o1LwRRjMeW3wf8iPhzPevXQr+
	zhc9m7kWcB6BuRxLhxuoLZuYDVtZ4DRMFnvxAiN62zNYjpCn06CY7QFZ7JOSWDAbiC8Piot52eb7n
	rrVGmEPN/LjQt6f2nA7xWb0OwhujfVyLdYqx6Bk2UCETC5GLsEZDz4ilhaBhZ3mjFqjdkJVzm0/hd
	pmjL2NgdMJ8FwxpkacwzgCszy52jBQwfyjyRq1xi8/rH4K3V2Nr3EZzI8rrYMR2HKJUtLQjxRDZzU
	WpI9Rj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GgT-00000007wsw-34KR;
	Tue, 22 Apr 2025 16:41:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FNo-00000007gAf-086S
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 15:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5F1049CFE;
	Tue, 22 Apr 2025 15:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75636C4CEE9;
	Tue, 22 Apr 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335079;
	bh=JkvPZdoTShYa8vDVe82Hn3R7KyYo0c/3vBiaqizB5ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hp+qvVRqvpQdd3/dLE1zjIapr7/xCp57r+PZJY4J9+xoE8I+C/cVAzdcKa400IG6+
	 5ciI5xalA1XEZevUxaHZHtGtSt6/XuxuZ4Y4ZprEWw7FXltbk+etoTyjUgfvBSooYn
	 5mtTVZOoT5bFfrmdqz595hLnXsX5eR4CyUPfk4cSw5Ef8M0GkH5mJpJMgMdU+IvPAu
	 UjxBUOlVJNcUxIOh9NQHcgCiDXbYA5/4kZel9vVrFMwsKjeM54BVQUClqlQ1ovtJYP
	 QPMzGYLO6KGm/bJFhxVhHju5CNjTY7btBsqxupzk8UqwEwe90Uko2ZU5M4BnXZLJhK
	 L+xZpktfPyLYQ==
Date: Tue, 22 Apr 2025 16:17:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: riscv: Add xsfvqmaccdod and
 xsfvqmaccqoq ISA extension description
Message-ID: <20250422-poise-tighten-aed2c0aae830@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-2-cyan.yang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250418053239.4351-2-cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_081800_118347_885E7984 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Type: multipart/mixed; boundary="===============4839333739147484170=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4839333739147484170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hRIk/4PQozJORUcm"
Content-Disposition: inline


--hRIk/4PQozJORUcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:28PM +0800, Cyan Yang wrote:
> Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
> SiFive for int8 matrix multiplication instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

If these have some dependencies, please look at how other extensions
have made them required. Otherwise all three dt-binding patches look
fine. I'll leave acks on them all, but with the condition that you
should make dependencies required.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index bcab59e0cc2e..d36e7c68d69a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -662,6 +662,19 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # SiFive
> +        - const: xsfvqmaccdod
> +          description:
> +            SiFive Int8 Matrix Multiplication Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/sifive-int8-matrix-mult=
iplication-extensions-specification
> +
> +        - const: xsfvqmaccqoq
> +          description:
> +            SiFive Int8 Matrix Multiplication Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/sifive-int8-matrix-mult=
iplication-extensions-specification
> +
>          # T-HEAD
>          - const: xtheadvector
>            description:
> --=20
> 2.39.5 (Apple Git-154)
>=20

--hRIk/4PQozJORUcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezIQAKCRB4tDGHoIJi
0jfcAQDrhx6DlkgKg6HVs+ukQJSLPErr2MbtDFPVK7i7rMFZXwEA/Y+WWXOz3uhT
2ItvCrOzJaa5cV3cMf5gtgR9G0zRmAY=
=7GKQ
-----END PGP SIGNATURE-----

--hRIk/4PQozJORUcm--


--===============4839333739147484170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4839333739147484170==--

