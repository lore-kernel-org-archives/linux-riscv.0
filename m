Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C96C04A6A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBgA5my/tuUJAL9Z2GS8Z9tpuWK607uGPFhaKK+a0Hw=; b=i4qoIh8SVmULJU
	HEj7rvXuv7S9IReZ9hHRsidOC8monU+BxT7Y1KLszVV5JW7jPwERabC3n+d4wWFt4fhGR5ZIbVzSg
	MpIuk/QZjc05FBbv4ti0ZHiOvtYjdXM2gCeGYvoMd8PKrTjgzEILSFUVZoBV8eGU0y2mCPsLNP4wT
	nCWH1dvHiNJgDDHjCz2B1CKkFyXw4yNp3O8AwcW7VB3y9HBzbqeyVnL6NZ3xl/ZJ9if4fkgP4UDiQ
	46gNj6DcC4mhKT3hxfP7prfCve0eVcYosCjfJRciI3WkzHozXsEYBZ9501hvxHMcmtQtsrKMT5u2p
	aYLH9x49Nzz2DhRZcv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUpso-00DaBf-2t;
	Sat, 12 Aug 2023 14:46:26 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUpsl-00DaAy-2O;
	Sat, 12 Aug 2023 14:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691851583; x=1723387583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCfr+Nz7HHzCOXY0udKVpPrS0ljXtJL5gnyuyd57AMw=;
  b=QkyPZsvqhXMY0kiE0g2V7vyCHLlduItHQ40EA+LJYoDDhK9JrmobXxNy
   /AHbbePd61zRpwGZqMJwcYGN7Uzwzsh0jGGtP1Rvu8aRlkei1KCKvofF+
   4o8T16jcP9qBFttiRE8hp4OByjr6Q32ob4NDpB3FxPOiqVv4sokzOGOTY
   FADN/cfmFC/3SHy6lj0L7IgiQXoAy76AYQ31qbhk7lz/+MYRhdVsHRI4R
   +C7qtwrnPcUHG/yVg1X2Cjsgb2HyNPcPqdP4QApBSs2mkJL2gedvr18Zq
   2uPhC+UTQpcad2Tt7LTbstCOKNpi8Koqr0mV/zcFW3MK1soKasTSX7N6k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="370731530"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="370731530"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 07:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="979503000"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="979503000"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2023 07:46:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUpsd-0008d2-1y;
	Sat, 12 Aug 2023 14:46:15 +0000
Date: Sat, 12 Aug 2023 22:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
Message-ID: <202308122212.SOHP09RP-lkp@intel.com>
References: <20230810145443.1053387-3-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810145443.1053387-3-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_074623_814898_2582F9BB 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aleksandr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on thierry-reding-pwm/for-next]
[also build test WARNING on sunxi/sunxi/for-next robh/for-next linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandr-Shubin/dt-bindings-pwm-Add-binding-for-Allwinner-D1-T113-S3-R329-PWM-controller/20230810-225849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
patch link:    https://lore.kernel.org/r/20230810145443.1053387-3-privatesub2%40gmail.com
patch subject: [PATCH v4 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308122212.SOHP09RP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122212.SOHP09RP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122212.SOHP09RP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pwm/pwm-sun20i.c: In function 'sun20i_pwm_apply':
>> drivers/pwm/pwm-sun20i.c:121:48: warning: unused variable 'tmp' [-Wunused-variable]
     121 |         u64 bus_rate, hosc_rate, clk_div, val, tmp;
         |                                                ^~~


vim +/tmp +121 drivers/pwm/pwm-sun20i.c

   115	
   116	static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   117				    const struct pwm_state *state)
   118	{
   119		struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
   120		u32 clk_gate, clk_cfg, pwm_en, ctl, period;
 > 121		u64 bus_rate, hosc_rate, clk_div, val, tmp;
   122		u32 prescaler, div_m;
   123		bool use_bus_clk;
   124		int ret = 0;
   125	
   126		mutex_lock(&sun20i_chip->mutex);
   127	
   128		pwm_en = sun20i_pwm_readl(sun20i_chip, PWM_ENABLE);
   129	
   130		if (state->enabled != pwm->state.enabled)
   131			clk_gate = sun20i_pwm_readl(sun20i_chip, PWM_CLK_GATE);
   132	
   133		if (state->enabled != pwm->state.enabled && !state->enabled) {
   134			clk_gate &= ~PWM_CLK_GATE_GATING(pwm->hwpwm);
   135			pwm_en &= ~PWM_ENABLE_EN(pwm->hwpwm);
   136			sun20i_pwm_writel(sun20i_chip, pwm_en, PWM_ENABLE);
   137			sun20i_pwm_writel(sun20i_chip, clk_gate, PWM_CLK_GATE);
   138		}
   139	
   140		if (state->polarity != pwm->state.polarity ||
   141		    state->duty_cycle != pwm->state.duty_cycle ||
   142		    state->period != pwm->state.period) {
   143			ctl = sun20i_pwm_readl(sun20i_chip, PWM_CTL(pwm->hwpwm));
   144			clk_cfg = sun20i_pwm_readl(sun20i_chip, PWM_CLK_CFG(pwm->hwpwm));
   145			hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
   146			bus_rate = clk_get_rate(sun20i_chip->clk_bus);
   147			if (pwm_en & PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
   148				/* if the neighbor channel is enable, check period only */
   149				use_bus_clk = FIELD_GET(PWM_CLK_CFG_SRC, clk_cfg) != 0;
   150				val = state->period * (use_bus_clk ? bus_rate : hosc_rate);
   151				do_div(val, NSEC_PER_SEC);
   152	
   153				div_m = FIELD_GET(PWM_CLK_CFG_DIV_M, clk_cfg);
   154			} else {
   155				/* check period and select clock source */
   156				use_bus_clk = false;
   157				val = state->period * hosc_rate;
   158				do_div(val, NSEC_PER_SEC);
   159				if (val <= 1) {
   160					use_bus_clk = true;
   161					val = state->period * bus_rate;
   162					do_div(val, NSEC_PER_SEC);
   163					if (val <= 1) {
   164						ret = -EINVAL;
   165						goto unlock_mutex;
   166					}
   167				}
   168				div_m = fls(DIV_ROUND_DOWN_ULL(val, PWM_MAGIC));
   169				if (div_m >= 9) {
   170					ret = -EINVAL;
   171					goto unlock_mutex;
   172				}
   173	
   174				/* set up the CLK_DIV_M and clock CLK_SRC */
   175				clk_cfg = FIELD_PREP(PWM_CLK_CFG_DIV_M, div_m);
   176				clk_cfg |= FIELD_PREP(PWM_CLK_CFG_SRC, use_bus_clk);
   177	
   178				sun20i_pwm_writel(sun20i_chip, clk_cfg, PWM_CLK_CFG(pwm->hwpwm));
   179			}
   180	
   181			/* calculate prescaler, PWM entire cycle */
   182			clk_div = val >> div_m;
   183			if (clk_div <= 65534) {
   184				prescaler = 0;
   185			} else {
   186				prescaler = DIV_ROUND_UP_ULL(clk_div - 65534, 65535);
   187				if (prescaler >= 256) {
   188					ret = -EINVAL;
   189					goto unlock_mutex;
   190				}
   191				do_div(clk_div, prescaler + 1);
   192			}
   193	
   194			period = FIELD_PREP(PWM_PERIOD_ENTIRE_CYCLE, clk_div);
   195	
   196			/* set duty cycle */
   197			val = state->duty_cycle * (use_bus_clk ? bus_rate : hosc_rate);
   198			do_div(val, NSEC_PER_SEC);
   199			clk_div = val >> div_m;
   200			do_div(clk_div, prescaler + 1);
   201	
   202			/*
   203			 * The formula of the output period and the duty-cycle for PWM are as follows.
   204			 * T period = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * (PPR0.PWM_ENTIRE_CYCLE + 1)
   205			 * T high-level = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * PPR0.PWM_ACT_CYCLE
   206			 * Duty-cycle = T high-level / T period
   207			 * In accordance with this formula, in order to set the duty-cycle to 100%,
   208			 * it is necessary that PWM_ACT_CYCLE >= PWM_ENTIRE_CYCLE + 1
   209			 */
   210			if (state->duty_cycle == state->period)
   211				clk_div++;
   212			period |= FIELD_PREP(PWM_PERIOD_ACT_CYCLE, clk_div);
   213			sun20i_pwm_writel(sun20i_chip, period, PWM_PERIOD(pwm->hwpwm));
   214	
   215			ctl = FIELD_PREP(PWM_CTL_PRESCAL_K, prescaler);
   216			if (state->polarity == PWM_POLARITY_NORMAL)
   217				ctl |= PWM_CTL_ACT_STA;
   218	
   219			sun20i_pwm_writel(sun20i_chip, ctl, PWM_CTL(pwm->hwpwm));
   220		}
   221	
   222		if (state->enabled != pwm->state.enabled && state->enabled) {
   223			clk_gate &= ~PWM_CLK_GATE_BYPASS(pwm->hwpwm);
   224			clk_gate |= PWM_CLK_GATE_GATING(pwm->hwpwm);
   225			pwm_en |= PWM_ENABLE_EN(pwm->hwpwm);
   226			sun20i_pwm_writel(sun20i_chip, pwm_en, PWM_ENABLE);
   227			sun20i_pwm_writel(sun20i_chip, clk_gate, PWM_CLK_GATE);
   228		}
   229	
   230	unlock_mutex:
   231		mutex_unlock(&sun20i_chip->mutex);
   232	
   233		return ret;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
