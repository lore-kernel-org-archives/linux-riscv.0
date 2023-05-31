Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE9C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+utLnUJaspMmrfbWp1fnTgUPW1WwiTqZWk/Rsh32Tc=; b=CzueIHGu8GcFgT
	hKplO902Nd1OWhMOSHgFb6KplbZJLeOuMgbIuWAmFvAALOqWwN3nVNl4TklcEeyW387Cr5LLFhfgP
	lSkxDwhtbY9sFRaRlb1D4V6lgEHAnBG9/KW33yKuMg//+1+PEMYkXgIYJ/j5a9DAXUkX3TjZqd2jb
	UAO0HwTIW4PcELCaVU09lExw/5LeIOF3cfr4Qv7V3frh9hNYJ548DwRiOIu4N4fJW/2tKKPzrWPFc
	osK7hkJzVMHx1WUYuiSxXN+TEScB2uaFjH2xyJ5Ut3bLu/tLCPvsVT+uhPOCd6+TLx6L000+zrGX8
	2rEGMTrW0K8ZRAlBLqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hdl-00Gmwj-16;
	Wed, 31 May 2023 08:57:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hdi-00GmjI-0M
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 08:57:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 85C8D8132;
	Wed, 31 May 2023 16:56:32 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:56:32 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:56:31 +0800
Message-ID: <bb490143-e04c-495d-7519-323b653b7351@starfivetech.com>
Date: Wed, 31 May 2023 16:56:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 02/11] clk: starfive: Add StarFive JH7110
 System-Top-Group clock driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
 <20230518101234.143748-3-xingyu.wu@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230518101234.143748-3-xingyu.wu@starfivetech.com>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_015706_311486_B8BC77AE 
X-CRM114-Status: GOOD (  13.14  )
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

On Thu, 18 May 2023 18:12:25 +0800, Xingyu Wu wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add driver for the StarFive JH7110 System-Top-Group clock controller.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  11 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-stg.c    | 173 ++++++++++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 5d2333106f13..d252c03bfb81 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -39,3 +39,14 @@ config CLK_STARFIVE_JH7110_AON
>  	help
>  	  Say yes here to support the always-on clock controller on the
>  	  StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_STG
> +	tristate "StarFive JH7110 System-Top-Group clock support"
> +	depends on CLK_STARFIVE_JH7110_SYS
> +	select AUXILIARY_BUS
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JH7110

Please drop the above three lines because these three options
are already selected by CLK_STARFIVE_JH7110_SYS. Ditto to for
the isp and vout clock drivers.

With that fixed,
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

> +	default m if ARCH_STARFIVE
> +	help
> +	  Say yes here to support the System-Top-Group clock controller
> +	  on the StarFive JH7110 SoC.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
