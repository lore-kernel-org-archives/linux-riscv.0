Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13564C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 03:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzTHStwp1/1Q2p3FoluWk6/eyJjHZIr7pE0KkB5u0g0=; b=ZPUln0O0pqi+Q3
	zzva5tlKQSxGQMMs1I0xcWAjjXhBT9NGnPKOzxa3M0H9paZFxe4HxwW7LZPMAPuBahR1lfugRAl0B
	u9HH2/agQB2BuakO/mtQascVBPD+sozwIC6IWjJQErz1RR7hefgj/7n1aGJkElf0yrVWl8TMpHJ9N
	vig6194kM7j7Dhhkmh75PvwYMLsV4mP+q78TpLfYgFJcWjm7dAkacmpgohB+j8OdIN1GHKQAwfASq
	e5M8liHHa4ullmldzOmg1Zyb3XacS+qyzz9pZ8M4/wF9Js8np20comRg45EqbLZSLOlqvGv/XNOTk
	7ZKfq+DQijifdPmgyL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NRh-00HaMB-2w;
	Tue, 06 Jun 2023 03:33:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NRd-00HaCv-14
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 03:33:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 165E28143;
	Tue,  6 Jun 2023 11:32:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 11:32:23 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 11:32:22 +0800
Message-ID: <4253cd7d-c295-775d-af32-68b3de347461@starfivetech.com>
Date: Tue, 6 Jun 2023 11:32:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
To: kernel test robot <lkp@intel.com>, <devicetree@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230602084925.215411-3-william.qiu@starfivetech.com>
 <202306022017.UbwjjWRN-lkp@intel.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <202306022017.UbwjjWRN-lkp@intel.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_203317_693546_240653DA 
X-CRM114-Status: GOOD (  15.86  )
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



On 2023/6/2 20:33, kernel test robot wrote:
> Hi William,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-spi/for-next]
> [also build test WARNING on linus/master v6.4-rc4 next-20230602]
> [cannot apply to robh/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20230602084925.215411-3-william.qiu%40starfivetech.com
> patch subject: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306022017.UbwjjWRN-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/6bbd49e32d407d210b6ea322696cef2e49bf3fa1
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
>         git checkout 6bbd49e32d407d210b6ea322696cef2e49bf3fa1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/spi/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/spi/spi-cadence-quadspi.c: In function 'cqspi_resume':
>>> drivers/spi/spi-cadence-quadspi.c:1873:17: warning: ignoring return value of 'clk_bulk_prepare_enable' declared with attribute 'warn_unused_result' [-Wunused-result]
>     1873 |                 clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +1873 drivers/spi/spi-cadence-quadspi.c
> 
>   1865	
>   1866	static int cqspi_resume(struct device *dev)
>   1867	{
>   1868		struct cqspi_st *cqspi = dev_get_drvdata(dev);
>   1869		struct spi_master *master = dev_get_drvdata(dev);
>   1870	
>   1871		clk_prepare_enable(cqspi->clk);
>   1872		if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
>> 1873			clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
>   1874		cqspi_wait_idle(cqspi);
>   1875		cqspi_controller_init(cqspi);
>   1876	
>   1877		cqspi->current_cs = -1;
>   1878		cqspi->sclk = 0;
>   1879	
>   1880		return spi_master_resume(master);
>   1881	}
>   1882	
> 

Thanks about that. I'll fix it in next version.

Best Regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
