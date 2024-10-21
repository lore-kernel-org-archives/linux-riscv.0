Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6A7D3C53F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 06:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSk7y2hM3nRjeYcmHNz4KMT0H/OGgNtEjlAE3WoxXmE=; b=TvVYjaEdQ1z/kn
	rMdUMW5BJ/zHpYWuq71uILtBvqydcC7ec9lMpsKQbzYtJn7Qz0VCCEupOJXGNHSkWL3EfWA8v459b
	Hw1VrxYHjGFZQ/abwiBJaXJBX4y3i+pS97Cpqnnur5L0I0PloXprG1eu1BRFnDjvjhIBvPvNZ8k8S
	17Hchrh+8JzqnzF1god2VkcuxIJ+hulXOT1dBrVHGWEcc49rMcMato1I73M8PVvToY6NwOyich8PD
	5ovKLA/Z+cT4rF/CDmT5djk/dPbUaiXbrOZ4lywEiHbSKbvjF2ZiOYQ2ckCq1W1KB2jXdG/jWpO4c
	kxQXtkEJ2ZtzWhNv1KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2lVE-000000069kU-3wgz;
	Mon, 21 Oct 2024 06:02:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2lVA-000000069iM-46jY
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 06:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729490569; x=1761026569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vu4RT3On7XnbTi5GEYXuD7VfT612YLOO9q2H7/dwXMk=;
  b=it4XXUveHkGElbmpZX7T3OLz73cL61fk/hn7F5ySLQF2XPTktzyLps3/
   /ZHMbVB3irKUof/Ga2D3Sr8uKdCUaY8eop5wUHAJM7boWMSSrbo2+kZIz
   YDlT76hdT6pQp4EqFkkouyF7q9Nm8bFw0fNn9ob+aWxcwIWu1ewjQoBj6
   aU9FKatrdKwwR+nmsd+ajO3jiFMOqDrDtwdwe5BeUqbt2QWQ709z8D03j
   Gr10+8ZlEBWQjJu3KtoFverXKirrt6GRlKwe5hnoutTPBRMyX0j60PnPY
   6JJqQqWbxIMuAQ64O/i0cBhvsZIEoU9mbs4eHpirjOJgQa9GmwBFYleZ3
   g==;
X-CSE-ConnectionGUID: qW6ycpOnQGm4PAfz2gxcZg==
X-CSE-MsgGUID: IS3LqUinTyWF73J344Steg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32641222"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32641222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 23:02:48 -0700
X-CSE-ConnectionGUID: 3RVbadbzQXiJFfRCWoMknA==
X-CSE-MsgGUID: Aho/sbD2QMWKcyndR5WT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="84214852"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Oct 2024 23:02:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2lV2-000RFj-2h;
	Mon, 21 Oct 2024 06:02:40 +0000
Date: Mon, 21 Oct 2024 14:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Message-ID: <202410211310.9jsZOb1L-lkp@intel.com>
References: <20241020121030.1012572-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020121030.1012572-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_230249_113254_E6C39276 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on sophgo/for-next sophgo/fixes tip/smp/core robh/for-next linus/master v6.12-rc4 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-interrupt-controller-Add-Sophgo-SG2044-ACLINT-SSWI/20241020-201209
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241020121030.1012572-3-inochiama%40gmail.com
patch subject: [PATCH v3 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
config: riscv-kismet-CONFIG_GENERIC_IRQ_IPI_MUX-CONFIG_THEAD_C900_ACLINT_SSWI-0-0 (https://download.01.org/0day-ci/archive/20241021/202410211310.9jsZOb1L-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410211310.9jsZOb1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211310.9jsZOb1L-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_IRQ_IPI_MUX when selected by THEAD_C900_ACLINT_SSWI
   WARNING: unmet direct dependencies detected for GENERIC_IRQ_IPI_MUX
     Depends on [n]: SMP [=n]
     Selected by [y]:
     - THEAD_C900_ACLINT_SSWI [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
