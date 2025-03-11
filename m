Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930A2C2BA1B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2MbhLoIa1oc5N+m+RmN0Nhr06aDEVThiMLkMO83TwQ=; b=ywspGC4dCq/njXvGGZM1kHZO4Z
	wKUpfWWIbpQGwSzznom/Om/KedD5y7Nj9jpFTcZ7o8oDugL6xRGaZzEq9bendWq8j8QeSxlOT9H/0
	C6pzxmiZukdt6d5zHhh3bRfpyWT+9MGMyHxBkaO0cR4uSSUJ/V3FHSZ8iWUP91Apr08OhuR8lcxS6
	UY7nCM17MpAbJCJTkx1QoKYw8wlkfb/dRw4BJPZtpH2U6inYMzwytopnGwsW2XETTZwMP8eth0CU+
	4nHYLXIK7HH4Qvw+UzCfoNeoLGx0odCa+j3/4X/LUXoX/qx0TAtp24UNBmGBss+wmRFr4XrAEHWQW
	OSU9wGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Oc-00000006dH0-0RUd;
	Tue, 11 Mar 2025 18:32:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts451-00000006Zvu-3Vhn
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3EA4A4611F;
	Tue, 11 Mar 2025 18:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370A0C4CEEF;
	Tue, 11 Mar 2025 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716710;
	bh=6F/k+ohWhXcoXwg5XBr9rp54e3QcQ9v3bx+s3rTBQZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbNZ//VPLZlh9QJO50mf5586izFK6ZQOSDpMdacVnUloSNC2dTtGORykLAYOYgXi1
	 V3uaVsi3Vn0ZGmVyRbA708FTYANDdK7bYnzhJtmQn4X1juNUE2o8ocyRmlU8sfB74n
	 nXY3DFqrYT/xjCXpK+TivylNgCYmgfdqZxRKYYYF3OkDGIhhBmyqe8owtRXb8MPZci
	 Mk4+DSQzg0PRGWbJhM1eR/UJkr8l416k4Yj17KJEJHruAyS6QHzoPbPQ3aDGXa1ZCh
	 5wQRufVfLB65+lf1e0b68N2cphBx0CTWuyLABvg2c4J2JQ7h4pAnt/YHeYopZIg8UT
	 ZgeM4FuSY61gA==
Date: Tue, 11 Mar 2025 18:11:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN
 EIC7700 SoC compatibility
Message-ID: <20250311-exposure-relive-f33873964914@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-6-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-6-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111152_009322_653943E8 
X-CRM114-Status: GOOD (  17.46  )
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
Content-Type: multipart/mixed; boundary="===============3324030954307125783=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3324030954307125783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4KqL/Ursy/O0/Cxs"
Content-Disposition: inline


--4KqL/Ursy/O0/Cxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:27PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> This cache controller is also used on the ESWIN EIC7700 SoC.
> However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
> So add dedicated compatible string for it.
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../bindings/cache/sifive,ccache0.yaml        | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 7e8cebe21584..11e9df2cd153 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -39,6 +39,7 @@ properties:
>            - const: cache
>        - items:
>            - enum:
> +              - eswin,eic7700-l3-cache
>                - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>            - const: sifive,ccache0
> @@ -55,10 +56,10 @@ properties:
>      enum: [2, 3]
> =20
>    cache-sets:
> -    enum: [1024, 2048]
> +    enum: [1024, 2048, 4096]
> =20
>    cache-size:
> -    const: 2097152
> +    enum: [2097152, 4194304]

Making this an enum makes either value permitted on each SoC. Can you
add cache-size restrictions to the if statements below to keep it
restricted to the correct value please?

Cheers,
Conor.

> =20
>    cache-unified: true
> =20
> @@ -89,6 +90,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - eswin,eic7700-l3-cache
>                - sifive,fu740-c000-ccache
>                - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
> @@ -122,11 +124,31 @@ allOf:
>          cache-sets:
>            const: 2048
> =20
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mpfs-ccache
> +              - sifive,fu540-c000-ccache
> +
> +    then:
>        properties:
>          cache-sets:
>            const: 1024
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - eswin,eic7700-l3-cache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 4096
> +
>    - if:
>        properties:
>          compatible:
> --=20
> 2.25.1
>=20

--4KqL/Ursy/O0/Cxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B83wAKCRB4tDGHoIJi
0qg6AP9/9GbV4BfcxIJ0Hq3/t9Jb3rfm4yxgeB1hMbL/+rUcHgD/eGLTFdv6dNBd
zNDict/2TFKThTFRgSv01Oz9CJbLGAA=
=BjHP
-----END PGP SIGNATURE-----

--4KqL/Ursy/O0/Cxs--


--===============3324030954307125783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3324030954307125783==--

