Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48732CA101A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDfeIQw+QsBGCj04XpGMjl+9mtGmxHdSLFkzr3U5aY0=; b=F42AOMrP8FKN9n
	l6pcOkD44IZqMJw/vQ2GIe/5mo6c2I/9T4FME1XAHa0ypIihRt13i7IGJTKT8MZLjTVzE9vyqa/QW
	pj0YZPmel1OrzcGVSlCbV5wSe23UlyQhDD0WddYDELwUpoNGzxK7sn3RzrdG6KdxXRG0a/Sy+Luw1
	Ap34bCmpMsiv8mQFfuBfbePa3e65heML++k4DuRckWn+hcvulG0ClyQNDBzpyUE7MzBOBsd0tQW3h
	McdFm+zdjfo8j8GuPa8TMv7atK5pl7/ppwsJysCBrQcdWuAIMoIPaUpG/NaI5j7n812s3URBdCj75
	F6/DNgD10dMDzdWn5mnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skCFX-00000008AVT-2OEz;
	Sat, 31 Aug 2024 00:45:55 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skCFU-00000008ASp-3Ca5
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 00:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725065153; x=1756601153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2q0EIE3WOnElSaZtNtUDPmT9aG++HAOSqsq5F8ycZo=;
  b=aMRUNt7HLf/GDZM1EiexaEkH/HQI4t3finNp25Eqv7zN3ho5kK4658TR
   8BV7Blx+u26NHi6tAX1eW3GIxBnzaidpveR1HfHt3VsvrrZCDAKFrDtLM
   uj27yYUmi07ERBPN/uSKMNFcb2g3OYvId7tiFNa3atzLrP3mVVNuy+PBQ
   NFdnNDzGLEbOR86sfktfLDQ9kqfCe69KBIivsW8m5wwqbyK+fHCoYZVeA
   BD6aLRrcHI01SLw9w28zL255srmFrmLZyKUW25ZnUDTneiqi+/BH60uoa
   ciGLbpGDVdpuNDD+RDxobS4bwtBQHGp1c2GyQ25xnLNMCaWp1zxgyEqoI
   A==;
X-CSE-ConnectionGUID: Lv0TbcNoRwa3AMQrHKYzwA==
X-CSE-MsgGUID: JTn2QK4QSkC2ll/6LdfyGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23892875"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="23892875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 17:45:47 -0700
X-CSE-ConnectionGUID: u/GJuGqQQlK5hrQMr3hglw==
X-CSE-MsgGUID: k697wz3HTuSYiLlEI6//FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68458817"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Aug 2024 17:45:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skCFJ-0002Fc-06;
	Sat, 31 Aug 2024 00:45:41 +0000
Date: Sat, 31 Aug 2024 08:45:16 +0800
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
Subject: Re: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 CV1800B SARADC
Message-ID: <202408310817.GT3TMpnv-lkp@intel.com>
References: <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_174552_995114_64C69D3E 
X-CRM114-Status: GOOD (  12.02  )
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

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-adc-sophgo-cv1800b-saradc-Add-Sophgo-CV1800B-SARADC/20240829-203431
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240829-sg2002-adc-v5-2-aacb381e869b%40bootlin.com
patch subject: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo CV1800B SARADC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240831/202408310817.GT3TMpnv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310817.GT3TMpnv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310817.GT3TMpnv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/sophgo-cv1800b-adc.c:120:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     120 |                 u32 status_reg = readl(saradc->regs + CV1800B_ADC_CYC_SET_REG);
         |                 ^
   1 warning generated.


vim +120 drivers/iio/adc/sophgo-cv1800b-adc.c

    88	
    89	static int cv1800b_adc_read_raw(struct iio_dev *indio_dev,
    90					struct iio_chan_spec const *chan,
    91					int *val, int *val2, long mask)
    92	{
    93		struct cv1800b_adc *saradc = iio_priv(indio_dev);
    94	
    95		switch (mask) {
    96		case IIO_CHAN_INFO_RAW:{
    97			u32 sample;
    98	
    99			scoped_guard(mutex, &saradc->lock) {
   100				int ret;
   101	
   102				cv1800b_adc_start_measurement(saradc, chan->scan_index);
   103				ret = cv1800b_adc_wait(saradc);
   104				if (ret < 0)
   105					return ret;
   106	
   107				sample = readl(saradc->regs + CV1800B_ADC_CH_RESULT_REG(chan->scan_index));
   108			}
   109			if (!(sample & CV1800B_ADC_CH_VALID))
   110				return -ENODATA;
   111	
   112			*val = sample & CV1800B_ADC_CH_RESULT;
   113			return IIO_VAL_INT;
   114			}
   115		case IIO_CHAN_INFO_SCALE:
   116			*val = 3300;
   117			*val2 = 12;
   118			return IIO_VAL_FRACTIONAL_LOG2;
   119		case IIO_CHAN_INFO_SAMP_FREQ:
 > 120			u32 status_reg = readl(saradc->regs + CV1800B_ADC_CYC_SET_REG);
   121			int clk_div = (1 + FIELD_GET(CV1800B_MASK_CLKDIV, status_reg));
   122			int freq = clk_get_rate(saradc->clk) / clk_div;
   123			int nb_startup_cycle = 1 + FIELD_GET(CV1800B_MASK_STARTUP_CYCLE, status_reg);
   124			int nb_sample_cycle = 1 + FIELD_GET(CV1800B_MASK_SAMPLE_WINDOW, status_reg);
   125			int nb_compare_cycle = 1 + FIELD_GET(CV1800B_MASK_COMPARE_CYCLE, status_reg);
   126	
   127			*val = freq / (nb_startup_cycle + nb_sample_cycle + nb_compare_cycle);
   128			return IIO_VAL_INT;
   129		default:
   130			return -EINVAL;
   131		}
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
