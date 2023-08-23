Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2574BEE49A3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 02:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/B/mnUxuuWW3p4uTUhGAcBT4DKrZt/WTBuyLXjhfSs=; b=NIKs+J3YAmYsRU
	xFNVe5maRFZzgEOcHEtrwTDpD11sRjvx6H4gB+cxjfXqErGISrtC/9WmwblDgDklha+ZJI9ZNfyis
	aTGeJtYBXdeO14n7gMqc3AxegXZIFKHQFNDz7iRg1/LjHwob59jHSFrdfZM6dW96y9R65QXK5q0nv
	8s1zpfuTWDEfq43xF2s56dPsMuCZ6YGzWgQjroBFQtYDzgHteJySbiTp5LV9Vmr9qUco88v8wJhFV
	utAH8fXIA+Lk8y6yKSz5Rk/NVRArvHB869p0JnPuWaXxu2U+A3n+mccGtDZVsKobHE40K7J9EnQIb
	KDXCPVRkRhYZo/hY59hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdsR-00H6Ip-1z;
	Wed, 23 Aug 2023 02:45:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdsN-00H6H1-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 02:45:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 09DC780BE;
	Wed, 23 Aug 2023 10:45:18 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:45:18 +0800
Received: from [192.168.125.113] (113.72.145.205) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:45:16 +0800
Message-ID: <c9ac528a-e1c2-0f64-c50e-30fc1eb6e9ac@starfivetech.com>
Date: Wed, 23 Aug 2023 10:45:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: pinfunc: Fix the pins name
 of I2STX1
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-5-xingyu.wu@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230821144151.207339-5-xingyu.wu@starfivetech.com>
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_194544_673671_358E8AD2 
X-CRM114-Status: GOOD (  11.62  )
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



On 2023/8/21 22:41, Xingyu Wu wrote:
> These pins are actually I2STX1 clock input, not I2STX0,
> so their names should be changed.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> index fb0139b56723..256de17f5261 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> @@ -240,8 +240,8 @@
>  #define GPI_SYS_MCLK_EXT			30
>  #define GPI_SYS_I2SRX_BCLK			31
>  #define GPI_SYS_I2SRX_LRCK			32
> -#define GPI_SYS_I2STX0_BCLK			33
> -#define GPI_SYS_I2STX0_LRCK			34
> +#define GPI_SYS_I2STX1_BCLK			33
> +#define GPI_SYS_I2STX1_LRCK			34
>  #define GPI_SYS_TDM_CLK				35
>  #define GPI_SYS_TDM_RXD				36
>  #define GPI_SYS_TDM_SYNC			37

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
