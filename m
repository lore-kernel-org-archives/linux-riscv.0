Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1B4C2FC14
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JZ7matiCOuMD1MMs2p2+B0bu64CGOiXF+TiFXcQU8k=; b=Uo3oL2rU8JAZvH
	IfNq9qU583EFdnSozUiA0UYaMJHHQt7azMW5Yl+zUqRHFM6XP/7QiqF8NkmO7/7YWsAIRegSo6J9D
	SFiVBmvzBt0+GCuumTxRWxbeH8fQUSmTOGhXjKvYBJZ0C/3NWYp/l5ngW55lp/SmOCwAaJ6932no+
	eblxGrwZyKC7IE9DEAtVpBzOLyXKA//d27TsRiW7Orcmm1p8TN+LfIioVvnTMqXy+0ZmOL4g29tu9
	JA8q86boR4zW1qlmHrK1/zfpVm3JgjW5EJyLgwH8PP8m+R07r/e3SRmUXyWlk/zVqI3krnbi37Xma
	uyXl64BD+AE324QIurEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYMJ-005oxk-2J;
	Thu, 17 Aug 2023 08:27:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYME-005owe-0h
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 08:27:58 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AE14B24E2B1;
	Thu, 17 Aug 2023 16:27:34 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 17 Aug
 2023 16:27:34 +0800
Received: from [192.168.125.113] (183.27.97.249) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 17 Aug
 2023 16:27:33 +0800
Message-ID: <d241515f-f5c7-f2aa-0c78-80f0c5b569f3@starfivetech.com>
Date: Thu, 17 Aug 2023 16:27:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] riscv: dts: jh7110: starfive: Add timer node
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samin Guo
	<samin.guo@starfivetech.com>, <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>
References: <20230814101603.166951-1-xingyu.wu@starfivetech.com>
 <20230814101603.166951-4-xingyu.wu@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230814101603.166951-4-xingyu.wu@starfivetech.com>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_012754_402802_A0399967 
X-CRM114-Status: GOOD (  10.78  )
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


On 2023/8/14 18:16, Xingyu Wu wrote:
> Add the timer node for the Starfive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index ec2e70011a73..84bb9717be13 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -502,6 +502,26 @@ sysgpio: pinctrl@13040000 {
>  			#gpio-cells = <2>;
>  		};
>  
> +		timer@13050000 {
> +			compatible = "starfive,jh7110-timer";
> +			reg = <0x0 0x13050000 0x0 0x10000>;
> +			interrupts = <69>, <70>, <71> ,<72>;
> +			clocks = <&syscrg JH7110_SYSCLK_TIMER_APB>,
> +				 <&syscrg JH7110_SYSCLK_TIMER0>,
> +				 <&syscrg JH7110_SYSCLK_TIMER1>,
> +				 <&syscrg JH7110_SYSCLK_TIMER2>,
> +				 <&syscrg JH7110_SYSCLK_TIMER3>;
> +			clock-names = "apb", "ch0", "ch1",
> +				      "ch2", "ch3";
> +			resets = <&syscrg JH7110_SYSRST_TIMER_APB>,
> +				 <&syscrg JH7110_SYSRST_TIMER0>,
> +				 <&syscrg JH7110_SYSRST_TIMER1>,
> +				 <&syscrg JH7110_SYSRST_TIMER2>,
> +				 <&syscrg JH7110_SYSRST_TIMER3>;
> +			reset-names = "apb", "ch0", "ch1",
> +				      "ch2", "ch3";
> +		};
> +
>  		watchdog@13070000 {
>  			compatible = "starfive,jh7110-wdt";
>  			reg = <0x0 0x13070000 0x0 0x10000>;

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
