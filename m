Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E60ACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xbYSLFwIQdtrbKA/q4AdguEwdU+in/VGDzIcBO9MKw=; b=1bLygFcXr2Jr3B
	3fKSv3i8dqM5tDTwdfOV3ouQP8eozbCJr+5pKAvnUqjLwi1/Pt+ba9WJRwBafXB5oZuIr3dIrKWtr
	zC9aXeDENNAtqDkaoLxV4/iccjSSRLIlsXgfL/Sbvk3i4Xkh/F4Xf1tFbPITiAnKj5ZJM9pxc2FGn
	Y/xQUdw91TW49v35IHoUHpXrmDBJSVqRfC3K4+HS0N4tAgCeLFjaaiwPog5w05J0gTK/2itpWhrg7
	4NTxqyA1dOfHjU5KNBUr+SAF4Q3yO3X7cLkfxj6fFsmeaTVyc4iAmBn674DD/e0yErYGUJ3n18viJ
	xyK5o54CEFhENo/9iOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rue5e-00000008lXS-2FZD;
	Wed, 10 Apr 2024 19:58:38 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rue5b-00000008lWD-1YLx
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 19:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712779115; x=1744315115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLwmqMV4AThUNLY2C0AJAwuOIliylAKYtQ0vTEe64Gg=;
  b=R7mz2ueh2i1IEvict9dXEVf1jAkjyFVReliK4VIkbRtNZVYiNL5IkICl
   z59s/bmSQMXdeGh1mK9DwKtL4jePOvV0ECUREBsW3XiD64IWc7dJHC7ZG
   vqwG5lred/yfBiKG0uDJt/naris5jXRbJ2UmePaFUVPBgy1Z8CK8fgDjt
   YwXMNmBVzUSGojapapGkFhFL782Yn0zds9KGhXr6YbUCo9Go0T+4AnthV
   bsDOM0aquFP17hB12AJDFjIuAlUmD6EnGJ7Qla7c6J/fjMhenJ/6kopo1
   7F8UIkGBzZ1Ab8JX0RVzIxnvTB/5VxxQF78BxJUjLDHhij0SDYYfXD6Gh
   g==;
X-CSE-ConnectionGUID: Lv5wvQVnSE2nQcCe1ePbzQ==
X-CSE-MsgGUID: MpzIL6a9RVaLY8Km5myCWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8026709"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8026709"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 12:58:31 -0700
X-CSE-ConnectionGUID: 81dFEfzJTEm0/J5lUQyriA==
X-CSE-MsgGUID: f1p2tR/CRuyjiSt/lZUEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20753180"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2024 12:58:29 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rue5S-0007kO-26;
	Wed, 10 Apr 2024 19:58:26 +0000
Date: Thu, 11 Apr 2024 03:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jinglin Wen <jinglin.wen@shingroup.cn>, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
	atishp@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH 1/3] riscv: Support for early console.
Message-ID: <202404110326.Qa9YV4bV-lkp@intel.com>
References: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_125835_449328_F5FE33F6 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Jinglin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinglin-Wen/riscv-Support-for-early-console/20240410-143840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240410063432.23058-2-jinglin.wen%40shingroup.cn
patch subject: [PATCH 1/3] riscv: Support for early console.
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404110326.Qa9YV4bV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110326.Qa9YV4bV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110326.Qa9YV4bV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/early_console.c: In function 'early_console_printf':
>> arch/riscv/kernel/early_console.c:51:17: warning: function 'early_console_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      51 |                 vsnprintf(buf, EARLY_CONSOLE_BUFSIZE, fmt, args);
         |                 ^~~~~~~~~


vim +51 arch/riscv/kernel/early_console.c

    42	
    43	#define EARLY_CONSOLE_BUFSIZE 256
    44	void early_console_printf(const char *fmt, ...)
    45	{
    46		if (riscv_early_console_putc) {
    47			char buf[EARLY_CONSOLE_BUFSIZE];
    48			va_list args;
    49	
    50			va_start(args, fmt);
  > 51			vsnprintf(buf, EARLY_CONSOLE_BUFSIZE, fmt, args);
    52			early_console_puts(buf);
    53			va_end(args);
    54		}
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
