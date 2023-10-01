Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9099E748ED
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e11Gfmeguo4bqkrGPlO2UqvHT/Xj+Mhtebf8YAhsmdM=; b=R8tqTfqeZDlawGX4AsE7kmUszA
	MPZk1h0VKTrFDo5pZ0bjR/KGtjo7HafyZc7QoPiLDaTCPb/orKfSxlQTJSc+augcWk9ieb2rngEE2
	S8OgvSkMnBW/EB+VQ64Kp2cd7c5PT6vwYFvjJ6pdBIS8ukW5awbV/VDW2AYk3AJbKaCL2bFeQbLQ+
	7vTZ4nUIKXGBIj2KJUH31R0C+es1cAoaL1zpHIKmZTmSTboiUH9Vr9fvZbfdPqleD9Uvj1xUqBFOo
	reCOWPF1JkAX+4UwTrmLgqyS7Ymv1MOF4wtX8ZOYd2HYFZEj7k2F9mGl5LpO4WRFjn6hx07GEDMoG
	xqrrcLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuZv-00AzI3-0T;
	Sun, 01 Oct 2023 11:25:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuZs-00AzH6-1u
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 11:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6A8DCE0A56;
	Sun,  1 Oct 2023 11:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4866C433C8;
	Sun,  1 Oct 2023 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696159522;
	bh=PUipNyho5r4Psjk0eUfxhKXe9d7G3c2FY5IEw3imF0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcfwTZmoo6jGSte0O0n8afk14KpMPshBNFzDQX6NRwpFBGbnP1gvpfmkAIZaCln2k
	 gLuBUMm+ZBVoH+1vYr4fNyfHR4U3FpEnucNVBEe8bxiMfNkoctILHc88MdpFW+h6qW
	 VBJhuFmOdx6hLO7zT5ZRgVAXvCF8QSHN88xyIhVN+oXnZIOJJqCX5LEn79/fBvQIbG
	 KoiLGHSCbJh9C3lBcaclrRW/b4jpWmhB0ZLyo0eJ9EV22o6wRqJ1gdPvXBPunHJVrR
	 QUnudpzl90lfUE4R7Dd8DBZaWW0wd4oCSwuuSVQk8v/gTyPNVn+iCecUXGS6HkLQjs
	 ahHz3+8V9strQ==
Date: Sun, 1 Oct 2023 12:25:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add SOPHGO
 CV1800B plic
Message-ID: <20231001-manila-unsent-6163d2a08145@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_042536_883785_55CF46B5 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: multipart/mixed; boundary="===============3810629993324184244=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3810629993324184244==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MA1P9/d49We4ZiCr"
Content-Disposition: inline


--MA1P9/d49We4ZiCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 08:39:33PM +0800, Jisheng Zhang wrote:
> Add compatible string for SOPHGO CV1800B plic.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 16f9c4760c0f..5c4539881a22 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -65,6 +65,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - sophgo,cv1800-plic
>                - sophgo,sg2042-plic
>                - thead,th1520-plic
>            - const: thead,c900-plic
> --=20
> 2.40.1
>=20

--MA1P9/d49We4ZiCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRlW/QAKCRB4tDGHoIJi
0hSKAP92lZxT2iiinmDL1BKX4qpZYu3g7KH/TCU9/uIef7ll4AD/Yf7u4wHaHvLx
av8JWEjoAfAlfpRq4nlnWoElnzANRQA=
=Vebj
-----END PGP SIGNATURE-----

--MA1P9/d49We4ZiCr--


--===============3810629993324184244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3810629993324184244==--

