Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA20C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA0t2eC6alBGPhqJEBb/fP3M/dBDaLp81YeEsrpc5/k=; b=qAvGXT8x71Dl9AXNTBZsRKXrRb
	t0UiQRKIHf1UT+Dm2VC8JAD2QiFDQI2lu53fKdbzqzz7FDFFMqY5r3GU6kRiEOmkfeEJpJcHgF54a
	4vzDG6iglj3uulhv3wIsFW3+3Re0ZXloV26qo1QDo3h/lQw9zY79jYuieFrQ0h+A43TzVxuj4fvye
	L3ebsbU/uVT3qjdiIAjYM1sCBOJ9CEbEyax9A61hmM7LBPxBc5G7qKZsqgAv7fFFGilK13xok9Z0f
	cS9o0vqU7wi1o6Q+VFlOKmkwfh5M2S8E/lWky8bY4WgVuZc4+BcYtCNKE9SBWDEFlr+TiyRN621c0
	TRE5OtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPfZ-0000000F4aD-12tg;
	Thu, 01 May 2025 08:53:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPfW-0000000F4Zl-1m2w
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 08:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746089602; x=1777625602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z1RFxDWWP2IBQlxJsdQVzEu9lSyqGOACkGpRLoXfJsM=;
  b=ldVa9GORA1qhD1MKietXy3+qptj7aiMjytK+1XalC0TJO9tA0B6Tgyv/
   +Oq7mLUdgraEuGzEY/7jmhu9fH7StmrDWtmY5uWOqFK7hnGDT73KdWYVd
   cV2UwoB8yqLG15gDlz/1Uz+08PjxuWHKgNtCkItw6nDY5BQ3dgtiehOz4
   yqgs4v2SL9r5Wj9OfbvidlPSVj8z+218bFQ46bJqzMzk6AHu3uJxJ9vVa
   B+O5xSQTuZalt2YFvOhgN9lUt1pycY2ltUBPEYyoA1z1A+HvnuMeCM/lD
   OsIvKDvG7vCoaYaXMg9Doym8s4fGH4CjldHnwwosnKTVsyJyN/cv45ORK
   Q==;
X-CSE-ConnectionGUID: Pt+j0or6TMWDwIg5ELXQeQ==
X-CSE-MsgGUID: XQoeLhC1RTi2lFv81GuRhg==
X-IronPort-AV: E=Sophos;i="6.15,253,1739862000"; 
   d="asc'?scan'208";a="41104049"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 May 2025 01:53:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 1 May 2025 01:52:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44 via Frontend
 Transport; Thu, 1 May 2025 01:52:46 -0700
Date: Thu, 1 May 2025 09:51:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <pierre-henry.moussay@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones
	<lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 8/9] clk: divider, gate: create regmap-backed
 copies of gate and divider clocks
Message-ID: <20250501-deafening-obtain-ab689094972d@wendy>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-dandelion-canola-c10f5934434b@spud>
MIME-Version: 1.0
In-Reply-To: <20250321-dandelion-canola-c10f5934434b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_015322_517070_F9A6BE92 
X-CRM114-Status: GOOD (  30.37  )
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
Content-Type: multipart/mixed; boundary="===============6585538566178126336=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6585538566178126336==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sKi5teEdgXK6kHX"
Content-Disposition: inline

--6sKi5teEdgXK6kHX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen,

On Fri, Mar 21, 2025 at 05:22:41PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Implement regmap-backed copies of gate and divider clocks by replacing
> the iomem pointer to the clock registers with a regmap and offset
> within.

Is this the sort of implementation you were looking for in your comments
on the previous version of this series?
(https://lore.kernel.org/linux-clk/20250220-iciness-mobilize-94a027ff52ce@s=
pud/)

Cheers,
Conor.

>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/Kconfig              |   8 +
>  drivers/clk/Makefile             |   2 +
>  drivers/clk/clk-divider-regmap.c | 270 +++++++++++++++++++++++++++++++
>  drivers/clk/clk-gate-regmap.c    | 253 +++++++++++++++++++++++++++++
>  drivers/clk/clk-gate.c           |   5 +-
>  include/linux/clk-provider.h     | 120 ++++++++++++++
>  6 files changed, 656 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/clk-divider-regmap.c
>  create mode 100644 drivers/clk/clk-gate-regmap.c
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..c700b6ef4f34 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -33,6 +33,14 @@ menuconfig COMMON_CLK
> =20
>  if COMMON_CLK
> =20
> +config COMMON_CLK_DIVIDER_REGMAP
> +	bool
> +	select REGMAP
> +
> +config COMMON_CLK_GATE_REGMAP
> +	bool
> +	select REGMAP
> +
>  config COMMON_CLK_WM831X
>  	tristate "Clock driver for WM831x/2x PMICs"
>  	depends on MFD_WM831X
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..c57f72af5db9 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -20,11 +20,13 @@ clk-test-y			:=3D clk_test.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-divider.o
> +obj-$(CONFIG_COMMON_CLK_DIVIDER_REGMAP)	+=3D clk-divider-regmap.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-fixed-rate.o
>  obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+=3D clk-fixed-rate-test.o
>  clk-fixed-rate-test-y		:=3D clk-fixed-rate_test.o kunit_clk_fixed_rate_t=
est.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-gate.o
> +obj-$(CONFIG_COMMON_CLK_GATE_REGMAP)	+=3D clk-gate-regmap.o
>  obj-$(CONFIG_CLK_GATE_KUNIT_TEST) +=3D clk-gate_test.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-multiplier.o
>  obj-$(CONFIG_COMMON_CLK)	+=3D clk-mux.o
> diff --git a/drivers/clk/clk-divider-regmap.c b/drivers/clk/clk-divider-r=
egmap.c
> new file mode 100644
> index 000000000000..2906130a2b47
> --- /dev/null
> +++ b/drivers/clk/clk-divider-regmap.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +
> +static inline u32 clk_div_regmap_readl(struct clk_divider_regmap *divide=
r)
> +{
> +	u32 val;
> +
> +	regmap_read(divider->regmap, divider->map_offset, &val);
> +
> +	return val;
> +}
> +
> +static inline void clk_div_regmap_writel(struct clk_divider_regmap *divi=
der, u32 val)
> +{
> +	regmap_write(divider->regmap, divider->map_offset, val);
> +
> +}
> +
> +static unsigned long clk_divider_regmap_recalc_rate(struct clk_hw *hw,
> +		unsigned long parent_rate)
> +{
> +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> +	unsigned int val;
> +
> +	val =3D clk_div_regmap_readl(divider) >> divider->shift;
> +	val &=3D clk_div_mask(divider->width);
> +
> +	return divider_recalc_rate(hw, parent_rate, val, divider->table,
> +				   divider->flags, divider->width);
> +}
> +
> +static long clk_divider_regmap_round_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +				unsigned long *prate)
> +{
> +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> +
> +	/* if read only, just return current value */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> +		u32 val;
> +
> +		val =3D clk_div_regmap_readl(divider) >> divider->shift;
> +		val &=3D clk_div_mask(divider->width);
> +
> +		return divider_ro_round_rate(hw, rate, prate, divider->table,
> +					     divider->width, divider->flags,
> +					     val);
> +	}
> +
> +	return divider_round_rate(hw, rate, prate, divider->table,
> +				  divider->width, divider->flags);
> +}
> +
> +static int clk_divider_regmap_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> +
> +	/* if read only, just return current value */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> +		u32 val;
> +
> +		val =3D clk_div_regmap_readl(divider) >> divider->shift;
> +		val &=3D clk_div_mask(divider->width);
> +
> +		return divider_ro_determine_rate(hw, req, divider->table,
> +						 divider->width,
> +						 divider->flags, val);
> +	}
> +
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
> +}
> +
> +static int clk_divider_regmap_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +				unsigned long parent_rate)
> +{
> +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> +	int value;
> +	unsigned long flags =3D 0;
> +	u32 val;
> +
> +	value =3D divider_get_val(rate, parent_rate, divider->table,
> +				divider->width, divider->flags);
> +	if (value < 0)
> +		return value;
> +
> +	if (divider->lock)
> +		spin_lock_irqsave(divider->lock, flags);
> +	else
> +		__acquire(divider->lock);
> +
> +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> +		val =3D clk_div_mask(divider->width) << (divider->shift + 16);
> +	} else {
> +		val =3D clk_div_regmap_readl(divider);
> +		val &=3D ~(clk_div_mask(divider->width) << divider->shift);
> +	}
> +	val |=3D (u32)value << divider->shift;
> +	clk_div_regmap_writel(divider, val);
> +
> +	if (divider->lock)
> +		spin_unlock_irqrestore(divider->lock, flags);
> +	else
> +		__release(divider->lock);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops clk_divider_regmap_ops =3D {
> +	.recalc_rate =3D clk_divider_regmap_recalc_rate,
> +	.round_rate =3D clk_divider_regmap_round_rate,
> +	.determine_rate =3D clk_divider_regmap_determine_rate,
> +	.set_rate =3D clk_divider_regmap_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_divider_regmap_ops);
> +
> +const struct clk_ops clk_divider_regmap_ro_ops =3D {
> +	.recalc_rate =3D clk_divider_regmap_recalc_rate,
> +	.round_rate =3D clk_divider_regmap_round_rate,
> +	.determine_rate =3D clk_divider_regmap_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_divider_regmap_ro_ops);
> +
> +struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock)
> +{
> +	struct clk_divider_regmap *div;
> +	struct clk_hw *hw;
> +	struct clk_init_data init =3D {};
> +	int ret;
> +
> +	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
> +		if (width + shift > 16) {
> +			pr_warn("divider value exceeds LOWORD field\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	/* allocate the divider */
> +	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> +	if (!div)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name =3D name;
> +	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
> +		init.ops =3D &clk_divider_regmap_ro_ops;
> +	else
> +		init.ops =3D &clk_divider_regmap_ops;
> +	init.flags =3D flags;
> +	init.parent_names =3D parent_name ? &parent_name : NULL;
> +	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
> +	init.parent_data =3D parent_data;
> +	if (parent_name || parent_hw || parent_data)
> +		init.num_parents =3D 1;
> +	else
> +		init.num_parents =3D 0;
> +
> +	/* struct clk_divider assignments */
> +	div->regmap =3D regmap;
> +	div->map_offset =3D map_offset;
> +	div->shift =3D shift;
> +	div->width =3D width;
> +	div->flags =3D clk_divider_flags;
> +	div->lock =3D lock;
> +	div->hw.init =3D &init;
> +	div->table =3D table;
> +
> +	/* register the clock */
> +	hw =3D &div->hw;
> +	ret =3D clk_hw_register(dev, hw);
> +	if (ret) {
> +		kfree(div);
> +		hw =3D ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(__clk_hw_register_divider_regmap);
> +
> +struct clk *clk_register_divider_regmap_table(struct device *dev, const =
char *name,
> +		const char *parent_name, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock)
> +{
> +	struct clk_hw *hw;
> +
> +	hw =3D  __clk_hw_register_divider_regmap(dev, NULL, name, parent_name, =
NULL,
> +					       NULL, flags, regmap, map_offset,
> +					       shift, width, clk_divider_flags,
> +					       table, lock);
> +	if (IS_ERR(hw))
> +		return ERR_CAST(hw);
> +	return hw->clk;
> +}
> +EXPORT_SYMBOL_GPL(clk_register_divider_regmap_table);
> +
> +void clk_unregister_divider_regmap(struct clk *clk)
> +{
> +	struct clk_divider_regmap *div;
> +	struct clk_hw *hw;
> +
> +	hw =3D __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	div =3D to_clk_divider_regmap(hw);
> +
> +	clk_unregister(clk);
> +	kfree(div);
> +}
> +EXPORT_SYMBOL_GPL(clk_unregister_divider_regmap);
> +
> +/**
> + * clk_hw_unregister_divider_regmap - unregister a clk divider
> + * @hw: hardware-specific clock data to unregister
> + */
> +void clk_hw_unregister_divider_regmap(struct clk_hw *hw)
> +{
> +	struct clk_divider_regmap *div;
> +
> +	div =3D to_clk_divider_regmap(hw);
> +
> +	clk_hw_unregister(hw);
> +	kfree(div);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_unregister_divider_regmap);
> +
> +static void devm_clk_hw_release_divider_regmap(struct device *dev, void =
*res)
> +{
> +	clk_hw_unregister_divider_regmap(*(struct clk_hw **)res);
> +}
> +
> +struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock)
> +{
> +	struct clk_hw **ptr, *hw;
> +
> +	ptr =3D devres_alloc(devm_clk_hw_release_divider_regmap, sizeof(*ptr), =
GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hw =3D __clk_hw_register_divider_regmap(dev, np, name, parent_name, par=
ent_hw,
> +					      parent_data, flags, regmap, map_offset,
> +					      shift, width, clk_divider_flags, table,
> +					      lock);
> +
> +	if (!IS_ERR(hw)) {
> +		*ptr =3D hw;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_divider_regmap);
> diff --git a/drivers/clk/clk-gate-regmap.c b/drivers/clk/clk-gate-regmap.c
> new file mode 100644
> index 000000000000..cf9e48407971
> --- /dev/null
> +++ b/drivers/clk/clk-gate-regmap.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/string.h>
> +
> +/**
> + * DOC: basic gatable clock which can gate and ungate its output
> + *
> + * Traits of this clock:
> + * prepare - clk_(un)prepare only ensures parent is (un)prepared
> + * enable - clk_enable and clk_disable are functional & control gating
> + * rate - inherits rate from parent.  No clk_set_rate support
> + * parent - fixed parent.  No clk_set_parent support
> + */
> +
> +static inline u32 clk_gate_regmap_readl(struct clk_gate_regmap *gate)
> +{
> +	u32 val;
> +
> +	regmap_read(gate->map, gate->map_offset, &val);
> +
> +	return val;
> +}
> +
> +static inline void clk_gate_regmap_writel(struct clk_gate_regmap *gate, =
u32 val)
> +{
> +	regmap_write(gate->map, gate->map_offset, val);
> +
> +}
> +
> +/*
> + * It works on following logic:
> + *
> + * For enabling clock, enable =3D 1
> + *	set2dis =3D 1	-> clear bit	-> set =3D 0
> + *	set2dis =3D 0	-> set bit	-> set =3D 1
> + *
> + * For disabling clock, enable =3D 0
> + *	set2dis =3D 1	-> set bit	-> set =3D 1
> + *	set2dis =3D 0	-> clear bit	-> set =3D 0
> + *
> + * So, result is always: enable xor set2dis.
> + */
> +static void clk_gate_regmap_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct clk_gate_regmap *gate =3D to_clk_gate_regmap(hw);
> +	int set =3D gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	set ^=3D enable;
> +
> +	if (gate->lock)
> +		spin_lock_irqsave(gate->lock, flags);
> +	else
> +		__acquire(gate->lock);
> +
> +	if (gate->flags & CLK_GATE_HIWORD_MASK) {
> +		reg =3D BIT(gate->bit_idx + 16);
> +		if (set)
> +			reg |=3D BIT(gate->bit_idx);
> +	} else {
> +		reg =3D clk_gate_regmap_readl(gate);
> +
> +		if (set)
> +			reg |=3D BIT(gate->bit_idx);
> +		else
> +			reg &=3D ~BIT(gate->bit_idx);
> +	}
> +
> +	clk_gate_regmap_writel(gate, reg);
> +
> +	if (gate->lock)
> +		spin_unlock_irqrestore(gate->lock, flags);
> +	else
> +		__release(gate->lock);
> +}
> +
> +static int clk_gate_regmap_enable(struct clk_hw *hw)
> +{
> +	clk_gate_regmap_endisable(hw, 1);
> +
> +	return 0;
> +}
> +
> +static void clk_gate_regmap_disable(struct clk_hw *hw)
> +{
> +	clk_gate_regmap_endisable(hw, 0);
> +}
> +
> +int clk_gate_regmap_is_enabled(struct clk_hw *hw)
> +{
> +	u32 reg;
> +	struct clk_gate_regmap *gate =3D to_clk_gate_regmap(hw);
> +
> +	reg =3D clk_gate_regmap_readl(gate);
> +
> +	/* if a set bit disables this clk, flip it before masking */
> +	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> +		reg ^=3D BIT(gate->bit_idx);
> +
> +	reg &=3D BIT(gate->bit_idx);
> +
> +	return reg ? 1 : 0;
> +}
> +EXPORT_SYMBOL_GPL(clk_gate_regmap_is_enabled);
> +
> +const struct clk_ops clk_gate_regmap_ops =3D {
> +	.enable =3D clk_gate_regmap_enable,
> +	.disable =3D clk_gate_regmap_disable,
> +	.is_enabled =3D clk_gate_regmap_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(clk_gate_regmap_ops);
> +
> +struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags,
> +		struct regmap *map, u8 map_offset, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct clk_gate_regmap *gate;
> +	struct clk_hw *hw;
> +	struct clk_init_data init =3D {};
> +	int ret =3D -EINVAL;
> +
> +	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
> +		if (bit_idx > 15) {
> +			pr_err("gate bit exceeds LOWORD field\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	/* allocate the gate */
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name =3D name;
> +	init.ops =3D &clk_gate_regmap_ops;
> +	init.flags =3D flags;
> +	init.parent_names =3D parent_name ? &parent_name : NULL;
> +	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
> +	init.parent_data =3D parent_data;
> +	if (parent_name || parent_hw || parent_data)
> +		init.num_parents =3D 1;
> +	else
> +		init.num_parents =3D 0;
> +
> +	/* struct clk_gate_regmap assignments */
> +	gate->map =3D map;
> +	gate->map_offset =3D map_offset;
> +	gate->bit_idx =3D bit_idx;
> +	gate->flags =3D clk_gate_flags;
> +	gate->lock =3D lock;
> +	gate->hw.init =3D &init;
> +
> +	hw =3D &gate->hw;
> +	if (dev || !np)
> +		ret =3D clk_hw_register(dev, hw);
> +	else if (np)
> +		ret =3D of_clk_hw_register(np, hw);
> +	if (ret) {
> +		kfree(gate);
> +		hw =3D ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +
> +}
> +EXPORT_SYMBOL_GPL(__clk_hw_register_gate_regmap);
> +
> +struct clk *clk_register_gate_regmap(struct device *dev, const char *nam=
e,
> +		const char *parent_name, unsigned long flags, struct regmap *map,
> +		u8 map_offset, u8 bit_idx, u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct clk_hw *hw;
> +
> +	hw =3D __clk_hw_register_gate_regmap(dev, NULL, name, parent_name, NULL,
> +					   NULL, flags, map, map_offset, bit_idx,
> +					   clk_gate_flags, lock);
> +	if (IS_ERR(hw))
> +		return ERR_CAST(hw);
> +	return hw->clk;
> +}
> +EXPORT_SYMBOL_GPL(clk_register_gate_regmap);
> +
> +void clk_unregister_gate_regmap(struct clk *clk)
> +{
> +	struct clk_gate_regmap *gate;
> +	struct clk_hw *hw;
> +
> +	hw =3D __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	gate =3D to_clk_gate_regmap(hw);
> +
> +	clk_unregister(clk);
> +	kfree(gate);
> +}
> +EXPORT_SYMBOL_GPL(clk_unregister_gate_regmap);
> +
> +void clk_hw_unregister_gate_regmap(struct clk_hw *hw)
> +{
> +	struct clk_gate_regmap *gate;
> +
> +	gate =3D to_clk_gate_regmap(hw);
> +
> +	clk_hw_unregister(hw);
> +	kfree(gate);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_unregister_gate_regmap);
> +
> +static void devm_clk_hw_release_gate_regmap(struct device *dev, void *re=
s)
> +{
> +	clk_hw_unregister_gate_regmap(*(struct clk_hw **)res);
> +}
> +
> +struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags, struct regmap *map,
> +		u8 map_offset, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct clk_hw **ptr, *hw;
> +
> +	ptr =3D devres_alloc(devm_clk_hw_release_gate_regmap, sizeof(*ptr), GFP=
_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hw =3D __clk_hw_register_gate_regmap(dev, np, name, parent_name, parent=
_hw,
> +					   parent_data, flags, map, map_offset,
> +					   bit_idx, clk_gate_flags, lock);
> +
> +	if (!IS_ERR(hw)) {
> +		*ptr =3D hw;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_gate_regmap);
> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> index 68e585a02fd9..1e3f21a249ca 100644
> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -34,10 +34,11 @@ static inline u32 clk_gate_readl(struct clk_gate *gat=
e)
> =20
>  static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
>  {
> -	if (gate->flags & CLK_GATE_BIG_ENDIAN)
> +	if (gate->flags & CLK_GATE_BIG_ENDIAN) {
>  		iowrite32be(val, gate->reg);
> -	else
> +	} else {
>  		writel(val, gate->reg);
> +	}
>  }
> =20
>  /*
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 2e6e603b7493..6f5cf6670b48 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
> +#include <linux/regmap.h>
> =20
>  /*
>   * flags used across common struct clk.  these flags should only affect =
the
> @@ -526,6 +527,7 @@ void of_fixed_clk_setup(struct device_node *np);
>  struct clk_gate {
>  	struct clk_hw hw;
>  	void __iomem	*reg;
> +	u8		map_offset;
>  	u8		bit_idx;
>  	u8		flags;
>  	spinlock_t	*lock;
> @@ -538,6 +540,37 @@ struct clk_gate {
>  #define CLK_GATE_BIG_ENDIAN		BIT(2)
> =20
>  extern const struct clk_ops clk_gate_ops;
> +
> +#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
> +/**
> + * struct clk_gate_regmap - gating clock via regmap
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @map:	regmap controlling gate
> + * @map_offset:	register offset within the regmap controlling gate
> + * @bit_idx:	single bit controlling gate
> + * @flags:	hardware-specific flags
> + * @lock:	register lock
> + *
> + * Clock which can gate its output.  Implements .enable & .disable
> + *
> + * Flags:
> + * See clk_gate
> + */
> +struct clk_gate_regmap {
> +	struct clk_hw hw;
> +	struct regmap	*map;
> +	u8		map_offset;
> +	u8		bit_idx;
> +	u8		flags;
> +	spinlock_t	*lock;
> +};
> +
> +#define to_clk_gate_regmap(_hw) container_of(_hw, struct clk_gate_regmap=
, hw)
> +
> +extern const struct clk_ops clk_gate_regmap_ops;
> +#endif
> +
>  struct clk_hw *__clk_hw_register_gate(struct device *dev,
>  		struct device_node *np, const char *name,
>  		const char *parent_name, const struct clk_hw *parent_hw,
> @@ -663,6 +696,31 @@ void clk_unregister_gate(struct clk *clk);
>  void clk_hw_unregister_gate(struct clk_hw *hw);
>  int clk_gate_is_enabled(struct clk_hw *hw);
> =20
> +#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
> +struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags,
> +		struct regmap *map, u8 map_offset, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock);
> +struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags,
> +		struct regmap *map, u8 map_offset, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock);
> +struct clk *clk_register_gate_regmap(struct device *dev, const char *nam=
e,
> +		const char *parent_name, unsigned long flags,
> +		struct regmap *map, u8 map_offset, u8 bit_idx,
> +		u8 clk_gate_flags, spinlock_t *lock);
> +
> +void clk_unregister_gate_regmap(struct clk *clk);
> +void clk_hw_unregister_gate_regmap(struct clk_hw *hw);
> +int clk_gate_regmap_is_enabled(struct clk_hw *hw);
> +#endif
> +
>  struct clk_div_table {
>  	unsigned int	val;
>  	unsigned int	div;
> @@ -736,6 +794,41 @@ struct clk_divider {
>  extern const struct clk_ops clk_divider_ops;
>  extern const struct clk_ops clk_divider_ro_ops;
> =20
> +#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
> +/**
> + * struct clk_divider_regmap - adjustable divider clock via regmap
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @map:	regmap containing the divider
> + * @map_offset:	register offset within the regmap containing the divider
> + * @shift:	shift to the divider bit field
> + * @width:	width of the divider bit field
> + * @table:	array of value/divider pairs, last entry should have div =3D 0
> + * @lock:	register lock
> + *
> + * Clock with an adjustable divider affecting its output frequency.  Imp=
lements
> + * .recalc_rate, .set_rate and .round_rate
> + *
> + * @flags:
> + * See clk_divider
> + */
> +struct clk_divider_regmap {
> +	struct clk_hw	hw;
> +	struct regmap	*regmap;
> +	u8		map_offset;
> +	u8		shift;
> +	u8		width;
> +	u8		flags;
> +	const struct clk_div_table	*table;
> +	spinlock_t	*lock;
> +};
> +
> +#define to_clk_divider_regmap(_hw) container_of(_hw, struct clk_divider_=
regmap, hw)
> +
> +extern const struct clk_ops clk_divider_regmap_ops;
> +extern const struct clk_ops clk_divider_regmap_ro_ops;
> +#endif
> +
>  unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long paren=
t_rate,
>  		unsigned int val, const struct clk_div_table *table,
>  		unsigned long flags, unsigned long width);
> @@ -972,6 +1065,33 @@ struct clk *clk_register_divider_table(struct devic=
e *dev, const char *name,
>  void clk_unregister_divider(struct clk *clk);
>  void clk_hw_unregister_divider(struct clk_hw *hw);
> =20
> +#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
> +struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock);
> +
> +struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *dev,
> +		struct device_node *np, const char *name,
> +		const char *parent_name, const struct clk_hw *parent_hw,
> +		const struct clk_parent_data *parent_data, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock);
> +
> +struct clk *clk_register_divider_regmap_table(struct device *dev,
> +		const char *name, const char *parent_name, unsigned long flags,
> +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> +		u8 clk_divider_flags, const struct clk_div_table *table,
> +		spinlock_t *lock);
> +
> +void clk_unregister_divider_regmap(struct clk *clk);
> +void clk_hw_unregister_divider_regmap(struct clk_hw *hw);
> +#endif
> +
>  /**
>   * struct clk_mux - multiplexer clock
>   *
> --=20
> 2.45.2
>=20

--6sKi5teEdgXK6kHX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBM2JAAKCRB4tDGHoIJi
0jP9AQDHCw+VQ2YRGBpEksC3IK+bGF4hWIQiHwWVhpVWYaCTlgD8Ch1KmriKxbvH
bnt2PG3axy16scJXTBlWU6kBZqLbvgs=
=2Rpl
-----END PGP SIGNATURE-----

--6sKi5teEdgXK6kHX--


--===============6585538566178126336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6585538566178126336==--

