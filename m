Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A497C3ABB6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5EgruCI8hAwBajdKdp/Llte/Cf13l28gft57RHP1hY=; b=xk3Z3DPhQ/+MNg
	gT2weIaBR/9FHXiTm8o1RRM/SgDfefynstFSdFcZHWCyTls4urgjQb22sz+MPaRgiSQgSXjP+XQ6m
	a7HKEEfMx5n/q07ZLtvOU7lLgSqU433RKUl+jvrvrx7M9iv7otJ0xPsDuK1YBy2JY1LxD8rpAghl+
	ntLpsjMtrrAN/2xLnY0tTIDZQfX1VFbBimRLARVmWDy3I3bgPi+YpYE+Zhn2r5SAXqqyAdfj+W2Ft
	Z6F7j5N/Tj8eeyA5PNGW/u9rNY1ZLQEWeDAMvIOqQVO4Im+ekiNuTpG7neYcMNXzhAkoN/u4E9TcA
	kHDhK9kt+syf30EFIOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXw0-0000000EKan-2whT;
	Wed, 07 May 2025 06:07:12 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXvy-0000000EKZx-3ceG
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 06:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598031; x=1778134031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJ3GmIEe0qHJJespiwekgd+syCW0uno2XczVjcXdZcw=;
  b=NW9nVC2StyMnrB0NQggreaB/0PK3fQGVHxbw8xrRw3IpGqz3QOJJNi3z
   Ndj+g+n7w6BFJtczHW51Be8foDuvxEMoSP8BTRlZ7Io49jToa8U9lIwZN
   9J87F00ITjD6LpZWfxmgBelCcMlkfLmqh7cLrbPoNTvjfoMVGNwcx5P51
   fikO2gyhLzZS3cEO9R9bgsUiNpFD5N+R7DbDiTxh+ykYXcm/gAh38jKAo
   2+YiOeoNITU1yRJ5R/Jn12oX+ZUc3FEAmEQ2y6/5DlCnCL3YsYZEa+bg6
   oENEBIEfyWJz7mcH87bl9EtbNUM454zAE1DhUxdTrplMjXXnpaeC7UWv1
   g==;
X-CSE-ConnectionGUID: brpjis4BTRC4K1qpwO9Olg==
X-CSE-MsgGUID: qz1R6Am0TXuioN4oeOhq2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48316405"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48316405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:09 -0700
X-CSE-ConnectionGUID: mYUWIYhbR5efS8YdeLTv+A==
X-CSE-MsgGUID: 8L47qrO8S56HbJmO3Re3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136370562"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 23:07:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079S-0D;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] mailbox: sophgo: add mailbox driver for CV18XX
 series SoC
Message-ID: <202505071325.uHimwt0g-lkp@intel.com>
References: <20250428-cv18xx-mbox-v3-3-ed18dfd836d1@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428-cv18xx-mbox-v3-3-ed18dfd836d1@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_230710_945105_00EC51C5 
X-CRM114-Status: GOOD (  14.44  )
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

[auto build test WARNING on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-mailbox-add-Sophgo-CV18XX-series-SoC/20250428-221604
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250428-cv18xx-mbox-v3-3-ed18dfd836d1%40pigmoral.tech
patch subject: [PATCH v3 3/3] mailbox: sophgo: add mailbox driver for CV18XX series SoC
config: m68k-randconfig-r121-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071325.uHimwt0g-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071325.uHimwt0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071325.uHimwt0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/cv1800-mailbox.c:64:50: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mailbox/cv1800-mailbox.c:89:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800-mailbox.c:88:42: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] [usertype] __iomem * @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:88:42: sparse:     expected unsigned long long [noderef] [usertype] __iomem *
   drivers/mailbox/cv1800-mailbox.c:88:42: sparse:     got unsigned long long [usertype] *
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mailbox/cv1800-mailbox.c:109:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got unsigned long long [usertype] * @@
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/mailbox/cv1800-mailbox.c:109:21: sparse:     got unsigned long long [usertype] *

vim +/__iomem +64 drivers/mailbox/cv1800-mailbox.c

    54	
    55	static irqreturn_t cv1800_mbox_isr(int irq, void *dev_id)
    56	{
    57		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    58		size_t i;
    59		int ret = IRQ_NONE;
    60	
    61		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    62			if (mbox->content[i] && mbox->chans[i].cl) {
    63				mbox_chan_received_data(&mbox->chans[i],
  > 64							(void *)mbox->content[i]);
    65				mbox->content[i] = NULL;
    66				ret = IRQ_HANDLED;
    67			}
    68		}
    69	
    70		return ret;
    71	}
    72	
    73	static irqreturn_t cv1800_mbox_irq(int irq, void *dev_id)
    74	{
    75		struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
    76		u8 set, valid;
    77		size_t i;
    78		int ret = IRQ_NONE;
    79	
    80		set = readb(mbox->mbox_base + MBOX_SET_INT_REG(RECV_CPU));
    81	
    82		if (!set)
    83			return ret;
    84	
    85		for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
    86			valid = set & BIT(i);
    87			if (valid) {
  > 88				mbox->content[i] =
    89					MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, i);
    90				writeb(valid,
    91				       mbox->mbox_base + MBOX_SET_CLR_REG(RECV_CPU));
    92				writeb(~valid, mbox->mbox_base + MBOX_EN_REG(RECV_CPU));
    93				ret = IRQ_WAKE_THREAD;
    94			}
    95		}
    96	
    97		return ret;
    98	}
    99	
   100	static int cv1800_mbox_send_data(struct mbox_chan *chan, void *data)
   101	{
   102		struct cv1800_mbox_chan_priv *priv =
   103			(struct cv1800_mbox_chan_priv *)chan->con_priv;
   104		struct cv1800_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
   105		int idx = priv->idx;
   106		int cpu = priv->cpu;
   107		u8 en, valid;
   108	
 > 109		memcpy_toio(MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, idx),
   110			    data, 8);
   111	
   112		valid = BIT(idx);
   113		writeb(valid, mbox->mbox_base + MBOX_SET_CLR_REG(cpu));
   114		en = readb(mbox->mbox_base + MBOX_EN_REG(cpu));
   115		writeb(en | valid, mbox->mbox_base + MBOX_EN_REG(cpu));
   116		writeb(valid, mbox->mbox_base + MBOX_SET_REG);
   117	
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
