Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE84CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dujmXuGzZ6eMI9yUrbaw/EQ48IpeUlWR0Q1AqEYwr3Y=; b=e7sP+YH/pAlaSU
	EUUs4Fw1tS72X7ccMyxV1F2hPSyKJS7cUc7pRIwxDHp5uGGav4D1XXmecGI9k5MB44AP+qYKGVBc8
	9yOyf1/guQuvJBkKKg0b6IXSc/Q0N9LOaRnS1WCeUi78HCSAxwLYTXooxjwWV1GKQFiCbNwe2tbML
	FE+hETFtKtbwqFy5AEisx8yKTJV36jltdzRfIMzrwCeC0gpNxujTJWJLJePhq5UZ4FlhFB6fYeAT1
	83Dtv62YbP5zfS5Wa3QAIzf38ehQt9x0cbkxAgtjUxOAy/iIJ6+siMfav54A7rRB/wG1dzzfefNbi
	XawrJkAbafWFgGPTIlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwhP-00000005GDV-1NHl;
	Fri, 30 Aug 2024 08:09:39 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwhM-00000005GCO-0i1r
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 08:09:38 +0000
Date: Fri, 30 Aug 2024 08:09:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v3 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20240830080931-GYB41291@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
 <IA1PR20MB495365FC785D7C0B205BD982BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495365FC785D7C0B205BD982BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_010936_301315_0FB03F47 
X-CRM114-Status: GOOD (  28.17  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Meng Zhang <kevin.z.m@hotmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Inochi:

On 09:46 Fri 30 Aug     , Inochi Amaoto wrote:
> On Wed, Aug 28, 2024 at 11:30:24AM GMT, Yixun Lan wrote:
> > SpacemiT's K1 SoC has a pinctrl controller which use single register
> > to describe all functions, which include bias pull up/down(strong pull),
> > drive strength, schmitter trigger, slew rate, mux mode.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/Kconfig               |   1 +
> >  drivers/pinctrl/Makefile              |   1 +
> >  drivers/pinctrl/spacemit/Kconfig      |  17 +
> >  drivers/pinctrl/spacemit/Makefile     |   3 +
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 978 ++++++++++++++++++++++++++++++++++
> >  drivers/pinctrl/spacemit/pinctrl-k1.h | 180 +++++++
> >  6 files changed, 1180 insertions(+)
> > 
.. snip
> > +
> > +obj-$(CONFIG_PINCTRL_SPACEMIT_K1)	+= pinctrl-k1.o
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > new file mode 100644
> > index 0000000000000..9faac5a629c38
> > --- /dev/null
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > @@ -0,0 +1,978 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > +
> > +
.. snip
> > +static int spacemit_request_gpio(struct pinctrl_dev *pctldev,
> > +				 struct pinctrl_gpio_range *range,
> > +				 unsigned int pin)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	void __iomem *reg;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, pin);
> > +	writel(spin->gpiofunc, reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct pinmux_ops spacemit_pmx_ops = {
> > +	.get_functions_count	= pinmux_generic_get_function_count,
> > +	.get_function_name	= pinmux_generic_get_function_name,
> > +	.get_function_groups	= pinmux_generic_get_function_groups,
> > +	.set_mux		= spacemit_pmx_set_mux,
> > +	.gpio_request_enable	= spacemit_request_gpio,
> > +	.strict			= true,
> > +};
> > +
> 
> > +static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
> > +				unsigned int pin, unsigned long *config)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	int param = pinconf_to_config_param(*config);
> > +	u32 value, arg;
> > +
> > +	if (!pin)
> > +		return -EINVAL;
> > +
> > +	value = readl(spacemit_pin_to_reg(pctrl, pin));
> > +
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		arg = !FIELD_GET(PAD_PULL_EN, value);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		arg = FIELD_GET(PAD_PULLDOWN, value);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		arg = FIELD_GET(PAD_PULLUP, value);
> > +		break;
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		arg = FIELD_GET(PAD_DRIVE, value);
> > +		break;
> > +	case PIN_CONFIG_INPUT_SCHMITT:
> > +		arg = FIELD_GET(PAD_SCHMITT, value);
> > +		break;
> > +	case PIN_CONFIG_SLEW_RATE:
> > +		arg = FIELD_GET(PAD_SLEW_RATE, value);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	*config = pinconf_to_config_packed(param, arg);
> > +
> > +	return 0;
> > +}
> 
> return the value follows the config requirement, not the register value.
> 
ok, I rework this part

> > +
> > +#define ENABLE_DRV_STRENGTH	BIT(1)
> > +#define ENABLE_SLEW_RATE	BIT(2)
> > +static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
> > +					    unsigned long *configs,
> > +					    unsigned int num_configs,
> > +					    u32 *value)
> > +{
> > +	enum spacemit_pin_io_type type;
> > +	int i, param;
> > +	u32 v = 0, voltage = 0, arg, val;
> > +	u32 flag = 0, drv_strength, slew_rate;
> > +
> > +	if (!spin)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < num_configs; i++) {
> > +		param = pinconf_to_config_param(configs[i]);
> > +		arg = pinconf_to_config_argument(configs[i]);
> > +
> > +		switch (param) {
> > +		case PIN_CONFIG_BIAS_DISABLE:
> > +			v &= ~(PAD_PULL_EN | PAD_PULLDOWN | PAD_PULLUP);
> > +			v &= ~PAD_STRONG_PULL;
> > +			break;
> > +		case PIN_CONFIG_BIAS_PULL_DOWN:
> > +			v &= ~(PAD_PULLUP | PAD_STRONG_PULL);
> > +			v |= (PAD_PULL_EN | PAD_PULLDOWN);
> > +			break;
> > +		case PIN_CONFIG_BIAS_PULL_UP:
> > +			v &= ~PAD_PULLDOWN;
> > +			v |= (PAD_PULL_EN | PAD_PULLUP);
> > +
> > +			if (arg == 1)
> > +				v |= PAD_STRONG_PULL;
> > +			break;
> > +		case PIN_CONFIG_DRIVE_STRENGTH:
> > +			flag |= ENABLE_DRV_STRENGTH;
> > +			drv_strength = arg;
> > +			break;
> > +		case PIN_CONFIG_INPUT_SCHMITT:
> > +			v &= ~PAD_SCHMITT;
> > +			v |= FIELD_PREP(PAD_SCHMITT, arg);
> > +			break;
> > +		case PIN_CONFIG_POWER_SOURCE:
> > +			voltage = arg;
> > +			break;
> > +		case PIN_CONFIG_SLEW_RATE:
> > +			if (arg) {
> > +				flag |= ENABLE_SLEW_RATE;
> > +				v |= PAD_SLEW_RATE_EN;
> > +				slew_rate = arg;
> > +			} else {
> > +				v &= ~PAD_SLEW_RATE_EN;
> > +			}
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	if (flag & ENABLE_DRV_STRENGTH) {
> > +		type = spacemit_to_pin_io_type(spin);
> > +
> > +		/* fix external io type */
> > +		if (type == IO_TYPE_EXTERNAL) {
> > +			switch (voltage) {
> > +			case 1800:
> > +				type = IO_TYPE_1V8;
> > +				break;
> > +			case 3300:
> > +				type = IO_TYPE_3V3;
> > +				break;
> > +			default:
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> > +		val = spacemit_get_driver_strength(type, drv_strength);
> > +
> > +		v &= ~PAD_DRIVE;
> > +		v |= FIELD_PREP(PAD_DRIVE, val);
> > +	}
> > +
> > +	if (flag & ENABLE_SLEW_RATE) {
> > +		/* check, driver strength & slew rate */
> > +		if (flag & ENABLE_DRV_STRENGTH) {
> > +			val = FIELD_GET(PAD_SLEW_RATE, v) + 2;
> > +			if (slew_rate > 1 && slew_rate != val) {
> > +				pr_err("slew rate conflict with drive strength\n");
> > +				return -EINVAL;
> > +			}
> > +		} else {
> > +			v &= ~PAD_SLEW_RATE;
> > +			slew_rate = slew_rate > 1 ? (slew_rate - 2) : 0;
> > +			v |= FIELD_PREP(PAD_SLEW_RATE, slew_rate);
> > +		}
> > +	}
> > +
> > +	*value = v;
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
> > +				 unsigned int pin,
> > +				 u32 value)
> > +{
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	void __iomem *reg;
> > +	unsigned long flags;
> > +	unsigned int mux;
> > +
> > +	if (!pin)
> > +		return -EINVAL;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> > +
> > +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +	mux = readl_relaxed(reg) & PAD_MUX;
> > +	writel_relaxed(mux | value, reg);
> > +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
> > +				unsigned int pin, unsigned long *configs,
> > +				unsigned int num_configs)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	u32 value;
> > +
> > +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> > +		return -EINVAL;
> > +
> > +	return spacemit_pin_set_config(pctrl, pin, value);
> > +}
> > +
> > +static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
> > +				      unsigned int gsel,
> > +				      unsigned long *configs,
> > +				      unsigned int num_configs)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin;
> > +	const struct group_desc *group;
> > +	u32 value;
> > +	int i;
> > +
> > +	group = pinctrl_generic_get_group(pctldev, gsel);
> > +	if (!group)
> > +		return -EINVAL;
> > +
> > +	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
> > +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < group->grp.npins; i++)
> > +		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);
> > +
> > +	return 0;
> > +}
> > +
> 
> > +static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
> > +				      struct seq_file *seq, unsigned int pin)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
> > +	void __iomem *reg;
> > +	u32 value;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, pin);
> > +	value = readl(reg);
> > +	seq_printf(seq, ", io type (%d)", type);
> > +	seq_printf(seq, ", strong pull (%ld)", FIELD_GET(PAD_STRONG_PULL, value));
> > +	seq_printf(seq, ", register (0x%04x)\n", value);
> > +}
> 
> drop, move the "io type" to the spacemit_pctrl_dbg_show.
Ok

> "strong pull" should be handled if you use real value in
> spacemit_pinconf_get.
> 
for this reason, I will just drop it


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
