Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C00C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmVlWd9gcj1Hfr3bpduVsbuHXvOHJcvE/oeq54HPU/8=; b=eo7ABncaGCt6Pg
	j4BLzwPA5F/aGvoBQlJ26MjMXLmBpoJZgNsy9rVMBV5Sb807bXzGBqhdmyxUlzCZoHjWyPobZzZom
	oW9SvvUKJqJvRdv7TVYoGaO8OXA6M0j0EYCpyVGC4i1Yks+2gdTboLixUfQsISSfvCOQSGuq2HBv+
	dbghMcWnNzebebtf5J2W3K8+vRHJQ56KqoJ6wz22ZIhikC+ySlyI6ZXfoGyN4kzrOTLWiHL87s61S
	ydbZe1EcmQU5QOukbpgqMNMFoavU61MAXTGnt2lbze6riQzM1aiPT6Tk5O75zm1FOJzZ54HtX0PrN
	/fer0j3lp1k/XAZedSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAog9-00000001nJn-0Lgk;
	Fri, 02 May 2025 11:35:41 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoVd-00000001m3T-1E4a
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 11:24:51 +0000
Received: from [192.168.2.35] (unknown [98.97.61.17])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 1FF12B4C2411;
	Fri,  2 May 2025 13:24:44 +0200 (CEST)
Message-ID: <d96b2243-0eb8-4596-bbef-7e7f9419d1ed@freeshell.de>
Date: Fri, 2 May 2025 04:24:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0
 pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>
References: <20250424060605.638678-1-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_042449_477955_B7E224A8 
X-CRM114-Status: GOOD (  14.39  )
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

On 4/23/25 23:06, Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
> 
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> This is only a prettying commit. The resulting DTB files have the same
> content with or without this patch (verified by doing sha256sum on
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).
> 
>  .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918f..a2c72b385a905 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -8,6 +8,7 @@
>  #include "jh7110.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>  
>  / {
>  	aliases {
> @@ -428,16 +429,16 @@ GPOEN_ENABLE,
>  		};
>  
>  		mmc-pins {
> -			pinmux = <PINMUX(64, 0)>,
> -				 <PINMUX(65, 0)>,
> -				 <PINMUX(66, 0)>,
> -				 <PINMUX(67, 0)>,
> -				 <PINMUX(68, 0)>,
> -				 <PINMUX(69, 0)>,
> -				 <PINMUX(70, 0)>,
> -				 <PINMUX(71, 0)>,
> -				 <PINMUX(72, 0)>,
> -				 <PINMUX(73, 0)>;
> +			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> +				 <PINMUX(PAD_SD0_CMD, 0)>,
> +				 <PINMUX(PAD_SD0_DATA0, 0)>,
> +				 <PINMUX(PAD_SD0_DATA1, 0)>,
> +				 <PINMUX(PAD_SD0_DATA2, 0)>,
> +				 <PINMUX(PAD_SD0_DATA3, 0)>,
> +				 <PINMUX(PAD_SD0_DATA4, 0)>,
> +				 <PINMUX(PAD_SD0_DATA5, 0)>,
> +				 <PINMUX(PAD_SD0_DATA6, 0)>,
> +				 <PINMUX(PAD_SD0_DATA7, 0)>;
>  			bias-pull-up;
>  			drive-strength = <12>;
>  			input-enable;

Ref:
https://lore.kernel.org/lkml/ZQ2PR01MB1307BD49C0A49DAD3AA76049E600A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
"[PATCH] riscv: dts: starfive: jh7110-common: Use named definition for
mmc1 card detect"

Thanks for taking this. Read previous comments from Hal there is yet
some description in dts/upstream/src/riscv/starfive/jh7110-pinfunc.h
that needs to change / be improved on.



-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
