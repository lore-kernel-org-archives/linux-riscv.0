Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C794C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zc5AejiYjXSjztejohtG01ypig9rlSn9nYGWhpAoQY=; b=1BtkGbRaVmw1cb
	pEBwOOEmNtvbs5DqsF1G/ZAaKIYkuUoame+JTICkssB3rFGYlxRm1AosVtD/mtPzX6YTqbXMQP6ij
	tkFhp+2Yat95LQpK412YBCONynBvxLFzVhsPe29BOwaXgy7IN72hRV0F5gdlxhCoDTx+153MJglaS
	RXphUXtJCeRhRrR5ZoJiWCBirfglhtPrwvqA2YjL3Gvum7FkD0HxkIbpf6ck/ocEMe7AcfHC+5yJT
	xBdTU/XyVfsX6YbMHnyt9G452tjZR+aUCD1YZwrxcKBXxsu60XEb+vsMcKbSCeMuU4LHWBhSSNwkP
	g71EmLEEg1zHEddT6LeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DfM-00BQ0l-7A; Thu, 08 Dec 2022 09:58:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DfH-00BP14-Mw
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:58:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F025524DC13;
	Thu,  8 Dec 2022 17:57:39 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 17:57:40 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 17:57:39 +0800
Message-ID: <05f7cf3d-f814-3231-e078-d972c742f5c6@starfivetech.com>
Date: Thu, 8 Dec 2022 17:57:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-4-william.qiu@starfivetech.com>
 <c0b84752-443f-d935-0ed8-c8ed4d212c2e@linaro.org> <Y5C/x80p8+6Tosk/@spud>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <Y5C/x80p8+6Tosk/@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_015804_120558_CC5E8533 
X-CRM114-Status: GOOD (  24.16  )
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



On 2022/12/8 0:31, Conor Dooley wrote:
> On Wed, Dec 07, 2022 at 04:14:53PM +0100, Krzysztof Kozlowski wrote:
>> On 07/12/2022 14:17, William Qiu wrote:
>> > This adds the mmc node for the StarFive JH7110 SoC.
>> > Set sdioo node to emmc and set sdio1 node to sd.
>> > 
>> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> > ---
>> >  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
>> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
>> >  2 files changed, 63 insertions(+)
>> > 
>> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> > index c8946cf3a268..6ef8e303c2e6 100644
>> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> > @@ -47,6 +47,31 @@ &clk_rtc {
>> >  	clock-frequency = <32768>;
>> >  };
>> >  
>> > +&sdio0 {
>> > +	max-frequency = <100000000>;
>> > +	card-detect-delay = <300>;
>> > +	bus-width = <8>;
>> > +	cap-mmc-highspeed;
>> > +	mmc-ddr-1_8v;
>> > +	mmc-hs200-1_8v;
>> > +	non-removable;
>> > +	cap-mmc-hw-reset;
>> > +	post-power-on-delay-ms = <200>;
>> > +	status = "okay";
>> > +};
>> > +
>> > +&sdio1 {
>> > +	max-frequency = <100000000>;
>> > +	card-detect-delay = <300>;
>> > +	bus-width = <4>;
>> > +	no-sdio;
>> > +	no-mmc;
>> > +	broken-cd;
>> > +	cap-sd-highspeed;
>> > +	post-power-on-delay-ms = <200>;
>> > +	status = "okay";
>> > +};
>> > +
>> >  &gmac0_rmii_refin {
>> >  	clock-frequency = <50000000>;
>> >  };
>> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > index c22e8f1d2640..e90b085d7e41 100644
>> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > @@ -331,6 +331,11 @@ aoncrg: clock-controller@17000000 {
>> >  			#reset-cells = <1>;
>> >  		};
>> >  
>> > +		sys_syscon: sys_syscon@13030000 {
>> 
>> No underscores in node names, generic node names (syscon or
>> system-controller)
>> 
>> > +			compatible = "syscon";
>> 
>> This is not allowed alone.
>> 
>> > +			reg = <0x0 0x13030000 0x0 0x1000>;
>> > +		};
>> > +
>> >  		gpio: gpio@13040000 {
>> >  			compatible = "starfive,jh7110-sys-pinctrl";
>> >  			reg = <0x0 0x13040000 0x0 0x10000>;
>> > @@ -433,5 +438,38 @@ uart5: serial@12020000 {
>> >  			reg-shift = <2>;
>> >  			status = "disabled";
>> >  		};
>> > +
>> > +		/* unremovable emmc as mmcblk0 */
>> > +		sdio0: mmc@16010000 {
>> > +			compatible = "starfive,jh7110-sdio";
>> > +			reg = <0x0 0x16010000 0x0 0x10000>;
>> > +			clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
>> > +				 <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
>> > +			clock-names = "biu","ciu";
>> > +			resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
>> > +			reset-names = "reset";
>> > +			interrupts = <74>;
>> > +			fifo-depth = <32>;
>> > +			fifo-watermark-aligned;
>> > +			data-addr = <0>;
>> > +			starfive,sys-syscon = <&sys_syscon 0x14 0x1a 0x7c000000>;
>> 
>> This does not match your bindings at all. "&sys_syscon" is a phandle,
>> not a number of tuning retries, as you expect in your bindings.
> 
> Additionally, a Link: to the documentation for where-ever these "random"
> numbers that are being used would be nice.
> 

I will update in next version.

> +static int dw_mci_starfive_parse_dt(struct dw_mci *host)
> +{
> +	struct of_phandle_args args;
> +	struct starfive_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = of_parse_phandle_with_fixed_args(host->dev->of_node,
> +						"starfive,sys-syscon", 3, 0, &args);
> +	if (ret) {
> +		dev_err(host->dev, "Failed to parse starfive,sys-syscon\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->reg_syscon = syscon_node_to_regmap(args.np);
> +	of_node_put(args.np);
> +	if (IS_ERR(priv->reg_syscon))
> +		return PTR_ERR(priv->reg_syscon);
> +
> +	priv->syscon_offset = args.args[0];
> +	priv->syscon_shift  = args.args[1];
> +	priv->syscon_mask   = args.args[2];
> 
> Given the driver, the property description just seems incorrect and this
> is actually the bit of the syscon that is relevant to the tuning process
> (perhaps where the find the tuning values?). Without public docs or a
> better description it is hard for (me at least) to know :)
> 

Hi Conor,

Thank you for taking time to review and provide helpful comments for this patch.
I'll make the description better and more detailed in next version.

Best regards,
William Qiu
> +
> +	host->priv = priv;
> +
> +	return 0;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
