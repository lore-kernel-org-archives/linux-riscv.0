Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3853C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG/K4Wiv/O0vYi/IEt98pCTka8cyGrM4KZQYGrzzR80=; b=JpC9Czsk4JplZtF/EQDHSecd0C
	WysismPAq38hWo/wW6Dlp4VJK/xQ+YZ3zu0tV1oqMmzrNtnun89XAgc8Jp3sFSwUFnJyoKq83gPt3
	P6VGXmpC+MWmmtKm5xpz/7FLjcB1MS2HPocwdqShtGG60MAutObIIbXmpjqlHFJoYekYFj3/CL5q2
	xl6OUOHmH5tsjQNHhEJrAbKb96rlOfrljnxn7OuJNwLD1OYnK/t2Qe9mnDyCEwBvUGz3CFPyzKeSa
	2wkZXaq13AtquE4w7GmPym2OGSKztDhOgYDlWYG6ignGt+SdWN+/aY0VLPJknJufHaBI+eo7lxXD7
	PUAkziDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqUX-00000006EjY-2YFc;
	Fri, 19 Apr 2024 15:49:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqUT-00000006EgE-0m38;
	Fri, 19 Apr 2024 15:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6764B61952;
	Fri, 19 Apr 2024 15:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F25C2BD10;
	Fri, 19 Apr 2024 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713541768;
	bh=MMNCu9qXo/Sui8C3tMfJ7lzuoTJCSLI1PUO4ACRkh8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXF3MH9UhHZaW5c+fQbICV8+tqL8zZd3GbsK+MMtlVnuI+U9MykD5EdYMbnqzGiQA
	 clolbwi+WJpRnCi8Bgt+tEF57vK45kHXEgAivOzflaV60ugfWPJize6jQXFRFHwjyr
	 VRS95okpFhaUArffiB/+u6m+wylmbq/z7sLeQsbFvkITQqoo7UuMHWOkDxb5E4UPYj
	 yAg41C5DHBDH+t2YzcwksmCMBm7ZYDOWSL2q4WPfoHN6O8DqUXWH6xY+zsUNil7480
	 D0X+YTTKNs+W1AwuRvHl2QI8DgHMxQgN51X8xpUibgE1yudXL+nOsnAy3LXdkfDXNg
	 tmjlh9MV2WO1A==
Date: Fri, 19 Apr 2024 16:49:16 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
Message-ID: <20240419-blinked-timid-da722ec6ddc4@spud>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418124300.1387978-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_084929_463937_303EA717 
X-CRM114-Status: GOOD (  25.35  )
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
Content-Type: multipart/mixed; boundary="===============5741308595008354917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5741308595008354917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DpdcO0rlxZdj1hXZ"
Content-Disposition: inline


--DpdcO0rlxZdj1hXZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 02:42:26PM +0200, Cl=E9ment L=E9ger wrote:
> As stated by Zc* spec:
>=20
> "As C defines the same instructions as Zca, Zcf and Zcd, the rule is that:
>  - C always implies Zca
>  - C+F implies Zcf (RV32 only)
>  - C+D implies Zcd"
>=20
> Add additionnal validation rules to enforce this in dts.

I'll get it out of the way: NAK, and the dts patch is the perfect
example of why. I don't want us to have to continually update
devicetrees. If these are implied due to being subsets of other
extensions, then software should be able to enable them when that
other extension is present.

My fear is that, and a quick look at the "add probing" commit seemed to
confirm it, new subsets would require updates to the dts, even though
the existing extension is perfectly sufficient to determine presence.

I definitely want to avoid continual updates to the devicetree for churn
reasons whenever subsets are added, but not turning on the likes of Zca
when C is present because "the bindings were updated to enforce this"
is a complete blocker. I do concede that having two parents makes that
more difficult and will likely require some changes to how we probe - do
we need to have a "second round" type thing?
Taking Zcf as an example, maybe something like making both of C and F into
"standard" supersets and adding a case to riscv_isa_extension_check()
that would mandate that Zca and F are enabled before enabling it, and we
would ensure that C implies Zca before it implies Zcf?

Given we'd be relying on ordering, we have to perform the same implication
for both F and C and make sure that the "implies" struct has Zca before Zcf.
I don't really like that suggestion, hopefully there's a nicer way of doing
that, but I don't like the dt stuff here.

Thanks,
Conor.

>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       |  8 +++--
>  .../devicetree/bindings/riscv/extensions.yaml | 34 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..c4e2c65437b1 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -168,7 +168,7 @@ examples:
>                  i-cache-size =3D <16384>;
>                  reg =3D <0>;
>                  riscv,isa-base =3D "rv64i";
> -                riscv,isa-extensions =3D "i", "m", "a", "c";
> +                riscv,isa-extensions =3D "i", "m", "a", "c", "zca";
> =20
>                  cpu_intc0: interrupt-controller {
>                          #interrupt-cells =3D <1>;
> @@ -194,7 +194,8 @@ examples:
>                  reg =3D <1>;
>                  tlb-split;
>                  riscv,isa-base =3D "rv64i";
> -                riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c";
> +                riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "=
zca",
> +                                       "zcd";
> =20
>                  cpu_intc1: interrupt-controller {
>                          #interrupt-cells =3D <1>;
> @@ -215,7 +216,8 @@ examples:
>                  compatible =3D "riscv";
>                  mmu-type =3D "riscv,sv48";
>                  riscv,isa-base =3D "rv64i";
> -                riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c";
> +                riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "=
zca",
> +                                       "zcd";
> =20
>                  interrupt-controller {
>                          #interrupt-cells =3D <1>;
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index db7daf22b863..0172cbaa13ca 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -549,6 +549,23 @@ properties:
>                  const: zca
>              - contains:
>                  const: f
> +      # C extension implies Zca
> +      - if:
> +          contains:
> +            const: c
> +        then:
> +          contains:
> +            const: zca
> +      # C extension implies Zcd if d
> +      - if:
> +          allOf:
> +            - contains:
> +                const: c
> +            - contains:
> +                const: d
> +        then:
> +          contains:
> +            const: zcd
> =20
>  allOf:
>    # Zcf extension does not exists on rv64
> @@ -566,6 +583,23 @@ allOf:
>            not:
>              contains:
>                const: zcf
> +  # C extension implies Zcf if f on rv32 only
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          allOf:
> +            - contains:
> +                const: c
> +            - contains:
> +                const: f
> +        riscv,isa-base:
> +          contains:
> +            const: rv32i
> +    then:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zcf
> =20
>  additionalProperties: true
>  ...
> --=20
> 2.43.0
>=20

--DpdcO0rlxZdj1hXZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKSfAAKCRB4tDGHoIJi
0p0bAQCI0ZdOO2q+xaWhcL7Krk9HCdLpniOsKdATTU8zMWqUWgEA7ccpybuwBzK1
KglS0OiA5rjSvLYmJv2WgOCxlKn58AQ=
=l0RY
-----END PGP SIGNATURE-----

--DpdcO0rlxZdj1hXZ--


--===============5741308595008354917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5741308595008354917==--

