Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E36CF2576
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Oct 2024 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qYzJ61OdZGIXTLlgOh4bqXgJkVqlreStdqfm/DOcj8=; b=MpJ8owCUqZqJqe
	wP8XyTLqLFE6n0jod4xWeVKA14RQ1Uuw5ZHgyWbFDpYREFlZSXwXvIeVUouEzqyDWFgLn3+8MbuSc
	sC8LS1MgglVJYsvktOBzEqRCl8Cd3J53DvcQeiulm/gsPYMSqai9vp7YUoBzP1KspiugQVEL6nMqc
	HpqCB6JLk/Lm4yfJiz2q7lJankSSL16jAMJHhy3avitWSQ3tI7De8fA4qYux8jahrIxSMs88dsCf4
	zeF7RH5X9XDzmJ+I3fVJmmYj+5Noh6BdPKaQ02omkmyQVHOPRo4jOOZyIzCpylXFNZdOJXMf5+F19
	oEDFI4W0ZFAzjIe1eIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t02EQ-00000002xYl-06Km;
	Sun, 13 Oct 2024 17:18:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t02EM-00000002xXi-0eo7
	for linux-riscv@lists.infradead.org;
	Sun, 13 Oct 2024 17:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728839890; x=1760375890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WbydFYAz5ZoV3Bxyd7+H0mgxO9Ixg4pDxJOa+O7WmhM=;
  b=Nqvv+NCAaParZgUw3HgU6ABGiLIPPmj1GSUaInFYvdibpa5nbRcrz3By
   MRkasG+pa7qhA9/eaikxd9A2lrqfrYq1PPLejzZIdKi0ST/jTUMMIeKx5
   Kr7R6QLkKcu0YBVvj8cTQEn0YmaH1+Su2N+Q7mTfdAmrG/68Bj4GMVL3n
   o5G0hmBXgI29guGp8+k9/2GQGf0IWr6kf3C5XxBBFS3HfiZXlZJgSksGe
   8haCAT2PHVRe1WS3u7zoqHhadDlVNDbauzNd/X/WHndzarLo4OBynLpR9
   QEZhoRpwg5OO5FKy6Khgj164XihIBbuc7zc2UpW6Qd/GNzKDGPEQZoVn9
   w==;
X-CSE-ConnectionGUID: 8G3nHn4/Q6CYRZxrBPKMnA==
X-CSE-MsgGUID: ojtS2lh0RsaZUblK8fHrKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28315577"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28315577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 10:18:04 -0700
X-CSE-ConnectionGUID: McE/a4jjRLeIzbeAIDSdXw==
X-CSE-MsgGUID: T73fj4mGSc+AlQGTXdLMtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77228813"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2024 10:17:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t02E8-000EYh-1W;
	Sun, 13 Oct 2024 17:17:56 +0000
Date: Mon, 14 Oct 2024 01:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>, Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Message-ID: <202410140004.WwnrCUnq-lkp@intel.com>
References: <20241009224410.53188-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009224410.53188-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_101810_277937_C7241700 
X-CRM114-Status: GOOD (  11.16  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on robh/for-next tip/smp/core linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-interrupt-controller-Add-Sophgo-SG2044-ACLINT-SSWI/20241010-064628
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241009224410.53188-3-inochiama%40gmail.com
patch subject: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
config: riscv-randconfig-r054-20241013 (https://download.01.org/0day-ci/archive/20241014/202410140004.WwnrCUnq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140004.WwnrCUnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140004.WwnrCUnq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ipi_mux_process
   >>> referenced by irq-thead-c900-aclint-sswi.c:38 (drivers/irqchip/irq-thead-c900-aclint-sswi.c:38)
   >>>               drivers/irqchip/irq-thead-c900-aclint-sswi.o:(thead_aclint_sswi_ipi_handle) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ipi_mux_create
   >>> referenced by err.h:81 (include/linux/err.h:81)
   >>>               drivers/irqchip/irq-thead-c900-aclint-sswi.o:(aclint_sswi_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
