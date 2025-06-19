Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24786C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 06:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXyjXjDRaj5vB3PgacrMAzJRwPhsgYMOH0DXuYOovIQ=; b=yFwIZd1GkN5Hrm
	l0jNZLrBfL1fA2lNDgfAcS1s89rXSzkvS8awVg/xDrd/rg+Uq6HZrlOWhQjrUmJRKuUm/XKurLDi3
	E8c2veD7i33QCXASQyPp+34+CxJVC3Za+iFHfbEG8LAduuttmHtTHE5rsylwxVLWJwT5FdhwBoYFC
	9cUVqpp6j0DPTo19TcRW7NB/3uITcWs9nEAk7ya15R4K9Lso46jgl/U12xK+3hv91EriCbkVimspO
	+Z7s8IH8i+kDevRLPhJ3M/XDUb3jpV2P/P5xrAELgze7iV47HDrGO+/kcfL8ejav24zDHjNYVOWHb
	wl1ewwDkPfpToA7lUjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8tW-0000000CAPP-00hh;
	Thu, 19 Jun 2025 06:37:06 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Zd-0000000C8ds-2M0R
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 06:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750313794; x=1781849794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2nJfHuAEgVWMuoP5MIOULxkZy7iA+qQ3cFHZksQqNo=;
  b=QRXxEvUsBgJfFJNB/5LLlIpvLT2LhdK8R2spszUqAt+bnEFnmf7z715F
   kxdAsBl6zBMWcKFsCwpnmd6sCxtEN4fr0ePRjISuUTSnsZ6+BJr7uuVjB
   sMvQuluPADF+zcel1S0jc889SRw+vSPpkpmzTDja5g47MczrowgetxYdI
   EgzWpHB/b218f0jtb7+ftrWTh9BhJCwP/zPk8Mw95qyNF2YSxaJQuOiLt
   nLuBA/9TGvrE+UBt5z2syf7098JW4FZEh4K142fdU42cTMy5R1LHUBSxI
   bxT8Kgqiqjw+AP9eLjNf3Azdx5ZLPl6Y/l+A0RKydD+fmm5YdFkuygcOU
   g==;
X-CSE-ConnectionGUID: jOrQBiqTR5yDhwcu8NUsLQ==
X-CSE-MsgGUID: xAlhxvqiRN6DX2SeMeVEeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52701399"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52701399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 23:16:27 -0700
X-CSE-ConnectionGUID: ldkW5VCUQ7aMYWaWZN8i+w==
X-CSE-MsgGUID: GoYIM3RQTpOnUtUfDen5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154769012"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2025 23:16:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS8ZO-000KSc-1i;
	Thu, 19 Jun 2025 06:16:18 +0000
Date: Thu, 19 Jun 2025 14:15:34 +0800
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
Message-ID: <202506191323.zD1fszQb-lkp@intel.com>
References: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_231633_654691_0C4D7DA7 
X-CRM114-Status: GOOD (  13.15  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 4774cfe3543abb8ee98089f535e28ebfd45b975a]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/power-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver/20250618-182429
base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
patch link:    https://lore.kernel.org/r/20250618-apr_14_for_sending-v5-8-27ed33ea5c6f%40samsung.com
patch subject: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250619/202506191323.zD1fszQb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191323.zD1fszQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191323.zD1fszQb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_ccb.c:5:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/imagination/pvr_context.h:17,
                    from drivers/gpu/drm/imagination/pvr_drv.c:4:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/drm/spsc_queue.h:27,
                    from include/drm/gpu_scheduler.h:27,
                    from drivers/gpu/drm/imagination/pvr_context.h:7:
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h: At top level:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bits.h:32,
                    from drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h:7,
                    from drivers/gpu/drm/imagination/pvr_stream_defs.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/imagination/pvr_vm.c:6:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/gpu/drm/imagination/pvr_rogue_fwif.h:10,
                    from drivers/gpu/drm/imagination/pvr_ccb.h:7,
                    from drivers/gpu/drm/imagination/pvr_device.h:7:
   drivers/gpu/drm/imagination/pvr_vm.c: In function 'pvr_vm_create_context':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1099511627776' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   arch/x86/include/asm/bitops.h:265:40: note: in definition of macro '__ffs'
     265 |          (unsigned long)__builtin_ctzl(word) :  \
         |                                        ^~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:63:41: note: in expansion of macro '_AC'
      63 | #define SZ_1T                           _AC(0x10000000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/imagination/pvr_mmu.h:87:40: note: in expansion of macro 'SZ_1T'
      87 | #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
         |                                        ^~~~~
   drivers/gpu/drm/imagination/pvr_mmu.h:88:40: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_SPACE_SIZE'
      88 | #define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_vm.c:556:33: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_BITS'
     556 |         if (device_addr_bits != PVR_PAGE_TABLE_ADDR_BITS) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from pvr_ccb.c:5:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from pvr_context.h:17,
                    from pvr_drv.c:4:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/drm/spsc_queue.h:27,
                    from include/drm/gpu_scheduler.h:27,
                    from pvr_context.h:7:
   pvr_rogue_fwif_client_check.h: At top level:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bits.h:32,
                    from pvr_rogue_fwif_client.h:7,
                    from pvr_stream_defs.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
--
   In file included from pvr_vm.c:6:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from pvr_rogue_fwif.h:10,
                    from pvr_ccb.h:7,
                    from pvr_device.h:7:
   pvr_vm.c: In function 'pvr_vm_create_context':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1099511627776' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   arch/x86/include/asm/bitops.h:265:40: note: in definition of macro '__ffs'
     265 |          (unsigned long)__builtin_ctzl(word) :  \
         |                                        ^~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:63:41: note: in expansion of macro '_AC'
      63 | #define SZ_1T                           _AC(0x10000000000, ULL)
         |                                         ^~~
   pvr_mmu.h:87:40: note: in expansion of macro 'SZ_1T'
      87 | #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
         |                                        ^~~~~
   pvr_mmu.h:88:40: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_SPACE_SIZE'
      88 | #define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   pvr_vm.c:556:33: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_BITS'
     556 |         if (device_addr_bits != PVR_PAGE_TABLE_ADDR_BITS) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +176 include/linux/iopoll.h

57a29df341466b Kai-Heng Feng      2020-04-25  115  
54c523127bcca9 Matt Wagantall     2014-12-15  116  /**
54c523127bcca9 Matt Wagantall     2014-12-15  117   * readx_poll_timeout - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall     2014-12-15  118   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  119   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  120   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall     2014-12-15  121   * @cond: Break condition (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  122   * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  123   *            read usleep_range() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  124   *            limitations.
54c523127bcca9 Matt Wagantall     2014-12-15  125   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  126   *
54c523127bcca9 Matt Wagantall     2014-12-15  127   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  128   * macros defined below rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  129   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  130   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  131   * case, the last read value at @addr is stored in @val. Must not
89124747f096fc Anna-Maria Behnsen 2024-10-14  132   * be called from atomic context if sleep_us or timeout_us are used.
54c523127bcca9 Matt Wagantall     2014-12-15  133   */
54c523127bcca9 Matt Wagantall     2014-12-15  134  #define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
eaa6b01024a74a Dejin Zheng        2020-03-23  135  	read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  136  
54c523127bcca9 Matt Wagantall     2014-12-15  137  /**
54c523127bcca9 Matt Wagantall     2014-12-15  138   * readx_poll_timeout_atomic - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall     2014-12-15  139   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  140   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  141   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall     2014-12-15  142   * @cond: Break condition (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  143   * @delay_us: Time to udelay between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  144   *            read udelay() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  145   *            limitations.
54c523127bcca9 Matt Wagantall     2014-12-15  146   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  147   *
54c523127bcca9 Matt Wagantall     2014-12-15  148   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  149   * macros defined below rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  150   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  151   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  152   * case, the last read value at @addr is stored in @val.
54c523127bcca9 Matt Wagantall     2014-12-15  153   */
54c523127bcca9 Matt Wagantall     2014-12-15  154  #define readx_poll_timeout_atomic(op, addr, val, cond, delay_us, timeout_us) \
57a29df341466b Kai-Heng Feng      2020-04-25  155  	read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  156  
54c523127bcca9 Matt Wagantall     2014-12-15  157  #define readb_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  158  	readx_poll_timeout(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  159  
54c523127bcca9 Matt Wagantall     2014-12-15  160  #define readb_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  161  	readx_poll_timeout_atomic(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  162  
54c523127bcca9 Matt Wagantall     2014-12-15  163  #define readw_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  164  	readx_poll_timeout(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  165  
54c523127bcca9 Matt Wagantall     2014-12-15  166  #define readw_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  167  	readx_poll_timeout_atomic(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  168  
54c523127bcca9 Matt Wagantall     2014-12-15  169  #define readl_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  170  	readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  171  
54c523127bcca9 Matt Wagantall     2014-12-15  172  #define readl_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  173  	readx_poll_timeout_atomic(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  174  
54c523127bcca9 Matt Wagantall     2014-12-15  175  #define readq_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15 @176  	readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
