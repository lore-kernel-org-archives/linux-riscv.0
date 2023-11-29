Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20E0C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXptETjMEI7FzcTYLDINJEuyrj3jXYRftNh1/igQkmE=; b=TSC7/nuyGT7IRjA5csphRAIlwY
	vZLRsAVyfZDQlXecBHyoN+O+1P38fOwVxwdLZ4kLcJYITWfcN2wKyIw7QJVQA17C0BNMJMItWj9Bd
	xqK9bsx98gNzyOKf/hy0ZRbzTpM+THH8+kpohRcHqI3FOEr9SxXzpOZNuIgHDE0luYcOcZouw7KPF
	elndOKNBKTaajisvqinZFn6lDfp48tiT79uj/7no/+E7MvElfW3uwVMIUHF3yTancXLJCR9c048DT
	rdZ7Vin+2OksPAVasXxuazJaZkruQYHL5VAcRkddhsJLj8eH7Xo+2fXdAlccLfFBGTMHsnp6oeRks
	KIs9Gj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LpM-008fyU-36;
	Wed, 29 Nov 2023 14:46:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LpI-008fwN-1v
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BA09CE1F2B;
	Wed, 29 Nov 2023 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FC2C433C8;
	Wed, 29 Nov 2023 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701269165;
	bh=AS/6F864rQJoy0jd7IJxC8rKYScfP+Im0dnqLTD1LM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVmbiXHDls+kb7E3ub5RkxLvadV56N5O0c1DYZDUZTi0X9wkuf01JJEqBzB7z5vw8
	 Thk2jMhtqrmx316XEnWyrM2+AE2WG1kH4L6yL7Eb+jTiGzzSQDd4wCY4jFqx5OWMqo
	 Evnsujym0A8r3+XeqbcH+4TXsWqLKfi9Da2mEbIn4909GFQY4GtSvEGPySJyqOCeAE
	 Y+w0TJ2NRj/m9mXpXU4MieehhRcOAC7AGnVTN5mEoOcyXwodB7Zwk2OF9+wJzINgAw
	 HB/wTA+fuW/bMcvEmW1vy622+k+ct2I6dBtT5JMTS0hl+G7Sljl+U0v7mivzsclcLm
	 F/qu4qnrHIZBw==
Date: Wed, 29 Nov 2023 14:45:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe compatibles
Message-ID: <20231129-revisit-prefix-5327168e91f3@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231129060043.368874-2-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_064608_871339_3D65C94D 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Type: multipart/mixed; boundary="===============3885436629481852373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3885436629481852373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EUvI/cSgkBgk0Ae7"
Content-Disposition: inline


--EUvI/cSgkBgk0Ae7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:00:38PM +0800, Sia Jee Heng wrote:
> Add new compatible strings for Dubhe-80 and Dubhe-90. These are
> RISC-V cpu core from StarFive Technology and are used in StarFive
> JH8100 SoC.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index f392e367d673..493972b29a22 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,8 @@ properties:
>                - thead,c906
>                - thead,c910
>                - thead,c920
> +              - starfive,dubhe-80
> +              - starfive,dubhe-90

s goes before t.

Cheers,
Conor.

>            - const: riscv
>        - items:
>            - enum:
> --=20
> 2.34.1
>=20

--EUvI/cSgkBgk0Ae7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdOpgAKCRB4tDGHoIJi
0uVEAP9+aU09s/wTZvSkheUPpKm6rd4yxNAHRKZCriICz4oaigD+PFVwtVTPyqlP
ZIoMEWCwYXrtM7SkFYto5vwuPsLNiwk=
=RbUh
-----END PGP SIGNATURE-----

--EUvI/cSgkBgk0Ae7--


--===============3885436629481852373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3885436629481852373==--

