Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51E5C71135
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnJv8Wjmw06AD9NqE/I6xZPGmoWcUPP1V+wC1s+uQhA=; b=w9IPKUMaW8pIxf
	F73EyHoTbG+IaYhl7+PLuUBeVnoYLb9BDfwcubm67sR6xsmeLRN3q7UZkuhmI2VoFegQ5T8HHlaaL
	zNLcNg0LCg4TzJQmCORSJsjM5o3JnK/paqyZv25Dx1MHkOOa46QiN3L1i825cCc48ZVR2ioKIPM+m
	A8aGgWxvrsNst7vs2+Yq6u0i3biM4ukFkCfzDY4vOFDTonolyWgHMZcb8GJUriS4deMBUJqYsIzxr
	enGYYyL3OgPzVgtPdBIenz3YiqRmPfHxzhLQ8nrVmh6DAk0lCnyG9za5UJvqX8fy3FPojVtm0EUBi
	nyiShBmAsj0oFKlGdsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY0Q-0000000C146-0AQt;
	Thu, 12 Jun 2025 02:49:30 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWYt-0000000Brxd-481q
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 01:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749691020; x=1781227020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9cQWUCePEsft2HV53xBGF7MysPCcHtpQG4kJkhSeY4s=;
  b=iL8TFPfAahgRUg6OWaHKOWERLk36uYkU7CjZLzQz9XsHhEUn1m+oEoUE
   UPnbEvhJRl8h6S04OJXl+k9Zhq5GIE32bZKJqtusGAnWDZkd+JuAd3NYm
   wErHI8YpUIFJ0lVqJAj4QbZzopQ1OJ1gs43uRa2NYQ5UOHd/YbBHfAgI8
   6HNfIzSYXfofKmKd8eUYsEM5CECbLaN5zVizrtSlVavnDx09E8xPumpuQ
   wcsJZMEIlYl46c7v2/kjxJ30g9fRAea+3HxkcdOT36WyNFGkeFVsivfeN
   CFhfgLGLdo8Lup5QK6dUTJwpzia6fdFuxkTB9QVlpshOhBN8wrQ3jT4NC
   w==;
X-CSE-ConnectionGUID: jFUDGvBiSYWe+lNnu4ISbA==
X-CSE-MsgGUID: oD/RHcpRRTSojLN+kSRCnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55656378"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="55656378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 18:16:56 -0700
X-CSE-ConnectionGUID: uEnlmiMNStCycJ50+9Yvkw==
X-CSE-MsgGUID: FzzCKf4qSVitjP+8e/YByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="152135888"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2025 18:16:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPWYj-000AyI-0v;
	Thu, 12 Jun 2025 01:16:49 +0000
Date: Thu, 12 Jun 2025 09:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Hu <nick.hu@sifive.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nick Hu <nick.hu@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 3/3] cpuidle: Add SiFive power provider
Message-ID: <202506120817.nRfhoHbQ-lkp@intel.com>
References: <20250611031023.28769-4-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611031023.28769-4-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_181700_061129_C36F1032 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge robh/for-next linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Hu/cpuidle-riscv-sbi-Work-with-the-external-pmdomain-driver/20250611-121115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250611031023.28769-4-nick.hu%40sifive.com
patch subject: [PATCH v2 3/3] cpuidle: Add SiFive power provider
config: riscv-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120817.nRfhoHbQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120817.nRfhoHbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120817.nRfhoHbQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cpuidle/cpuidle-sifive-dmc-pd.c:8:
   In file included from include/linux/of_device.h:5:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3975 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> drivers/cpuidle/cpuidle-sifive-dmc-pd.c:42:27: error: use of undeclared identifier 'pm_domain_cpu_gov'
      42 |         ret = pm_genpd_init(pd, &pm_domain_cpu_gov, false);
         |                                  ^
   1 warning and 1 error generated.
--
   In file included from drivers/cpuidle/cpuidle-riscv-sbi.c:16:
   In file included from include/linux/cpu_cooling.h:17:
   In file included from include/linux/thermal.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3975 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> drivers/cpuidle/cpuidle-riscv-sbi.c:410:25: error: use of undeclared identifier 'pm_domain_cpu_gov'
     410 |         pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
         |                                ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=n] && OF [=y]
   Selected by [y]:
   - SIFIVE_DMC_PD_CPUIDLE [=y] && CPU_IDLE [=y] && RISCV [=y] && ARCH_SIFIVE [=y]


vim +/pm_domain_cpu_gov +42 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

    26	
    27	static int sifive_dmc_probe(struct platform_device *pdev)
    28	{
    29		struct device *dev = &pdev->dev;
    30		struct device_node *np = dev->of_node;
    31		struct generic_pm_domain *pd;
    32		struct of_phandle_args child, parent;
    33		int ret = -ENOMEM;
    34	
    35		pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
    36		if (!pd)
    37			goto fail;
    38	
    39		pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
    40		pd->power_off = sbi_cpuidle_pd_power_off;
    41	
  > 42		ret = pm_genpd_init(pd, &pm_domain_cpu_gov, false);
    43		if (ret)
    44			goto free_pd;
    45	
    46		ret = of_genpd_add_provider_simple(np, pd);
    47		if (ret)
    48			goto remove_pd;
    49	
    50		if (of_parse_phandle_with_args(np, "power-domains",
    51					       "#power-domain-cells", 0,
    52					       &parent) == 0) {
    53			child.np = np;
    54			child.args_count = 0;
    55	
    56			if (of_genpd_add_subdomain(&parent, &child))
    57				pr_warn("%pOF failed to add subdomain: %pOF\n",
    58					parent.np, child.np);
    59			else
    60				pr_debug("%pOF has a child subdomain: %pOF.\n",
    61					 parent.np, child.np);
    62		}
    63	
    64		platform_set_drvdata(pdev, pd);
    65		pm_runtime_enable(dev);
    66		pr_info("%s create success\n", pd->name);
    67		return 0;
    68	
    69	remove_pd:
    70		pm_genpd_remove(pd);
    71	free_pd:
    72		dt_idle_pd_free(pd);
    73	fail:
    74		pr_info("%s create fail\n", pd->name);
    75	
    76		return ret;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
