Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B2C6FD18
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Apr 2023 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDTyEVBNx0M1dSw8cDuy1fxcKXDCqXFISGG3OxjlLzU=; b=OywjhA1FiHZQOc
	18PsLIoMN4rluhjOuBYBj9XUuimMOTQGjHDG+BjYbaJjWL1cyIXYJQiJ2wFHu+EDaqMKhm0CDrUiZ
	uofb0PcvJJHhumB7p35hJLlg7ol48fIFSFvVg8oFteLmd4pi8uwyoVTHrQB0ODokocB7FCtgRhql1
	jaJYmNGZLuO9aSecl2Rj/SFDt/jQB+yxpUqtRcXjXJJbyg5Zb5zp6KFKwM4XnqHKxyw3f8x36XMdr
	g/j7G49L/YkAZB3axg5vgmxWl62RUiV9j79ybFLqf1mVr/cUBDp4WEIxQZfyQTv793ZN7RIs+MhGt
	fFnCxAtLp1coVr54KPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqDCY-00CwTC-2I;
	Sat, 22 Apr 2023 13:22:54 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqDCV-00CwSS-2W
	for linux-riscv@lists.infradead.org;
	Sat, 22 Apr 2023 13:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682169771; x=1713705771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4hmqW8jviqLT2Gn4j6xIteHxG2TJ3+3ga9V3vfgYALA=;
  b=NXNBqs/AlzNgPOtxONo0i2jbjSfz1m/yBPaiMJA8gSxNwRwCqvIcdNxt
   ym3EXHkadL4dtfZQ3rVqcy8cKuLgWtWSiBYBdEk7JtM2nUevVCc7CR6rI
   GgJelgF+C927tZuqVJ3sINhyMlEX3jvfd+KyEQAWOCnJRkP970lLNpqhg
   hvfFuItGP4hkibIEgOrArJLOJDN66ZFlfULkYbkv3ScJV0MoE9CjGs468
   gKW9li2+EdWVZ38u+Z/LMo6bdZSRTIvc1Jo8zxVQtqZAfOmumRIlfzqUD
   /fAhsBS8/Eic/vSPqCFlqZg/P/sspgqnMt0XPAmh/kZC0Z5JR5AR6Qqda
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325753884"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325753884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="938787159"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="938787159"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 06:22:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqDCO-000hJw-2F;
	Sat, 22 Apr 2023 13:22:44 +0000
Date: Sat, 22 Apr 2023 21:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nylon Chen <nylon.chen@sifive.com>, aou@eecs.berkeley.edu,
	conor@kernel.org, emil.renner.berthing@canonical.com,
	geert+renesas@glider.be, heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, nylon.chen@sifive.com,
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED
 algorithm
Message-ID: <202304222135.B9PoQ5w3-lkp@intel.com>
References: <20230420093457.18936-3-nylon.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420093457.18936-3-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_062251_837023_0207EC5A 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Nylon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on thierry-reding-pwm/for-next rockchip/for-next linus/master v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-dts-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properties/20230420-173619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230420093457.18936-3-nylon.chen%40sifive.com
patch subject: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
config: sparc64-randconfig-s031-20230421 (https://download.01.org/0day-ci/archive/20230422/202304222135.B9PoQ5w3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f2d706bf61190a45a8f90f1f455bc943d4ac7b6e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nylon-Chen/riscv-dts-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properties/20230420-173619
        git checkout f2d706bf61190a45a8f90f1f455bc943d4ac7b6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222135.B9PoQ5w3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-sifive.c:157:18: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/pwm/pwm-sifive.c:157:18: sparse:    unsigned long long const *
>> drivers/pwm/pwm-sifive.c:157:18: sparse:    unsigned int *

vim +157 drivers/pwm/pwm-sifive.c

   129	
   130	static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   131				    const struct pwm_state *state)
   132	{
   133		struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
   134		struct pwm_state cur_state;
   135		unsigned int duty_cycle, period;
   136		unsigned long long num;
   137		bool enabled;
   138		int ret = 0;
   139		u32 frac;
   140	
   141		if (state->polarity != PWM_POLARITY_NORMAL && state->polarity != PWM_POLARITY_INVERSED)
   142			return -EINVAL;
   143	
   144		cur_state = pwm->state;
   145		enabled = cur_state.enabled;
   146	
   147		duty_cycle = state->duty_cycle;
   148		if (!state->enabled)
   149			duty_cycle = 0;
   150	
   151		/*
   152		 * The problem of output producing mixed setting as mentioned at top,
   153		 * occurs here. To minimize the window for this problem, we are
   154		 * calculating the register values first and then writing them
   155		 * consecutively
   156		 */
 > 157		period = max(state->period, ddata->approx_period);
   158		num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
   159		frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
   160		frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
   161		/* The hardware cannot generate a 100% duty cycle */
   162		frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
   163	
   164	
   165		mutex_lock(&ddata->lock);
   166		if (state->period != ddata->approx_period) {
   167			/*
   168			 * Don't let a 2nd user change the period underneath the 1st user.
   169			 * However if ddate->approx_period == 0 this is the first time we set
   170			 * any period, so let whoever gets here first set the period so other
   171			 * users who agree on the period won't fail.
   172			 */
   173			if (ddata->user_count != 1 && ddata->approx_period) {
   174				mutex_unlock(&ddata->lock);
   175				return -EBUSY;
   176			}
   177			ddata->approx_period = state->period;
   178			pwm_sifive_update_clock(ddata, clk_get_rate(ddata->clk));
   179		}
   180		mutex_unlock(&ddata->lock);
   181	
   182		/*
   183		 * If the PWM is enabled the clk is already on. So only enable it
   184		 * conditionally to have it on exactly once afterwards independent of
   185		 * the PWM state.
   186		 */
   187		if (!enabled) {
   188			ret = clk_enable(ddata->clk);
   189			if (ret) {
   190				dev_err(ddata->chip.dev, "Enable clk failed\n");
   191				return ret;
   192			}
   193		}
   194	
   195		writel(frac, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
   196	
   197		if (!state->enabled)
   198			clk_disable(ddata->clk);
   199	
   200		return 0;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
