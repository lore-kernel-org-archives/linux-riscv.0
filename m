Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BDCE748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POEiH72BgBv8E/zmFQJOwVvDqsakumKqCr6vOE+Kkic=; b=cjSO9Y/8rATVHE
	0nNn3fVIgdXdjHlebQVlI5gw3loBZDR8A/TjI0hIaAbUbbE8fngmywmDIxiKITGcy/eYbhIC1l8YS
	iP8laJJfUAv7u9kkUlNHIC6NCc0QZtH7pL2+iUz7MiCQq8VmwTN9I2QIW1VkFKjJjzfphbPAZfO+6
	tS9w+0jKm/LlqGiGDXKrFG0efOdm7qrxLpqeSCRylfxh/ukYt6u6EIzi/oirAuHzZAy/RCRKiJaI7
	qpTVwxxLmFdk79dIWrFNZTVyOWcwyYMcmVtmrUD8ne5BDIkNnOpk54NvJ9NxCsfp2sW4KS936Leg+
	PE4O1/MLzt+7TOwkPRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmyzh-00BNaH-32;
	Sun, 01 Oct 2023 16:08:33 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmyze-00BNWf-0G;
	Sun, 01 Oct 2023 16:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696176510; x=1727712510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ttbpa5CPZtUl/EL5mFBC+uzL/iLNKmwUeDvQROsDv6k=;
  b=UlV4eEsOv5ABiS2Jj7vNeaq3MNTTr0sTS3s9Djny3s1iM42zUgOXdcIE
   YWy/UtNr3g0DrvC5n5suTYVr/5Eqr/vHfNpgIIdniXWikfNQ/srYBVU8l
   opRec+vVf7Bm/3A0+g0QLFQ2XA/VVyF2kuLCJsCgInwB3NIlMwnrxO+jG
   unn2c+wfJ70nE/RAD/BL9/FzQ19fjF/tEbgv7UmIar0FrxTIU8pdDzQh1
   jbfBduNAdBPckVz6LAyulV5endcGsEWthekN4cOAzmfuu9GRutPZK7vbs
   aj5wJmeBBNGtuR/XmNR5xXqEftRu1XYGRXBdMgtqnTes0FpLoYIFIuyqu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="382445440"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="382445440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 09:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="785576469"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="785576469"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Oct 2023 09:08:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmyzP-0005Cf-2Z;
	Sun, 01 Oct 2023 16:08:15 +0000
Date: Mon, 2 Oct 2023 00:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Young <sean@mess.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <202310012348.puyNjoMk-lkp@intel.com>
References: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_090830_163390_DD395A54 
X-CRM114-Status: GOOD (  14.70  )
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

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on thierry-reding-pwm/for-next]
[also build test ERROR on shawnguo/for-next atorgue-stm32/stm32-next media-tree/master linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Young/media-pwm-ir-tx-trigger-edges-from-hrtimer-interrupt-context/20231001-194056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
patch link:    https://lore.kernel.org/r/1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean%40mess.org
patch subject: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic context
config: i386-buildonly-randconfig-004-20231001 (https://download.01.org/0day-ci/archive/20231001/202310012348.puyNjoMk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310012348.puyNjoMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310012348.puyNjoMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/percpu.h:27:0,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/backlight.h:12,
                    from drivers/video/fbdev/ssd1307fb.c:8:
   include/linux/pwm.h: In function 'pwm_apply_state':
   include/linux/pwm.h:428:17: error: implicit declaration of function 'pwm_can_sleep'; did you mean 'gpiod_cansleep'? [-Werror=implicit-function-declaration]
     might_sleep_if(pwm_can_sleep(pwm));
                    ^
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
    #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                          ^~~~
   In file included from drivers/video/fbdev/ssd1307fb.c:16:0:
   include/linux/pwm.h: At top level:
>> include/linux/pwm.h:455:20: error: conflicting types for 'pwm_can_sleep'
    static inline bool pwm_can_sleep(struct pwm_device *pwm)
                       ^~~~~~~~~~~~~
   In file included from arch/x86/include/asm/percpu.h:27:0,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/backlight.h:12,
                    from drivers/video/fbdev/ssd1307fb.c:8:
   include/linux/pwm.h:428:17: note: previous implicit declaration of 'pwm_can_sleep' was here
     might_sleep_if(pwm_can_sleep(pwm));
                    ^
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
    #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                          ^~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/percpu.h:27:0,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/mfd/intel_soc_pmic_crc.c:11:
   include/linux/pwm.h: In function 'pwm_apply_state':
   include/linux/pwm.h:428:17: error: implicit declaration of function 'pwm_can_sleep'; did you mean 'cant_sleep'? [-Werror=implicit-function-declaration]
     might_sleep_if(pwm_can_sleep(pwm));
                    ^
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
    #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                          ^~~~
   In file included from drivers/mfd/intel_soc_pmic_crc.c:18:0:
   include/linux/pwm.h: At top level:
>> include/linux/pwm.h:455:20: error: conflicting types for 'pwm_can_sleep'
    static inline bool pwm_can_sleep(struct pwm_device *pwm)
                       ^~~~~~~~~~~~~
   In file included from arch/x86/include/asm/percpu.h:27:0,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/mfd/intel_soc_pmic_crc.c:11:
   include/linux/pwm.h:428:17: note: previous implicit declaration of 'pwm_can_sleep' was here
     might_sleep_if(pwm_can_sleep(pwm));
                    ^
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
    #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                          ^~~~
   cc1: some warnings being treated as errors


vim +/pwm_can_sleep +455 include/linux/pwm.h

   454	
 > 455	static inline bool pwm_can_sleep(struct pwm_device *pwm)
   456	{
   457		return true;
   458	}
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
