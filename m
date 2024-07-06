Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192D0C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 05:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ao6LeGMqDHA6BZdWkYWw/6p0ZZG97kHlH6NmNFGZgKA=; b=d1l2PPq+GiIa4o
	y8EywkTwBPZJIt9iQXR4oIFhER2+URRVWBIH0kc/X4KcZAu4smOY7FkBjgRbaJpGWGuzGq5FpZfNB
	Urmjv0p72RlhBg+MhsKBdt63DOay5ovTo3Y3p5sO+pQfjjXQrZoxSDJIyH077ZcuX2RCN6QGFVMNo
	ScgpO8+lZ6WfrXKAUVf4JTwWGONhrbi1AxE6hILYbktzjSwbDR+FiQIT1OUKUAaYN5yzK0TrkMEdB
	oElzpfrjAFW6jCuet5N1z/AfVcGhMYi4DemEYmL8DEKisXVmZt+TiZVoWxxlgOzSP/4GtjnH3bppz
	Q2hqF3V2FTckDXaD2RGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPxnm-0000000HLuj-17E1;
	Sat, 06 Jul 2024 05:17:38 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPxni-0000000HLuF-3H52
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 05:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720243055; x=1751779055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RFvdfc5SP26/erCYWy3Bh1P2+7EZnv+hwzsSCZjL4tM=;
  b=RFHuf7wA9WCRc+M8aNB2t8sGGiEq5aAC8X4wL0gV/1zGCLGVe0FB+s5I
   OpD00rM5Lz0rhKQmYHbLc9lc/rUkdQldrFZm8taWXzILVhAXqPPLTtP6e
   nf+n49GXgg04fuhEXN9l2AeOnuURheK/Hl1ZrpR8AZBhWC8Fh5/XHySjE
   rWV4w3XsrG/HBZ+ZZ15n9pD/MOujY2Pe0hYQdYl9fxSoDUIP7gF7iafmI
   PFobA6o46pijOyubfb+8pfi35o9pM5782s24yiSnnRu4zAHMubEiGea1n
   53Yyy+DWSDAR/vrgiT+w6H/4/sWjiw0oTmWR4MU8jiZExG7zpks4jKHtk
   Q==;
X-CSE-ConnectionGUID: CbwIUeaAT9GH/QLhbBuQyw==
X-CSE-MsgGUID: Gbop9NXMRu6mT6yf1QkfyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28192544"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="28192544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 22:17:32 -0700
X-CSE-ConnectionGUID: YVCQsgiNSwWQjpuk1p5tAw==
X-CSE-MsgGUID: CZdNPP4XSZaL+D5Sv3OlhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="51626836"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2024 22:17:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPxnZ-000TLE-11;
	Sat, 06 Jul 2024 05:17:25 +0000
Date: Sat, 6 Jul 2024 13:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 SARADC
Message-ID: <202407061311.ZEmwMY8m-lkp@intel.com>
References: <20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_221735_039309_FEA112A8 
X-CRM114-Status: GOOD (  10.70  )
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d20f6b3d747c36889b7ce75ee369182af3decb6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-adc-sophgo-cv18xx-saradc-yaml-Add-Sophgo-SARADC-binding-documentation/20240706-040736
base:   d20f6b3d747c36889b7ce75ee369182af3decb6b
patch link:    https://lore.kernel.org/r/20240705-sg2002-adc-v2-2-83428c20a9b2%40bootlin.com
patch subject: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo SARADC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240706/202407061311.ZEmwMY8m-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061311.ZEmwMY8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061311.ZEmwMY8m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/sophgo-cv18xx-adc.c:85:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      85 |                 struct cv18xx_adc *saradc = iio_priv(indio_dev);
         |                 ^
   1 warning generated.


vim +85 drivers/iio/adc/sophgo-cv18xx-adc.c

    78	
    79	static int cv18xx_adc_read_raw(struct iio_dev *indio_dev,
    80					  struct iio_chan_spec const *chan,
    81					  int *val, int *val2, long mask)
    82	{
    83		switch (mask) {
    84		case IIO_CHAN_INFO_RAW:
  > 85			struct cv18xx_adc *saradc = iio_priv(indio_dev);
    86			u32 sample;
    87			int ret;
    88	
    89			scoped_guard(mutex, &saradc->lock) {
    90				cv18xx_adc_start_measurement(saradc, chan->scan_index);
    91				ret = cv18xx_adc_wait(saradc);
    92				if (ret < 0)
    93					return ret;
    94	
    95				sample = readl(saradc->regs + CV18XX_ADC_CH_RESULT_REG(chan->scan_index));
    96			}
    97			if (!(sample & CV18XX_ADC_CH_VALID))
    98				return -ENODATA;
    99	
   100			*val = sample & CV18XX_ADC_CH_RESULT;
   101			return IIO_VAL_INT;
   102		case IIO_CHAN_INFO_SCALE:
   103			*val = 3300;
   104			*val2 = 12;
   105			return IIO_VAL_FRACTIONAL_LOG2;
   106		default:
   107			return -EINVAL;
   108		}
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
