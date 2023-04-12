Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF939C76196
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ots4uD0O1VZfb9BWGI/yO7eKU2Js8/h6AtxMYYra5ao=; b=fKc1ruAbM7SuRX
	9pdL0HnHc2Xton1U9vbId4YYuR7g8sjIvPFL2ajpdJKweh9I3xXP6vDnC8UmX1zF0ZMdnyjWtl0Rg
	iV0JMDqi7yisuLxNtkQfWU14sQNH5udr4ex4CaTPX50aqf2T1MgLdSE1R8CGczwbdLU1mlaTtAfcs
	y7bWC91VzinxEmlnv1N2Rq0PF1vNHqtdxWRPDlTKza8tg9JWy9TXnhE3AeFAbMD7MRDmQ2yWKNIir
	V+dIWIP8Wn+HAJK7zdalaabFJcKoA4AvTuTSCM9DDCahrqkJ5DWenD8pTvJBFOrInoBh04XAm9DFY
	COuM/JEPJJP+nYLKw5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPyM-001b29-1N;
	Wed, 12 Apr 2023 02:12:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPyI-001ayo-1D
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:12:32 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E8E4124E1C6;
	Wed, 12 Apr 2023 10:11:32 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:11:33 +0800
Received: from [192.168.125.109] (113.72.145.176) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:11:32 +0800
Message-ID: <a3d5c666-c7c1-7a77-31ac-d3e686bdef59@starfivetech.com>
Date: Wed, 12 Apr 2023 10:11:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/7] soc: starfive: Replace SOC_STARFIVE with
 ARCH_SATRFIVE
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-3-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230411064743.273388-3-changhuang.liang@starfivetech.com>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_191230_627786_83BA1C68 
X-CRM114-Status: GOOD (  10.87  )
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



On 2023/4/11 14:47, Changhuang Liang wrote:
> Using ARCH_FOO symbol is preferred than SOC_FOO.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/soc/starfive/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
> index bdb96dc4c989..1e9b0c414fec 100644
> --- a/drivers/soc/starfive/Kconfig
> +++ b/drivers/soc/starfive/Kconfig
> @@ -3,8 +3,8 @@
>  config JH71XX_PMU
>  	bool "Support PMU for StarFive JH71XX Soc"
>  	depends on PM
> -	depends on SOC_STARFIVE || COMPILE_TEST
> -	default SOC_STARFIVE
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	default ARCH_STARFIVE
>  	select PM_GENERIC_DOMAINS
>  	help
>  	  Say 'y' here to enable support power domain support.

The subject 'ARCH_SATRFIVE' spelling error.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
