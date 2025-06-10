Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791DC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 05:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIAEFlQR6+gHJRzhFpPztD+/lNdu2z6VQNoFP0rnoWo=; b=WjeozgNtwDS/Aj
	Cg80EcQazA/SjedDyZm9DdLeX4JJzsEe8KGKnmh5lPxRyws9/pBk2uH54VLHiDa3sMF4rCn3bqCZX
	+3to9KGT+X6yEgDtrTufSXKnVP+brj+FjhUf8HHd2hUjbExC+a+7aQ/ZBKX6e7ptaJDdWM1wgdwda
	VJ1EOpA2zgDOEz9fSezwb/uGBIddctimWCeOOUa3iWCQyNtBZOfPOTK84dygdAmHo6XP6r1WI5509
	X/yl9xtIlC4wjp7Mxrf5922r621PxqXG6p4bOJO4TB8zPcR5WeS9riw3lo9UGlPJLFsI02oyL42VR
	Zxi08T4D30lMaEDKc9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrKa-00000005p8K-3h37;
	Tue, 10 Jun 2025 05:15:28 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrKY-00000005p7x-0P6m
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 05:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749532526; x=1781068526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwx1RGlswAft6HtyBTWGHwM1xvSwaWadQVlRSN2NE4k=;
  b=UDAKVw0MteH4xz1yfvGIkdJ99nSh5wPfb1NJKgQYxASFj2CLleV1GGUs
   /yF0MlKTw+hBoLgUFKBdZNFnpJ4ImjuCaPlrz4Xt92s9tRheiQie2fD3I
   YuaRLm/Mxw+vXYJEPsOY7M9A3Pfybnv7nM4sd5QMOybdtbYPwtrBNlChm
   CU78oRSbVtb05SLYwnnHha28Xk59OO5/Q/0iiyHSxLVdJLn902s0E9Zmz
   entzeR9eqjy3NlzhoXlCa5IXYUwgUvLPYYSqbo/YfrW2xQ3+usnVEpaMj
   2kyZJnR1r6Ipd7B3Awvy01YQYJxmpCHP9UIBx9ttfDmYxavIo9fOolhh4
   A==;
X-CSE-ConnectionGUID: 4YgozUiRRi6SQnCEC+ASNQ==
X-CSE-MsgGUID: QB4KBpJ9TP2Genh/+Cq7uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55431716"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55431716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:15:25 -0700
X-CSE-ConnectionGUID: GoXFIom2SbCGSvZIugHs+A==
X-CSE-MsgGUID: 3dgGJazITluB05ndUhbYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147076646"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jun 2025 22:15:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOrKQ-0007nV-2j;
	Tue, 10 Jun 2025 05:15:18 +0000
Date: Tue, 10 Jun 2025 13:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
 CV1800B SoC
Message-ID: <202506101252.4HRoLbL7-lkp@intel.com>
References: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_221526_177315_A03D44B2 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8630c59e99363c4b655788fd01134aef9bcd9264]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-remoteproc-Add-C906L-rproc-for-Sophgo-CV1800B-SoC/20250608-104249
base:   8630c59e99363c4b655788fd01134aef9bcd9264
patch link:    https://lore.kernel.org/r/20250608-cv1800-rproc-v1-2-57cf66cdf6a3%40pigmoral.tech
patch subject: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC
config: nios2-randconfig-r132-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101252.4HRoLbL7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506101252.4HRoLbL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101252.4HRoLbL7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse:     expected void *va
   drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse:     expected void [noderef] __iomem *addr
   drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse:     got void *va

vim +41 drivers/remoteproc/sophgo_cv1800b_c906l.c

    35	
    36	static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
    37					   struct rproc_mem_entry *mem)
    38	{
    39		void *va;
    40	
  > 41		va = ioremap_wc(mem->dma, mem->len);
    42		if (IS_ERR_OR_NULL(va))
    43			return -ENOMEM;
    44	
    45		/* Update memory entry va */
    46		mem->va = va;
    47	
    48		return 0;
    49	}
    50	
    51	static int cv1800b_c906l_mem_release(struct rproc *rproc,
    52					     struct rproc_mem_entry *mem)
    53	{
  > 54		iounmap(mem->va);
    55	
    56		return 0;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
