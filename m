Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E528C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvFK2BkITykBx06wTKtvLW4lQ1rPIUx3EmWeoZv5R/A=; b=uxzJN50aPxDNcZ
	Qr0dDQPa67A4ffmrNIORtUy4ZfhpcoROfeu3n6zWrCkgM8Un3rYRT2LIgX0YgpF+/gHfdKFxaG4uf
	DOqJhQZ/hxyxpXvH4T33KZxCvYt36KL/plmZ0JDtdZasN7KKbH4YQ9aNiRpFuYia67MCbLakc3QXB
	Zo5kQpSR0pvEajmMvM50Z6t8D2ZC8E9QV/oUMVJRVAnU4QlQU+cIw9H1rloAxLO0bnHfBAwGk8oDn
	qLkHEBEEAEBkYhHZ7Bu8T8Tbf/rDMNI+f44+/6eZdYVVA+zsEZLNdxs5ta5FyL0F6xDwFcUxgSd52
	yBkNeDN/oZ35+LdmPpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6szp-00000004a84-25fW;
	Mon, 21 Apr 2025 15:23:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6szm-00000004a7a-0zxq
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 15:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745249022; x=1776785022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vJPOq/jtYR3O8m4x/saV7Lfzl0TMxKs1hSTnn1MH0/Q=;
  b=Jwhn61oaupwEm0PwOqAOtgzVyd94Z+JjTPdtc5FS0WlBDiWQvh7Nsa2o
   IqXRh7to2dZejrahxPR5TZsvPKWqxAPrYT5gZWgiZxwxnwhYZ+zXXtAB2
   nwVKf0bVS1QmeFAj7pCJ9tbituu0oQYTRHd2zVpyj7MONXSdPRHlP32DD
   /ib2/mIEIzrpc0IhOMtV3Zp/woP45GM8yohpNwRBIkZ6nUu/R+s1VPAMN
   k2YxwAnLJf0nSWMocmrqUeksDbo8cqLalzfDUclf4k6nA0kodlu2WtXUD
   KcXz4EJbsJuZCqrnfeEfvJrMlBdhycVu2NldUgQw35nCSHHfCunJX+cgW
   g==;
X-CSE-ConnectionGUID: wvMkeSU7QMqCF0wsh5IBvg==
X-CSE-MsgGUID: nGCKhgioTV6MowCkTx5y1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46018339"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="46018339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 08:23:39 -0700
X-CSE-ConnectionGUID: qYxPlAo5T1q0ooVmsIMlWQ==
X-CSE-MsgGUID: Spq369kLR+qDitQqo2fORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="136707842"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Apr 2025 08:23:35 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6szd-0000Bh-0Y;
	Mon, 21 Apr 2025 15:23:33 +0000
Date: Mon, 21 Apr 2025 23:23:12 +0800
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
Subject: Re: [PATCH v11 4/5] pwm: sifive: Fix rounding issues in apply and
 get_state functions
Message-ID: <202504212351.Aa9tPMsO-lkp@intel.com>
References: <20250421095521.1500427-5-nylon.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421095521.1500427-5-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_082342_326932_11132394 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Nylon,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc3 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-dts-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properties/20250421-174716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250421095521.1500427-5-nylon.chen%40sifive.com
patch subject: [PATCH v11 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
config: i386-buildonly-randconfig-003-20250421 (https://download.01.org/0day-ci/archive/20250421/202504212351.Aa9tPMsO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504212351.Aa9tPMsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504212351.Aa9tPMsO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
>> ERROR: modpost: "__udivdi3" [drivers/pwm/pwm-sifive.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
