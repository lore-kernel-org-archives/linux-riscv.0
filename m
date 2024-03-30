Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E7C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8RaetW4KaAJXrmrioPVvLNeqM5EoMh03fnHcwY86rk=; b=IbEO6KT+9uK3fM
	fraBk9sjL1EtSf3Pl+a3wDv5ZaUKTXkE9W6RZoTEI5fpDMZQ0WSY+ftPqwVb/HfCh6e/kKfy+wxOh
	MVGTw9nPxEsD0+XASk6JZQZFPk/EoI9Gm/idYDk6OKTp4E/Nw+/P9nxPzfCvG7jijJORmMq7Z/aa/
	+/PDVwhyrs+pwV8GgzWaRyd5cpjcgURKBhv3CuLmG5FfnXfS65BlTYVzPCgb88vsGnSY2XgNswa7i
	fTYZ+1zNpff3g/e2OSTBs1lhDnJu6kp4N/QNEZfSUynTeH9ZzBOLR/Ha/xRmd0KQG1fqEn11+FkMp
	Y2+8SPCS3ZRdsWmKUbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqYNw-00000003W3z-0aBX;
	Sat, 30 Mar 2024 13:04:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqXM8-00000003Plj-02ap
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 11:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711799920; x=1743335920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynfTQ/GVycFwNXOPFSe6F0brkpnNBWsKnsVlyJvCxJE=;
  b=UKar91PZVZIq5k7D6ap157ddn5eJ/Iuv1CbS/B/9CB/PL36gQRhu/kmS
   T2ChEDjK770xmyzgjnsSbhipKSdJtRuusqyfkk+EPIhpT696Q8NVJTE43
   XU8po+OFqO/1VgY8k7+NKNcMMaVgFeuyOmiPEYCR5mh0K6pZc3HOmiyPa
   JEXjZtNrz9F0y7Rb7L5LJtlJ9xInQsZK1PyNRBcOvZ025t6mwE3EgepCY
   YIBNW57IEbYu5b9NAND7bKPgD3smEHQJyORwKH+MpSHmi8idaNw3+HvcV
   xV4AbIDkDn3EcZ/m3XWAvjOQSiJCJJe/O23X2BcSkfxTag/gNzavoShF+
   A==;
X-CSE-ConnectionGUID: 9lftOUBERWmkaf+RcL4wlw==
X-CSE-MsgGUID: TgDpUxH/Q5Gat1IcRaPQFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="18120532"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="18120532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 04:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17292158"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2024 04:58:30 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqXLv-0004EM-2E;
	Sat, 30 Mar 2024 11:58:27 +0000
Date: Sat, 30 Mar 2024 19:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: wefu@redhat.com, jszhang@kernel.org, guoren@kernel.org,
	conor@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, jic23@kernel.org,
	lars@metafoo.de, andriy.shevchenko@linux.intel.com,
	nuno.sa@analog.com, marcelo.schmitt@analog.com,
	bigunclemax@gmail.com, marius.cristea@microchip.com,
	fr0st61te@gmail.com, okan.sahin@analog.com,
	marcus.folkesson@gmail.com, schnelle@linux.ibm.com, lee@kernel.org,
	mike.looijmans@topic.nl
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, Wei Fu <wefu@redhat.com>
Subject: Re: [PATCH 3/3] dt-bindings: adc: Document XuanTie TH1520 ADC
Message-ID: <202403301900.9wSnTE6y-lkp@intel.com>
References: <20240329200241.4122000-4-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329200241.4122000-4-wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_045840_153146_7A76D876 
X-CRM114-Status: GOOD (  10.03  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wefu-redhat-com/drivers-iio-adc-Add-XuanTie-TH1520-ADC-driver/20240330-041029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240329200241.4122000-4-wefu%40redhat.com
patch subject: [PATCH 3/3] dt-bindings: adc: Document XuanTie TH1520 ADC
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240330/202403301900.9wSnTE6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301900.9wSnTE6y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml:45:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml:45:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml: ignoring, error parsing file

vim +45 Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml

    41	
    42	examples:
    43	  - |
    44	    adc: adc@0xfffff51000 {
  > 45		compatible = "thead,th1520-adc";

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
