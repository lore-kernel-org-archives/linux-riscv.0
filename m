Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63315C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n16GbsGp1PXDQMGGnD6p+lVhnRThkwr3/lSnwyX4j/w=; b=EK5eqv0++8EY9+
	W4mOkBC6x70MuMO0jJKc+YTeftVPIvPcQQ61hEB5wCZpPgTpkEyn5meVLfc/DY/Xx2VGxBK4m7UEd
	ZkwmOZPqTbC9fioaVaX+7Ns/pOWdvadUUU/GqHNlCG8aRwYWvqjXxACMVs8wd8J8gKHcx38tTgqUJ
	/OFOuB2v7gTxh6dBYSpaQ6J0eWcL1Xaty8Q0YzkPAOuaFzNOHqKGqByMT74zl4KPlNdRWeM63mIaS
	d0dJ/M61f6GeUB5tQ7ephv9zy53TJkNpjRT/UoYuThMpYQawaFA4ms0CNoUuB3Cs6XmRcSCQpKC7X
	AGiPyUwlLhKTuc9B44Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5BoZ-00Esl4-2L;
	Mon, 20 Nov 2023 21:28:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5BoW-00Esjn-2E
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 21:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700515696; x=1732051696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgbT9umBX5qx6FDkSEMaq0vWexN6eBlM61WrBeIo+1o=;
  b=Kc/2qkpVwQzYNPZmRNt9+S08RQQZpJ3Q2c3A9pgugtA5heSNecIcU0Nw
   pM0L6QadG3mGKS+Xgx6b9cJNoSdSRGlbc5UyDnEUjwR5k9LNpStH6w/RT
   L5sz0GljlaqChGxZBk9g40/HJwVkZImDM40Hamg0RYXQsmMS5y+EY+Rm4
   b1v8YX1JRlhNxdGfn5ipocKDw30uY5IKrwVTYRyRKpD8ICPWSyr3FmlXz
   i2WO07vvGO1Cqxn+74LnV84xhRK1SKpzshRx4jV75RCQR1wPj4Dx4cz5Q
   U7n4rYE6QngvKT/kaCxgaprSQZVUfwtzcJSYCAsvruz6qPqtLJHCblWMJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4823363"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4823363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7688814"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 13:28:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BoN-0006wQ-3A;
	Mon, 20 Nov 2023 21:28:07 +0000
Date: Tue, 21 Nov 2023 05:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Message-ID: <202311210512.n4evtQf6-lkp@intel.com>
References: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_132816_759792_77AE5699 
X-CRM114-Status: GOOD (  10.75  )
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

Hi Heinrich,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heinrich-Schuchardt/tty-serial-RISC-V-SBI-earlycon-via-DBCN-extension/20231115-213355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231115133127.107575-1-heinrich.schuchardt%40canonical.com
patch subject: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311210512.n4evtQf6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210512.n4evtQf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210512.n4evtQf6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/earlycon-riscv-sbi.c:11:10: fatal error: 'asm/sbi.h' file not found
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +11 drivers/tty/serial/earlycon-riscv-sbi.c

27de1f541f1f91 Anup Patel 2018-12-04 @11  #include <asm/sbi.h>
27de1f541f1f91 Anup Patel 2018-12-04  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
