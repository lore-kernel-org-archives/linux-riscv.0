Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC06C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLQjmVOSqMeadLLPMT9Jvzq/OH+uvCcUbZxv6tIg0dk=; b=RtobMO/Z3w+PPq
	M1SlakHF1yxgXP/JL+7OHxPxRnoKLUU+ge6FviyjA/4P7nwqjVxPVESnMcckjcl+v1FxLO3EaNpaN
	diQy0NCPQxndqIVGYPguhEKcUzQCztNHvdRgleTeGFNRFzifvOiIj01NL4Hxlwd78uCDHk+ft8ah3
	tZxfvd1O7wnrtSYmYiXoKUwKEo6kuf4q3e0az6XLuMLrPLNsuBPjUZtThf+hrl4pPhCoDT9QU8/Vw
	jNAUbqddw+P/qx+4mD5YxAZPJ3w6qFkgmj1G4U4TH9bJgLMpwKxDBN5z4wv5xw0fLKnG2oDw40F30
	GeNKaK5K3MTdKt4/T38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6TUh-00000002WXh-3kbj;
	Sun, 20 Apr 2025 12:09:55 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6TUe-00000002WVr-3eJf
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 12:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745150993; x=1776686993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NFlaEuLIw0Zajlp8jpqXN2CskXo/XnjXuoyqH9AEvhw=;
  b=bJPLZBDs0VykoZvJVmaAUHhQRSM3vYXSb7oH3N8DUz+K+PnZZZwqJQQE
   kpLE5B8gqEYgo3nvcgJt3TivLvy4rXEyMeOFrfnXNCiRrDwr4Vt4xjGrB
   wKg24F+B0DrI79xHlFi4qP/s4EF/w6YzxkEuDkNm+QCKLI3u9zQL8Mjrw
   8ND9tdMQMdQUhzCn96zGtxsaLu07z7Hqlo2nTg9RrpZk1w1n1XiBSR1iK
   NCWDneqEcZ02EyAhGt1tSeppwZPy0QOyMgud479zF72YMAOS5VrQmMmRV
   574aX1jW+EaIjinFhKNyZw62yAKscXWsRVLgLEEURG6d9Y5ctQEvwQsvh
   A==;
X-CSE-ConnectionGUID: jNCTknj7QEe1Chkiyv6Pvg==
X-CSE-MsgGUID: DVcomn28Qx2wK3KHr7XFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72095989"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72095989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 05:09:45 -0700
X-CSE-ConnectionGUID: QUR9/X0LQLKchS+BDV4HsQ==
X-CSE-MsgGUID: SUTGsSbdSOu5YWkRvUIDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="135582954"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2025 05:09:39 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6TUP-0004cL-0v;
	Sun, 20 Apr 2025 12:09:37 +0000
Date: Sun, 20 Apr 2025 20:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com,
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
	tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, guodong@riscstar.com
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
Message-ID: <202504201920.P8LBocr2-lkp@intel.com>
References: <20250420070251.378950-4-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420070251.378950-4-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_050952_920423_28C0403F 
X-CRM114-Status: UNSURE (   9.85  )
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

Hi Guodong,

kernel test robot noticed the following build errors:

[auto build test ERROR on spacemit/for-next]
[also build test ERROR on spacemit/fixes robh/for-next linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-pwm-marvell-pxa-pwm-Add-SpacemiT-K1-PWM-support/20250420-150635
base:   https://github.com/spacemit-com/linux for-next
patch link:    https://lore.kernel.org/r/20250420070251.378950-4-guodong%40riscstar.com
patch subject: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
config: riscv-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201920.P8LBocr2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201920.P8LBocr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201920.P8LBocr2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/spacemit/k1.dtsi:532.27-28 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
