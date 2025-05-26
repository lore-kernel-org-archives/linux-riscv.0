Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABCC54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9EdtUDuSnU76EsuNMRx57lQdH47K7N6yMmMemOxIg0=; b=MkdI5CHTVOb7DpbNWwmi9pwV8R
	5RUXAZzliretWKxpiIO7VUAy3c1TnNjaAUrj50dMDEXTnRUlcTS1X75bPbQkZ3VkjuY4UNpqafWeY
	JQ6TLCgClNAGAu9xJOJZ6ZYZ+Clv5ykYTjSXybDLeGdHEzGELCyh3xc6Cxr+8TKH2DQFf40e70vi0
	HYn9dxs53RKzug+/chs+8TTBIGK3HP896p5IECpk4Sh1X3B/q7wIOjixI9nVPRB9ugHKkKwm6fsNp
	rETYHGc2FaSLKA9ZTsLNSmp4lLYvkRZ7zQV9eJQSinPh0UEZsHp8Tp+6xmA95w0JV2B3TydE9aldI
	lrvxWq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZIj-000000095Qg-28Wq;
	Mon, 26 May 2025 14:59:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZIg-000000095QI-2bbh
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 14:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 339AEA4F1C8;
	Mon, 26 May 2025 14:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC43C4CEE7;
	Mon, 26 May 2025 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748271576;
	bh=E8SaAUgrX/X3dekablDtQmiUY499qEqCSuaUoBIMc4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3MFvLKGV43p1eBMXVMy4czAhTXOz2ctCEOeVW2WnXnaTrpA/Q1ifkqOkKuCR9hQU
	 w00FPOZ4osYXe03owq6G0dRPSqmrd+XAffAauMuPgLkHKhjNh/TzUMuaEQtX+Yk9yi
	 9dGrirNlbBxKgDHBOMh/4zG7zPPuwz5zs/cq3k6PnLWIdwQRVDf/nqc48pHxJ9Qrff
	 7S5ntnrO8nuYuwOH6YCsowbLnRqQ30cWeOe3ZcmA58WVEqYvce1wnJhgpXEDYlK5TY
	 n6jC2/MwptaZ/AuiJLH76ugtEGlu6fAYbiWlst+dFQ+vSIpvU/4XBHRg8nB9dCbfHE
	 +wYm/DVOMNFlA==
Date: Mon, 26 May 2025 16:59:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] pwm: sophgo: reorganize the code structure
Message-ID: <l57yh42pb7cfbnk5z4zo473vb5pac6t4hnpg36m3iph3og4wom@kmd35myokcgp>
References: <20250428013501.6354-1-looong.bin@gmail.com>
 <20250428013501.6354-3-looong.bin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250428013501.6354-3-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_075938_791298_A31FDAA2 
X-CRM114-Status: GOOD (  22.15  )
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
Content-Type: multipart/mixed; boundary="===============8099433124042003576=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8099433124042003576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6wrgiquygeci5im"
Content-Disposition: inline


--y6wrgiquygeci5im
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] pwm: sophgo: reorganize the code structure
MIME-Version: 1.0

Hello,

On Mon, Apr 28, 2025 at 09:34:49AM +0800, Longbin Li wrote:
> As the driver logic can be used in both SG2042 and SG2044, it
> will be better to reorganize the code structure.
>=20
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/pwm/pwm-sophgo-sg2042.c | 62 +++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2=
042.c
> index ff4639d849ce..23a83843ba53 100644
> --- a/drivers/pwm/pwm-sophgo-sg2042.c
> +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> @@ -26,18 +26,6 @@
>  #include <linux/pwm.h>
>  #include <linux/reset.h>
>=20
> -/*
> - * Offset RegisterName
> - * 0x0000 HLPERIOD0
> - * 0x0004 PERIOD0
> - * 0x0008 HLPERIOD1
> - * 0x000C PERIOD1
> - * 0x0010 HLPERIOD2
> - * 0x0014 PERIOD2
> - * 0x0018 HLPERIOD3
> - * 0x001C PERIOD3
> - * Four groups and every group is composed of HLPERIOD & PERIOD
> - */

This seems to be still correct? Why remove it then?

>  #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
>  #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
>=20
> @@ -53,6 +41,10 @@ struct sg2042_pwm_ddata {
>  	unsigned long clk_rate_hz;
>  };
>=20
> +struct sg2042_chip_data {
> +	const struct pwm_ops ops;
> +};
> +
>  /*
>   * period_ticks: PERIOD
>   * hlperiod_ticks: HLPERIOD
> @@ -66,21 +58,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata=
 *ddata, unsigned int chan,
>  	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
>  }
>=20
> -static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> -			    const struct pwm_state *state)
> +static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *=
pwm,

This is not a global pwm API function, so please stick to the pwm_sg2042
prefix.

> +			      const struct pwm_state *state)
>  {
>  	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
>  	u32 hlperiod_ticks;
>  	u32 period_ticks;
>=20
> -	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> -		return -EINVAL;
> -
> -	if (!state->enabled) {
> -		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
> -		return 0;
> -	}
> -
>  	/*
>  	 * Duration of High level (duty_cycle) =3D HLPERIOD x Period_of_input_c=
lk
>  	 * Duration of One Cycle (period) =3D PERIOD x Period_of_input_clk
> [...]
> @@ -123,13 +123,16 @@ static int pwm_sg2042_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>  	return 0;
>  }
>=20
> -static const struct pwm_ops pwm_sg2042_ops =3D {
> -	.apply =3D pwm_sg2042_apply,
> -	.get_state =3D pwm_sg2042_get_state,
> +static const struct sg2042_chip_data sg2042_chip_data =3D {
> +	.ops =3D {
> +		.apply =3D pwm_sg2042_apply,
> +		.get_state =3D pwm_sg2042_get_state,
> +	}
>  };
>=20
>  static const struct of_device_id sg2042_pwm_ids[] =3D {
> -	{ .compatible =3D "sophgo,sg2042-pwm" },
> +	{ .compatible =3D "sophgo,sg2042-pwm",
> +	  .data =3D &sg2042_chip_data },

I would have expected that checkpatch doesn't like that. At least I
don't. Please make this

	{
		.compatible =3D ...;
		.data =3D ...;
	},

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);

--y6wrgiquygeci5im
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg0gdMACgkQj4D7WH0S
/k4J4Qf8CHX9dIGtIPbLOS9813DI9uLk4w5rJKuXFCntm61HNC7eEe0RbGwRynoZ
A8E3zWI+tt4ZUmLp3nTHtrXTa3DBSG7FLpHXWCB7GogJcfcJ3NMgkqA9jJf6gjDY
ogojTOXZ8Uti38J4uXeupkpybGA/ulpdAMaDlF8gx3l8NiVzg4Eycn7yV2Z0UBhB
L1+TUXRyGKV6PZ0aKCZzVAGhBUGY3C09T5jF7xFL0ap500i5mRYeK2R+HU8ZJ8fi
Nel1QgRdVXOxIZt+/zYOQB7021f9AqTwns1oxxTN24CXN6TzsDY4dTBlnPCG5uqt
RA6ku7ja1Ot/ELHxpUYuQBSMEg+8Cg==
=dnJY
-----END PGP SIGNATURE-----

--y6wrgiquygeci5im--


--===============8099433124042003576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8099433124042003576==--

