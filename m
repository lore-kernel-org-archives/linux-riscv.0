Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0043C61CE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTdoJQO758GTnV72SGuVUr8NzvreGL6RnOdtxN7uz28=; b=w4yr67tn6MG3b/
	5/fC1WUGbhT0EXq0+o6bkvC8WYFX03rYeqr839WRl4ezxXlLECk/AyetAzx/7ef78I31uMiRa14gX
	Iu5DrdctEeP0c2uOcaoFliw0nMc0HJ7DNuQgfeMPKujHsVM1SHqjzsEOwaOGgGUldpj/m2uf7UXZQ
	F5g3gc5dkQVShy376PZcvUqjKkVxEkVP+kP6vDvT3sFxmpaE69sSFajX4j91OHOYj7xgyxw+81VsH
	fqJ4UbGFR61RUaj7ZFlHhgk042JYOUaWKqXvlpZz9ouxh2Qeuzc7G3UQbBzqYtLY2aVjV3aDhJUfc
	/Pnmz+ca8XGQ+R2fB1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkyy-00000002RIC-2QsN;
	Sun, 15 Jun 2025 10:53:00 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkyv-00000002RHB-1xmN
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 10:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749984777; x=1781520777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ejtojejYEkKUTk6N+o9TY6ArccN85B9ukz5YklvHMeQ=;
  b=VonxRVk8hNIMrQIZCV8epEvpZTU6Xmws8tgMmb3pc4rxpYiOOMyw7R5v
   U7ahPs7aUrN32bAZgWZjGX5HleJXTnuZohHqyra32ZtzdyafbbL6AlpG4
   WCfajEeIZiBSY8EWZ0Rvxd8X7CAgvXmf9rX5ayRGc6TjnuYfetixwV4Nl
   VfXWIIsa6hN//iCz6mmXkwwKw0+c1y2mohyKvIRvHX56smA42JvbunN90
   KrlCbDlGuBkH6sc6AI9M12OYcpWOrexV3Z2036P4Su7nZuiNEw4nlNQAl
   wOWzfqdczM2NHpWPxhdYXIbERoTk1NXO5Ydm3JTx5ueSET6uzGwifwa9q
   g==;
X-CSE-ConnectionGUID: Uh4hP9FUR8mTRutVgFxxNg==
X-CSE-MsgGUID: bk59M+1YS8+Ttx5fQU3vow==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52285343"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="52285343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 03:52:50 -0700
X-CSE-ConnectionGUID: iPnqe7lDTyWwtmi51DmowQ==
X-CSE-MsgGUID: KOTMKZ52R2ij4S+CeEoraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="149129847"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2025 03:52:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQkyg-000EFw-0j;
	Sun, 15 Jun 2025 10:52:42 +0000
Date: Sun, 15 Jun 2025 18:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Message-ID: <202506151839.IKkZs0Z0-lkp@intel.com>
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_035257_510536_15D2E486 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/power-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver/20250615-021142
base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4-8-8e3945c819cd%40samsung.com
patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_POWERVR
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_POWERVR [=y] && HAS_IOMEM [=y] && (ARM64 || RISCV [=y]) && DRM [=y] && PM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
