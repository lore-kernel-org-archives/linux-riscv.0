Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B020C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW4hyWGI6KWHLusMZnqs5caVfzKBCbriYNrfiTw+/AI=; b=KK0Rgl5qW8ujoa
	1OCprI92N+7PTs2xFW4yQMhp+boSTojxuc9xFFRV9euFkwRHwY9eu4KShCRnxPDeIhVEuG+F9K8kn
	87Qv9MW++r7oz+BMxAIgqFtIzEJFmdF5HyiubIoEb9N8dGrLn3+Lsagi9rXGOzdvLKGceLursZ1hJ
	+XYZKSf+cJGzDHnVCL0EpbtfQTLjHgfb6FX0ZHH4O3MUz3RVSahEM40LF5TweMI/EwniRRfHsQZfr
	8HbS+SziyDk93GsTmgr9w9XsEm/2WCq4HIwVI15Qjo8moN0PhnYcxbiFDm7nNSecFI8tXpfMYqmLN
	XGQjsTUYCZ+jqJK/jFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHib-00000006Tlr-1146;
	Mon, 15 Jul 2024 09:10:01 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHiX-00000006Tiw-2HOC
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 09:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721034598; x=1752570598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9VQl3YvtCVqzJrmMa8ve+rPTBLk5zbjsSx4SZChw0R4=;
  b=BjvmnQBZ0ByckRoyCunjd1FHUNnenduh6hdAZ8g7iy5knYN4HQGe09O1
   W0VG9aVT3UA3YO3uwiypo4oPxyvqzxyncG7S9FoXlyITICOEH6gY1WVcv
   jXdcJRSAk7bvJPNHh2HxyXO9LTYeBkvj5qXT+MUfP4pBaO5VNKC0p8vnB
   v8/4xfLT5CeNJcd5Ft3WeubmE/j7MSXoR1Ln4fu77Je1o2r9mX1eRj32X
   FmX6nWndN0cEle3CFQn5zISLHshaa180h/3ozka0fSvw0V03i6/RVFt3p
   QUgfx5161haLH+nEpN7xaQXVgrxA0MTWTVTDS1b7Mt6Ep795aw5JAnKc0
   w==;
X-CSE-ConnectionGUID: UhCc34rKRd+NLHiuXynM1g==
X-CSE-MsgGUID: VsE7xmbzQnOgE1r4Qp84pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18247922"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="18247922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 02:09:54 -0700
X-CSE-ConnectionGUID: rFW3txrQRs+va6vRHZPgIg==
X-CSE-MsgGUID: S8ahSpr1RMy1P74Ohlqc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="54738169"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2024 02:09:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTHiN-000eAQ-2x;
	Mon, 15 Jul 2024 09:09:47 +0000
Date: Mon, 15 Jul 2024 17:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: Re: [PATCH v2 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
Message-ID: <202407151649.ExTr3xXL-lkp@intel.com>
References: <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_020957_679177_C5B8CFCF 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Yuntao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10 next-20240715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Dai/dt-bindings-mailbox-add-Sophgo-cv18x-SoCs-mailbox/20240715-003952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/SYBP282MB2238F93565D20F0A5F3EEB6BC4A02%40SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
patch subject: [PATCH v2 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
config: powerpc-randconfig-r113-20240715 (https://download.01.org/0day-ci/archive/20240715/202407151649.ExTr3xXL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240715/202407151649.ExTr3xXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407151649.ExTr3xXL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/cv1800-mailbox.c:56:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *data @@     got unsigned long long [noderef] [usertype] __iomem * @@
   drivers/mailbox/cv1800-mailbox.c:56:62: sparse:     expected void *data
   drivers/mailbox/cv1800-mailbox.c:56:62: sparse:     got unsigned long long [noderef] [usertype] __iomem *
>> drivers/mailbox/cv1800-mailbox.c:78:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800-mailbox.c:78:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] [usertype] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:78:22: sparse:     expected unsigned long long [noderef] [usertype] __iomem *addr
   drivers/mailbox/cv1800-mailbox.c:78:22: sparse:     got unsigned long long [usertype] *
   drivers/mailbox/cv1800-mailbox.c:102:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mailbox/cv1800-mailbox.c:102:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] [usertype] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:102:14: sparse:     expected unsigned long long [noderef] [usertype] __iomem *addr
   drivers/mailbox/cv1800-mailbox.c:102:14: sparse:     got unsigned long long [usertype] *

vim +56 drivers/mailbox/cv1800-mailbox.c

    47	
    48	static irqreturn_t cv1800_mbox_isr(int irq, void *dev_id)
    49	{
    50		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    51		size_t i;
    52	
    53		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    54			if (mbox->content[i] && mbox->chans[i].cl) {
    55				mbox_chan_received_data(&mbox->chans[i],
  > 56							mbox->content[i]);
    57				mbox->content[i] = NULL;
    58				return IRQ_HANDLED;
    59			}
    60		}
    61		return IRQ_NONE;
    62	}
    63	
    64	static irqreturn_t cv1800_mbox_irq(int irq, void *dev_id)
    65	{
    66		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    67		u64 __iomem *addr;
    68		u8 set, valid;
    69		size_t i;
    70	
    71		set = readb(mbox->mbox_base + MBOX_SET_INT_REG(RECV_CPU));
    72	
    73		if (!set)
    74			return IRQ_NONE;
    75	
    76		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    77			valid = set & (1 << i);
  > 78			addr = (u64 *)(mbox->mbox_base + MAILBOX_CONTEXT_OFFSET) + i;
    79			if (valid) {
    80				mbox->content[i] = addr;
    81				writeb(valid,
    82				       mbox->mbox_base + MBOX_SET_CLR_REG(RECV_CPU));
    83				writeb(~valid, mbox->mbox_base + MBOX_EN_REG(RECV_CPU));
    84				return IRQ_WAKE_THREAD;
    85			}
    86		}
    87	
    88		return IRQ_NONE;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
