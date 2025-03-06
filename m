Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4503CC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 05:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLMSIMyBueiAHrTpIIYDW/GcqleQaGup1jRSBPs830w=; b=cDfVTZU5I2odE5
	wnDBv/Rz7uv8DlLYuY+AkH+jv0CaIohQTHJsgZPaxyeAgvf49bw7NC4PC6CU3k/Soky8IbWcSPRBA
	EupyTCxLZm+vPIkRB3EdEITxbhAI8qnfvGmeUY2ddHsQiUuNWHhsI2737vhn9zMylqV2mO5tnuZFC
	dQL6l7I+ntPqRviLFbwGb69VxSFoiz+fDbYZaOxCaX+K3bp9hlH8HQ1RAeu5LrX5aND0OFunObxzc
	bbEInIXPdciaIjhBoQiCYEJfQwuBc2uKIMG9BRZVusZcxJj3tyDIZu9s9i90zXiSV6AsrJjp3BtLs
	+i4Wlbz3a6ptmJ5+dMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3ol-0000000A2qs-1WNc;
	Thu, 06 Mar 2025 05:30:47 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3oi-0000000A2qI-03gi
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 05:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741239044; x=1772775044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=21iO/G2bQw9K65JrUOqRRdhPgZGB06xxok6XVDEcObw=;
  b=lfSsWIhT/XSC9TtmA+oCZkHO7ukwF+Syap1yqRPg1vPGhe6YrhIuvDFf
   N4NsJYpcNDJ1B+GeVNCRJrT/pPnM+xOFPCFlK39Dmf5cM9VDv1N9iQMnE
   SmDPs4JJwh954qbBchvrmIO0JoEI+MRBw9cgGQ8nTxBwr+0qMdAKXZi5a
   pXRCTTtpYnZuS9y95vvVRDTqed7Bu+8Q41YYDj6jcgSS49ZsE+Bw7lecO
   nFNVrsbFHGHX6Mlo6SQXG760wQs/1EhulrYbbXA+vt1XGJkxKKDTymlr7
   TvyKm0M0iP73zuzxySzPTw2cqWiDY+CIoXg9mv7uKxtsav25hJR/Kcus+
   g==;
X-CSE-ConnectionGUID: wo2RvE42TweVLMQ143aYTg==
X-CSE-MsgGUID: iiSukeXoTQ6Oc/VwWREq6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42258847"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42258847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:30:40 -0800
X-CSE-ConnectionGUID: FOt1b/HPS/Kk/o/pTnuQsA==
X-CSE-MsgGUID: F1Uayh3pT8GmKmLuuh1/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119602412"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 21:30:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq3oX-000MaE-2x;
	Thu, 06 Mar 2025 05:30:33 +0000
Date: Thu, 6 Mar 2025 13:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <202503061309.yjpOnrMo-lkp@intel.com>
References: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_213044_186895_F1AC449E 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Sverdlin/dt-bindings-mfd-sophgo-add-RTC-support-for-Sophgo-CV1800-series-SoC/20250303-035433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250302195205.3183174-3-alexander.sverdlin%40gmail.com
patch subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503061309.yjpOnrMo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061309.yjpOnrMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061309.yjpOnrMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cv1800-rtcsys.c:30:30: warning: 'cv1800_rtcsys_rtc_subdev' defined but not used [-Wunused-const-variable=]
      30 | static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/cv1800_rtcsys_rtc_subdev +30 drivers/mfd/cv1800-rtcsys.c

    29	
  > 30	static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
    31		MFD_CELL_NAME("cv1800-rtc");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
