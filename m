Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE38C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 03:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPKlDOGp3A7Gl5/sC7Tn0/nioi9SFyCfEdM8w6fM1iQ=; b=Lkz+ebIF8tmedT
	1jdbc1i1L4DqIS4cW42Ww56gRWGawiEfrJ7W781dqXS1+bj0IdBm54rWjI4Ht6vNIdXPgJWZ+B7wt
	srTqgMc8F4gsg6/FHAhwFylOQj4S9LfmMt1N5MbKAiDGkxDROLbcjiSJ6KxZydMZ4pyXtgCrUYTnU
	xQovXT8SmhV9LuQEQL7Z9cUNpkrGpoujbW/6si0a3NmuXwmVYPjQWRUXiYhgeNtCPl90WeAbF1QYh
	jlGaFN/DBUwlCEbT4lpBr4nGAojWDOwqiJ3P6Ho3KK5kPV2z6lwm/oRceXMwdWObSTBdCpSxZ8Qr6
	d0jZFFyS8FbgEriVs3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSWi-0000000EfY7-40od;
	Fri, 20 Jun 2025 03:34:52 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSVO-0000000EfRB-333U
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 03:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750390410; x=1781926410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7b4Zgn39nbR0MuT55dc6lDAmtx2/UCmMGXfe6j+aHDM=;
  b=Hmqcuber4Kd/Av4hxAAHMJus6lD+W9K5OZqAyKS0nPDMfMLzp/rWAwLl
   OPasJiRX4sJU4Ti7vzNzqHIqT9WZZNKFo0kOqBE/xsiR4ijZHad8ZJ6eE
   /yGwILlQitwJ/MNOBMU/gL+2oTCSKPZUQvYxXtB62sACc3EGFu6av2DPd
   uUW5fBCdygNNq9w7N2fJ/EaIg+uHme1OLmhMcbzXh+sydYMLoCg9ZejH7
   TKo5Di/5C0Chdi6effb4iAA/UXg7ENqV+YD//R+xMSt3q9A8BH7r6gtFd
   FPb1jG4u1LGpU6FG5zOxp3K7LA6vQwsupFmHfSNBAIRUIBN1fYOXKEEPr
   Q==;
X-CSE-ConnectionGUID: gbp9R2ivSVmU2LMrz5i5mw==
X-CSE-MsgGUID: 8thjsu21RfaHwOzLpcaGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63692015"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="63692015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 20:33:26 -0700
X-CSE-ConnectionGUID: LwfHEg8eS0iD8pPsmJpIWA==
X-CSE-MsgGUID: j7YO7yV7TuCOk+Ncl9X9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="151105039"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2025 20:33:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSSVB-000LLC-31;
	Fri, 20 Jun 2025 03:33:17 +0000
Date: Fri, 20 Jun 2025 11:32:51 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Message-ID: <202506201103.GX6DA9Gx-lkp@intel.com>
References: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_203330_858830_3B5085FC 
X-CRM114-Status: GOOD (  15.51  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/power-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver/20250618-182429
base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
patch link:    https://lore.kernel.org/r/20250618-apr_14_for_sending-v5-8-27ed33ea5c6f%40samsung.com
patch subject: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
config: sparc64-randconfig-r121-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201103.GX6DA9Gx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250620/202506201103.GX6DA9Gx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201103.GX6DA9Gx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imagination/pvr_mmu.c:57:3: error: #error Unsupported device page size PVR_DEVICE_PAGE_SIZE
    # error Unsupported device page size PVR_DEVICE_PAGE_SIZE
      ^~~~~
   In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/memory.h:19,
                    from drivers/gpu/drm/imagination/pvr_mmu.h:7,
                    from drivers/gpu/drm/imagination/pvr_mmu.c:4:
   drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l1_entry_raw_set':
   drivers/gpu/drm/imagination/pvr_mmu.c:577:50: error: 'ROGUE_MMUCTRL_PAGE_SIZE_X' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_SIZE_1MB'?
         PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   drivers/gpu/drm/imagination/pvr_mmu.c:574:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(entry->val,
     ^~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_mmu.c:577:6: note: in expansion of macro 'PVR_PAGE_TABLE_FIELD_PREP'
         PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_mmu.c:577:50: note: each undeclared identifier is reported only once for each function it appears in
         PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   drivers/gpu/drm/imagination/pvr_mmu.c:574:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(entry->val,
     ^~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_mmu.c:577:6: note: in expansion of macro 'PVR_PAGE_TABLE_FIELD_PREP'
         PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l0_entry_raw_set':
   drivers/gpu/drm/imagination/pvr_mmu.c:741:24: error: 'ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_1MB_RANGE_CLRMSK'?
              (dma_addr & ~ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK) |
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   drivers/gpu/drm/imagination/pvr_mmu.c:739:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(entry->val, PVR_PAGE_TABLE_FIELD_PREP(0, PT, VALID, true) |
     ^~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_mmu.c: In function 'pvr_page_table_l0_idx':
   drivers/gpu/drm/imagination/pvr_mmu.c:1713:9: error: 'ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT' undeclared (first use in this function); did you mean 'ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT'?
            ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT;
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT
>> drivers/gpu/drm/imagination/pvr_mmu.c:1714:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +1714 drivers/gpu/drm/imagination/pvr_mmu.c

ff5f643de0bf27 Donald Robson 2023-11-22  1696  
ff5f643de0bf27 Donald Robson 2023-11-22  1697  /**
ff5f643de0bf27 Donald Robson 2023-11-22  1698   * pvr_page_table_l0_idx() - Calculate the level 0 page table index for a
ff5f643de0bf27 Donald Robson 2023-11-22  1699   *                           device-virtual address.
ff5f643de0bf27 Donald Robson 2023-11-22  1700   * @device_addr: Target device-virtual address.
ff5f643de0bf27 Donald Robson 2023-11-22  1701   *
ff5f643de0bf27 Donald Robson 2023-11-22  1702   * This function does not perform any bounds checking - it is the caller's
ff5f643de0bf27 Donald Robson 2023-11-22  1703   * responsibility to ensure that @device_addr is valid before interpreting
ff5f643de0bf27 Donald Robson 2023-11-22  1704   * the result.
ff5f643de0bf27 Donald Robson 2023-11-22  1705   *
ff5f643de0bf27 Donald Robson 2023-11-22  1706   * Return:
ff5f643de0bf27 Donald Robson 2023-11-22  1707   * The index into a level 0 page table corresponding to @device_addr.
ff5f643de0bf27 Donald Robson 2023-11-22  1708   */
ff5f643de0bf27 Donald Robson 2023-11-22  1709  static u16
ff5f643de0bf27 Donald Robson 2023-11-22  1710  pvr_page_table_l0_idx(u64 device_addr)
ff5f643de0bf27 Donald Robson 2023-11-22  1711  {
ff5f643de0bf27 Donald Robson 2023-11-22  1712  	return (device_addr & ~ROGUE_MMUCTRL_VADDR_PT_INDEX_CLRMSK) >>
ff5f643de0bf27 Donald Robson 2023-11-22  1713  	       ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT;
ff5f643de0bf27 Donald Robson 2023-11-22 @1714  }
ff5f643de0bf27 Donald Robson 2023-11-22  1715  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
