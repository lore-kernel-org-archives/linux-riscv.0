Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34EC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWttCC7yQzY/JuIHAkA0IpV3AWM89dOv735ZtE7zHVQ=; b=qOwbeGeyBzQpnT
	b4wNqk10EoGIAwBTwZ6/EHELt2sQeuCul7nNAycLvMsvUE76J5db/Fw3Z+BAh0Pzm3SsvPutWvYrX
	Y/J0alxKdyz5Uf+1DqgLYZ0shJFAAVkU5WpMWknpVo8sttToRk9IY7JNf0elaVtqtLW0091RN4aBc
	BHFaVr176cYcFf2Cngr9fq9gtZ8AUpkLBmtfa8UzFuyT7Nm89V0882/GDfbF/cRjl/5bHzKlvjDSR
	piyhc13TpMEOV8obw4Lh2D/hFm440EnPxUF/elNtWfj9Lt5nqsqMDlTpt3qtKpVTVd0QGdPcaRxO1
	lq0in/em/QxIJNkh4dSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiFn-0000000GbFo-3yhK;
	Tue, 29 Jul 2025 11:12:19 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiFl-0000000GbFQ-2imW
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 11:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753787538; x=1785323538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/J0BHd+fuqkNFinG3p1UvN7xRkDJF3VXrbJKKrrPA8=;
  b=PmDkST1cHGXEKrK9smJKTyXSV4DEOlhkzUxT0JnHYBmZ8YXMwp+vst/w
   HVUEBTNaGqhI2YBOgBSaB7zWPAPkXRM4PqwU2CTb68+t3LaBTNhPaVLWH
   Fg+6yrgTnK9D9fymeHTPvFmUBQBLTcBS1HlUSfg82hbPICIRm6Hs0spZL
   V4tO4D7A2uyJqTA/6qoiEQ5tFUiy4X49TSr92kSJL44jxXC04PTf2J0nE
   V23VjLHf8b0FT3ISX7p5daKzgiqyZShRECVaQRemm+r9b0mhBdhH+sKcP
   VrLt9JK7g+tYu/L0/Bt6VuUutzQgn9X9wNkWDJB1rbbNw5qERK20gEuSj
   A==;
X-CSE-ConnectionGUID: 2nT+Tu7fROy4smw3Z+XuOg==
X-CSE-MsgGUID: goPSmPf7RGOf4XjRYtRdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58677114"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="58677114"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:12:13 -0700
X-CSE-ConnectionGUID: 9h1TUjEISHO75Q1oFt4DCg==
X-CSE-MsgGUID: 7H97cNIyQnStcprWNIE7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163451637"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 04:12:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugiFa-0001Dv-2z;
	Tue, 29 Jul 2025 11:12:06 +0000
Date: Tue, 29 Jul 2025 19:11:34 +0800
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
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for
 Sophgo CV1800B SoC
Message-ID: <202507291829.aB1UgzrA-lkp@intel.com>
References: <20250728-cv1800-rproc-v2-2-5bbee4abe9dc@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-cv1800-rproc-v2-2-5bbee4abe9dc@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_041217_698680_4583F62A 
X-CRM114-Status: UNSURE (   9.80  )
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

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-remoteproc-Add-C906L-rproc-for-Sophgo-CV1800B-SoC/20250728-190847
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250728-cv1800-rproc-v2-2-5bbee4abe9dc%40pigmoral.tech
patch subject: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC
config: parisc-randconfig-r123-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291829.aB1UgzrA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250729/202507291829.aB1UgzrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291829.aB1UgzrA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:47:20: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +47 drivers/remoteproc/sophgo_cv1800b_c906l.c

    36	
    37	static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
    38					   struct rproc_mem_entry *mem)
    39	{
    40		void __iomem *va;
    41	
    42		va = ioremap_wc(mem->dma, mem->len);
    43		if (!va)
    44			return -ENOMEM;
    45	
    46		/* Update memory entry va */
  > 47		mem->va = (void *)va;
    48	
    49		return 0;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
