Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26FC2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 00:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kn4c58k6SCkImR/J815/oKRrG76VQ1jnump3aH+n9Q=; b=1iGcbygt6z8Hsy
	P0pXMfO8B5MskGNvwkXPmlvmnEg+Ca240OMihx+3MjpVPjb7Hm9+zZQBproR14UTG2lZ4cL/ZmQVm
	NXUN1UXBvNILHBIPBmlfa4nrM4pmdoJnuRZtZ7NJN19/HWuuSTj2CBS3ZFHlyL3DFZ5jfKtRsKWCN
	8dv5CS4kzE0pQ9NHDgj1Xv+lEv7RQ/pYWyO0ZKNkYLuiI8dXussUTALPq/Ft83q455bQUCEJZHeG7
	OHf+dHk6p1c6QWqNVowPAm0B3WJqq4/1i6cvUFCDhb/mnXlCGhbHXWnHXjKa96lnFrsahEJxfw76i
	gfJBufq1zoiZrCOdDC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKS2a-00000007CnO-11DK;
	Fri, 21 Jun 2024 00:22:08 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKS2X-00000007Cmz-2Z4i
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 00:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718929326; x=1750465326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5oOZHXU+IU0z5IfE4+M02oaOKdsfUbdPWbbLMxbgBY=;
  b=maP0PoYscxPG82n+H+ZjD+6bvCxbber356XXMr5yiRnFi1+KwoEldT77
   NkH9RGX+Vd3C2pTE8RWPMqXAGM5+OShxkmaqnj69+1DLFko1SLL91H/8X
   CEpCl/0yihRNbJ5YjzFvkcBAXaV1/330HCTSBzn0nM6eRYoMrRH4D7zBP
   mxze8XcJnCgCaRdbIrOnXGojV/nMvU+7q9EWOx0KQgA3FshOcgw6TvLEZ
   kz159ZzWVz35NDX61P3fgDjo3tBXjGYficU8an7QgYKB3ef4tLa9w8uVI
   bB8GAm3wAgRr7JeZU8rRSMWEmFcHSXktWsbASV2NjQq3Zv03p7h1veK6X
   w==;
X-CSE-ConnectionGUID: e1OCiQTqQteYmCLIh/9lQg==
X-CSE-MsgGUID: 3AyoTs8RSa+a0gR60OCHhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33403644"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="33403644"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:22:05 -0700
X-CSE-ConnectionGUID: 1vsqdwxiTimYX59IXwOCkg==
X-CSE-MsgGUID: iV7byUPPTrWfWCnKRy86tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="43094446"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 17:22:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKS2Q-00083Q-2G;
	Fri, 21 Jun 2024 00:21:58 +0000
Date: Fri, 21 Jun 2024 08:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: Re: [PATCH 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
Message-ID: <202406210836.gWHxzdUE-lkp@intel.com>
References: <SYBP282MB2238F93AB57A398E322644C3C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SYBP282MB2238F93AB57A398E322644C3C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_172205_847337_AEF16CDA 
X-CRM114-Status: GOOD (  13.60  )
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
[also build test WARNING on linus/master v6.10-rc4 next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Dai/dt-bindings-mailbox-add-Sophgo-cv18x-SoCs-mailbox/20240618-232307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/SYBP282MB2238F93AB57A398E322644C3C4CE2%40SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
patch subject: [PATCH 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
config: powerpc-randconfig-r121-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210836.gWHxzdUE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240621/202406210836.gWHxzdUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210836.gWHxzdUE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/cv1800b-mailbox.c:66:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mailbox/cv1800b-mailbox.c:85:22: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800b-mailbox.c:87:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *d @@     got unsigned long long [usertype] *addr @@
   drivers/mailbox/cv1800b-mailbox.c:87:21: sparse:     expected void volatile [noderef] __iomem *d
   drivers/mailbox/cv1800b-mailbox.c:87:21: sparse:     got unsigned long long [usertype] *addr

vim +/__iomem +66 drivers/mailbox/cv1800b-mailbox.c

    51	
    52	static irqreturn_t cv1800b_mbox_irq(int irq, void *dev_id)
    53	{
    54		struct cv1800b_mbox *mbox = (struct cv1800b_mbox *)dev_id;
    55		u8 set, valid;
    56		u64 *addr;
    57		size_t i;
    58	
    59		set = readb(mbox->mbox_base + MBOX_SET_INT_REG(mbox->recvid));
    60	
    61		if (!set)
    62			return IRQ_NONE;
    63	
    64		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    65			valid = set & (1 << i);
  > 66			addr = (u64 *)(mbox->mbox_base + MAILBOX_CONTEXT_OFFSET) + i;
    67			if (valid) {
    68				mbox->content[i] = addr;
    69				writeb(valid, mbox->mbox_base +
    70						      MBOX_SET_CLR_REG(mbox->recvid));
    71				writeb(~valid,
    72				       mbox->mbox_base + MBOX_EN_REG(mbox->recvid));
    73				return IRQ_WAKE_THREAD;
    74			}
    75		}
    76	
    77		return IRQ_NONE;
    78	}
    79	
    80	static int cv1800b_mbox_send_data(struct mbox_chan *chan, void *data)
    81	{
    82		struct cv1800b_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
    83		int idx = (int)chan->con_priv;
    84		u8 en, valid;
    85		u64 *addr = (u64 *)(mbox->mbox_base + MAILBOX_CONTEXT_OFFSET) + idx;
    86	
  > 87		memcpy_toio(addr, data, 8);
    88	
    89		valid = 1 << idx;
    90		writeb(valid, mbox->mbox_base + MBOX_SET_CLR_REG(mbox->sendto));
    91		en = readb(mbox->mbox_base + MBOX_EN_REG(mbox->sendto));
    92		writeb(en | valid, mbox->mbox_base + MBOX_EN_REG(mbox->sendto));
    93		writeb(valid, mbox->mbox_base + MBOX_SET_REG);
    94	
    95		return 0;
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
