Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2473CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDw8S6Zu5fiCMPL7LkIuUw2ksZletkN6oQ23sEcZC9k=; b=cnR4M6whodIjvw
	zBqd+SWhSvlhmgqYtdO/22Fdh5TnkGu1VDW1mFtr5P+TQkAG/NwbKWOjAkaDAcZRMzJyCyUtiZZUn
	CL+8d3R44a8jICxWXKc587ueocC+ycl4RBiD1FoPa8NJJz1IU+RPm/ryLi2bRpzOph03UtrlQKKqC
	uxNweQe8ai5Uk80arUWnnYF5SISiSKg63HUpQEsP6DFriqVBOGojM9kTeEgKDANxfTv2T+ge2J8fM
	C97sknK4J5zQgV4P63lLvq44S/e3h1SgfzUzM6502Uftzu76AH3y60Qm9y5+VZtsfXM81gZHS5MBH
	0HoYTpkG1Et4zxRCh5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpTr-00000006KLK-2Rd8;
	Mon, 18 Aug 2025 02:20:15 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpTp-00000006KKi-0YaI
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 02:20:14 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 601D212FB9DF;
	Sun, 17 Aug 2025 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755483611; bh=CosjTx8va6pZLipoVSMb7IfvL5LyoiBbXc+YFlVKM3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKd7RZROZzJo+OndANBCZgUnVOskBkHpvNFl2tjW6XtsX/3nFvkp+mgtnGy/rNYpL
	 YwdW5LavHind787x7HHooeG3JpRPh3c7DMTHI0QFLxG3z80IcduQqZOABVrjVRiLJ+
	 aN1Jn6cy/8qUUfraB293lKCpj5C/cTZTqfG11cphRYLXuh5ZBPYuRNtmU3GK8/Soh6
	 R8rofEidDDM0WbnYD88xSfR7hiirO6+xjSCZKkGYObtN6ND92/Ra3NcLkuDGos+C2q
	 WGCJDBn0g+DVPv9bKK1FES9OoWWrtIPgjYXJ8/ncZt9i7i9HqWmOCpR+0dlrf9w3Pj
	 Ep7NKXPxD1hRg==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B96bH3ge1wco; Sun, 17 Aug 2025 19:20:09 -0700 (PDT)
Received: from ketchup (unknown [117.171.67.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1347812FB42D;
	Sun, 17 Aug 2025 19:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755483609; bh=CosjTx8va6pZLipoVSMb7IfvL5LyoiBbXc+YFlVKM3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1So0BoUQ6dU7KkwneIlzTB4pXnuu2j4nsFqptUv6c3xjIB3hz34lVn4WNAxUjqPOb
	 oK4XoIteGigE85GdgWeRIT8vCWIxcOJtDzQfPB+lyVcEBnyIj65OPCTd/W7mpfItKn
	 msze26BBfucHXBRvbiIpo1c09u5o4POp9jZzHLFsuq3+Yx5ubo1Sn+fBHiEsgdfoRy
	 QBFfjjzUtOI6UGZuWgMeYAfH4DGyqYUmalhh6/Sm6bYx4f46Z3AvTWxuCYnsvycs0p
	 WpLd6cKbXtZkPpu4ZfHHt4lYr5J/raj/5uQsRO2KceMEPCDuRe0QMXQ3hc3fYjjXsr
	 OC6n5P9nsJZwQ==
Date: Mon, 18 Aug 2025 02:20:03 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 3/4] clk: spacemit: introduce factor for div clock
Message-ID: <aKKN05w88uKP_HY7@ketchup>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
 <20250811-k1-clk-i2s-generation-v2-3-e4d3ec268b7a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-3-e4d3ec268b7a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192013_341006_332A020B 
X-CRM114-Status: GOOD (  24.99  )
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

On Mon, Aug 11, 2025 at 10:04:29PM +0800, Troy Mitchell wrote:
> From the definition of register, The i2s_bclk is a non-linear,
> discrete divider clock.
> 
> The following table shows the correspondence between index
> and frequency division coefficients:
> 
> | index |  div  |
> |-------|-------|
> |   0   |   2   |
> |   1   |   4   |
> |   2   |   6   |
> |   3   |   8   |
> 
> But from a software perspective and this table, dividing the
> actual div value by 2 is sufficient to obtain a continuous
> divider clock.
> 
> Rather than introducing a new clock type to handle this case,
> a factor parameter has been added to CCU_DIV_GATE_DEFINE.

Actually, I expected you to represent the factor simply with
CCU_FACTOR_DEFINE, introducing no new clock-calculation code...

> Suggested-by: Haylen Chu <heylenay@4d2.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 7 ++++++-
>  drivers/clk/spacemit/ccu_mix.h | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..dbd2cf234bf81d8e110b19868ff9af7373e2ab55 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -56,7 +56,10 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>  	val = ccu_read(&mix->common, ctrl) >> div->shift;
>  	val &= (1 << div->width) - 1;
>  
> -	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);
> +	if (!div->factor)
> +		return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);

Please adapt all div-related macros to make them assign one to the
factor, which helps you get rid of this if and the one in
ccu_mix_calc_best_rate().

> +	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width) / div->factor;
>  }
>  
>  /*
> @@ -115,6 +118,8 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
>  
>  		for (int j = 1; j <= div_max; j++) {
>  			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
> +			if (mix->div.factor)
			---- this if ------

> +				tmp /= mix->div.factor;
>  
>  			if (abs(tmp - rate) < abs(best_rate - rate)) {
>  				best_rate = tmp;
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 54d40cd39b2752260f57d2a96eb8d3eed8116ecd..7dd00d24ec4b1dab70663b9cb7b9ebb02abeaecb 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -34,6 +34,7 @@ struct ccu_mux_config {
>  struct ccu_div_config {
>  	u8 shift;
>  	u8 width;
> +	unsigned int factor;
>  };
>  
>  struct ccu_mix {
> @@ -130,10 +131,11 @@ static struct ccu_mix _name = {							\
>  }
>  
>  #define CCU_DIV_GATE_DEFINE(_name, _parent, _reg_ctrl, _shift, _width,		\
> -			    _mask_gate,	_flags)					\
> +			    _mask_gate,	_factor, _flags)			\

This isn't that consistent: why could only divider-gate come with a
factor? This is another reason why I think representing the factor
separately with the CCU_FACTOR_DEFINE() macro is better.

>  static struct ccu_mix _name = {							\
>  	.gate	= CCU_GATE_INIT(_mask_gate),					\
>  	.div	= CCU_DIV_INIT(_shift, _width),					\
> +	.div.factor = _factor,						\
>  	.common = {								\
>  		.reg_ctrl	= _reg_ctrl,					\
>  		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_div_gate_ops,	\
> 
> -- 
> 2.50.1
> 

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
