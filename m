Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27C1CF9C69
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0RoNh/clBULQaa7Etfv1u5qolc42fsfkHgkdS95+eE=; b=h+QIEIMCq2i5yT
	nDz+ZSXyzfwKG7H95rnRNH1AInYfOhTjctGwD7ufQRDGzJoW71thZk98zLAEva/uiFX00XJYszRXB
	y7RLuUL0HgdK1i4gqm7mGIvLQUVXuGqqGw3sIUv7+Y6VJM3a/kxB0hEcNiukStA0SYiQaXf6UDeec
	5vhXAO0UL1Wd+Kj0emk8r31v9cLzCZQ6g3/ETjBfm8n2eob26ufgzw+2QXPWNIjz+va/s3YGiSqsL
	B4HfoEYBnkhDZOBtkuOxHewktUdQcHp7XNjs07ATzIk/W8h/ymKF9An+AerwlWkwwkxTUIgTlHb+i
	JWtuGWkotNUkKxTwgQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stAM4-000000033Ti-3qph;
	Tue, 24 Sep 2024 18:33:44 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stAM2-000000033Sv-0V4s
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 18:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727202822; x=1758738822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GznWfCDnUnyKOCfGDttffNNb5sJr81NujIVW9fi2A8=;
  b=geBYBl2Ha3matO2ZpGb9ekYmihKlga0O7OUauQpFv/XK2P0elsTGDvPg
   RJ5uQZU+IWK86HV8oPONxo+w3fMxNSqylA/qTXWl7oTN+RTf6avvdSHFr
   nkQB+2lRluX3Td/aYGQqocPe2qrFVi0PuYHf8FYXDVFyT6la9LVh/R2rV
   +wjn3cBE1US0igbIRhfSYiTDTuUW3posDk5uEr7Taggz0YY96DZLtORLV
   aD62rxtcCEHOXJ1JfUUdIsnU+wgyaU/PLciW4JMeo/5hvLA8LOd7ytvnz
   y7lkh6Gq/dcxS6FNQ5aPVZQuTeIr19F84wpWNP4q+SX8A+7GOkGG7bX0N
   w==;
X-CSE-ConnectionGUID: jbOeEd8+T+Ob7hmKQE8EuQ==
X-CSE-MsgGUID: wx1cj7cpSGSc2sBJxyWafQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43690615"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="43690615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 11:33:36 -0700
X-CSE-ConnectionGUID: BrxgntzbQjqqAVMJPEq+cA==
X-CSE-MsgGUID: CxoHm09bTTWpi/JiWpQb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="71122146"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2024 11:33:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stALr-000IgU-1X;
	Tue, 24 Sep 2024 18:33:31 +0000
Date: Wed, 25 Sep 2024 02:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <liujh2818@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junhui Liu <liujh2818@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] reset: canaan: Add reset driver for Kendryte K230
Message-ID: <202409250201.ZlZsYfH8-lkp@intel.com>
References: <20240924-k230-reset-v1-2-d0cdc11989eb@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240924-k230-reset-v1-2-d0cdc11989eb@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_113342_266314_3B1205AD 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abf2050f51fdca0fd146388f83cddd95a57a008d]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-reset-Add-support-for-canaan-k230-rst/20240924-140732
base:   abf2050f51fdca0fd146388f83cddd95a57a008d
patch link:    https://lore.kernel.org/r/20240924-k230-reset-v1-2-d0cdc11989eb%40outlook.com
patch subject: [PATCH 2/2] reset: canaan: Add reset driver for Kendryte K230
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409250201.ZlZsYfH8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250201.ZlZsYfH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250201.ZlZsYfH8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/reset/reset-k230.c:8:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/reset/reset-k230.c:8:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/reset/reset-k230.c:8:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/reset/reset-k230.c:223:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     223 |         case RST_TYPE_SW_DONE:
         |              ^~~~~~~~~~~~~~~~
   drivers/reset/reset-k230.c:231:9: note: uninitialized use occurs here
     231 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:214:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     214 |         case RST_TYPE_CPU1:
         |              ^~~~~~~~~~~~~
   drivers/reset/reset-k230.c:231:9: note: uninitialized use occurs here
     231 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:215:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     215 |         case RST_TYPE_FLUSH:
         |              ^~~~~~~~~~~~~~
   drivers/reset/reset-k230.c:231:9: note: uninitialized use occurs here
     231 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:206:9: note: initialize the variable 'ret' to silence this warning
     206 |         int ret;
         |                ^
         |                 = 0
   drivers/reset/reset-k230.c:250:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     250 |         case RST_TYPE_SW_DONE:
         |              ^~~~~~~~~~~~~~~~
   drivers/reset/reset-k230.c:258:9: note: uninitialized use occurs here
     258 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:247:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     247 |         case RST_TYPE_FLUSH:
         |              ^~~~~~~~~~~~~~
   drivers/reset/reset-k230.c:258:9: note: uninitialized use occurs here
     258 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:248:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     248 |         case RST_TYPE_HW_DONE:
         |              ^~~~~~~~~~~~~~~~
   drivers/reset/reset-k230.c:258:9: note: uninitialized use occurs here
     258 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:241:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     241 |         case RST_TYPE_CPU0:
         |              ^~~~~~~~~~~~~
   drivers/reset/reset-k230.c:258:9: note: uninitialized use occurs here
     258 |         return ret;
         |                ^~~
   drivers/reset/reset-k230.c:238:9: note: initialize the variable 'ret' to silence this warning
     238 |         int ret;
         |                ^
         |                 = 0
   13 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/ret +223 drivers/reset/reset-k230.c

   201	
   202	static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
   203	{
   204		struct k230_rst *rstc = to_k230_rst(rcdev);
   205		const struct k230_rst_map *rmap = &k230_resets[id];
   206		int ret;
   207	
   208		switch (rmap->type) {
   209		case RST_TYPE_CPU0:
   210			k230_rst_clear_done(rstc, id, true);
   211			k230_rst_update(rstc, id, true, true, false);
   212			ret = k230_rst_wait_and_clear_done(rstc, id, true);
   213			break;
   214		case RST_TYPE_CPU1:
   215		case RST_TYPE_FLUSH:
   216			k230_rst_update(rstc, id, true, true, false);
   217			break;
   218		case RST_TYPE_HW_DONE:
   219			k230_rst_clear_done(rstc, id, false);
   220			k230_rst_update(rstc, id, true, false, false);
   221			ret = k230_rst_wait_and_clear_done(rstc, id, false);
   222			break;
 > 223		case RST_TYPE_SW_DONE:
   224			k230_rst_update(rstc, id, true, false,
   225					id == RST_SPI2AXI ? false : true);
   226			break;
   227		default:
   228			return -EINVAL;
   229		}
   230	
   231		return ret;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
