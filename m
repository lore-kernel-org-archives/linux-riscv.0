Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DFFC87FD1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF4/M5NQtP1CfZhQ6SZN299Yt7ks7d1tMo0ZF0Msm1Y=; b=o8bStTAIO5VG8O
	cMXl+BclkEsUoq5+PDyen6gUVmvJTMuFF2RBjDJ6Lr+F7ZfFWASZjqZebVEkRGNS/58586MzbyatX
	kRXh1HrYmtg0CiuTPj5UdwNeqYUPgFBRQKflCeQr3TJiY1QETDdQd0N1yehOdvnhCRj1oAvVWSrT4
	pe/qG4AfCvoIfVg+ZYAAxTNhDMdwfqK3EfNf9L1dDmBhRp00XyMZzzPaLxyj0cO5W1OYKo/yJ7kci
	XC/P5cxYArVgTFI6Pp1u4DF35nF5r+WsUI5PmXBKcHNIFmwiEb/Ll+eNrZczDuyg4UZc7tWQhcINu
	SQQ3ACNT3Phd0Mc0j3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugInv-0000000DvGJ-2EJo;
	Mon, 28 Jul 2025 08:01:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIRR-0000000Dsev-3Un9
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 07:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753688317; x=1785224317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Atv+h1zy3lGlRpGsaTZb5bGl9bBfscVo1QdxCp3Ycio=;
  b=YidYqouMh45FHZEsU2SdUX/UgX7ieWDU9cwq4XKaeAaaG/+BRChlMHa/
   mvpM7+AXTwOyB38keC9LAm1y2tidnsIxp55GJPS0xLlfQJKF+JiDlaPaJ
   TYW34SkxFqp498/oZc9eXSVP942EORVCKGX5zfToey8buv7rlXW5m/ZaV
   yhpJExW7hU9erDp2ZA1PYI+jwRJU99ie2vlQvRatk/YwhiY12HOtpGSsR
   bjQN31X1PpiKAWq45Osl+oew+UjBQ3CazIlWqS7/8eRMxI2ZXxaz/auAo
   jWcZo97YRSvkGu++zBFRawdkLCq1niSlSXqm0VlfbXEV71gmNpli1LAeg
   g==;
X-CSE-ConnectionGUID: FL9e+cASQNWo8xksrA6ouQ==
X-CSE-MsgGUID: +YcIu1SVSb6r4nx6nrC3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67007806"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67007806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:38:36 -0700
X-CSE-ConnectionGUID: 7fHWNrH9SCKEyS77FrHOWg==
X-CSE-MsgGUID: FLqVuymaRu2UlNmoWUzs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166517711"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2025 00:38:32 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugIRJ-0000Il-1J;
	Mon, 28 Jul 2025 07:38:29 +0000
Date: Mon, 28 Jul 2025 15:37:36 +0800
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
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
Message-ID: <202507281558.lZ0NYtth-lkp@intel.com>
References: <20250726131003.3137282-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250726131003.3137282-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_003837_913052_841A6BDC 
X-CRM114-Status: UNSURE (   8.11  )
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

[auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
base:   d7af19298454ed155f5cf67201a70f5cf836c842
patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
