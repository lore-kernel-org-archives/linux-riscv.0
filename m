Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7BEC71135
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/ur7Sh1D9H+8x8kQlMR6uHbXuAFhL6Raz4iAbhXpbE=; b=rvus2eN3CI9xMI
	0nM7BuRcDgYE2jolEDLnPf+nYrX0L/6nY74atNINo3EKdIJWAY4LD36eXXtSE5kzyE8WV3EIA4I/K
	mAVrz/SggrIt+aQqmmb8yHZFdYqv9vP2ipVZJw4xcARZQDB+Y8Rd0RpsneYsryCTcL/FBA+ayWD/H
	YABLjka2KFmhgozDsooVOuVNInbhtcaVzSul0+Vz7AQi+ErYFpenjm0uWcUBLmrxQMZKDLn/eiC5n
	eilJiNcKf9uYAC1lqKj7fe8jDo6URYHy765owTgLn+h6hD73W2lT0W7FLX9W1OKbeF+CjIemuBNs+
	cSqSSbKC5OdBrZl5m4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXuH-0000000BzVp-3EFa;
	Thu, 12 Jun 2025 02:43:09 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUbj-0000000BeEP-224S
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 23:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749683507; x=1781219507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xi7Bn8Dl4dzWWpiOeR/DTKrcXEYcYeIJC7prsjMVDnk=;
  b=amqskxSgFrAK8QciV75rlxxLNkkx6CzpclI7JGWhnsWKMUKV6V/vDfwM
   oQG3DcBtIkmIkIHk03vWryA9OWdBdp03JP2n5nHayFTc98oXA4570WI/G
   LKWa7lVhHpfw/MiXIMbYgK9vIpspyAFMV3THUZRThfBUEPDRCBi+4gzEU
   HUTq9T7bJqN6CZREX66CewUqN/He4ZnunWoQ1h5bRuBg7O107egaKtPdS
   HTbd+c2JVCdC7ji/Xwdmdkb2t8y62Ll0fLhFA3e9U5mStlkhx6W7Ik1W2
   Z8J5yx8kgA/hrg6fqGsAdzfAMxbQBsUWlNc68weVwwvn7qM/rIO7C2h38
   w==;
X-CSE-ConnectionGUID: y3mljnonR9y1JBNrvSjj7w==
X-CSE-MsgGUID: 1ed7NKw1SKW7evMuam1Iog==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51063175"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51063175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 16:11:47 -0700
X-CSE-ConnectionGUID: WCKpKM7NRfePmN8CCfTQuw==
X-CSE-MsgGUID: jVTruJE9RbKw+bqDvkvdzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="178245955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2025 16:11:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPUbc-000Av4-1y;
	Wed, 11 Jun 2025 23:11:40 +0000
Date: Thu, 12 Jun 2025 07:11:17 +0800
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
Message-ID: <202506120735.Ek7I6Nze-lkp@intel.com>
References: <20250611031023.28769-4-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611031023.28769-4-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_161147_537390_957AEE57 
X-CRM114-Status: UNSURE (   9.56  )
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
config: riscv-kismet-CONFIG_RISCV_SBI_CPUIDLE-CONFIG_SIFIVE_DMC_PD_CPUIDLE-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120735.Ek7I6Nze-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120735.Ek7I6Nze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120735.Ek7I6Nze-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE when selected by SIFIVE_DMC_PD_CPUIDLE
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=n] && OF [=y]
     Selected by [y]:
     - SIFIVE_DMC_PD_CPUIDLE [=y] && CPU_IDLE [=y] && RISCV [=y] && ARCH_SIFIVE [=y]
   
   WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
     Depends on [n]: CPU_IDLE [=y] && RISCV [=y] && RISCV_SBI [=n]
     Selected by [y]:
     - SIFIVE_DMC_PD_CPUIDLE [=y] && CPU_IDLE [=y] && RISCV [=y] && ARCH_SIFIVE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
