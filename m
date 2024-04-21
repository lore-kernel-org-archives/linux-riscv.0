Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CAAC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5LxEEqVLvVlvY5im/s9dLdPagWUY2xHVRUXIfV52bQ=; b=jC3E6N+m+xl+Iq
	WQ4o+EH51ouyD4hRfzFeQCq56xnI1NTmQPZkrmYhuQkXY15aOiCHtmBgNmuwmstUCFfPc233AFS1k
	Acu3pVwRHs/NpaVbGSmC3acxu+YisnGkIw6adwAI4qWGIDJQiGSHDng1LMZhhPwLUTWhha/sF3R4/
	KHf6XEWcjGU9pYkXNfaUIfmDtHi9Cw9TMZPkPaB/KZghS1lSv7rE4gFZnRNuKwzPnC071t98Huryo
	9T/onHU/nDfLQu30iocalfC6R7YtHFQuMJzGVOjT88ZMiODekb0fQAUnhTztFMvyr9rcZtrmRkhXs
	pDUY4yLazTHJR9TG5m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryNxJ-00000009kPK-3uyH;
	Sun, 21 Apr 2024 03:33:29 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryNxE-00000009kNC-1chS;
	Sun, 21 Apr 2024 03:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713670404; x=1745206404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBIQRbltK56dYLTITMXI0bI+xyVYUlz+U20zt2FHxxc=;
  b=NyCWuUFN2r9ihruVVOIQUaJS1O572EwvF84L/GSDWmeM6adEFyspwggJ
   8CmLB4XtOVEdLkYzzOzuGEH7UUUWP4eWMiLKUVTKbzitieTaOXYv++2BQ
   QI/vPq8fEGS8JUdGbttLt6Ti+6eAPyF6w5KugPhyh75vRfasuGnseU1+5
   nIrQ/UL+99ERHlKDCiNfy2HBsr0exwUK+PIBOeXWQdcQ3uhePPMNP4mzA
   WAu6ujyHMtKbMdqe3/B1bd8IPGAeD2xsZvSB7XGpvuI1eqm7Ssa4gjxH4
   ncNE4g9C9V29Fe/lUkGx5QEgDL4nbpvBAS7ueJybyUs59PJUvt45alM+P
   Q==;
X-CSE-ConnectionGUID: feqqaqNbSNeL3hw1N2DEuA==
X-CSE-MsgGUID: 4XpyqbOIRWWwgnBsPzBJGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9406046"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9406046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 20:33:14 -0700
X-CSE-ConnectionGUID: jcr1JPZJT4+c6ciAN+dwBA==
X-CSE-MsgGUID: PsOdNAeKRSSwrcSD91eYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="24311007"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Apr 2024 20:33:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryNww-000Beu-0C;
	Sun, 21 Apr 2024 03:33:06 +0000
Date: Sun, 21 Apr 2024 11:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
Message-ID: <202404211157.zejQ9FZ1-lkp@intel.com>
References: <IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_203324_581358_4AA71541 
X-CRM114-Status: GOOD (  11.15  )
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

Hi Inochi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.9-rc4 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-phy-Add-Sophgo-CV1800-USB-phy/20240412-152532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/IA1PR20MB4953EB2E2BF9D5F1EE30E2D4BB042%40IA1PR20MB4953.namprd20.prod.outlook.com
patch subject: [PATCH 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240421/202404211157.zejQ9FZ1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404211157.zejQ9FZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404211157.zejQ9FZ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/sophgo/phy-cv1800-usb.c:20:10: fatal error: soc/sophgo/cv1800-sysctl.h: No such file or directory
      20 | #include <soc/sophgo/cv1800-sysctl.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/phy/sophgo/phy-cv1800-usb.c

  > 20	#include <soc/sophgo/cv1800-sysctl.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
