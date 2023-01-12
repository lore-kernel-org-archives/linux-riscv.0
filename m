Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9740BC54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW6NZa49khy6ahWq3lz0fIJX3/D77A2CjZ6Uq6gE2jU=; b=OnegL2DViaQTnIz/WBch08Gkfr
	T3aGzshEol2DgbOpgPMQZxpb41bHC7YxBakN0vbw+696Oltl6fL+z/0FGAXEzqMrHTV+aXvngZs0A
	ZoyTRBy0xLcFRSY6al4nTz8/LJ9PjwcNRFploSfeIvtX+A+1ynZ2EhkQfzubI7p1wetEk0Ys3s7zy
	p48DQPn+HUTSgxSNQ5vD6mtNIYKYpaqIhTi2YWUF0k8aE8HYHqn3LEViwoV7J1CpnyF+8dxm7v4XR
	kcnqvQeIWbgdCu5NZUO3eFsLMPL4BtCBkunsEunSmO9Kcy4VyJQqJi67zLIEouY70j91rzcEOdoT7
	5OmsHr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG34S-00GQ8c-IT; Thu, 12 Jan 2023 19:17:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG34L-00GQ7L-Nv
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 19:16:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CD6262169;
	Thu, 12 Jan 2023 19:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BCDC433EF;
	Thu, 12 Jan 2023 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673551016;
	bh=8qPdRHscPzEsxrdzYWBcWavkV05o9Fa8dyWjFMiqcmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAbO4+eTHTQ/K3aOrr/++Olc+qK8C4VzmA5Zg+NEMk/z+1RcF2Mu2jdy4BaJ3Akj+
	 HU2TjkBTIjXxYPXuwKiPsFlQXG3h0URm93yJyIRCGIGrG2FQFBzmdBydjoMr5sqy+S
	 adq9s0CsjT9QD6oO6npfshWCpawhSjO6eft7Gyk7jBLiQx8uZRi7rwb8rx0DE5jQ7C
	 mIv08gzpCvsbTX3cbq+lbPLG9UMbXy812n0N4+hrEzmfxRquuIgaF29jAkKxvcM9nn
	 UG8sZ9NNoy23ffZ/H9bXQ43S5fNJqTTtmzFTKSm7grrDIKeX4Sftj4aJXo2tbQyy+W
	 MJjaCr6z0jYsg==
Date: Thu, 12 Jan 2023 19:16:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Message-ID: <Y8Bco7lBBj7CO9C5@spud>
References: <20230112043812.150393-1-jiajie.ho@starfivetech.com>
 <20230112043812.150393-3-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230112043812.150393-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_111657_894364_1C88C936 
X-CRM114-Status: GOOD (  26.76  )
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
Content-Type: multipart/mixed; boundary="===============0702648446494542194=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0702648446494542194==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pC+9YUp9vH5Uuamr"
Content-Disposition: inline


--pC+9YUp9vH5Uuamr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 12:38:11PM +0800, Jia Jie Ho wrote:
> This adds driver support for the hardware random number generator in
> Starfive SoCs and adds StarFive TRNG entry to MAINTAINERS.
>=20
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  MAINTAINERS                            |   6 +
>  drivers/char/hw_random/Kconfig         |  11 +
>  drivers/char/hw_random/Makefile        |   1 +
>  drivers/char/hw_random/starfive-trng.c | 397 +++++++++++++++++++++++++
>  4 files changed, 415 insertions(+)
>  create mode 100644 drivers/char/hw_random/starfive-trng.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65140500d9f8..b91e3fc11fc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19626,6 +19626,12 @@ F:	drivers/reset/reset-starfive.c
>  F:	include/linux/reset/starfive.h
>  F:	include/dt-bindings/reset/starfive*
> =20
> +STARFIVE TRNG DRIVER
> +M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/rng/starfive*
> +F:	drivers/char/hw_random/starfive-trng.c

minor nit (so don't submit another version just to fix this):
This should be Supported, no?

> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Mak=
efile
> index 3e948cf04476..f68ac370847f 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -47,3 +47,4 @@ obj-$(CONFIG_HW_RANDOM_XIPHERA) +=3D xiphera-trng.o
>  obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) +=3D arm_smccc_trng.o
>  obj-$(CONFIG_HW_RANDOM_CN10K) +=3D cn10k-rng.o
>  obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) +=3D mpfs-rng.o
> +obj-$(CONFIG_HW_RANDOM_STARFIVE) +=3D starfive-trng.o

Is "STARFIVE" a bit too general of a name here and in the Kconfig entry?
I don't have a TRM for the JH7100, but this name (and the Kconfig text)
would give me the impression that I can use it there too.
Does this driver support both?

> +static int starfive_trng_probe(struct platform_device *pdev)

> +	clk_prepare_enable(trng->hclk);
> +	clk_prepare_enable(trng->ahb);
> +	reset_control_deassert(trng->rst);
> +
> +	trng->rng.name =3D dev_driver_string(&pdev->dev);
> +	trng->rng.init =3D starfive_trng_init;
> +	trng->rng.cleanup =3D starfive_trng_cleanup;
> +	trng->rng.read =3D starfive_trng_read;
> +
> +	trng->mode =3D PRNG_256BIT;
> +	trng->mission =3D 1;
> +	trng->reseed =3D RANDOM_RESEED;
> +
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to register hwrng\n");
> +		goto err_fail_register;
> +	}
> +
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);

> +	pm_runtime_enable(&pdev->dev);

> +
> +	return 0;
> +
> +err_fail_register:

> +	pm_runtime_disable(&pdev->dev);

This was only enabled after the only goto for this label, does it
serve a purpose?
I know little about runtime PM, it just caught my eye.
I looked at the other rng drivers that had calls to pm_runtime_enable(),
but they all seem to do their pm enablement _before_ calling
hwrng_register().
Again, I am not familiar with runtime PM, but curious why you are doing
things differently, that's all.

> +
> +	reset_control_assert(trng->rst);
> +	clk_disable_unprepare(trng->ahb);
> +	clk_disable_unprepare(trng->hclk);
> +
> +	return ret;
> +}

Thanks,
Conor.


--pC+9YUp9vH5Uuamr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8BcowAKCRB4tDGHoIJi
0ooTAQCVQna4B47AvqRVufpOn/h7Kf45VvY66vkny3KGYOzbqgEAh0GS0PmMp9sY
K/fI4Uwn7A+7DZ9+xKDhHSaNAjPdEAE=
=8g8P
-----END PGP SIGNATURE-----

--pC+9YUp9vH5Uuamr--


--===============0702648446494542194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0702648446494542194==--

