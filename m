Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A0DC76196
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 02:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9tSB0KRPlg20S/MX2MU6ZlZIpUZRqYZ35apH8eyBss=; b=jZr0qWpElvNDrn
	jEZs5KXOCP6sSgQFeAmVCTS6XSufYWEvlKk5FNu/9nNkJNcOEu6ugWasjFm4Gvqb+jfU0r2KGmaGv
	mKbM3bYdSF6vOD8+/HP2/6fHz8Vz1fWsSAMH/wabSFxnCI0LR6+JXn8EOZXs2iGCQaqbtItAuB5WA
	1jKCLHUekrO8LJZtxbxUH2KbCkcZ03Ibcm0nPyf5Rs58zvgr1ysreCKRv0oir9A3DdKbuOwsYX3w7
	1h+PTbpcZBHgaiLqjJE5aYWJVnRkQOxoSYbieC6rGIgU2G2vPVmqDePbmWP8a5VRzDGexyA7wvWoG
	zzE4K7q4aQY5G4sn+g3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phM0H-00GPaG-1R;
	Wed, 29 Mar 2023 02:57:37 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phM0D-00GPXG-0q
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 02:57:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8A5EE24E207;
	Wed, 29 Mar 2023 10:57:03 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 10:57:03 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 10:57:02 +0800
Message-ID: <f8be0cf7-fe78-7e63-7fbc-78d083a9f186@starfivetech.com>
Date: Wed, 29 Mar 2023 10:57:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [net-next v9 5/6] net: stmmac: Add glue layer for StarFive JH7110
 SoC
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
 <20230328062009.25454-6-samin.guo@starfivetech.com>
 <20230328191716.18a302a1@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230328191716.18a302a1@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_195733_608676_C66010C3 
X-CRM114-Status: GOOD (  12.03  )
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


Re: [net-next v9 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
From: Jakub Kicinski <kuba@kernel.org>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/3/29

> On Tue, 28 Mar 2023 14:20:08 +0800 Samin Guo wrote:
>> This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
>>
>> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> 
> Excellent, now it applies cleanly :)
> 
> Our clang build with W=1 complains that:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:37:2: warning: variable 'rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>         default:
>         ^~~~~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:42:36: note: uninitialized use occurs here
>         err = clk_set_rate(dwmac->clk_tx, rate);
>                                           ^~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:24:20: note: initialize the variable 'rate' to silence this warning
>         unsigned long rate;
>                           ^
>                            = 0
> 
> 
> not sure how you prefer to fix this. Maybe return early?

Hi Jakub,

Sorry, gcc I used does not report this error (:, and clang compile checks are more stringent.
Also, if return early at default node, Arun Ramadoss doesn't think it's a good idea because the function is a void type.

I think I can initialize the value of rate first by clk_get_rate (Intel did the same <dwmac-intel-plat.c: kmb_eth_fix_mac_speed >),
like this:


static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
{
        struct starfive_dwmac *dwmac = priv;
        unsigned long rate;
        int err;

	rate = clk_get_rate(dwmac->tx_clk);

        switch (speed) {
        case SPEED_1000:
                rate = 125000000;
                break;
        case SPEED_100:
                rate = 25000000;
                break;
        case SPEED_10:
                rate = 2500000;
                break;
        default:
                dev_err(dwmac->dev, "invalid speed %u\n", speed);
                break;
        }   

        err = clk_set_rate(dwmac->clk_tx, rate);
        if (err)
                dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
}

What do you think?


Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
