Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998AAC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgK4U4TJGYtY7HSkMqasK6Zm9Q54T4KVx52PxPOzbrQ=; b=vW9CM+x4DK73XA
	W/kspp2u5Z8KDA4B83gQTRnhIepFKJX+7JNvbeAjdO/qg5D1fKWIqmHLYdZaFOSxSNGnJACe/Qknx
	RNGilA5N1tqLFeu8CcTVDsBMsRHsM17KrOrRaAREOVK+vnDpCRxIGbC1iPqgIz7woyjGq7bADiq6K
	T/cJiX83UkBj9GVaoOgVC0SkIOPYa5pkRiBUCRqtuQjfj0Y5nqPJsyazz7R4ULKV+PBD1ApPSGwQl
	SI5u5Y20u3YGKxDJhyiodW98XJfKvZxIRi0imKjjxLZNS4TjOqgD5NKPs7XYMLvOe7Ex3WJ7T4u1x
	fcReXwEuF55nvONNZDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxTz-0007Gc-2B;
	Mon, 08 May 2023 09:48:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxTx-0007GC-07
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 09:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683539316; x=1715075316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cWmWF6uKtJ7K13p4GwcrX3bQ+qpYDfz2qJtqq6XorVs=;
  b=CNzmFOq5H7T4+T+kitMHlF1Zawz/ynAoqMHzQcQ+HXLEUQOvvdBkQTGL
   mUQ5jGQ4pGtJO4IZgMLYnmZKS8LVpYrxdBo/l+uM+Wq6jQmNUurHYa1E/
   KVW6jcbe3+N3/Yz9xC+kRCDq0M4aCOePBvlBU0rJob/2IT9e00Oop1Q0k
   jPs0VckbpscQY3jwDzM8WSbTFafF8cTGPY6ZFmswY7uV8COGLxB58APok
   qEeYVjRGmPs0m2njKHTcmvi5dn0rSJDUq/xc4eDO9Gl+Tjn3rX1jGxJPu
   peRpe5/nrW+JxlbGf+jte44Ajf9gsXhCDKhvJ1XHi8FKvLkmchIh10BUM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415163173"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415163173"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="788035025"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="788035025"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 02:48:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvxTp-0001An-1l;
	Mon, 08 May 2023 09:48:29 +0000
Date: Mon, 8 May 2023 17:48:29 +0800
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
Message-ID: <202305081759.wgN4Q80I-lkp@intel.com>
References: <20230420093457.18936-3-nylon.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420093457.18936-3-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_024837_145370_65F34696 
X-CRM114-Status: GOOD (  16.16  )
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
[also build test WARNING on thierry-reding-pwm/for-next rockchip/for-next linus/master v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-dts-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properties/20230420-173619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230420093457.18936-3-nylon.chen%40sifive.com
patch subject: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
config: powerpc-randconfig-s041-20230507 (https://download.01.org/0day-ci/archive/20230508/202305081759.wgN4Q80I-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081759.wgN4Q80I-lkp@intel.com/

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
