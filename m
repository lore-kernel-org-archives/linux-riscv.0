Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D66C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHHnsdHHsl2SAGOOSYThDGuQ5VNd1Kg+klrlPuwa6Ug=; b=uxv8sGbLW5+vAx6HDEydS0ccT0
	+FQJ+48z7jRC0auNJOMDQFS9yZzDsAgnRcNo1z8E92PL+GFWtGC7DL5x62mYZCqHt/bWjqLPdRBGh
	f2bOQ7mF7NHPKilyTjkeCabojJVSathRCxcWO5dJ5Kbih3Z/u/rBtuXGg//sIKgBxm8bVho4CV0EY
	WHTTcjnYURtw0Ypp4G9ttHQRALx8ciai7tsQ3/D5OwEo33paWVY3RGxzr4CNz75sfaM7dfkGhlV5Q
	LMzMi3lQzq2g3Io7gNYkHWJNDamHBitl0976hWb71kttufR1ebgkcmt9M9IxQVPbn5NUl8H/5AF4D
	0mbnda4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WqA-00E2N2-0w;
	Mon, 13 Nov 2023 13:18:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wq6-00E2LO-2z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9B7FEB80DB8;
	Mon, 13 Nov 2023 13:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4BEC433C8;
	Mon, 13 Nov 2023 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699881533;
	bh=+8leGFcBO03KqBvuLccS/eEH1Cx5hybO9OKnutzXe8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNhek2gP1BRQnDnH2LeNK6SUvXBliiLONnJ+7GEWmYH3qrA54djm4qU20qX0ZSgC9
	 VSAZQZFtU1s9R7YMJnyPIt9cPd8r65omFzblmWhyJbY7YvZfys1aHaClOHDyIhbRtj
	 yssTaeVhe//MlV/hHXAY5hnNYfBYJUhLF6aiDfANMxVfcEFPu5F5qSXzh/9vtj5/D2
	 0z7c2BtEbFw/JTIJgix595Z2zRsgrh/bw+R31NegCromIEO3yxYPQxIuOn3TVRR/eU
	 JSj9v0Fot4yiy7yh8HZD6dD0kDGIhohRo0mGogfIdCZTfIhS1GC35nFZMwc3Omuet8
	 RX9cUepEDUsZQ==
Date: Mon, 13 Nov 2023 13:18:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Message-ID: <20231113-confusing-postcard-7dd9da33dc23@squawk>
References: <IA1PR20MB49538304E99DABF0208C00A0BBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49538E6F9B462DD40E98C998BBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49538E6F9B462DD40E98C998BBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051855_225543_777BCABC 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Type: multipart/mixed; boundary="===============4125056355452945759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4125056355452945759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CBvT2rAjqEdWny82"
Content-Disposition: inline


--CBvT2rAjqEdWny82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 10:23:59AM +0800, Inochi Amaoto wrote:
> To make thead aclint timer more closer to the aclint spec, use two regs
> to represent the mtime and mtimecmp.

In the devicetree patch you say:
"Change the timer layout in the dtb to fit the format that needed by
the SBI."

That seems like a far more important thing to say in the binding patch,
since that is where the ABI is set. You also provide two links to
discussion on the mailing list for opensbi, but provide no context in
the commit message here for why they're relevant. The 005738 one doesn't
seem to be relevant at all?

Could you please resubmit this with a better commit message that
explains why the ABI here needs to change?

Thanks,
Conor.

>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.h=
tml
> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005738.h=
tml
> Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> ---
>  .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml  | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index fbd235650e52..c3080962d902 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -17,7 +17,7 @@ properties:
>        - const: thead,c900-aclint-mtimer
>=20
>    reg:
> -    maxItems: 1
> +    maxItems: 2
>=20
>    interrupts-extended:
>      minItems: 1
> @@ -38,6 +38,7 @@ examples:
>                              <&cpu2intc 7>,
>                              <&cpu3intc 7>,
>                              <&cpu4intc 7>;
> -      reg =3D <0xac000000 0x00010000>;
> +      reg =3D <0xac000000 0x00000000>,
> +            <0xac000000 0x0000c000>;
>      };
>  ...
> --
> 2.42.1
>=20

--CBvT2rAjqEdWny82
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIiNgAKCRB4tDGHoIJi
0h83AQCPCDghV0IzJbJmjexiHOifjtNURzlkEKw1HzXGmn/tGwD8CBvuwPYjE8yD
nJPH05dSoYXOM+TkZ2ZJ2jjLLfJIygg=
=SBI8
-----END PGP SIGNATURE-----

--CBvT2rAjqEdWny82--


--===============4125056355452945759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4125056355452945759==--

