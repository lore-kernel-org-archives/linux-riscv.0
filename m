Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A57FCCA473
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkiuu+cYgdby6CZSC4NdNDBNdMeMaGGmVnzIvQxilJo=; b=lmWzuT4eCcBGoM
	WgseNcrrGlAy0U06Gg+zSAjZwmKBZwjoMkNT1u0HoW+8M/9WRsKhBJ1WgKdL0f+AuTzChwcj0vvIO
	pizW2Doumvo7jBevlP9FuJKin5QP17iSmlkEr/5v7gtRUzWFgZXkMX9iBj445tqhtneVXXm4GKvYz
	2Ke6yYHq1ptNf7440YRqhfGypUZ7tq/y/lkCrQ/0KGH3PQwsu7+7h86qzvVoVkQ31mDSNas+kUtvj
	Zm/YN73UKPDnxIpsmw21krIvD6hfkrtQLvkKRE8mBYLL3ffO2GLctXu3a7dTHQkcaVKWXek+Yb9ql
	lfV9uMkM1V+bmifHe/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YTK-00G34X-OA; Wed, 15 Jun 2022 19:14:34 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YTI-00G33N-Ka
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 19:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655320472; x=1686856472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhJp3BBzKkSAhPSokH+1OsWLVBR4UOySK6LdL2s0mZE=;
  b=l8lWJg5guML6EFnDgQKW19M7r8qSt8NPl8+1PWt77d/mi7f5JKveIINI
   +uE02ravk9iHPMcZiMQWPf6Fy0VxVD1uCk/84MnLJ00v3j5IPsrKvSvPw
   OTUK3iqaTb2ymPd3/DwYVdHjoAo+HjagDjGnLxva8NGG+4P4iZOvZ6Jm0
   cZCDr1+e7gAfXmln7yReW0lvamxXu/FaIjzfnF/SxObLYBGP1P2wDBzey
   uacc8lVFE0WaLJ2NVFxcsqE3zNegUOh2e+IIcYrvGLkmsQM4E/c5PTrOr
   nYommTItultXXwXGJqF7uSfDb+0fMelterP9F5VQEZlsQNsT1W7iysRUt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340738409"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="340738409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 12:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="612884393"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2022 12:14:27 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1YTC-000N7j-Nm;
	Wed, 15 Jun 2022 19:14:26 +0000
Date: Thu, 16 Jun 2022 03:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>
Cc: kbuild-all@lists.01.org, Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <202206160239.6lkHbYaU-lkp@intel.com>
References: <20220613111759.1550578-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613111759.1550578-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_121432_823657_634DF2C1 
X-CRM114-Status: GOOD (  10.09  )
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

Hi Conor,

I love your patch! Yet something to improve:

[auto build test ERROR on thierry-reding-pwm/for-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20220613-211851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220616/202206160239.6lkHbYaU-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4451a8420f9fd16ee9a0801fcf02f1ec04bb8ab0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Conor-Dooley/pwm-add-microchip-soft-ip-corePWM-driver/20220613-211851
        git checkout 4451a8420f9fd16ee9a0801fcf02f1ec04bb8ab0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_apply':
>> pwm-microchip-core.c:(.text.mchp_core_pwm_apply+0x290): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
