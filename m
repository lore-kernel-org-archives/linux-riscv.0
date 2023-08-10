Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60BAC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9R59937UVwddOPEYFi2H4FtC25+zSpaHAY4p8qc1+M=; b=rBKRzH0cKjZv2y3Tlu3vqi6lfV
	01An8XpuVTjLeJD62zJz8ecuFMiEwnqNbAjIVh8/xx/kaTQ2eABp1zmMvuZOkrE6n/wH65tH3jtZ5
	/DQpPF+S5dvm5/KkygWSyBMl5SZ4cxIwzMx79jzwFO8V+qLsY9c4oiWpDacP+uQzysGmCh6KvDqJ4
	3UJypapUGV+AQKZSf410PSkvCu875vAKKfAYy3WlYOMHlrzUnWcigXY8VoFOcacSb890eSOawYYGP
	UJLT7+rNwonClQVDLL3Img245bz+CeV5DG6D/0u1lIm3T9nuqql8juToINnDCG+mywT2TRAACLTy2
	o3aGFCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Gz-0089jF-11;
	Thu, 10 Aug 2023 16:12:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Gw-0089hg-02;
	Thu, 10 Aug 2023 16:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7741565D22;
	Thu, 10 Aug 2023 16:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E2FC433C8;
	Thu, 10 Aug 2023 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691683944;
	bh=OcqNCzObC1EKNtRyWAawRvnOnyFp+jPeVcOHVtyLdMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEo1uoMv6Je3nMeV7pnuPSOi0e1OXzWRNRWkvPlyow/fdcmg8gRAOP7G7HjXWA29a
	 bv2TunAq0eHA7i/nX5/c8Lr3eqJxGOFyojctbtX88Xn2WOZF6W1aKmAKv+9kD/cZRy
	 q4u0QFM8Y9TRu3sc8TI48543QfAtnPYQro/kWvU5ROFhCVj5Crl6LWDP9BHORlwAYd
	 CgNt6oU4afQgMZaikM8EWBfjNPaBiJMaP1t9gC4S96mfJYinPZK+T6NOReYJvMpQNN
	 mrUtttZloojwATvGTQBcPpDRuAat/MoNtR0bGfrfvYhrt6mt2ZgKbPAOAhIAyvdmTU
	 OAm4nvN75CS3w==
Date: Thu, 10 Aug 2023 17:12:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230810-unmasking-sprinkler-d75e728cc0ee@spud>
References: <20230810145443.1053387-1-privatesub2@gmail.com>
 <20230810145443.1053387-2-privatesub2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230810145443.1053387-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_091226_092862_851E9CA4 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4014473859802237057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4014473859802237057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hPg5kcy3KfBtOZY7"
Content-Disposition: inline


--hPg5kcy3KfBtOZY7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 05:54:26PM +0300, Aleksandr Shubin wrote:

> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-r329-pwm
> +
> +    then:
> +      required:
> +        - allwinner,pwm-channels
> +
> +    else:
> +      not:
> +        required:
> +          - allwinner,pwm-channels

Hmm, I realise I lead you astray a little. This can be reduced to
    else:
      properties:
        allwinner,pwm-channels: false

If you respin, please update to that. Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--hPg5kcy3KfBtOZY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNUMYgAKCRB4tDGHoIJi
0k5XAPwK6ZnDy6YMcS7YyTbkZhp9bNvTudr9mvnqvkaKJWAqdQEAj6Ky6dhw1dD2
9IZEmfA6h0yN/+zGi1B3HLfafbpNzg4=
=Pcfq
-----END PGP SIGNATURE-----

--hPg5kcy3KfBtOZY7--


--===============4014473859802237057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4014473859802237057==--

