Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C151C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Du6xkuwfPdF8dzCXxyPNJtgx1LUKeGIm9l48RWkMJaY=; b=GE/i90CKrPhkRO
	JqhvuZG9H4zqZBAWb1bVxGP3paUbfX8svZZSjk/yUqfXo6rxK6YPgA4yL9ue4gYcx0uMLrz0ohaWk
	egg6LQLGKlm/bEKmpb6U3OQGsobAY48JZla6KuGi0h9bwKqPA1orPP9XXLW+IQLW9eOoZoF+rYLSg
	9An06dhFSmvoK5JrqJLt7BH+MVAx07KokxooaRGBLpzC+zu0PIxhT4C1nS6XJqPTzyiSdoWCPcZNK
	lVg8aHUZtbzS/UpJEoregSS3Z1p4O7tULPB8R2FI7rZZyzAn/IZvxnJEgJ38VgBen4tpLvlHVTnKF
	TR1/rPzBT5io6OnDcY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkNx-0000000GZLJ-0Rtp;
	Wed, 07 May 2025 19:24:53 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkNI-0000000GZIG-3lsB
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 19:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746645853; x=1778181853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k7TU0yCd41PZirj6SFO+AJ5zKgUUEUjKl0PjUEVrBsA=;
  b=Iw3lqW8/fgblzx8Mn/O/QS12ziL4h8PYZ8Mx7wmg/0jroorUWXwGUzPo
   SFTZ8YNOFsvqAAPcFDKmFTr8DmXuWLkEhwOojDfLGUq/iQ6UBPE9SQK5S
   F/cFEKkUMBcvWvATKaQx0DC9H2iq1udCZDmiY3f5X9SAw0KMMNbZXp4gl
   atmTXeDpIeYYHQYzzuatlJNZMA79DcSAypq2jjH1F8LVXflQJSU9PTIds
   0NEKUi6EgEcNiyLTr7fSdy9q/5hSd83SKQv5DXPGjhQyAHylU7ok8olwa
   9Ay7sSAzg5EykXGhq7EFbku81rOlr9DSO7XOV/asnnBG2S6TmR/HqkFOB
   A==;
X-CSE-ConnectionGUID: cJSaWDRVSXeNlgnD9XpPFw==
X-CSE-MsgGUID: 4PsVbTrjRbS1fmzT54Ieqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59795619"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="59795619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 12:24:07 -0700
X-CSE-ConnectionGUID: wNGSX0kmQeWclpeNzUJwIA==
X-CSE-MsgGUID: Fyu05ThLSzOn/rC/l8/nrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136448656"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2025 12:24:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCkN7-0008z9-1t;
	Wed, 07 May 2025 19:24:01 +0000
Date: Thu, 8 May 2025 03:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nylon Chen <nylon.chen@sifive.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v13 4/5] pwm: sifive: Fix rounding issues in apply and
 get_state functions
Message-ID: <202505080303.dBfU5YMS-lkp@intel.com>
References: <20250423090446.294846-5-nylon.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423090446.294846-5-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_122413_013395_09836E04 
X-CRM114-Status: GOOD (  17.08  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-dts-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properties/20250423-165906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250423090446.294846-5-nylon.chen%40sifive.com
patch subject: [PATCH v13 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505080303.dBfU5YMS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080303.dBfU5YMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080303.dBfU5YMS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-sifive.c:161:2: warning: comparison of distinct pointer types ('typeof ((frac)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     161 |         do_div(frac, state->period);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-sifive.c:161:2: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     161 |         do_div(frac, state->period);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/pwm/pwm-sifive.c:161:2: warning: shift count >= width of type [-Wshift-count-overflow]
     161 |         do_div(frac, state->period);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   2 warnings and 1 error generated.


vim +161 drivers/pwm/pwm-sifive.c

   131	
   132	static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   133				    const struct pwm_state *state)
   134	{
   135		struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
   136		struct pwm_state cur_state;
   137		unsigned int duty_cycle;
   138		unsigned long long num;
   139		bool enabled;
   140		int ret = 0;
   141		u32 frac, inactive;
   142	
   143		if (state->polarity != PWM_POLARITY_NORMAL)
   144			return -EINVAL;
   145	
   146		cur_state = pwm->state;
   147		enabled = cur_state.enabled;
   148	
   149		duty_cycle = state->duty_cycle;
   150		if (!state->enabled)
   151			duty_cycle = 0;
   152	
   153		/*
   154		 * The problem of output producing mixed setting as mentioned at top,
   155		 * occurs here. To minimize the window for this problem, we are
   156		 * calculating the register values first and then writing them
   157		 * consecutively
   158		 */
   159		num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
   160		frac = num;
 > 161		do_div(frac, state->period);
   162		/* The hardware cannot generate a 0% duty cycle */
   163		frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
   164		inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
   165	
   166		mutex_lock(&ddata->lock);
   167		if (state->period != ddata->approx_period) {
   168			/*
   169			 * Don't let a 2nd user change the period underneath the 1st user.
   170			 * However if ddate->approx_period == 0 this is the first time we set
   171			 * any period, so let whoever gets here first set the period so other
   172			 * users who agree on the period won't fail.
   173			 */
   174			if (ddata->user_count != 1 && ddata->approx_period) {
   175				mutex_unlock(&ddata->lock);
   176				return -EBUSY;
   177			}
   178			ddata->approx_period = state->period;
   179			pwm_sifive_update_clock(ddata, clk_get_rate(ddata->clk));
   180		}
   181		mutex_unlock(&ddata->lock);
   182	
   183		/*
   184		 * If the PWM is enabled the clk is already on. So only enable it
   185		 * conditionally to have it on exactly once afterwards independent of
   186		 * the PWM state.
   187		 */
   188		if (!enabled) {
   189			ret = clk_enable(ddata->clk);
   190			if (ret) {
   191				dev_err(pwmchip_parent(chip), "Enable clk failed\n");
   192				return ret;
   193			}
   194		}
   195	
   196		writel(inactive, ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
   197	
   198		if (!state->enabled)
   199			clk_disable(ddata->clk);
   200	
   201		return 0;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
