Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051BC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV5EWxyUdo9gyaJ95UcaQLGUdkqOmONH8s3QQy91Uk8=; b=yW8/HhXcmuyXC9
	ZYBguZfHCejURDteTwaDj2BGvVQuQ2HbfS8KunoWD+Rg6GR53Nf0LWUmzIDTFvrtKHczEE/DKj9UK
	zyB665TQ+hTcMxX7yuDKFYCwq76xmf4TgKIhBuF4VHgHHg0K89tw8o/XYCZwGaYrANfkeh5zuaihA
	YQRuX6yzPP22MkttATGBSTVIklzMZJZZuJJtfGf/njx8wwfU0S5/ptMpj1Rw7vBJFbWu4nFX/BdGn
	b8xvXRFOxq9LVLyScsYosQvZi6Z0FlcAF3x8NK02XH1vEoX0APWRcEAJXKXcZp7pqU/UdNeLnaShg
	K/pUn5cZRxPlysbjmRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDAz4-0000000BcUT-1vj0;
	Fri, 31 May 2024 22:44:26 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDAz0-0000000BcTQ-3n0u
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 22:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717195463; x=1748731463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sus4y6UmNR5dzGV4IzmSLrPvvrNGonDyWCvKjZx6etY=;
  b=gPrS8FuPdNYlaLmhuzatC6nzBZuhWsi+tlwQRTWkPmE4tENsNMvZAqUt
   prHdKBMkrf4Jvx2OylLutgQeFaANhZ3pJ/UGl1ZXVd/5SrGOSSuBtSJp8
   HvQUE5paGY6V/1UjfxAuIttMeihz4Y3y/Xwjj/pDzJEboiha0lHZExKrB
   D1nMeJuHj/hnLpiQs5rRFgQk9ugiKp0Ez6CWiWpAETNXc268z7Gg+x0UG
   09Gcm+m2FLAmn1ZJKgigrShk1ELQZI7UuwDfxqFuMEGeOzEJZpZ/Mpoir
   JqtBR4Xl384QXYCjlJd3Qhy4ByyPUdoDDJEXvn2iUAPgMoKsIHCMWDQ6e
   w==;
X-CSE-ConnectionGUID: Zvjdfn4dTHedPAyySZ/9IA==
X-CSE-MsgGUID: HLMJpR9CQN+32HU6IBxSqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13882288"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13882288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: ngmWe3QmTvmwk9vRxe5PZg==
X-CSE-MsgGUID: 76dvYXejRtWErjwhEgsmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="41223266"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 May 2024 15:44:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDAys-000HxN-1J;
	Fri, 31 May 2024 22:44:14 +0000
Date: Sat, 1 Jun 2024 06:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <202406010606.hHFDxmHY-lkp@intel.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_154423_303154_8D86ACC6 
X-CRM114-Status: GOOD (  10.39  )
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

Hi Jesse,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Use-Zkr-to-seed-KASLR-base-address/20240601-002545
base:   linus/master
patch link:    https://lore.kernel.org/r/20240531162327.2436962-1-jesse%40rivosinc.com
patch subject: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240601/202406010606.hHFDxmHY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010606.hHFDxmHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010606.hHFDxmHY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __pi__printk
   >>> referenced by __pi_archrandom_early.c
   >>>               arch/riscv/kernel/pi/archrandom_early.pi.o:(__pi_get_kaslr_seed_zkr) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
