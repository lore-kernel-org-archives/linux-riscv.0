Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC02C282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoU4Pv7w1FWgxHeaNwRL6xzTfHNjrF2D3n8Y856ahpw=; b=kW/9DQ9Kgx67Tx
	s87DlfwyCvkRaFcyOyfTJC8O0+z597akG0jqzXI4+pIA7H2p2Zoj2KkBjKvkr1pL4YWlAIaxCQK2v
	+AwkpT3nAbyiWF6pwjmB3Er9+DepqZq9Oy1VR8MerSCCwF3kXX5C8+yoWf3t3hURjYtMMaP9shkMJ
	xPENsbm86x/7IzWbN14OhpNXA0/UUC3DM0JIN2K93SxQ3FEFQmjaJ3tP1CuyhOjKB88dXal1z+dN4
	pKLbx5it7r1p6G4h8dHC8dML3d1P1Xg/bNCat/wSpnJkvKmjHVDfqly/lK07D25rTDKjDZOeAvJJC
	Yt4A614/hyjQwGtP5gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBCc-0000000B2tp-3qC6;
	Thu, 06 Mar 2025 13:23:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB5Y-0000000B1Yu-0Rwc
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Mar 2025 13:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tAc/INlPDXeHYv8dCSOPToCNodWJlcOuzDrIrSEgZec=; b=Hgp/XPvZ/TLsDs68DlKW3tNtLS
	sxsOM6nCAJNXIvxJCtOjuc619t5o9K6NXqKduqtcRAOVj+4Wnn2h78ZR16UTm5Q5A/MYw5ELgi8wN
	sLdssVltENRXqopmoz1JlSppJmbA3pMT9jRiqH2WVDg2ftM6hXHUR0uAgPAEcQYk9xTFxIH6gSCBh
	JABAEb2DeAASaCMt8z2HH9r2giemoYytE53ReKby5/EUzUKJiqkgPJ+fn9/hxhB+Y0J4VoG+d8iVl
	aWP+DcT4oItQ4WY69qG4N4GbRegMMye7bvpwA5S1XbYDvKvJHHrJF20bRL/W93F1bcxYGvHW6JX4X
	fWjqgh1g==;
Received: from mgamail.intel.com ([198.175.65.21])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB5O-00000009cOu-0pz1
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 13:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266986; x=1772802986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ZZqQrq8U/ip7fmy3k0FKs7lmTjCF1yWU9LYT4w/A+Q=;
  b=lkgTd+0+RnN+OnnsT/1lOGwuNe5hIazeddiIGO18fmUyeitsiL0BZzQU
   n7xUwNR/LP5GnPg+9D11OakNqKzQneWRLpNHebIyvMh5L/PpM6YqKbnd/
   Fd5zwVvnTzPfmeYZQtI7fZoRgxTmfP9eLR5X9d5khh0ilyuxIWUYRHClq
   ey7fTHta52xu4Cr+nf13llpRTu6rgcKzhoHagHn8ZBPynTnEB6GDtoebs
   fliqaP98YzUvPJZxnpDbQZ/6vnT7HzDYu7eZkNF6l6wOaaiY5lGujPDIC
   VK8Q18qAGqSpvYjL+UlQoSFS7rmch2d4RYVt5bpwEaeiRIMvFgIF0ZlBU
   A==;
X-CSE-ConnectionGUID: 5FX/ECmYRZmehlzV4ugTPw==
X-CSE-MsgGUID: XElymg9ITyWsq9XuirNbew==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42188744"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42188744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:16:19 -0800
X-CSE-ConnectionGUID: +P/ybUpGQnKelY8wY6WiBg==
X-CSE-MsgGUID: BHWOhwHVSMGSXeKOi8Dp8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119519929"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 05:16:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqB5A-000N5y-0f;
	Thu, 06 Mar 2025 13:16:12 +0000
Date: Thu, 6 Mar 2025 21:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org,
	m.szyprowski@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v1 2/5] firmware: thead: Add AON firmware protocol driver
Message-ID: <202503062029.bHmgxF2Q-lkp@intel.com>
References: <20250303145901.446791-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303145901.446791-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_131630_381358_557175D7 
X-CRM114-Status: GOOD (  13.80  )
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

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/dt-bindings-firmware-thead-th1520-Add-support-for-firmware-node/20250303-230224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250303145901.446791-3-m.wilczynski%40samsung.com
patch subject: [PATCH v1 2/5] firmware: thead: Add AON firmware protocol driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503062029.bHmgxF2Q-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062029.bHmgxF2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062029.bHmgxF2Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/thead,th1520-aon.c: In function 'th1520_aon_init':
>> drivers/firmware/thead,th1520-aon.c:206:20: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     206 |         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
         |                    ^~~~~~~
>> drivers/firmware/thead,th1520-aon.c:206:18: error: assignment to 'struct th1520_aon_chan *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     206 |         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
         |                  ^
>> drivers/firmware/thead,th1520-aon.c:219:17: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Wimplicit-function-declaration]
     219 |                 kfree(aon_chan);
         |                 ^~~~~
         |                 kvfree


vim +206 drivers/firmware/thead,th1520-aon.c

   185	
   186	/**
   187	 * th1520_aon_init() - Initialize TH1520 AON firmware protocol interface
   188	 * @dev: Device pointer for the AON subsystem
   189	 *
   190	 * This function initializes the TH1520 AON firmware protocol interface by:
   191	 * - Allocating and initializing the AON channel structure
   192	 * - Setting up the mailbox client
   193	 * - Requesting the AON mailbox channel
   194	 * - Initializing synchronization primitives
   195	 *
   196	 * Return:
   197	 * * Valid pointer to th1520_aon_chan structure on success
   198	 * * ERR_PTR(-ENOMEM) if memory allocation fails
   199	 * * ERR_PTR() with other negative error codes from mailbox operations
   200	 */
   201	struct th1520_aon_chan *th1520_aon_init(struct device *dev)
   202	{
   203		struct th1520_aon_chan *aon_chan;
   204		struct mbox_client *cl;
   205	
 > 206		aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
   207		if (!aon_chan)
   208			return ERR_PTR(-ENOMEM);
   209	
   210		cl = &aon_chan->cl;
   211		cl->dev = dev;
   212		cl->tx_block = true;
   213		cl->tx_tout = MAX_TX_TIMEOUT;
   214		cl->rx_callback = th1520_aon_rx_callback;
   215	
   216		aon_chan->ch = mbox_request_channel_byname(cl, "aon");
   217		if (IS_ERR(aon_chan->ch)) {
   218			dev_err(dev, "Failed to request aon mbox chan\n");
 > 219			kfree(aon_chan);
   220			return ERR_CAST(aon_chan->ch);
   221		}
   222	
   223		mutex_init(&aon_chan->transaction_lock);
   224		init_completion(&aon_chan->done);
   225	
   226		return aon_chan;
   227	}
   228	EXPORT_SYMBOL_GPL(th1520_aon_init);
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
