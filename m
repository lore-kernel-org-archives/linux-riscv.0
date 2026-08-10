Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58299C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwXfd+FuvvqCl0hVoHbqak5H1IUrdpk+4t6tcracHPU=; b=NoZErryQ+ERi0hJRDEDM0PowAh
	fMcoIiLWMdAQJR3OZ+pTwFrZIcIm4k113zQ2eOvGkOsL6Flk7/kVU41Ts129Fiw21+ISYaCbxQFqN
	bphu+Oo1yR2pyRLAFNH3/FyJmYRXZyx+ehKuv2HWQOlYmAW7hT0o0uW8ux9CaCmBB7qMVCB88vCQF
	VyLk03ubDcpebasDTjE5yWpIi6XQ83nqyze6aklZ5b2iZjHfzDu+WQrrbICkrfMgzgHF11DOqsRV+
	0P8yBckMHxQgt/kfwmmGNlGjte36RkXrAQcQUn6G7kqfIfhIZr03vskIQSEzmNNNgRiI42x3dksWE
	IB8tx83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSlP-0000000CNHq-008D;
	Mon, 10 Aug 2026 16:22:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSlO-0000000CNHZ-0GGV
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 16:22:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FB342EB7;
	Mon, 10 Aug 2026 16:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861B31F000E9;
	Mon, 10 Aug 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378929;
	bh=R+nQqKrTrGCn1/1USoU4telVFbB6QfHRod55DukTIpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFgHk/HbEAtr7ptQ3k5MNMtvvzCLrzAS3WZYoGYf8PSq/SgtbEaZKnX+/il3Iz0SE
	 MMqiq2WxMoAb9HUdwSqRXRVYqFeQczs5UEPQZFeAe5W8pfrywHuG8TluXrod447UT0
	 3uZT8la9O6Q4bAq0APQe4X9WfWGpcK5oOGTUjcxYwR6m1NXY1B8ANewtJC2ch6k2Y5
	 XJ8EZ21kj4VYpmq/vl0KGGrIW3+t8/7mu0dwrSZwighMiI3cEhh2NMdodpP5+Fg+WO
	 5TG7241q4NRZ+jJAJXQuFhRxCA6mQYCExJ3f1c2pIEyF1wxcrnvXnhT9FYMoXHxnfE
	 X1PUILF0hfr0A==
Date: Mon, 10 Aug 2026 17:22:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/8] reset: starfive: Introduce active_low
Message-ID: <20260810-overhead-seventy-cdab37ccb66d@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260809015054.210577-6-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============0177390953030542013=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0177390953030542013==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ff1WWiLCKZVhlsMd"
Content-Disposition: inline

--ff1WWiLCKZVhlsMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:51PM -0700, Changhuang Liang wrote:
> The JHB100 SoC supports inverted operations for reset
> assertion/deassertion, introducing an active_low field to distinguish
> between different operation logics.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Can you please get Hal to review this and the other reset patch?

Thanks,
Conor.

> ---
>  drivers/reset/starfive/reset-starfive-common.c | 6 +++++-
>  drivers/reset/starfive/reset-starfive-common.h | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/res=
et/starfive/reset-starfive-common.c
> index 86dbb33bb216..7723520637ca 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -52,12 +52,16 @@ static int starfive_reset_update(struct reset_control=
ler_dev *rcdev,
>  				 unsigned long id, bool assert)
>  {
>  	struct starfive_reset *data =3D starfive_reset_from(rcdev);
> +	bool active_low =3D data->info && data->info->active_low;
>  	unsigned long offset, flags;
>  	void __iomem *reg_assert;
>  	void __iomem *reg_status;
>  	u32 mask, done, value;
>  	int ret;
> =20
> +	if (active_low)
> +		assert =3D !assert;
> +
>  	if (data->info && data->info->discontiguous) {
>  		id =3D starfive_reset_id_to_hw_id(data->info->map, data->info->nr_rese=
ts, id);
>  		if (id =3D=3D STARFIVE_RESET_ID_INVALID)
> @@ -70,7 +74,7 @@ static int starfive_reset_update(struct reset_controlle=
r_dev *rcdev,
>  	reg_status =3D data->status + offset * sizeof(u32);
>  	done =3D data->asserted ? data->asserted[offset] & mask : 0;
> =20
> -	if (!assert)
> +	if (active_low =3D=3D assert)
>  		done ^=3D mask;
> =20
>  	spin_lock_irqsave(&data->lock, flags);
> diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/res=
et/starfive/reset-starfive-common.h
> index 0d4e634de58e..c7f80e744700 100644
> --- a/drivers/reset/starfive/reset-starfive-common.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -15,6 +15,12 @@ struct starfive_reset_info {
>  	unsigned int nr_resets;
>  	unsigned int assert_offset;
>  	unsigned int status_offset;
> +
> +	/* If active_low is false, setting the bit to 1 asserts
> +	 * the signal while clearing it to 0 deasserts it, and vice
> +	 * versa.
> +	 */
> +	bool active_low;
>  	bool discontiguous;
>  	const struct starfive_reset_map *map;
>  };
> --=20
> 2.25.1
>=20

--ff1WWiLCKZVhlsMd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann6qwAKCRB4tDGHoIJi
0mrFAQCe6LL/fNbn7QcGbEMfuYIdu5/9Lnk4y7bNCihQwEi53QEAtJ3dYCnVEcBf
Y2xL1pYCAab8CXAAayqFSqes8TJLFQQ=
=v9a5
-----END PGP SIGNATURE-----

--ff1WWiLCKZVhlsMd--


--===============0177390953030542013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0177390953030542013==--

