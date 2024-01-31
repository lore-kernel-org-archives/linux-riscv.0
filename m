Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB5CC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 01:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu+2o0q8xM7jXcvJTMseWhEE6u32dcP5ZX7uew51iAI=; b=ZN/nC2pParS0Df
	pSDpshBD4wu+PmHS8nPdlmErwqr303QrPny4DfaM+X2CT/bfFl/PiB3hMt5fVu82XuDFdH0PKX8pt
	Nnskspq+agd6vbwTTSnt5iFXhT0sZQgQG/cO3gpok1A7lS8LN/yYD4bEj0H4pfWR7yYk+kMlMNAFS
	UiXqS3Li04h70MtTef0r3hq0pqQX4GfX2g17LbjlBsVWrW5JfFYM+tZf1tf7FM2/QAdIZl7nsCqMD
	rPsG2cjGlJP3q0esndEgpai7CYfbqii4OOUHbsJA74hZeyawUDmPYe7cPAnn3KnKrRKYFZdmKnWUw
	kwX925seNYKE82KAGZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUzLW-000000018NI-21Lv;
	Wed, 31 Jan 2024 01:24:58 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUzLS-000000018MB-2u34
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 01:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706664294; x=1738200294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tysgIYWxG7SDGpxBga/N02NUuK5X1g5CuvWQnJHeypM=;
  b=SsFHeRM5hFfBorMUwgXFL133K6mEJiPWS9W3xn30IqqL5O2FkIKzkAsQ
   1sml2t6YX40Sk2wHfW75eDg1jDkXaczIoOno9u+dwRQLszgecWAwK/N0q
   4vsmBUVMxgV3w4qfahF58qBUVb7I6gQDpja0bUJkyj+XotX+rRARJsge+
   jgru8qDPy/gRz/61yuYZBYcp8D1GgJxkUCs0c8jvU/z0e7bIyEU2xemiB
   L9p0dP9gsq4zN+Pvj8dI3xGSuMu1YOc6/m5+PKc2rkgjfu7JmMriYm/F/
   SqaVRAvHmQdvImUJAQRWQbKvspXKA4Xgq6JIvU+ZvN5T0TdVLgyAU9B7l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="21969892"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="21969892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36693738"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2024 17:24:44 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUzLF-00010e-2N;
	Wed, 31 Jan 2024 01:24:41 +0000
Date: Wed, 31 Jan 2024 09:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-can@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>
Subject: Re: [PATCH v1 3/4] can: cast: add driver for CAST CAN controller
Message-ID: <202401310909.4bnaezTF-lkp@intel.com>
References: <20240129031239.17037-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129031239.17037-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_172454_876213_3D70082A 
X-CRM114-Status: GOOD (  12.24  )
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

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master mkl-can-next/testing v6.8-rc2 next-20240130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-vendor-prefixes-Add-cast-vendor-prefix/20240129-114752
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240129031239.17037-4-william.qiu%40starfivetech.com
patch subject: [PATCH v1 3/4] can: cast: add driver for CAST CAN controller
config: arm-randconfig-r131-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310909.4bnaezTF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401310909.4bnaezTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310909.4bnaezTF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/cast_can.c:277:41: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/net/can/cast_can.c:295:41: sparse: sparse: subtraction of different types can't work (different address spaces)
>> drivers/net/can/cast_can.c:308:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:357:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
>> drivers/net/can/cast_can.c:352:5: sparse: sparse: symbol 'ccan_get_freebuffer' was not declared. Should it be static?
   drivers/net/can/cast_can.c:375:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:389:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:394:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:396:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:438:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:443:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:445:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:504:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:505:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:514:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:515:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:695:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
>> drivers/net/can/cast_can.c:697:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:732:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:733:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:760:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:761:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:762:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:765:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:837:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:838:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:849:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:852:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:921:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:926:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   drivers/net/can/cast_can.c:934:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
   drivers/net/can/cast_can.c:260:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:262:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
   drivers/net/can/cast_can.c:260:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:262:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:244:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
   drivers/net/can/cast_can.c:260:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@
>> drivers/net/can/cast_can.c:262:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] addr_down @@

vim +277 drivers/net/can/cast_can.c

   232	
   233	static inline unsigned char ccan_ioread8(const void  *addr)
   234	{
   235		void  *addr_down;
   236		union val {
   237			u8 val_8[4];
   238			u32 val_32;
   239		} val;
   240		u32 offset = 0;
   241	
   242		addr_down = (void  *)ALIGN_DOWN((unsigned long)addr, 4);
   243		offset = addr - addr_down;
 > 244		val.val_32 = ioread32(addr_down);
   245	
   246		return val.val_8[offset];
   247	}
   248	
   249	static inline void ccan_iowrite8(unsigned char value, void  *addr)
   250	{
   251		void  *addr_down;
   252		union val {
   253			u8 val_8[4];
   254			u32 val_32;
   255		} val;
   256		u8 offset = 0;
   257	
   258		addr_down = (void *)ALIGN_DOWN((unsigned long)addr, 4);
   259		offset = addr - addr_down;
   260		val.val_32 = ioread32(addr_down);
   261		val.val_8[offset] = value;
 > 262		iowrite32(val.val_32, addr_down);
   263	}
   264	
   265	static void ccan_reigister_set_bit(const struct ccan_priv *priv,
   266					   enum ccan_device_reg reg,
   267					   enum ccan_reg_bitchange mask)
   268	{
   269		void  *addr_down;
   270		union val {
   271			u8 val_8[4];
   272			u32 val_32;
   273		} val;
   274		u8 offset = 0;
   275	
   276		addr_down = (void *)ALIGN_DOWN((unsigned long)(priv->reg_base + reg), 4);
 > 277		offset = (priv->reg_base + reg) - addr_down;
   278		val.val_32 = ioread32(addr_down);
   279		val.val_8[offset] |= mask;
   280		iowrite32(val.val_32, addr_down);
   281	}
   282	
   283	static void ccan_reigister_off_bit(const struct ccan_priv *priv,
   284					   enum ccan_device_reg reg,
   285					   enum ccan_reg_bitchange mask)
   286	{
   287		void  *addr_down;
   288		union val {
   289			u8 val_8[4];
   290			u32 val_32;
   291		} val;
   292		u8 offset = 0;
   293	
   294		addr_down = (void *)ALIGN_DOWN((unsigned long)(priv->reg_base + reg), 4);
   295		offset = (priv->reg_base + reg) - addr_down;
   296		val.val_32 = ioread32(addr_down);
   297		val.val_8[offset] &= mask;
   298		iowrite32(val.val_32, addr_down);
   299	}
   300	
   301	static int ccan_device_driver_bittime_configuration(struct net_device *ndev)
   302	{
   303		struct ccan_priv *priv = netdev_priv(ndev);
   304		struct can_bittiming *bt = &priv->can.bittiming;
   305		struct can_bittiming *dbt = &priv->can.data_bittiming;
   306		u32 reset_test, bittiming_temp, data_bittiming;
   307	
 > 308		reset_test = ccan_ioread8(priv->reg_base + CCAN_CFG_STAT_OFFSET);
   309	
   310		if (!(reset_test & CCAN_SET_RST_MASK)) {
   311			netdev_alert(ndev, "Not in reset mode, cannot set bit timing\n");
   312			return -EPERM;
   313		}
   314	
   315		bittiming_temp = ((bt->phase_seg1 + bt->prop_seg + 1 - 2) << SEG_1_SHIFT) |
   316				 ((bt->phase_seg2 - 1) << SEG_2_SHIFT) |
   317				 ((bt->sjw - 1) << SJW_SHIFT) |
   318				 ((bt->brp - 1) << PRESC_SHIFT);
   319	
   320		/* Check the bittime parameter */
   321		if ((((int)(bt->phase_seg1 + bt->prop_seg + 1) - 2) < 0) ||
   322		    (((int)(bt->phase_seg2) - 1) < 0) ||
   323		    (((int)(bt->sjw) - 1) < 0) ||
   324		    (((int)(bt->brp) - 1) < 0))
   325			return -EINVAL;
   326	
   327		priv->write_reg(priv, CCAN_S_SEG_1_OFFSET, bittiming_temp);
   328	
   329		if (priv->cantype == CAST_CAN_TYPE_CANFD) {
   330			data_bittiming = ((dbt->phase_seg1 + dbt->prop_seg + 1 - 2) << SEG_1_SHIFT) |
   331					 ((dbt->phase_seg2 - 1) << SEG_2_SHIFT) |
   332					 ((dbt->sjw - 1) << SJW_SHIFT) |
   333					 ((dbt->brp - 1) << PRESC_SHIFT);
   334	
   335			if ((((int)(dbt->phase_seg1 + dbt->prop_seg + 1) - 2) < 0) ||
   336			    (((int)(dbt->phase_seg2) - 1) < 0) ||
   337			    (((int)(dbt->sjw) - 1) < 0) ||
   338			    (((int)(dbt->brp) - 1) < 0))
   339				return -EINVAL;
   340	
   341			priv->write_reg(priv, CCAN_F_SEG_1_OFFSET, data_bittiming);
   342		}
   343	
   344		ccan_reigister_off_bit(priv, CCAN_CFG_STAT_OFFSET, CCAN_OFF_RST_MASK);
   345	
   346		netdev_dbg(ndev, "Slow bit rate: %08x\n", priv->read_reg(priv, CCAN_S_SEG_1_OFFSET));
   347		netdev_dbg(ndev, "Fast bit rate: %08x\n", priv->read_reg(priv, CCAN_F_SEG_1_OFFSET));
   348	
   349		return 0;
   350	}
   351	
 > 352	int ccan_get_freebuffer(struct ccan_priv *priv)
   353	{
   354		/* Get next transmit buffer */
   355		ccan_reigister_set_bit(priv, CCAN_TCTRL_OFFSET, CCAN_SET_TENEXT_MASK);
   356	
   357		if (ccan_ioread8(priv->reg_base + CCAN_TCTRL_OFFSET) & CCAN_SET_TENEXT_MASK)
   358			return -EPERM;
   359	
   360		return 0;
   361	}
   362	
   363	static void ccan_tx_interrupt(struct net_device *ndev, u8 isr)
   364	{
   365		struct ccan_priv *priv = netdev_priv(ndev);
   366	
   367		/* wait till transmission of the PTB or STB finished */
   368		while (isr & (CCAN_SET_TPIF_MASK | CCAN_SET_TSIF_MASK)) {
   369			if (isr & CCAN_SET_TPIF_MASK)
   370				ccan_reigister_set_bit(priv, CCAN_RTIF_OFFSET, CCAN_SET_TPIF_MASK);
   371	
   372			if (isr & CCAN_SET_TSIF_MASK)
   373				ccan_reigister_set_bit(priv, CCAN_RTIF_OFFSET, CCAN_SET_TSIF_MASK);
   374	
   375			isr = ccan_ioread8(priv->reg_base + CCAN_RTIF_OFFSET);
   376		}
   377		netif_wake_queue(ndev);
   378	}
   379	
   380	static int ccan_rx(struct net_device *ndev)
   381	{
   382		struct ccan_priv *priv = netdev_priv(ndev);
   383		struct net_device_stats *stats = &ndev->stats;
   384		struct can_frame *cf;
   385		struct sk_buff *skb;
   386		u32 can_id;
   387		u8  dlc, control, rx_status;
   388	
   389		rx_status = ccan_ioread8(priv->reg_base + CCAN_RCTRL_OFFSET);
   390	
   391		if (!(rx_status & CCAN_RSTAT_NOT_EMPTY_MASK))
   392			return 0;
   393	
   394		control = ccan_ioread8(priv->reg_base + CCAN_RBUF_CTL_OFFSET);
   395		can_id = priv->read_reg(priv, CCAN_RUBF_ID_OFFSET);
 > 396		dlc = ccan_ioread8(priv->reg_base + CCAN_RBUF_CTL_OFFSET) & CCAN_SET_DLC_MASK;
   397	
   398		skb = alloc_can_skb(ndev, (struct can_frame **)&cf);
   399		if (!skb) {
   400			stats->rx_dropped++;
   401			return 0;
   402		}
   403		cf->can_dlc = can_cc_dlc2len(dlc);
   404	
   405		/* change the CANFD id into socketcan id format */
   406		cf->can_id = can_id;
   407		if (control & CCAN_SET_IDE_MASK)
   408			cf->can_id |= CAN_EFF_FLAG;
   409		else
   410			cf->can_id &= ~CAN_EFF_FLAG;
   411	
   412		if (control & CCAN_SET_RTR_MASK)
   413			cf->can_id |= CAN_RTR_FLAG;
   414	
   415		if (!(control & CCAN_SET_RTR_MASK)) {
   416			*((u32 *)(cf->data + 0)) = priv->read_reg(priv, CCAN_RBUF_DATA_OFFSET);
   417			*((u32 *)(cf->data + 4)) = priv->read_reg(priv, CCAN_RBUF_DATA_OFFSET + 4);
   418		}
   419	
   420		ccan_reigister_set_bit(priv, CCAN_RCTRL_OFFSET, CCAN_SET_RREL_MASK);
   421		stats->rx_bytes += can_fd_dlc2len(cf->can_dlc);
   422		stats->rx_packets++;
   423		netif_receive_skb(skb);
   424	
   425		return 1;
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
