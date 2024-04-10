Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D92CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avsfAOU9C735HRyCu/63K2w24lbj4lY6zV3uSKGvjyQ=; b=o9irHkFgzJB1vu
	6XopLCeEoOpjdEgN4SkP12NuJcT2JfHVrPdk017FhNZg5Mb4WX5ncFL9XzrIR+DA+jc6CV1UVxdSc
	b0Xrd8+UrCxJOpI17ZhZNRROghMyBowffWLPPdxPqFt6ThsBsf9osbaA2AtN1W4jiidgxuc1yQlii
	NEAkmnyYlXTx3WEeVQ76peolpha9qYmgdGQlz29q2XbTvaoS3CTkbQ9V8VvYIE8MDJZPqbtkIJKE+
	uNCfDJgHBDXHUuuNhsP86tdpmRUMS7ScOhROLrc4UUPEzWI4yYpEXD2ju4+y6PPrllX2/ChXnNrrc
	LOhqLMA1hxrCGCpsdAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRND-00000005NDA-1NRS;
	Wed, 10 Apr 2024 06:23:55 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRN8-00000005NB2-1iNq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712730230; x=1744266230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CrqbmIXc8hcwOYEXXRkcAJ1s6Ei9utAjsjiuOZBrYVk=;
  b=Idi/7YMc7UJfqKZ5iOQv2SLVHhwtmsvOb0H3JBKpRw12JLFuF1e8NaWs
   APXDzX5RUOs392l+amPq3I3HFjkaztEw/BclNjl7365UTI9xi4FEJ9w/1
   e0KCEbBEbj/nVbftQKMlhACRaFHAf6P5Vr2ae9b13lojvrOG6COuRjHv0
   2ZwsxsiwuvArqkNnN5dGMEtUDd5ZCxWCbYhBl1phJklVZ7qUEt3I5XMm6
   xG5CwCZJ0HrigaDknVfReaIwXLLLBlgspEA95A5URGluTpz135kxbVL0O
   iC4KZ+DiLmOfqtEdbqi1GJ4i6W477d4bnv0j/ZW4L6rWFmdWsac6JeoKB
   Q==;
X-CSE-ConnectionGUID: YilTUwKGQJqHFHYZXyeMvQ==
X-CSE-MsgGUID: G8NEdUSJRvCzorPCggJEhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11864700"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11864700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:23:50 -0700
X-CSE-ConnectionGUID: HDtH6VViTZiBlgivADDNxQ==
X-CSE-MsgGUID: f4IleIp6Qzu/2LKbUep5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="24932405"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Apr 2024 23:23:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruRMz-0006zq-2C;
	Wed, 10 Apr 2024 06:23:41 +0000
Date: Wed, 10 Apr 2024 14:23:05 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: Re: [PATCH 2/3] riscv: dts: thead: Add XuanTie TH1520 ADC device node
Message-ID: <202404101407.KnrqaGoC-lkp@intel.com>
References: <20240329200241.4122000-3-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329200241.4122000-3-wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_232350_665743_57242FA2 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linus/master v6.9-rc3 next-20240409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wefu-redhat-com/drivers-iio-adc-Add-XuanTie-TH1520-ADC-driver/20240330-041029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240329200241.4122000-3-wefu%40redhat.com
patch subject: [PATCH 2/3] riscv: dts: thead: Add XuanTie TH1520 ADC device node
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404101407.KnrqaGoC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101407.KnrqaGoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101407.KnrqaGoC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
