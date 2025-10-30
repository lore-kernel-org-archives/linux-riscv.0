Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B43CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEPsHzOeHOLKgEiZqqub4Xt6s/NYK34GLpdztNP2ZCc=; b=CCG+ujbvcgjeFP
	w1ZTM109LOLOL2uH1FMJ9LetFmOQFg35XsF3xSndGSVncIGOXR3KeuRQpqov4BKXigQWWgAeZ5Cj8
	/2EkYxVsMN5BauKjYHqUyOMRiRhA9Sp80pKgDiYAGY0FN+LxY7tDxZ8ym+NV13otGkOTxSHC8FnGa
	56FhDckQkgjhnxyDULTbpxmxEw+LzLdxDgNE2m0EVFQzUbKXEaZg995RvDJl15fiJzL5iwtvK/slM
	CB3wjZRMheQqk/Z18Qg6fomwUlwqzs+oja32QfwQRwjoGdOqiuq+BTCwEcmyY3IM2LTJc5BQeAzvG
	H9PPFNx2kTL054z4tQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZXR-00000004rEK-0R7x;
	Thu, 30 Oct 2025 20:46:29 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZXO-00000004rDX-3JwM
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761857187; x=1793393187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IzHEHcAJbzakFfy2ATpib9g8Ap3+ty+ERc7BngoXid4=;
  b=GylLjDwrCN59J1N5m+1QNhCsyElH8F1hTbm3VWdx6MMWaItn7EYCULsM
   Go51+j029j//EXPsoB1GJaAb3ZMQDWgIgEtLAplqdLgLU9pSTamaH+4Pw
   BfwwWjWK8CFQNVVt/sz4wdzgar8RqFDG2p969vMznmlCEz3H1UGDz8Fx8
   TmmB7rXGW/wMlO5xZ6RWVedXTc3nUJBFg7NB/XTnGyVCAVQW3hPbvA1vA
   cSBJNliVvCYJ5nPEDTK4OEdDL2EgCg1SoMQD5W1xibIz90N4Ct+WH32Xs
   T9QK0j5zcOFRG2/FMfPdvk//8c1SWiDBaTLOv4hScQQgrdBLbOUhhVwVJ
   A==;
X-CSE-ConnectionGUID: eysZm50oS52ldE+qkZjhJw==
X-CSE-MsgGUID: xLiH8aZRRDqHW0Rffq8Waw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75361171"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="75361171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 13:46:26 -0700
X-CSE-ConnectionGUID: ZOSCdisEQn6yO+A1JXJA3Q==
X-CSE-MsgGUID: CcBCWZKSSniJ0nEvu4L6Yw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2025 13:46:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEZWs-000MVc-24;
	Thu, 30 Oct 2025 20:46:03 +0000
Date: Fri, 31 Oct 2025 04:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	linux-spi@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <202510310407.ooVqGn3P-lkp@intel.com>
References: <20251027125504.297033-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_134626_863326_E1A483FD 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-spi-add-SpacemiT-K1-SPI-support/20251027-211246
base:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
patch link:    https://lore.kernel.org/r/20251027125504.297033-3-elder%40riscstar.com
patch subject: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller driver
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251031/202510310407.ooVqGn3P-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310407.ooVqGn3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310407.ooVqGn3P-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/spi/spi-spacemit-k1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
