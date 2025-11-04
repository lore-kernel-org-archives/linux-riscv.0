Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB46CCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+wnV3Pxq/w4/20YRm0Fz4KCXwI6BdkTITr7qtPoV00=; b=Go3hMNJ8tu+Ya2
	6Af2/Oxmz6zrgwoUFNwUYZCFQ7CpC25UAkEQBfCTkCB1sg71w1W7RnrT4F4/F96SlGut3THXPHz7G
	TSD9PlbM0fJlsB6S64GGjx2athhyhPwZ075o6Vb8xCrP//KaYcqcBgPorCEACnoJvMHZyiOxHQWQ9
	MZO/oLV3yMcnpjKIftEnELIqWOJILie/gEUk1+nk8BTUMJ5fM6qH61cdnFHgzbgbpX78THyEvCi/2
	400bCTH1pF+zc7zl45YSNRXJkaQU65PHh5VIDDmIep8qhBNnN86oKKkHXFKKKqR2ddPFxV2zGAfi/
	NxWQPNaH9RXmXxZdewUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ1N-0000000C6Hy-1FFz;
	Tue, 04 Nov 2025 15:32:33 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ1K-0000000C6Gv-0dzj
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 15:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762270350; x=1793806350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/kB+iSurW7zoiDDtbH95+4Fk8pV2slaHdvSG1EPNCE=;
  b=XfCEsMtxxe8HRzSivQoXBwxJf4I8nkYz/FdQ6gWN1iue3oYcAkEWMalV
   g/sFSYgq8RWN+JoueiQff8m/jZ4pDWjeXpbT2ageNHv8YVKkZTjuTWgis
   qdlSWaEY4aYCr2SGaqWJhfWcKSvCZIJQoTPTsJOOscgxV0etqvwkBmd5h
   MtMo5k91tyGjovG2A8CPNjQjhlcbcQqmdTRNlwi6VYmcAw45gChmIYugG
   5knIjiipKi3NpF1boQqXgH0r3p+Bq8B8x4PXQdW7vmdNQpO90+J74zu+H
   eMq2on+myOCdXB6JEHcpk61seUviwmTIOxfAECUiLWT2EjycDR9UuhA2O
   Q==;
X-CSE-ConnectionGUID: Puo1ezSgS4GaWMGP6YwZhA==
X-CSE-MsgGUID: x3qSh6v+S3ayUzNbW410tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68204143"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68204143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 07:32:27 -0800
X-CSE-ConnectionGUID: pBo2mrM5T42UlzXUvw/0yQ==
X-CSE-MsgGUID: j+rctOb1RECHOKpGmNsLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187339081"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2025 07:32:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGJ0W-000RXo-0f;
	Tue, 04 Nov 2025 15:31:56 +0000
Date: Tue, 4 Nov 2025 23:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v1 1/3] spi: microchip: rename driver file and internal
 identifiers
Message-ID: <202511042322.bDgHrd9d-lkp@intel.com>
References: <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_073230_281634_E1608088 
X-CRM114-Status: GOOD (  13.11  )
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
[also build test ERROR on linus/master v6.18-rc4 next-20251104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prajna-Rajendra-Kumar/spi-microchip-rename-driver-file-and-internal-identifiers/20251104-001544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20251103160515.412706-2-prajna.rajendrakumar%40microchip.com
patch subject: [PATCH v1 1/3] spi: microchip: rename driver file and internal identifiers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251104/202511042322.bDgHrd9d-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042322.bDgHrd9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042322.bDgHrd9d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mpfs.c:620:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     620 |         .remove_new = mpfs_spi_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +620 drivers/spi/spi-mpfs.c

   612	
   613	static struct platform_driver mpfs_spi_driver = {
   614		.probe = mpfs_spi_probe,
   615		.driver = {
   616			.name = "microchip-spi",
   617			.pm = MICROCHIP_SPI_PM_OPS,
   618			.of_match_table = of_match_ptr(mpfs_spi_dt_ids),
   619		},
 > 620		.remove_new = mpfs_spi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
