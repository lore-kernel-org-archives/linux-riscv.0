Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6539C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7tNKRoWChuLWb9Of3LLMqmOHPZUkw7GzSGzKDxt6y0=; b=Vft8Et0E5MphlU
	7zhGSrhNOMw66ut51Pg9xTgvAgqWeQOthQHgzPrUJi24RgkiJxfdbgM2ggogaW36XPVjojVdvG2fj
	UF9G9OxzPpCJXO8AmQWhn+WxBTq7UF6oxeugoMjExW2w86UFzYVZCt0eETvDJxqiBb6srsCuWvVqE
	Pib/m8Z3xLAuEmPAwgmq56tHen3lwPwj7r3dLVqAspzt4n9ya27uXNKdXQno6zvw/Uo93KGAZswc9
	V5B9fi4XPR1OJuUlrgRldS/dCTzx7qpz9at9dfNMMOM2LCUvALd2e+7zA1RwZaZHmMrtqnjtGfkpv
	FdWAM+y7OOIDrdfeoboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prEIp-000a79-1l;
	Tue, 25 Apr 2023 08:45:35 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prEIm-000a6k-32
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 08:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682412332; x=1713948332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FsXK0pVsiKRVSRpZSn2/rIa4Ll3HrIxEMFe6k8mBodE=;
  b=kEd9D8MxBMZI7xym7uyCC0dpxpv6eMp3PjLUGwUWJjATrKkq11A48ht6
   KwZugd0Gj0Aii8NpyorkJE3Ae3OfXGFGHKsdrpTL8g2coi7Bwp3kipqiX
   3TMrznr1060+PPguCB0GLMAI1mTSzOEBBgbD74n1TWq+qARcRp0jBiSMb
   9G69NUFPjydysxBfATfeF5kZVAJSxhyEZAHpOJc/YeYHpEfhjIksQUA7W
   OwJsWAGis48WaQgLf2T8dRBabwiJV8EcQQlY5U5b+CZfvTJkzEzx1s++p
   mxRN8Zi59RLvTujn4HkCNU2plYYzxNSs75EQdlKDsXnseicaOdK2TGZxA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409642941"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409642941"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693415315"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="693415315"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 01:45:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prEIg-000jEJ-2E;
	Tue, 25 Apr 2023 08:45:26 +0000
Date: Tue, 25 Apr 2023 16:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, heiko@sntech.de, kito.cheng@sifive.com,
	jrtc27@jrtc27.com, conor.dooley@microchip.com,
	matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
	greentime.hu@sifive.com, nick.knight@sifive.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	richard.henderson@linaro.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/4] RISC-V: create ISA string separately - not as part
 of cpuinfo
Message-ID: <202304251640.IVxoyd0v-lkp@intel.com>
References: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_014533_028404_19D2AF55 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230424]
[also build test WARNING on v6.3]
[cannot apply to soc/for-next linus/master kees/for-next/execve v6.3 v6.3-rc7 v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
base:   next-20230424
patch link:    https://lore.kernel.org/r/20230424194911.264850-2-heiko.stuebner%40vrull.eu
patch subject: [PATCH 1/4] RISC-V: create ISA string separately - not as part of cpuinfo
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230425/202304251640.IVxoyd0v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
        git checkout 8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251640.IVxoyd0v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/cpu.c: In function 'riscv_create_isa_string':
>> arch/riscv/kernel/cpu.c:269:25: warning: 'strncat' output may be truncated copying 1 byte from a string of length 13 [-Wstringop-truncation]
     269 |                         strncat(isa_str, &base_riscv_exts[i], 1);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncat +269 arch/riscv/kernel/cpu.c

   246	
   247	static char *riscv_create_isa_string(const char *isa)
   248	{
   249		int maxlen = 4;
   250		char *isa_str;
   251		int i;
   252	
   253		/* calculate the needed string length */
   254		for (i = 0; i < sizeof(base_riscv_exts); i++)
   255			if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
   256				maxlen++;
   257		maxlen += strlen_isa_ext();
   258	
   259		isa_str = kzalloc(maxlen, GFP_KERNEL);
   260		if (!isa_str)
   261			return ERR_PTR(-ENOMEM);
   262	
   263		/* Print the rv[64/32] part */
   264		strncat(isa_str, isa, 4);
   265	
   266		for (i = 0; i < sizeof(base_riscv_exts); i++) {
   267			if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
   268				/* Print only enabled the base ISA extensions */
 > 269				strncat(isa_str, &base_riscv_exts[i], 1);
   270		}
   271	
   272		strcat_isa_ext(isa_str);
   273	
   274		return isa_str;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
