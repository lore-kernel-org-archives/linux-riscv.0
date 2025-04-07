Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C36C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHRT/fYX9Eg7wR2SgidZ+J7c38jAXEwetMvhUNS/mWo=; b=wA1F3veI28uN6B
	TbJSDhpvw9grPDkFR9pXn24EfccT2xH7Is1yfOdOQZkPX3Mr33uQ8OG5VnfcOgMzAAZa1y3pFFAz2
	RMQ/RVLJIt7kisWsJvupJfuj4YoGm8ULbkCp06lr5i7sUS+vxfEBUWrwYI27dZbmzPmaud0lSKIce
	dwwbnZZcOQV5zgxxXLB1XVSKdfZUyruj+D0YX2Fxgc+PG3oFNxes0cVAyNaaPMrr5mFWdb7t1QYhR
	VZW2P2h2ZRFao+u/MmQRlKFgEjecp/1+XLbiEz5kXyAsvfr6rz3ikPhEqoGPfgK+Wg+wO7/ko3415
	BU4SnW3vz7Yb3K5Gvsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pMV-00000001D6I-48Hx;
	Mon, 07 Apr 2025 16:30:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oR6-00000000y9c-3A8p
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 15:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039856; x=1775575856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtlccTfM9VZZD5m8j+ndF1OOWgDstqM5TbodR3i3Obw=;
  b=i7ZCVa4mTjTWVUxCW+84KqUBuU777BhmQvvnDJJG0edSUBHcd8WR+IaE
   wF+MxNq6gTgBGypGBsLMgUDoYLeGtoqGqaHrpvRdMOQ2CKINx45mT+E6g
   Y7obvFT4cAh1K68NRFkQcBJvVUSx+yfgWbjMBf5zeJLxEKW6vyXNViDPh
   VC827S9TUn1QVkQX9Gbh1OFyf2HNUT0uAJ6GYXjSG2QNb2cXiZovAhLSN
   Mx+8LEMZQgMjGMU10iXoxWka+5FDszlzI0fPOWWclApX/Xf6D1Tkq2bKK
   WOM18pVaCS1aFs33u9IvwZPSmXIoebmx223Qp6Yua1JpIcqck2amvd1ws
   Q==;
X-CSE-ConnectionGUID: /97NxsChQSiZgyj5ZXiODQ==
X-CSE-MsgGUID: IE8W3CFCQsWi0qLn2b7iCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62980317"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62980317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:56 -0700
X-CSE-ConnectionGUID: OyF2CGuLQrO3ZJ0HpvmNeQ==
X-CSE-MsgGUID: oCBZlUSSSnKQsmNOxl09Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127869350"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2025 08:30:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1oR0-0003Wh-0P;
	Mon, 07 Apr 2025 15:30:50 +0000
Date: Mon, 7 Apr 2025 23:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Longbin Li <looong.bin@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, ghost <2990955050@qq.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for SG2044
Message-ID: <202504072300.KCXJcmJK-lkp@intel.com>
References: <20250407072056.8629-3-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407072056.8629-3-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_083056_803138_BA106F9E 
X-CRM114-Status: GOOD (  12.13  )
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

Hi Longbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-dt/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250407]
[cannot apply to robh/for-next sophgo/for-next sophgo/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Longbin-Li/dt-bindings-pwm-sophgo-add-pwm-controller-for-SG2044/20250407-153334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20250407072056.8629-3-looong.bin%40gmail.com
patch subject: [PATCH 2/2] pwm: sophgo: add driver for SG2044
config: arm-randconfig-003-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072300.KCXJcmJK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072300.KCXJcmJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072300.KCXJcmJK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-sophgo-sg2042.c:57: warning: Function parameter or struct member 'lock' not described in 'sg2042_pwm_ddata'


vim +57 drivers/pwm/pwm-sophgo-sg2042.c

    47	
    48	/**
    49	 * struct sg2042_pwm_ddata - private driver data
    50	 * @base:		base address of mapped PWM registers
    51	 * @clk_rate_hz:	rate of base clock in HZ
    52	 */
    53	struct sg2042_pwm_ddata {
    54		void __iomem *base;
    55		unsigned long clk_rate_hz;
    56		struct mutex lock;
  > 57	};
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
