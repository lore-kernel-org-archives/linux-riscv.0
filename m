Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77781D778B2
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/s9mqLxLQ7Kk8spmHCxjz/JqGviQIR7IKMWu41+EVw=; b=u6RqgmeWvEHpG6
	5aJmFJeaTeu+LtpJjnbLfGbGb6VzAprKLz67OnCLQuTZWUcwVvgQtbHOVByDYcKKcsYwYCuCKYCI/
	mNuPjjHRDGwxV4hGBBs+uPdUoNRXfjlGXI6FP9LJum2wK3jndtdY1AXUJOe0A3sPJ3zu5Z2HAWagr
	VtSaUy+dWyt76gyXXc3Id8/o5wwT+X1S3vK2eIzE/Swd5HSkEzQG/vjUQg46qq/5dv5qxRIiSeBv2
	LRu2TZ7cc+7zGT1CDaY5bPPl56GSPAxSNOLhyYTSsop5Vik4ss3GoAI6q/nO5T2cBC6zZxLdYRq6r
	fEng7lDwVdwHnc3Fwk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOiB-00000009W5O-3hhc;
	Fri, 23 Jan 2026 21:28:59 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOi7-00000009W51-4BOK
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 21:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769203736; x=1800739736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+3lxxdOCzI1G+P2RWvjJqV8G0EnM8ESruTvIjlp03Y=;
  b=ZWOmQaIbwYnEi731WqulbY55WshUKD3axWlrHhyKC3mc4ddq3EK6m73J
   sCZj3w5mPzXxsHN2luw+G9hfqBhmVe43tymhHH3+X6sCLoXXNGJM3ojyZ
   6qzQQIjelVFc5Z+kc140l2gwsVIRISrwq9R39bpH46iWXWDHRP9XhfFjE
   pR0ORY2P5/qQHvo0jQdbupS29k1uNhhrJYo7MKRvihxQaZKGiEX1WOuY2
   JYwRiKPGWr14lEetd/81T8HvBODrKN3bhl24fcHQVPwJmMvMuwO6u1o5f
   DL5eE1TVIHc/KsmqThPzdEl2EHPOzc7sz3k+Uw0OkqUWyCrwpe6XylTvn
   g==;
X-CSE-ConnectionGUID: HiVcRUcOSde7JQbt0ZNUQw==
X-CSE-MsgGUID: i/9RAHAETR6ZHCxQ4qrD+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88037073"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="88037073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:28:54 -0800
X-CSE-ConnectionGUID: ZNRfMAYGQeCGb28jB3gqig==
X-CSE-MsgGUID: 5pu4H/wGTbGQHbaRND9vtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211581938"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 13:28:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOhy-000000000p7-2cGG;
	Fri, 23 Jan 2026 21:28:46 +0000
Date: Fri, 23 Jan 2026 22:28:19 +0100
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <202601232234.kb8a1hFz-lkp@intel.com>
References: <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_132856_908011_B4390E3B 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, oe-kbuild-all@lists.linux.dev, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on next-20260122]
[cannot apply to drm-misc/drm-misc-next drm/drm-next linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-vendor-prefixes-add-verisilicon/20260123-173225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123092830.4046009-4-zhengxingda%40iscas.ac.cn
patch subject: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon display controllers
config: riscv-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_VERISILICON_DC-0-0 (https://download.01.org/0day-ci/archive/20260123/202601232234.kb8a1hFz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601232234.kb8a1hFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232234.kb8a1hFz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_VERISILICON_DC
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC [=y] && HAS_IOMEM [=y] && DRM [=y] && COMMON_CLK [=y] && (RISCV [=y] || COMPILER_TEST)
   
   WARNING: unmet direct dependencies detected for SIFIVE_CCACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n] && (ARCH_SIFIVE [=y] || ARCH_STARFIVE [=y])
     Selected by [y]:
     - ERRATA_STARFIVE_JH7100 [=y] && ARCH_STARFIVE [=y] && !DMA_DIRECT_REMAP [=n] && NONPORTABLE [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
