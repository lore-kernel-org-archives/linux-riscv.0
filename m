Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AC6C282EC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6E01IoKitwwDFZ/nI6V+UIR88nKyF34Crs2hCOW2w4c=; b=Bj0M5Xs7c6vObw
	JFI42INJ/RXjTT2iCfU+TmcON7RKmSuYyc3zFMzifFWiPY00Tr77MShYj+wCWz66Oby2DTOC2l5+e
	4Fq7TW/lJdeRRt+KgS+BgaP7FmAoX/cAdXzo2PiEGgwSzC6YRQDWANI/c+4JMseOxNUcUmzjACcsp
	r6SI3cZO1+jxqxGaX9aft5KGs2SV4b7PxLgmV/4kAGRDcO9UupTkY0mFRj2deYWWFjcD/CY/x8F7P
	BvQ98mFuquYb0xJKwTCoAYZUHmzLECs9t3ZIk56ei9Bl39HGaRlNlTdTZiZ4otN4Ykb37Lx9ngE0J
	whSAqQwHvbyBJycU+YOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpymJ-00000009fgL-2qc6;
	Thu, 06 Mar 2025 00:07:55 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpymH-00000009ffs-0JOC
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 00:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741219674; x=1772755674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XmkEAc+/w2Dkxu/1TNTvMeosZ3tOVAg+QYljZPhFBjc=;
  b=Fs41zXv1cfTQ/9UKidLqeSBmSM44jBUWriYV6O2UGRz0kXoxEUOqyoxE
   E/JDICoAjQd+fYzgL4EelDyTb8SulOdeN6fZRbRn93lvho0bMc6VftU8C
   TVu83OscSQhJkuNk9lf/sZ+5yQzhogxsLfWyn0HWbkoj0RwbMNtLUWXUG
   sAQQr2j8d9jSnAOvX5KYDdYa353cObzwiw2b0Vd15w9y2q81jE8PLPgBr
   J1XAjCRm7I25L5EIBbZ19Lyn5qSrtV9SqcO7JJd1nIRKgOs3X85HN+zWZ
   1Xr1IL928DV9ZmQeqDKxAaWxe7e+xkc+OiOpF2yDbFssvckJ0Oassm7MJ
   Q==;
X-CSE-ConnectionGUID: GcbQZQMVTBi7leFitoolgA==
X-CSE-MsgGUID: 5YUtzhOJSrGpiSNN1uIPgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42341123"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42341123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 16:05:55 -0800
X-CSE-ConnectionGUID: QY7iUrB3R0C/1HrbrZxxLg==
X-CSE-MsgGUID: 3ucTVqz5SF+bWZZ35HJ1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="149619719"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2025 16:05:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpyju-000MLA-0L;
	Thu, 06 Mar 2025 00:05:27 +0000
Date: Thu, 6 Mar 2025 08:04:23 +0800
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
Message-ID: <202503060707.a8CwuQbH-lkp@intel.com>
References: <20250303145901.446791-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303145901.446791-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_160753_152612_D3F1B048 
X-CRM114-Status: GOOD (  12.33  )
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

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/dt-bindings-firmware-thead-th1520-Add-support-for-firmware-node/20250303-230224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250303145901.446791-3-m.wilczynski%40samsung.com
patch subject: [PATCH v1 2/5] firmware: thead: Add AON firmware protocol driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503060707.a8CwuQbH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060707.a8CwuQbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060707.a8CwuQbH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/thead,th1520-aon.c: In function 'th1520_aon_init':
   drivers/firmware/thead,th1520-aon.c:206:20: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     206 |         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
         |                    ^~~~~~~
>> drivers/firmware/thead,th1520-aon.c:206:18: warning: assignment to 'struct th1520_aon_chan *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     206 |         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
         |                  ^
   drivers/firmware/thead,th1520-aon.c:219:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     219 |                 kfree(aon_chan);
         |                 ^~~~~
   cc1: some warnings being treated as errors


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
   219			kfree(aon_chan);
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
