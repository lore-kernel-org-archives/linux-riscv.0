Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F93C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cq6ar1Qj3uZHHUbIhoSAXulsN3STwmUneHh6CJfLgGs=; b=a8IfUEjiTRoTNJ
	d5We5xWwV8RxUeK+H5ca0WuUHifMagN3prf/pExlAVnwG9vuFmCn/j4dMUesfmcBoK9x1niJxllLc
	VUZrPacWMpijGWc5CWZ7OxDYjrkwburZkI05sXGBBGxRq0FtnpMkRpcfbs9bdkw6YLVuViK4v0rqu
	UvJeB3JiqXHu2S35SguXNobFud4cedxT0M7pAFzK+cnr1TwZXKVR8y1sD/tGE/x2f0Vs33mxdPhx0
	WAxr0DInVOertC+jUe4EiO4v3NTA2OaRvZILmLlWcz3tFiAilTDLhbzJlbCR/yn5o1qveEcbNkdt5
	6BMeW95IykqUymw6oF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezuZ-0000000G5Zj-2viG;
	Mon, 03 Feb 2025 17:07:03 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezuW-0000000G5Yz-2Pc0
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 17:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738602421; x=1770138421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EiQB0sYBQAho8pe6u94W/tfr8rXHV1YpEzUOZK+DVUo=;
  b=cQnPUVbLdMIXwHmrSWyerkeZ48qxfDlUBcP+iBdp6Qipnn0fVRuvI9PY
   CgK7bdEvGIwCbLOkGtZrjYgcyO1WsF78SqKvSLbvcN0xhoI6ZmGO+9SAu
   9SCdl3++kMQMtMgr0FJlsOvylddvbtkwWC0LT+/vhGKgfxLRyZ0TlkPgp
   JoCNR3hcME6zP/A3/Js6dVJJUimchiiq3tc4Pj/+dg8bzvYbjX9orhs1C
   Y4P1hI/DtpTYhJumdb3uTlkohV4eS8OwyCu9/RoOH6PJvFl5/O/N0Amq0
   tG7Bw1s46ipoLEnR4si5tt8HHNEg7CaqWINJyYEbqq/fobcZEw6ZSJwJ8
   Q==;
X-CSE-ConnectionGUID: akp3FqN6TNOhsZQgA9hkGw==
X-CSE-MsgGUID: ETUVGuehRcydm9Xc+w8kZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26706708"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="26706708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:06:57 -0800
X-CSE-ConnectionGUID: ia0Qpw0DQfCrdKcIAo414Q==
X-CSE-MsgGUID: HrHf0u6URWuyOeJPMYIroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110150579"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 09:06:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tezuO-000rE7-0S;
	Mon, 03 Feb 2025 17:06:52 +0000
Date: Tue, 4 Feb 2025 01:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4] riscv: Add runtime constant support
Message-ID: <202502040018.8DyjnzNe-lkp@intel.com>
References: <20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_090700_680361_37967E67 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-runtime-constant-support/20250131-092950
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250130-runtime_const_riscv-v4-1-2d36c41b7b9c%40rivosinc.com
patch subject: [PATCH v4] riscv: Add runtime constant support
config: riscv-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040018.8DyjnzNe-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040018.8DyjnzNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040018.8DyjnzNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/dcache.c:38:
   arch/riscv/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
   arch/riscv/include/asm/runtime-const.h:167:63: warning: right shift count >= width of type [-Wshift-count-overflow]
     167 |                 __runtime_fixup_32(where + 4, where + 12, val >> 32);
         |                                                               ^~
   fs/dcache.c: In function 'd_hash':
   arch/riscv/include/asm/runtime-const.h:13:28: warning: unused variable '__tmp' [-Wunused-variable]
      13 |         typeof(sym) __ret, __tmp;                               \
         |                            ^~~~~
   fs/dcache.c:112:16: note: in expansion of macro 'runtime_const_ptr'
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^~~~~~~~~~~~~~~~~
   fs/dcache.c: Assembler messages:
>> fs/dcache.c:116: Error: illegal operands `addi a0,-0x211'


vim +116 fs/dcache.c

ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  115  
94bdd655caba20 Al Viro         2016-04-15 @116  #define IN_LOOKUP_SHIFT 10
94bdd655caba20 Al Viro         2016-04-15  117  static struct hlist_bl_head in_lookup_hashtable[1 << IN_LOOKUP_SHIFT];
94bdd655caba20 Al Viro         2016-04-15  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
