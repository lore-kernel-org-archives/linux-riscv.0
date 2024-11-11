Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17957D2E9DD
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMXrp2i7BfQQb7yt1ob4kZ13FRSOSjSZ2KndcosLS/s=; b=2d54Als+3cbSD2
	POvffUPVZ7rWJGogUxkKzC0cz5kfbFXDBmWRomAhOq35Feg0dA7GcXBYlzg3Efz54VKBPUAKKrc1P
	KKHk+TVld/jEkMUI+AaWmZdCH8854i+41aUNGzl68aPu3afD9GL4om1vmVBdaGJ+hDqdgi/OU9lox
	RqTUuH4sOesHqHOeFleUILYScW9XIGo3Z6mCqXSDfGnWKWD0Cv+lg9CPcP1NlS6i5rWcRFkEZv4yz
	v1flEH4idDyXrdU4q5f1JHumN8MSHf5o2lOhdHNa3Ii/ylH1IrKan3ya9gS2OpN0q8Hy+4PZ0QlTB
	VIKNYYAhRDkWOAIbjWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASbm-0000000HSjQ-00nl;
	Mon, 11 Nov 2024 11:29:26 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASbj-0000000HShh-08s6
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 11:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324563; x=1762860563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TNR8Irg9SFGemO0CwPl7apQbYEX5kMn4q8DdQYuF7iA=;
  b=F2cVjEM0yVJ+gjtNFKSiPJ+EyYIVmpsDOc+0mMrmbGfOHteGbF4VgpJ7
   jfiL/lIGzKcz/VOYCm8DiEw3JvlnD7GmV5gAAKCIWMqhzbKIyh0Fd8os4
   lNjP2vmOhYNJo1SP5A08ufgl5Hnro9Hxh2QbHVHcpeSJUkK0wR47kvjLK
   OAVGIk+BROqrFRjKwXXz8FsWuWyxeo/dc3iY5hdcjDlX1c9K3+L4GdwJ9
   wSwMB7Ch95Cg7kTsdUAmnsbZ1o3N6DojjNLc8lerYhntAeN9BQnnNkmxq
   3VUyMmyqukhDoKEJ87slWR/u+rLrqtU01NcJs/yc9nW1szrSN4OjW5HMZ
   w==;
X-CSE-ConnectionGUID: H62JVruGSsK7W5vLIBN4nw==
X-CSE-MsgGUID: CdYfEvCQQCW+mjKt54Pufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34814597"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34814597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:29:21 -0800
X-CSE-ConnectionGUID: 7qdCuUaNROSsRPwhQ+1cLA==
X-CSE-MsgGUID: TNENUA3HTw6mQg31NfiN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="86992621"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2024 03:29:16 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASbZ-0000En-1o;
	Mon, 11 Nov 2024 11:29:13 +0000
Date: Mon, 11 Nov 2024 19:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, unicorn_wang@outlook.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <202411111935.kqORCWuE-lkp@intel.com>
References: <5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_032923_137724_2072DC9C 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20241111-140237
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang%40outlook.com
patch subject: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241111/202411111935.kqORCWuE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111935.kqORCWuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111935.kqORCWuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-sg2042.c:141:12: warning: 'sg2042_pcie_msi_irq_set_affinity' defined but not used [-Wunused-function]
     141 | static int sg2042_pcie_msi_irq_set_affinity(struct irq_data *d,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sg2042_pcie_msi_irq_set_affinity +141 drivers/pci/controller/cadence/pcie-sg2042.c

   140	
 > 141	static int sg2042_pcie_msi_irq_set_affinity(struct irq_data *d,
   142						    const struct cpumask *mask,
   143						    bool force)
   144	{
   145		if (d->parent_data)
   146			return irq_chip_set_affinity_parent(d, mask, force);
   147	
   148		return -EINVAL;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
