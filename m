Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91687C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txwMsnCK0Vk+fx/Dg9xaFucYDzGd8DIvViWq96hC+BQ=; b=LY5OZhbGaK76kU
	6lPcaoHFlvjnAHRTSy20c611dQd66k+td7iS2jb0FlLR8TtBdhICnjDZ8Ol1jTT4fOM+4J2tDI/UP
	eWl1f5z+QOreC9lVBSANcSmnr+z/j1JBBSsfjy5wkuP9iJ+y5M44LY4vxLx17YSWv6OOveVJmYnCD
	Gyhr3W+FnYPBLlvkBMl+ugCgB8cMA1IkxkL/td9gKdj4EJj/BYgwAYFTyQWYrHRmolvUo8gBrdSfR
	E9KRh5RLR2cyxsVSKAeLaiqqUtn8oVUmdt+XcRo05eIXlF1KC+oIjNHEbZETAolLUBMnPWF6w7fuG
	sEhl1dUIA47WY1MXeWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUX6-0000000BczO-34bd;
	Wed, 11 Jun 2025 23:07:00 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTdf-0000000BR96-3CHo
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 22:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749679784; x=1781215784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q3xX2X7h9he/dUJnCnbpHt/NgJ+2yrK0a9aojccAvFc=;
  b=ZSeQH8yxhX3kEZz7KH8MqBPYkMOFWROstp8UVCUlfBdUVRbtDJ7yq7GL
   9l6Q6f+U8SzjBHzZHJOh2xF8MqRj0Xv2PtrJnMkOLmC1MpOtqZbRtjjTN
   ZWOgDST3jsIWNlFCAuFN72MX+avvyV6AdpHbY5BK1bqMkoEpb7hD9ATPI
   NQythFgcY2wpEWjYoEl8AKwpfIBt5IZtAHvNCfrCn/pYm0I8YaUKqZeK/
   BjvyqngdgYIsp8bGGEnC5SMYQI3mrF7oL/JAgd42WoFAj8smk8Y+4YNXK
   BuB7B7yWjn0076g6x4IryTIjjldExrEvlTiy7O7xJWl74xuAtaCWa1gg3
   Q==;
X-CSE-ConnectionGUID: G50Si0MZQO24mXcI7Yb0uQ==
X-CSE-MsgGUID: gGiLs7jIS2+P0WAxYAYBvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51707294"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51707294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 15:09:41 -0700
X-CSE-ConnectionGUID: IpgnycrbQlKXGyi3trCu0w==
X-CSE-MsgGUID: W1gk8/exQIulUE0QautbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147220983"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2025 15:09:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPTdX-000AtS-2b;
	Wed, 11 Jun 2025 22:09:35 +0000
Date: Thu, 12 Jun 2025 06:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Hu <nick.hu@sifive.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Nick Hu <nick.hu@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 3/3] cpuidle: Add SiFive power provider
Message-ID: <202506120535.f1iULf9O-lkp@intel.com>
References: <20250611031023.28769-4-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611031023.28769-4-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_150943_844178_84C6C19D 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge robh/for-next linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Hu/cpuidle-riscv-sbi-Work-with-the-external-pmdomain-driver/20250611-121115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250611031023.28769-4-nick.hu%40sifive.com
patch subject: [PATCH v2 3/3] cpuidle: Add SiFive power provider
config: riscv-kismet-CONFIG_PM_GENERIC_DOMAINS_OF-CONFIG_SIFIVE_DMC_PD_CPUIDLE-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120535.f1iULf9O-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120535.f1iULf9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120535.f1iULf9O-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by SIFIVE_DMC_PD_CPUIDLE
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=n] && OF [=y]
     Selected by [y]:
     - SIFIVE_DMC_PD_CPUIDLE [=y] && CPU_IDLE [=y] && RISCV [=y] && ARCH_SIFIVE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
