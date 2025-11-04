Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEFFCCFA00
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j5bK15nl+KgQhdIvoJ90KW91P9821R1ztZY2sqGIS0=; b=lCg+57amnjKeYJ
	vGGbnAblaNWa6AIzrLdZhX/Y/LD/vRH9lQDesRWbieJC/rUEfP7DExoYXoms8880ux+RLJEsuoAVJ
	02UJEQHGDHsSRGt9Tj758iA8zykuK6p+Di7VQe1xdnQ7+ut6kiN904eaBz9ydBQqyJjL/wdIRufTN
	YaBi/Ta321q5CYZsdbf8d3QihYsZGf7tWp/YgsdH88ieKl2PPbVvXrGVQji/tAExIQPg0FgQoGgUw
	4039jNP6bJ2dZSCEa/9OZ6Ywh/XioA5p98+x4cfItLFPXEv41QmhKRJ3E/ixBxDrNI5dubmTm1teG
	PpW39956tJ2weGPGfMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCGw-0000000BPB3-3RQN;
	Tue, 04 Nov 2025 08:20:10 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCGt-0000000BPAH-38fg
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 08:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762244408; x=1793780408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MtR/xZVvEaQczGlFwJlc3qeyM4jRQ5EHhZH0AQSey+E=;
  b=Ylm4i4CVScgl/UQd9zzdr30QgHqS62Jh/zFsIo9leB7zjoJNc2V+nJKL
   /+c+JHNQ3MtbYnePNmZ6xqTLgJM2XDteQUsvtVGdLH5n9ggqgbogiK3oT
   QYJNb1AjcCYE/iNnBU38SsDctqZ3fvkQf1l4DS/4c873sdK1v5j0ceLJp
   WFZfejht/kr9PEIPNvdaYGAb702i2BucaVtty/89oOdvj3Nb5CXYmwRDL
   rJgW6G0UBA3sz0e3w6jpRvLVY56YrLH9Q6KakR+12Ue6lijYAC1/UbEc9
   sW7J4E4eHcWht4ZDVWCUVyYV3hwsJOEIi6QdtbLN6ag0hMYKV8P4X7A67
   Q==;
X-CSE-ConnectionGUID: x6M9dTZhTk2Zr8Ryfy/O4g==
X-CSE-MsgGUID: JCazNEDuQ0+XEpUJ8SDwxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64236715"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64236715"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:20:08 -0800
X-CSE-ConnectionGUID: mHaQJxUGQH22XIprnhNFdg==
X-CSE-MsgGUID: JKYDb3pmST2DVUAvDZJyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191186728"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2025 00:20:04 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCGn-000R7e-2X;
	Tue, 04 Nov 2025 08:20:01 +0000
Date: Tue, 4 Nov 2025 16:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v1 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <202511041552.wtkxOpRz-lkp@intel.com>
References: <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_002007_861607_A178A208 
X-CRM114-Status: GOOD (  14.88  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-microchip-rename-driver-file-and-internal-identifiers/20251104-001544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20251103160515.412706-4-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH v1 3/3] spi: add support for microchip "soft" spi controller
config: sparc-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041552.wtkxOpRz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041552.wtkxOpRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041552.wtkxOpRz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/spi/spi-microchip-core.c: In function 'mchp_corespi_setup':
>> drivers/spi/spi-microchip-core.c:163:30: warning: unused variable 'corespi' [-Wunused-variable]
     163 |         struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
         |                              ^~~~~~~
   drivers/spi/spi-microchip-core.c: At top level:
>> drivers/spi/spi-microchip-core.c:438:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
     438 |         .remove_new = mchp_corespi_remove,
         |          ^~~~~~~~~~
         |          remove
>> drivers/spi/spi-microchip-core.c:438:23: error: initialization of 'const struct platform_device_id *' from incompatible pointer type 'void (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     438 |         .remove_new = mchp_corespi_remove,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core.c:438:23: note: (near initialization for 'mchp_corespi_driver.id_table')
   cc1: some warnings being treated as errors


vim +438 drivers/spi/spi-microchip-core.c

   430	
   431	static struct platform_driver mchp_corespi_driver = {
   432		.probe = mchp_corespi_probe,
   433		.driver = {
   434			.name = "microchip-corespi",
   435			.pm = MICROCHIP_SPI_PM_OPS,
   436			.of_match_table = of_match_ptr(mchp_corespi_dt_ids),
   437		},
 > 438		.remove_new = mchp_corespi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
