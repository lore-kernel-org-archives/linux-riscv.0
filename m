Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF7C47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qy92HfIMAevcEaZK0R5nLftqb3E8oP3XR6rs9KOkjcI=; b=C9CN2h7n6/wvng
	J7NyEdjdB6DvfgA5yImJ/xbn3cbgW1tG46QoKTg24MTwb+b7e6V3CbUyIdw1M+3XpezawJ4f94IPb
	SBLT779+K+g2yJh+g/v3rscw3tuwb6RxPwEwB7Yn1FRfzBQL2UTBAvfvoX+NjrNg2w3ofMmeJ0vEh
	90VVAIhbDIsXvIR9tKmX1fXmjPtC2FpuAsDkFnd0Ellul6iB/bxLHu1W5YIuK2riwDiOUFLPMM/PZ
	j200vVuWxdxg2uN0t7ShNNNckhWT4KoHEq28yHzt6M+ZSjwuhIqI9od6ENi3DEHjHmBqcIaaBxYUV
	+ZY0Wrh23ZEIzBLf10tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUabB-0000000EXBj-28OU;
	Mon, 29 Jan 2024 22:59:29 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUab8-0000000EX9n-1xln
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 22:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706569166; x=1738105166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNV9jQ6id/1L1Zg6Yr7l1mZgaZ5CjsKCXyjXTnXM8ss=;
  b=eNoXwsyf4plLVnOyACpmgVs9uhUSrnKKEEu2vM0c9qxHvGBRL6//vwWD
   xviTk/pV248y+Rw/+MKXORqe8GdUcIs7HRCKMZSzMkHK/ypqDU8A8CsUj
   YRvX6NZ1kdz2GWaWU0zvosyCWXKfC4g2tiFnatA8idvK9QYrE2xsC/Llb
   IGzXAT4zubpdWm3g/olHrtOKUNNyiiJ0DRxOUz1Kj1ouZ2F3jR0PmeCk6
   AHLs+tcml2CRj7xXXo4YriLc0Td+9bejVFj2b/aGSDN85e+RIhuVG8vZU
   afaHRnfiXIvsYeROdNm/SILYa7lZ/kgRoZqg6icuy/H9CSfS7Jsptc0dj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393543929"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393543929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 14:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="878235933"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="878235933"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2024 14:59:17 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUaax-0004hM-0B;
	Mon, 29 Jan 2024 22:59:15 +0000
Date: Tue, 30 Jan 2024 06:58:18 +0800
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
Message-ID: <202401300618.Sp2FQ2Z7-lkp@intel.com>
References: <20240129031239.17037-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129031239.17037-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_145926_648445_1C126637 
X-CRM114-Status: GOOD (  13.96  )
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
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401300618.Sp2FQ2Z7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300618.Sp2FQ2Z7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300618.Sp2FQ2Z7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/cast_can.c:352:5: warning: no previous prototype for 'ccan_get_freebuffer' [-Wmissing-prototypes]
     352 | int ccan_get_freebuffer(struct ccan_priv *priv)
         |     ^~~~~~~~~~~~~~~~~~~


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
