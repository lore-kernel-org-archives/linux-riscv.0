Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDFCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVqm3l5z087qJgnrUqBugivbo6eAkDjHIdn3XMit6fY=; b=L1IsEW5wsyQWk+
	Xm5uHMVgioTCp51aookg+BBsrSucbCssL4ZKxvspaC7qtK4D40XcYVM+2n2WrHUD9HrE9JEjlfvAa
	QwJ3oB3SQknON4/L5iYdsjgVQWpNCBi3uAwbRse2q8K/YZqxFJ6xdbSUkq6PwPn7hjeOXuThrySOX
	jwDu6huuZezFKsLnQCBaYVzipPp+G8ToYR0LVrAgh/qv3Sb8nGusFYU3p2IQ/NCt9ORaod4TysaPQ
	TJPwZEe3vCrUrMOgU31BRMIGD7Pm3qAAkD9YqwSipAtfBG5sW2NqhmILqe9zfQM2EWqVk6pucAg4l
	t4/1WvBGss8B3IvwV4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lcn-0000000FAyP-4BL4;
	Fri, 03 May 2024 05:38:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lck-0000000FAxX-1zWJ
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 05:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714714702; x=1746250702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rIOanS3NEM0FdsDfQos+HeWqaxYjUZHhl//Lgnnpjyc=;
  b=MWfp7hLsM35oU+1hOiWR9JIhFWZe5Iw3luHgnyLdaQ6Rxl7Gp8yKuikc
   4bZWb6KaWlSUQMh5P07BJpbs77su/rmT3LHrt86onIYIqb/l7htnQEITG
   cVbilsatgRWPf7NzMn64vBGzwtUXuagODoq2aVcNJFscWl6vGD2Bgbpq9
   kO3g3CyVV65b2/NLMimmg+wIHEbXzw3jO726XgL98zC0vcF44g/BS91pf
   PKHXXMh9jZf35hpKaUbPn1n0qznZl47r7ltb7CcyQZ4AP+ZqsjvAbT9ML
   tsnVtNAIm9lASQkN/3sbrwPLkt/0HjSsDHRCSPuH/NWvXCogOeAO9aIa3
   w==;
X-CSE-ConnectionGUID: OKskZHgLSmKL10+SlcvNdw==
X-CSE-MsgGUID: fx8bTjlaQFeh4atV96V+Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="33025267"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="33025267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 22:38:18 -0700
X-CSE-ConnectionGUID: zZhTx/LNQVyeh59xXQiJuA==
X-CSE-MsgGUID: wByDFti2RZ+Xlb7eXRFXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27760508"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 May 2024 22:38:16 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2lcb-000BLu-1O;
	Fri, 03 May 2024 05:38:13 +0000
Date: Fri, 3 May 2024 13:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based
 CS
Message-ID: <202405031322.8UuTAWrf-lkp@intel.com>
References: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_223822_594228_61FA1453 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Prajna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.9-rc6 next-20240502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-spi-microchip-core-Add-support-for-GPIO-based-CS/20240502-223714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240502143410.12629-2-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based CS
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240503/202405031322.8UuTAWrf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031322.8UuTAWrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031322.8UuTAWrf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-microchip-core.c: In function 'mchp_corespi_setup':
>> drivers/spi/spi-microchip-core.c:261:13: warning: the comparison will always evaluate as 'true' for the address of 'cs_gpiod' will never be NULL [-Waddress]
     261 |         if (spi->cs_gpiod)
         |             ^~~
   In file included from drivers/spi/spi-microchip-core.c:21:
   include/linux/spi/spi.h:219:34: note: 'cs_gpiod' declared here
     219 |         struct gpio_desc        *cs_gpiod[SPI_CS_CNT_MAX];      /* Chip select gpio desc */
         |                                  ^~~~~~~~


vim +261 drivers/spi/spi-microchip-core.c

   255	
   256	static int mchp_corespi_setup(struct spi_device *spi)
   257	{
   258		struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
   259		u32 reg;
   260	
 > 261		if (spi->cs_gpiod)
   262			return 0;
   263	
   264		/*
   265		 * Active high targets need to be specifically set to their inactive
   266		 * states during probe by adding them to the "control group" & thus
   267		 * driving their select line low.
   268		 */
   269		if (spi->mode & SPI_CS_HIGH) {
   270			reg = mchp_corespi_read(corespi, REG_SLAVE_SELECT);
   271			reg |= BIT(spi_get_chipselect(spi, 0));
   272			mchp_corespi_write(corespi, REG_SLAVE_SELECT, reg);
   273		}
   274		return 0;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
