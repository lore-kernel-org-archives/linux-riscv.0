Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A80BC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8IaQIhDwADjgEh2IqvNvJrPl2ehxYoTacV5E89g8FI=; b=V9I1jMSWSTWHzYPkxDREJStlkX
	ZW/Vn5XcMUjRnp0xi9KX37/dgwpKORTvoqbi4z2pbh0D1DfajnsqeO/o/yFk8xoplqjXoz11rc5h6
	YtrDApUy6ikrOPMyqMPgEo6pgPwa5DYV5+3hlqDgtvd1q940gksyAMFU4RQVnfUP7Wd7Z92+KrUsE
	ND3ICwjxOO0xXUrwP48qlHahlXCdOUpT5GJak9+9FiKKWGp/vcA6JyxV75UHweIDxe/ggbK6ubVJF
	TMBdBd7kqt0NQaae1THRXNABwR+ByY5ocvCNrtEm0TuZs/Lih2pypquhDa9u2JmHXnhA+hQcMGd8L
	0khyKrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6TJ-00000006xJK-3Acp;
	Tue, 11 Mar 2025 20:45:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6TH-00000006xIb-3Gb6
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 20:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55A0D5C0EC9;
	Tue, 11 Mar 2025 20:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5491BC4CEEA;
	Tue, 11 Mar 2025 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741725902;
	bh=p5wxlv0baXv+9OyKpF3W9P7Pe9J7X5EYUfFeIweRo8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJaKlmpjXm4f6lZA5REj923wJohERzFXbEWZl3bV7OP9XKjUqE+6bNVEye9YFZZ54
	 jQdwCB/6iUYv9YzUXR+CFAVwGPLx6G7VV9M6LwZKRHBk1hYA0b5ASAe/Hs7PwLXxSi
	 LQPSU7my445RPrq/D6PJYBJ1h8UkXMafV26W+tV1pRHj5LKmM5hlcmrfadQQP618my
	 AyhfNDIpjSU4t5zwCZbOysERoGyuNpR6Z7L4Bq2FL67TjrL4IO0/lLnhv9RH9yyMne
	 SpU9S64myDPSwZWhruU6mnqQDI19qOPlc9qN9p1E2i3eSjQHctk2M7k06SdQ7b93KH
	 Qg2q2sjLnlqSA==
Date: Tue, 11 Mar 2025 20:44:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20250311-unwoven-headrest-5b1716bcfeb3@spud>
References: <20250311051903.3825-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250311051903.3825-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_134503_860719_D5B6C07C 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Type: multipart/mixed; boundary="===============1485203991891653931=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1485203991891653931==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zeIRKp/XrKjrRaB4"
Content-Disposition: inline


--zeIRKp/XrKjrRaB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:19:03PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2.
>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..93d74c504b5f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,9 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
> +      - items:
> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description: SiFive CLINT v2 is the HRT that supports the Zicntr

I'm curious why sifive,clint0 isn't a fallback.

>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +65,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
> =20
> +  sifive,fine-ctr-bits:
> +    description: The width in bits of the fine counter.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  properties:
> +    sifive,fine-ctr-bits:
> +      maximum: 15
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
> =20
>  required:
> --=20
> 2.17.1
>=20

--zeIRKp/XrKjrRaB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9CgyQAKCRB4tDGHoIJi
0nOuAP9PpKdkQZr7bEJYcCGO2Jxd3xT8eb18iBJdGL9sMehhggD9FXyfpKM7pUMq
4n4C8jt8e/ZF8OUasNqcpXS84fhqPwY=
=Szks
-----END PGP SIGNATURE-----

--zeIRKp/XrKjrRaB4--


--===============1485203991891653931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1485203991891653931==--

