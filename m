Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B79CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlxEl2vuyYTUG51Y8EcWPuloSCyeH/0iET/VMRFinXg=; b=UwNqcmcPHw8KznzMVeCcLZoFok
	21dTbdPvgak2zFMwcnxOXEJB46+zJAxqlzO/nw4N1BUuSk33oSS5qu4fcTtOqb8tyA14SJbZ/CbLE
	qodOb57ywT3DB6c1e0pG2XH94HF9TjzwEJIAeG4BJJkcWT3xcWWnXwv8O2Pb6JCNBQ3S3lGh/0DnK
	hp0Oa0qe3yC9eBI+kSvLq1klS0FLLdyJT7R9jrsGAkkNVkYRK0DbXcMnmXRfb6UZIbDar1riENWWS
	H85est08Zm+mARfP/mk3+vfkGur3LMSo0+gMCTycA7zvGCvp/PlWmkNnmXVClCWXE6dEGt8wmwft4
	9a4gyspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6QW-003qp7-1Z;
	Tue, 12 Sep 2023 16:39:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6QT-003qnv-1V
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 16:39:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E5E36B81BFC;
	Tue, 12 Sep 2023 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D81C433C7;
	Tue, 12 Sep 2023 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536782;
	bh=iIgQaIkZ2NodE34d4bE3iprG8w+h+eA+RXmUuBgooEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixhx0siWJ6pbfZX21c4X9mWnfIur+kAOFoUXfDX25ZgloNQjFfipyLjGIKYpP1gB+
	 6IH1O2IslQPT556dIODXA2/ow2G4ACMYV8IFSZHxciJlTR7Hrlp7xl+xLZ7f62FPP5
	 BbL9OUL21yNn1Qf3rRoO19NxLVqQixGg3GD7vizsmAur7sdd/xlRIvBgWGx70WyDSj
	 IogMpY5QToypoN3aH/AnGnkk8b6K/MSCt8vJHJlTJPLHmvo2imMaPYkSrHNKU7npGn
	 vVjKL8nY2Md/Z5bu+ZLj2mVJ/3krGcldaHdnqKF/okEGfW3pBOVccU3ga1SZnccBvf
	 FiqVkjM7LDLkA==
Date: Tue, 12 Sep 2023 17:39:37 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: Remove properties from required
Message-ID: <20230912-jailer-whole-41875e57a298@spud>
References: <20230912081402.51477-1-william.qiu@starfivetech.com>
 <20230912081402.51477-5-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230912081402.51477-5-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_093945_652580_C828AD16 
X-CRM114-Status: GOOD (  16.67  )
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
Content-Type: multipart/mixed; boundary="===============2605103770398046550=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2605103770398046550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h9UcmCWcT6OWVQ3V"
Content-Disposition: inline


--h9UcmCWcT6OWVQ3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 04:14:00PM +0800, William Qiu wrote:
> Due to the change of tuning implementation, it's no longer necessary to
> use the "starfive,sysreg" property in dts, so remove it from required.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

$subject probably should be more specific about what binding is being
modified.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.ya=
ml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> index 51e1b04e799f..553a75195c2e 100644
> --- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> @@ -55,7 +55,6 @@ required:
>    - clocks
>    - clock-names
>    - interrupts
> -  - starfive,sysreg
> =20
>  unevaluatedProperties: false
> =20
> @@ -73,5 +72,4 @@ examples:
>          fifo-depth =3D <32>;
>          fifo-watermark-aligned;
>          data-addr =3D <0>;
> -        starfive,sysreg =3D <&sys_syscon 0x14 0x1a 0x7c000000>;
>      };
> --=20
> 2.34.1
>=20

--h9UcmCWcT6OWVQ3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCUSQAKCRB4tDGHoIJi
0l5dAQDG9Uyg44/spYOTktXTqx5C02wOIIDlOOSA0mMIykDLtAEAgYHAdwhbEfP7
4MOV5k39/w6IRjAqcD3Hl10cLYsAZQY=
=TfmZ
-----END PGP SIGNATURE-----

--h9UcmCWcT6OWVQ3V--


--===============2605103770398046550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2605103770398046550==--

