Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52122C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4NGL1AceiXpglIAp3EPMxpnGSjNNRuA6Y2hGNYdJhg=; b=eDe0m3eR+sxY1U
	bNjhWEEmEoEYP87ISjnR/b/dHc4I7dxo/2/hANsxri9Oz1pD7WvAIYBv1VSCjd8r6C57Xr0R8t42b
	nQ/iA+NSIE2Q4vl+H9aTTK9N7iT0cDk7ppzbwKaWvdd/CmGIV0ygKSbShxLQkLHtV7exIWnSkPkGd
	uzcTFVjAqjl3wyUoL8kup4Sr5UQU1N0rM2SYdzPD2sB0ramSJmjcOvRJeAQOpvyvej9egrL05jyIJ
	8K448bvHIukR5Hy4AANThlFW2XJMW+uXooLx3uEsxlmhtppBtEPoPniTmQ1Nz+52wHJJfs5ww/19F
	jReo0ayWmiig5USt4DBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFH-0000000CQmP-2sj8;
	Fri, 18 Jul 2025 11:27:19 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucigZ-0000000CLzx-3IbQ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 10:51:29 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2E48833C84E;
	Fri, 18 Jul 2025 10:51:24 +0000 (UTC)
Date: Fri, 18 Jul 2025 18:51:20 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix sspax_clk
Message-ID: <20250718105120-GYB695709@gentoo>
References: <20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035127_864396_5691C9CE 
X-CRM114-Status: GOOD (  24.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Troy,

On 09:54 Fri 18 Jul     , Troy Mitchell wrote:
> In the SpacemiT public document, when the FNCLKSEL field of
> the APBC_SSPAX_CLK_RST register is 7 (3'b111),
> which is a reserved value. And BIT3 of the same register is
> a reserved bit.
> 
so, if I parse above correctly, it describe current public document?
which value 7 of FNCLKSEL and BIT3 is wrongly marked as reserved.

https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#10.2.3.2-resource-reset-schemes
10.2.4.3.16 SSPAX CLOCK RESET CONTROL REGISTER (APBC_SSPAX_CLK_RST)

> But the document is wrong, the actual situation is:
> when FNCLKSEL is 7 (3'b111), and the purpose of bit 3 is
> if to select i2s_bclk as the parent clock.
> 
> And only when FNCLKSEL is 7 (3'b111), The bit 3 is not a reserved bit.
> 
so what's the difference of value 7 from other 0-6? has additional ops to
select i2s_bclk as parent? otherwise just say they are not reserved

please have more explanation for BIT3, it's quite obscure and unclear

anyway, can you coordinate with SpacemiT internal to update the docs?

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c  |  4 ++--
>  drivers/clk/spacemit/ccu_mix.c | 29 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_mix.h | 14 ++++++++++++++
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a0523537c2f436e481ae8d6ec5a581b87e..0e22f6fb2c45b68ab20a9b1563a1a6dec1a7e16c 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -359,8 +359,8 @@ static const struct clk_parent_data sspa_parents[] = {
>  	CCU_PARENT_HW(pll1_d3072_0p8),
>  	CCU_PARENT_HW(i2s_bclk),
>  };
> -CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
> -CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_SSPA_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
> +CCU_SSPA_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
>  CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
>  CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
>  CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..bfc65fc00df67299523eb5d1d2ed479c61fc6141 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -191,6 +191,25 @@ static int ccu_mux_set_parent(struct clk_hw *hw, u8 index)
>  	return ccu_mix_trigger_fc(hw);
>  }
>  
> +static int ccu_mux_set_sspa_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> +	struct ccu_mux_config *mux = &mix->mux;
> +	u32 mask, val;
> +
> +	mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> +	val = index << mux->shift;
> +
> +	if (index == 7) {
> +		mask |= BIT(3);
> +		val |= BIT(3);
> +	}
it occur to me, BIT(3) is kind of a conditional BIT..

what's the behavior of reading/writing to BIT3 when index != 7?
write value will be ignored, read will return zero?

> +
> +	ccu_update(&mix->common, ctrl, mask, val);
> +
> +	return ccu_mix_trigger_fc(hw);
> +}
> +
>  const struct clk_ops spacemit_ccu_gate_ops = {
>  	.disable	= ccu_gate_disable,
>  	.enable		= ccu_gate_enable,
> @@ -235,6 +254,16 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
>  	.set_parent	= ccu_mux_set_parent,
>  };
>  
> +const struct clk_ops spacemit_ccu_sspa_mux_gate_ops = {
> +	.disable	= ccu_gate_disable,
> +	.enable		= ccu_gate_enable,
> +	.is_enabled	= ccu_gate_is_enabled,
> +
> +	.determine_rate = ccu_mix_determine_rate,
> +	.get_parent	= ccu_mux_get_parent,
> +	.set_parent	= ccu_mux_set_sspa_parent,
> +};
> +
>  const struct clk_ops spacemit_ccu_div_gate_ops = {
>  	.disable	= ccu_gate_disable,
>  	.enable		= ccu_gate_enable,
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb7203d1eddf96047cf3174533601..7753446386353bf849787ed4ec7c85c298238ab5 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -124,6 +124,19 @@ static struct ccu_mix _name = {							\
>  	}									\
>  }
>  
> +#define CCU_SSPA_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl,			\
> +				     _shift, _width, _mask_gate, _flags)	\
> +static struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.mux	= CCU_MUX_INIT(_shift, _width),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW_PARENTS(_name, _parents,				\
> +				       spacemit_ccu_sspa_mux_gate_ops,		\
> +				       _flags),					\
> +	}									\
> +}
> +
>  #define CCU_DIV_GATE_DEFINE(_name, _parent, _reg_ctrl, _shift, _width,		\
>  			    _mask_gate,	_flags)					\
>  static struct ccu_mix _name = {							\
> @@ -213,6 +226,7 @@ extern const struct clk_ops spacemit_ccu_div_ops;
>  extern const struct clk_ops spacemit_ccu_factor_gate_ops;
>  extern const struct clk_ops spacemit_ccu_div_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
> +extern const struct clk_ops spacemit_ccu_sspa_mux_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
>  #endif /* _CCU_DIV_H_ */
> 
> ---
> base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
> change-id: 20250717-k1-clk-i2s-e4272f1f915b
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
