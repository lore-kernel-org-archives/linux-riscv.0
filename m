Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5EAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzoNB7COgPy6W+O+HKMFqwOIbE9Daj527kLEns+sv5Y=; b=EXRmwoUwaRZPCjwETaIvZO2aSP
	LeNba3CpltrpdkGvGiudXTDgarbJSQnL8xlJqXQUrKbJHElBHI2b/N8SGlHWcFcTnr7XgjuzsW3z8
	s7D6JSARlyvdy3TlH4hgamHRhS//DCGUGkqidp2ekbk+rdIfYejNtXnH9EJBQo+d+A6G6Pjxuxz9Q
	D9mSVjcsseY78L0SgIsCGhyf9BupmTLesmd/casGqTZxHxV3VHoa4dCES+4v8N8TZpc2Vz2tGVKGE
	nRoidAWDT1R7lP2tpLHVGJ9TER2Y1eBQBFDeQ7cKu4MmlZLp5WRQk+SNuLsikHwt78OrvF5RqXL+G
	0stzeQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7lQc-005XQi-2r; Tue, 20 Dec 2022 22:49:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7lQX-005XOJ-DT
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 22:49:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4B16B81674;
	Tue, 20 Dec 2022 22:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE36C433EF;
	Tue, 20 Dec 2022 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671576574;
	bh=4wODmTjWcv6PbL1g82ucHA5Q1cZyzD8D2OlhOsOTZD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kz7yPoUPqqRMy5nk4QHcbiZ7Pyrz9cvx7gQ21k4OlhB+olAQu9l9Tl2Wayy4hTMKk
	 +ju4cn2E1NSUqsjhiN8M6UR3fmdWzrP7dMhGOV0sVRZDZ331wl3se3sVx+JcNHrt3E
	 vwyDd5Gxn0p97Tsvp2JPIKfmMj2Z85R9XTq9CVKneg2zeCNddb2Z0NFzfad7prWcID
	 MupBssUJz33BpeVaf5yBhPfys4mgbHbMJIxwYUzRaEtk0sZ3ooeWcQgBkELaSjDQef
	 UakD5z+Hhc2idqjBA/OW403J+R/7WTf8LD8l2WOLv7kbILv5j1Th9KTDfGdVzK0Xzj
	 rdOLnqDqqQFNw==
Date: Tue, 20 Dec 2022 22:49:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/11] reset: starfive: jh71x0: Use 32bit I/O on 32bit
 registers
Message-ID: <Y6I7+apspEgczfzG@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-7-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220005054.34518-7-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_144937_769406_8B92495B 
X-CRM114-Status: GOOD (  26.11  )
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
Content-Type: multipart/mixed; boundary="===============3238542814944282587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3238542814944282587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9bznr0tDVP4t2+zy"
Content-Disposition: inline


--9bznr0tDVP4t2+zy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 08:50:49AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> We currently use 64bit I/O on the 32bit registers. This works because
> there are an even number of assert and status registers, so they're only
> ever accessed in pairs on 64bit boundaries.
>=20
> There are however other reset controllers for audio and video on the
> JH7100 SoC with only one status register that isn't 64bit aligned so
> 64bit I/O results in an unaligned access exception.
>=20
> Switch to 32bit I/O in preparation for supporting these resets too.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh7100.c    | 14 ++++-----
>  .../reset/starfive/reset-starfive-jh71x0.c    | 31 +++++++++----------
>  .../reset/starfive/reset-starfive-jh71x0.h    |  2 +-
>  3 files changed, 23 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/res=
et/starfive/reset-starfive-jh7100.c
> index 5f06e5ae3346..2a56f7fd4ba7 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -30,16 +30,16 @@
>   * lines don't though, so store the expected value of the status registe=
rs when
>   * all lines are asserted.
>   */
> -static const u64 jh7100_reset_asserted[2] =3D {
> +static const u32 jh7100_reset_asserted[4] =3D {
>  	/* STATUS0 */
> -	BIT_ULL_MASK(JH7100_RST_U74) |
> -	BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
> -	BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
> +	BIT(JH7100_RST_U74 % 32) |
> +	BIT(JH7100_RST_VP6_DRESET % 32) |
> +	BIT(JH7100_RST_VP6_BRESET % 32),

And this change is required cos BITS_PER_LONG is 64 for rv64 and
therefore you cannot use BIT_MASK, right?

Otherwise, does look to be a 64 -> 32 conversion, `word-diff` coming in
super handy for this series!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  	/* STATUS1 */
> -	BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
> -	BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET),
> +	BIT(JH7100_RST_HIFI4_DRESET % 32) |
> +	BIT(JH7100_RST_HIFI4_BRESET % 32),
>  	/* STATUS2 */
> -	BIT_ULL_MASK(JH7100_RST_E24) |
> +	BIT(JH7100_RST_E24 % 32),
>  	/* STATUS3 */
>  	0,
>  };
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/res=
et/starfive/reset-starfive-jh71x0.c
> index 1f201c612583..c62d0c309c62 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> @@ -8,7 +8,6 @@
>  #include <linux/bitmap.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> -#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
>  #include <linux/reset-controller.h>
>  #include <linux/spinlock.h>
> @@ -19,7 +18,7 @@ struct jh71x0_reset {
>  	spinlock_t lock;
>  	void __iomem *assert;
>  	void __iomem *status;
> -	const u64 *asserted;
> +	const u32 *asserted;
>  };
> =20
>  static inline struct jh71x0_reset *
> @@ -32,12 +31,12 @@ static int jh71x0_reset_update(struct reset_controlle=
r_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct jh71x0_reset *data =3D jh71x0_reset_from(rcdev);
> -	unsigned long offset =3D BIT_ULL_WORD(id);
> -	u64 mask =3D BIT_ULL_MASK(id);
> -	void __iomem *reg_assert =3D data->assert + offset * sizeof(u64);
> -	void __iomem *reg_status =3D data->status + offset * sizeof(u64);
> -	u64 done =3D data->asserted ? data->asserted[offset] & mask : 0;
> -	u64 value;
> +	unsigned long offset =3D id / 32;
> +	u32 mask =3D BIT(id % 32);
> +	void __iomem *reg_assert =3D data->assert + offset * sizeof(u32);
> +	void __iomem *reg_status =3D data->status + offset * sizeof(u32);
> +	u32 done =3D data->asserted ? data->asserted[offset] & mask : 0;
> +	u32 value;
>  	unsigned long flags;
>  	int ret;
> =20
> @@ -46,15 +45,15 @@ static int jh71x0_reset_update(struct reset_controlle=
r_dev *rcdev,
> =20
>  	spin_lock_irqsave(&data->lock, flags);
> =20
> -	value =3D readq(reg_assert);
> +	value =3D readl(reg_assert);
>  	if (assert)
>  		value |=3D mask;
>  	else
>  		value &=3D ~mask;
> -	writeq(value, reg_assert);
> +	writel(value, reg_assert);
> =20
>  	/* if the associated clock is gated, deasserting might otherwise hang f=
orever */
> -	ret =3D readq_poll_timeout_atomic(reg_status, value, (value & mask) =3D=
=3D done, 0, 1000);
> +	ret =3D readl_poll_timeout_atomic(reg_status, value, (value & mask) =3D=
=3D done, 0, 1000);
> =20
>  	spin_unlock_irqrestore(&data->lock, flags);
>  	return ret;
> @@ -88,10 +87,10 @@ static int jh71x0_reset_status(struct reset_controlle=
r_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct jh71x0_reset *data =3D jh71x0_reset_from(rcdev);
> -	unsigned long offset =3D BIT_ULL_WORD(id);
> -	u64 mask =3D BIT_ULL_MASK(id);
> -	void __iomem *reg_status =3D data->status + offset * sizeof(u64);
> -	u64 value =3D readq(reg_status);
> +	unsigned long offset =3D id / 32;
> +	u32 mask =3D BIT(id % 32);
> +	void __iomem *reg_status =3D data->status + offset * sizeof(u32);
> +	u32 value =3D readl(reg_status);
> =20
>  	return !((value ^ data->asserted[offset]) & mask);
>  }
> @@ -105,7 +104,7 @@ static const struct reset_control_ops jh71x0_reset_op=
s =3D {
> =20
>  int reset_starfive_jh71x0_register(struct device *dev, struct device_nod=
e *of_node,
>  				   void __iomem *assert, void __iomem *status,
> -				   const u64 *asserted, unsigned int nr_resets,
> +				   const u32 *asserted, unsigned int nr_resets,
>  				   struct module *owner)
>  {
>  	struct jh71x0_reset *data;
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/res=
et/starfive/reset-starfive-jh71x0.h
> index ac9e80dd3f59..db7d39a87f87 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -8,7 +8,7 @@
> =20
>  int reset_starfive_jh71x0_register(struct device *dev, struct device_nod=
e *of_node,
>  				   void __iomem *assert, void __iomem *status,
> -				   const u64 *asserted, unsigned int nr_resets,
> +				   const u32 *asserted, unsigned int nr_resets,
>  				   struct module *owner);
> =20
>  #endif /* __RESET_STARFIVE_JH71X0_H */
> --=20
> 2.38.1
>=20
>=20

--9bznr0tDVP4t2+zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6I7+QAKCRB4tDGHoIJi
0mIGAP9Lzp79OLLpHZnDGnKCol5QCgY02fi/AfBG4nDnjLwJ/gD+MMUiXSzwHsk4
slBi8jzod3luuZHPdATCJZIFe/AONQg=
=ND0s
-----END PGP SIGNATURE-----

--9bznr0tDVP4t2+zy--


--===============3238542814944282587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3238542814944282587==--

