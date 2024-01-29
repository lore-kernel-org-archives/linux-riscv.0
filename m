Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927CDC47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMvpBY8sMRDpmfarmK+WQ+TEEApfz7NcQfoNFN/cRck=; b=yFCeLsWchEkNRO
	AWillFxWtpyzNm42Nf3+uIDMADJqddxu8x7umGJJWLxZtL/8HQETyCyURo7KLwzItvtBA+hVmhy1P
	YLTIyJNBKqqC+uNQggEVYnRa/Z2GlcQUqNqdZc49A3mh04xPxT42M/4EXFbjKMrPBxIuDeyTYNaL7
	XpXNdZ8OTTMZ86C4Kp++xORBKMjsRaL89+C5QH61yrLFxyBZA9T/N+A8RvYFfcSWrb/ZA8xQZfbQX
	BhniS4vnxw2ehP1VXqG29/61tUHogZNN5gQCIjs5TUkIiFVeUZH+PiBcv+YOW2EoIOtoIaeaZXiO1
	h0qFexsJrgHY9T7d8deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUXg7-0000000E9dl-2lxj;
	Mon, 29 Jan 2024 19:52:23 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUXg5-0000000E9d7-223r
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 19:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706557942; x=1738093942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AkBpWCt8Yn5W3lR5XfqNrLHf+HDLn89jCMBMA0LnBBE=;
  b=Oi+kkIbEPV/VSzEvE/FMiV3T+8G227kh0tyPRt/jEb7r6xulP766lmUx
   pCAjI+aJMvCMc6v+u/6DP0jJsqvfGfmObphHVLK8TdegT+YD29zbZCIml
   YfIjezqvZ39n6wGvaYJFzrOUEHxBmsD/g6/TYutrUdY3WSNTF8xGdBdyw
   JLtSKsAKamJXC1RKM8T6CorpNLh9Re5C7qFy2GN2uxkbfFgJGhVjwhbje
   Wpd0ldy5zDTe1fcjy9RJNY2Dw84EhuA4iD+eTgmo1soVif5zRQqpB0j9M
   WEXIT82Yif0nvFc3Y3OCfejOR5O1N30r5y1268Pu9ibhf9SPNeiqcIhta
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16450399"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="16450399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 11:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29905599"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 11:52:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUXfv-0004bQ-0f;
	Mon, 29 Jan 2024 19:52:11 +0000
Date: Tue, 30 Jan 2024 03:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-can@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <kernel@esmil.dk>,
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
Message-ID: <202401300313.9DPa2nuW-lkp@intel.com>
References: <20240129031239.17037-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129031239.17037-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_115221_599684_3DB744BF 
X-CRM114-Status: GOOD (  13.65  )
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
[also build test WARNING on linus/master mkl-can-next/testing v6.8-rc2 next-20240129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-vendor-prefixes-Add-cast-vendor-prefix/20240129-114752
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240129031239.17037-4-william.qiu%40starfivetech.com
patch subject: [PATCH v1 3/4] can: cast: add driver for CAST CAN controller
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401300313.9DPa2nuW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4a39d08908942b2d415db405844cbe4af73e75d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300313.9DPa2nuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300313.9DPa2nuW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/cast_can.c:352:5: warning: no previous prototype for function 'ccan_get_freebuffer' [-Wmissing-prototypes]
     352 | int ccan_get_freebuffer(struct ccan_priv *priv)
         |     ^
   drivers/net/can/cast_can.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | int ccan_get_freebuffer(struct ccan_priv *priv)
         | ^
         | static 
   1 warning generated.


vim +/ccan_get_freebuffer +352 drivers/net/can/cast_can.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
