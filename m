Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A1ECA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCDLzVPYVbMTiD/WINNvhAJwU3GsXq1q3jiXHZ6kvUg=; b=fNjXGwtVm/9wUJ
	tY4YudFkrWi4dRryvZmRAiIJGh5iNugKFM7XFg6WJfD87FDWEKux7LyyJPoroNNhT/QPxjZ2X9Lul
	LqyIFAkF1kb8gy9HUtGXNAkvg1OjK4BYnJGQEHPvsgX4Akq2wO1zCMGh5rrKw/QaPAXNSADZXilp9
	Ny/A2Rd2+GWGAlYYeNPCNvpULSDeHjN0MWFjWGnUXHhGTXKSx4uXc1I51BzJJgHGG/Kt4iSEuVG9d
	blX6I22EylBhFDoCr5WDh3ZWzC1XJ/++//8F+ylRionxxM5sEpaED3Ak5qx3XLaboRBsdlG2fQ7zI
	s2iDc6XdXQGjvrxOUQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzoD-00000005ybe-2C4A;
	Fri, 29 Aug 2025 14:10:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwuL-00000005QkQ-0FAU
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 11:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756465477; x=1788001477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MN1Il3XT7U/RcSriz2Tk4rsIzr1Tdk5cc/+Xb6ZDhtM=;
  b=jtpc7IfnXv5HtsAZ0cwxjh2BfgTXfe/BcIbUAlUjV+p2VU8bylinaCC4
   3X1SKOyoPH/JELkL6JNmjRglOoB3XhFJWu4/zOBHeDbGw61rNQOUwgVHV
   wB7A+Pe+XH5fAiZ1HvWGHWzfg+rUK1o5Xu6/7zhNCGbKPLQL4rHhgpi+c
   sI5HDakxlkcuSBfYB3WHxxHtsLfsRyCDgfR1XFFxv9JQEUtGjVZ694Gxt
   reSYYEJqw5o/mYF+sNPo1eDBayWPkDNmlMWoDIeV3FNGnlfZ/8A4Lq9sh
   y4PnNKnfFP6RGgB40A3bB/Cge3mu1uL4ctxzY72sznBjfsWXwAfpb6TaN
   Q==;
X-CSE-ConnectionGUID: MCeiy6WkQNCUoV5Revrevw==
X-CSE-MsgGUID: MKts3SpLQXSUmMdQt/gJnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="57943830"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="57943830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:04:35 -0700
X-CSE-ConnectionGUID: wsY8eeOsTdabKwII9Rr7MA==
X-CSE-MsgGUID: wmxIinv+ROSgUDAFQPOhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170739659"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Aug 2025 04:04:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urwtz-000Udr-1z;
	Fri, 29 Aug 2025 11:04:26 +0000
Date: Fri, 29 Aug 2025 19:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202508291833.SY2MmoZx-lkp@intel.com>
References: <20250825172057.163883-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825172057.163883-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040437_110511_3B0304B8 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6c68f4c0a147c025ae0b25fab688c7c47964a02f]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250826-012424
base:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
patch link:    https://lore.kernel.org/r/20250825172057.163883-3-elder%40riscstar.com
patch subject: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: x86_64-kismet-CONFIG_I2C_K1-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250829/202508291833.SY2MmoZx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250829/202508291833.SY2MmoZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291833.SY2MmoZx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_K1 when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for I2C_K1
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
