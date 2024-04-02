Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E82CCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDh9HP5+KYb6HpTDk55CN81MqZVJ8UuywAwOK6XsFTA=; b=XT7NR4l8wg9Tmt
	LxZFrc8wVyxgrSu7121I2rbsCtLTU2QyDBCM6I5QC3FzGTAJ15ZxB1/un2taiRr8dge1iEnhnN/Rh
	Soy80COC+etXQVxYH86hfCu9hESO1xxiTVbu1S22krCriEG1pZdPGHgf7ZZoG8R+AG5h1VW0u03Qx
	5yegfkKjPt6OWtfsEyES5ThG5ujSXXyXjQJmHoNCpk5NIbJfhhBAwLuf5wKzfSRqt0neaHVerOO6+
	iSYnbApzgRNg32JLdhJaDQL5K8TUnuB0lg/zqs/zaas5j0fsCH1Of/Vu7MAYMMJttTEtOITrR+NUg
	tGLMQuOdz3qh9USVRT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgq8-0000000C0TG-3h8T;
	Tue, 02 Apr 2024 16:18:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgq4-0000000C0Rv-3pw8
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 16:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 139ABCE10EF;
	Tue,  2 Apr 2024 16:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD868C433C7;
	Tue,  2 Apr 2024 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712074696;
	bh=tqIuMZfC4MsoHlk9HVhKG/9PpH5oRCBJruwdKEA1VZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJDRrDbNLGOiNgFd3/HXrhBy/yplIQOUciqf0NwEUhNc72OkVudEPXLgseBuiTuH4
	 pUA3CN2l7ysl7ggJ34ZEsWQ7OFWB5VHUASq0qWrCkNd/XjeUaXzeyROLPwyqYDErUE
	 lOBbvSaXwblHk4UiHlCfUmsQFGef9Z/F4EqEYjVhWWnGtfj7ZPnhhvW4I59deE5x2r
	 cHMZmr3qnkY9FnT16mx1+RdGMgM2zEHDH6ldN2F0WOuCUXUNdLjltPRgEPPmg+6EwU
	 gDwCDAzmLWBsmutde7WRplqOrZ5LgeqtJUg7wsi5USu3F/XEFULPbLJQqtjrTtZ5Lh
	 xQPC+Do4UQCfQ==
Message-ID: <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
Date: Tue, 2 Apr 2024 18:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_091821_368215_040A28B1 
X-CRM114-Status: GOOD (  20.80  )
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

On 02/04/2024 11:09, Xingyu Wu wrote:
> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> But now PLL0 rate is 1GHz and the cpu frequency loads become
> 333/500/500/1000MHz in fact.
> 
> So PLL0 rate should be default set to 1.5GHz. But setting the
> PLL0 rate need certain steps:
> 
> 1. Change the parent of cpu_root clock to OSC clock.
> 2. Change the divider of cpu_core if PLL0 rate is higher than
>    1.25GHz before CPUfreq boot.
> 3. Change the parent of cpu_root clock back to PLL0 clock.
> 
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
> 
> Hi Stephen and Emil,
> 
> This patch fixes the issue about lower rate of CPUfreq[1] by setting PLL0
> rate to 1.5GHz.
> 
> In order not to affect the cpu operation, setting the PLL0 rate need
> certain steps. The cpu_root's parent clock should be changed first. And
> the divider of the cpu_core clock should be set to 2 so they won't crash
> when setting 1.5GHz without voltage regulation. Due to PLL driver boot
> earlier than SYSCRG driver, cpu_core and cpu_root clocks are using by
> ioremap(). 
> 
> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
> 
> Previous patch link:
> v2: https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfivetech.com/
> v1: https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfivetech.com/
> 
> Thanks,
> Xingyu Wu
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++

Please do not mix DTS and driver code. That's not really portable. DTS
is being exported and used in other projects.

...

>  
> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct platform_device *pdev)
>  	struct jh7110_pll_priv *priv;
>  	unsigned int idx;
>  	int ret;
> +	struct device_node *np;
> +	struct resource res;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	priv->is_first_set = true;
> +	np = of_find_compatible_node(NULL, NULL, "starfive,jh7110-syscrg");

Your drivers should not do it. It's fragile, hides true link/dependency.
Please use phandles.


> +	if (!np) {
> +		ret = PTR_ERR(np);
> +		dev_err(priv->dev, "failed to get syscrg node\n");
> +		goto np_put;
> +	}
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to get syscrg resource\n");
> +		goto np_put;
> +	}
> +
> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
> +	if (!priv->syscrg_base)
> +		ret = -ENOMEM;

Why are you mapping other device's IO? How are you going to ensure
synced access to registers?



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
