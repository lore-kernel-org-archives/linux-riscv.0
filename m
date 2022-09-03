Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C660FECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn7cKJd4DCqxyOb2h4/75F/5M9hZLkbT9rcWsDs/2a4=; b=mKDPBBcculGere
	FF3Mb2DyJ0yKJfWvbQWzpXtFJFfMb/v2g4tyDls9Ejw/0chwiDcnRwUUXuepWowaXnR4Qv/RRu1Ez
	ty/VRYR5tHeszWmm6Lj0/VkXQ3IECmRA/xzASAu8gWMshh/Vt3/91GBz32axDqjUCh+mqSfd8qFp3
	+vdHfMFsAevvezV9AfWHjAlPEMOqhGXcVxzPmRYtFBh+Gg/eXVZF/Ho/9IZ66e5Z79n1o3PELjlNN
	YbbROk9tCcTBNX8AeSwpWg0D9Fn4jwLX4NbR4QKeng/30DshnHLmTC0jWAUfKwJJdB22VqOkpCwUm
	Ekr7Y8vxIZmm7IGPp/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUXGT-00EVK4-AB; Sat, 03 Sep 2022 17:49:05 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUXGQ-00EVGT-7g
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 17:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662227342; x=1693763342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vBns7j9FUt8fPAWHIlfUjC3o9Q8+8wFBJc0wtm12Fns=;
  b=g0wsutujJ+NW3cx3ITlhxgNalkc4T+/oeXubPyA3/+YrqhLFvadN1fmt
   UQGR4tdUFjrmJpes2UGWH2mwifqqN7Afzd8td+Fkx/oUVZlDKsfM/uvoN
   W2kA+cZ39rk6yyj/hJAis2OklK7oJetkikUqavX3q2EJ/8+PwDpMcYeZ6
   R/7dfVrfLFZ8Fmr471kU1iVezBFc5e2w0yAB/YBJE5x5WWYzN9Iu2NFh8
   6yQMiQVEwm93FTYI3HT+ebfC3h7igkDOdbR2C5jTw65TTbpafBprxQQRA
   LJc+55FO9852dnGKmR0ssfeP34/AfVxfQYtetBR+bJsS5JSQAfBQqdLJk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="294915170"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="294915170"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 10:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="613359713"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Sep 2022 10:48:55 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUXGI-0001yL-1a;
	Sat, 03 Sep 2022 17:48:54 +0000
Date: Sun, 4 Sep 2022 01:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
	tglx@linutronix.de, luto@kernel.org
Cc: kbuild-all@lists.01.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 1/3] riscv: convert to generic entry
Message-ID: <202209040122.Nhovi9f6-lkp@intel.com>
References: <20220903163808.1954131-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903163808.1954131-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_104902_320405_79B6E920 
X-CRM114-Status: GOOD (  12.43  )
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

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209040122.Nhovi9f6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8390e92d0bcc635f457df18c8c1baefc78a94e48
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
        git checkout 8390e92d0bcc635f457df18c8c1baefc78a94e48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/signal.c:275:6: warning: no previous prototype for 'arch_do_signal_or_restart' [-Wmissing-prototypes]
     275 | void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_do_signal_or_restart +275 arch/riscv/kernel/signal.c

   274	
 > 275	void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
