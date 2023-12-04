Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7875C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RKfeP1vLob7sZS9+s4dL9pcwFvpuM8UTbvOp7TxTFo=; b=aGtGDqC7Xxe5z+
	KpWIQeSel7ku2RcyvdboOnFIJlv9ZXe9l5ls+0vU/HHvDVcXyL+aFik4Uw/p/3tj7xnlNYgUMgMaL
	WTEd8N8zF5A8uYOr162berdFx9ZbqPsKiHPdlS5HrEMIjEQX6ouSbJbZpb7G8z57NVSAf6xMPOvyJ
	oSUlQ5M9p2pSEknSYwQfPYSYpli7f0thhVxWCWNvFmEKkd77AOYEFaN5dVtdIPM/QShW+9oo6C7g9
	P/Re9lvEHfhuHO8CkSB5Dq9P4kyYcq07kYfVYD5XDp4U9eG4VOikbDMSCZ7h4YbfTp6WbTNwnAPZu
	I2SOF4gPvjo0xCTkwiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7Hm-003f3j-0t;
	Mon, 04 Dec 2023 11:38:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7HP-003esG-1V
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 11:38:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7798517F57;
	Mon,  4 Dec 2023 19:37:07 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 19:37:07 +0800
Received: from [192.168.125.131] (183.27.97.199) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 19:37:06 +0800
Message-ID: <f807bd04-02b9-4fda-97b9-7b47ce0cd87a@starfivetech.com>
Date: Mon, 4 Dec 2023 19:29:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: starfive: move timebase-frequency to .dtsi
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	<linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Walker Chen
	<walker.chen@starfivetech.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20231130-bobbing-valid-b97f26fe8edc@spud>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20231130-bobbing-valid-b97f26fe8edc@spud>
X-Originating-IP: [183.27.97.199]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_033827_837972_D41F03A0 
X-CRM114-Status: GOOD (  21.56  )
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

On 2023/12/1 0:11, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Properties fixed by the SoC should be defined in the $soc.dtsi, and the
> timebase-frequency is not sourced directly from an off-chip oscillator.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I actually have no idea whether this is true or not, I asked on the
> jh8100 series but only got an answer for that SoC and not the existing
> ones. I'm hoping that a patch envokes more of a reaction!
> 
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Walker Chen <walker.chen@starfivetech.com>
> CC: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> CC: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100-common.dtsi               | 4 ----
>  arch/riscv/boot/dts/starfive/jh7100.dtsi                      | 1 +
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ----
>  arch/riscv/boot/dts/starfive/jh7110.dtsi                      | 1 +
>  4 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..214f27083d7b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -19,10 +19,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	cpus {
> -		timebase-frequency = <6250000>;
> -	};
> -
>  	memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x2 0x0>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index e68cafe7545f..c50b32424721 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -16,6 +16,7 @@ / {
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		timebase-frequency = <6250000>;
>  
>  		U74_0: cpu@0 {
>  			compatible = "sifive,u74-mc", "riscv";
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..7873c7ffde4d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -26,10 +26,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	cpus {
> -		timebase-frequency = <4000000>;
> -	};
> -
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 45213cdf50dc..ee7d4bb1f537 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -18,6 +18,7 @@ / {
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		timebase-frequency = <4000000>;
>  
>  		S7_0: cpu@0 {
>  			compatible = "sifive,s7", "riscv";


Hi Conor and Emil,

I found some information that I hope will be useful to you.
What Emil said is right:
osc (24MHz) -> rtc_toggle (div N) -> mtime

I found the N is depend on this clock register in drivers/clk/starfive/clk-starfive-jh7110-sys.c:

 83         JH71X0__DIV(JH7110_SYSCLK_RTC_TOGGLE, "rtc_toggle", 6, JH7110_SYSCLK_OSC),

and the description of the register is that the divider defaults to and is fixed to 6. So the timebase-frequency is 4MHz on the JH7110.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
