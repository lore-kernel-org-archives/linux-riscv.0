Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56309C30658
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 02:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EBnxHi6RG6uQXjukp4ZdRd+BS9px6GObOhL9WiChQ4=; b=gkY+dmIGF8sMQj
	mun6RvdSFfDO3PW54lQ4bK4LOOYX32MsI1M1kcnaZhLZ5LV0F7x5Mut0OVysPi1vLOAkU4QIs5SpF
	UwKANGyaNesJ0Nf/8QqMq5J9QM+kULhaeph5CXbD1a3lUI86Rn+mAF08zt7sdLg4CiVCA52m/p38j
	PtdGYHAwLw8hsx4mzR2JETBYi+OM1vtqdzDoZ1d2W0dtxUnyCacf/sYHgIUZpuMGUkRLWqa0BfdkO
	vbrq3pHTOb5oh9SDrMfP7YcjmdMVUVjHJT7CzfvBQYu16ZVVB7fgQm7PBxzUATQzTMqpVsh4GBF15
	rdoav3Vw5yrMLq2AXllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpRO-00000008Xmr-1iV8;
	Wed, 03 Jul 2024 02:09:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpRL-00000008XmL-0tqY
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 02:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719972587; x=1751508587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=agajvCivFdkzHTcK2qV0G18SpVRD8KhPbNoX4ZI/vJ4=;
  b=YE+Cu7T5mzew7eJxyDfbPbS0chRxxTF4nQDMY/j425cpOgiTF+JHNBjm
   EGn/rDUrKB+p4KQO1/w+ATcF1cXn8OARXBFWVUxtLQeeM/5Je2prMnEd3
   VyZMINj2s4aO9iTKe9QkSYYYVSgyzR58v7sBfmNDBPOqAJexhxcEEZLaJ
   GXt/X9RUHLGp5OIMMKukj8rw/eLevGZd8bLbmPGqkjWAl8qTJ94s+csOm
   /hxzAOYh3ZRWKI2i1MRlcsJDIPVdHE8+wrz+vCr9zmLwT7qFrgLdNcj7x
   X7sZedDikkKiiAwodlNtl/MW3v3dqsfRQjgVP7PC69HRqzNfiqXGYQcL/
   Q==;
X-CSE-ConnectionGUID: LwGLt43RSNWHCKqniLPC1A==
X-CSE-MsgGUID: TTKiUuh5QCy4b4FSpt40Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="42606838"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="42606838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 19:09:46 -0700
X-CSE-ConnectionGUID: JbhFs33uQbyIk3a9dhQSnA==
X-CSE-MsgGUID: A4ylhif6SKu74ahUsalp7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="50702291"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2024 19:09:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOpRC-000P8j-2Y;
	Wed, 03 Jul 2024 02:09:38 +0000
Date: Wed, 3 Jul 2024 10:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <202407030941.LFCgSw4G-lkp@intel.com>
References: <20240701185132.319995-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701185132.319995-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_190947_325649_3BF7B7E3 
X-CRM114-Status: GOOD (  10.55  )
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

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.10-rc6 next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-pi-Force-hidden-visibility-for-all-symbol-references/20240702-025515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240701185132.319995-5-jesse%40rivosinc.com
patch subject: [PATCH v3 4/4] RISC-V: Use Zkr to seed KASLR base address
config: riscv-randconfig-001-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030941.LFCgSw4G-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030941.LFCgSw4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030941.LFCgSw4G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: __pi___fortify_panic
   >>> referenced by fdt_early.c:24 (arch/riscv/kernel/pi/fdt_early.c:24)
   >>>               arch/riscv/kernel/pi/fdt_early.pi.o:(__pi_fdt_early_match_extension_isa) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
