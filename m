Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B9FD3C926
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PytAKHo4/6oJycw+qNkzNnSFTyMgQ2FoN8gDc+hirpI=; b=KXHRWD36sLa7lP
	mheUHNIGLErYfyYBZtf58iQfYgAeVZl9IZLrgNdibUv4nYVxvoA1kyBAbB76NexRpJWEnr9UE+5V0
	lxWpRKHaZnkw992pKkiG1um/ZS3xoN9GrM35AWGQOyzYd4u4EYjO84tmY4moRw4CjAgGE64jqvn1n
	6/PhAkkt1y+47drfptiGFiCK1n5GPPqDX8HgerGdUrZSUOUSatDYp2qPM4GeVm9dUM5qC7BjvYFCk
	Ii7VaZvxz7LRW2LWRLeliWOERVve4Ide4jP3r/L5YLVl6ut8JW+NmOicuOzvUTP2+Aa69NaYb4Uej
	iVUk2BlatdfrJTiF70sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2DNw-00000003hVA-0ikB;
	Sat, 19 Oct 2024 17:37:04 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2DGz-00000003gmA-1AGo;
	Sat, 19 Oct 2024 17:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729358993; x=1760894993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MFhNPISShuBCTSvLSqLqLUm7Mu6JuRwmhaAZNqzQcBY=;
  b=UqmSGliuk8atN76rZY7eamrzVwKyo5CpOI5kcN3JNS2tx85RZ4Z2/8cl
   W1d+mYQFzyxFLgECM5sDkaA0TdbRRSvQpaHoRIwP/w0cjDCb/GLstxqpH
   5V30zbZnrk1ugN1nDwy/9o7OcP8tFxkbB6XG304S0zLgeNhb5wqZ0k0a3
   7PUbLKNn8bSJH7f9ENYlygwpTn33B8FZUbT6g2ZaoV8F0KhbDlAImF+ff
   eLv15wbegKgnaP9T89nwCIluiN61Lz04dQw6iyfe/QXnlT+/C9DbYdu3/
   AI4CbeJ3zyZ7NzXzpfc4ZCa9UUkq1K6gmgk4JRNgkzMjRplTCXjqTU0TL
   Q==;
X-CSE-ConnectionGUID: RbaOeqdVSuyHZ4ktYT3vLw==
X-CSE-MsgGUID: /8UBmaiFS4aE5UJu+sKMfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="16495182"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="16495182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 10:29:51 -0700
X-CSE-ConnectionGUID: bqOwgFENTIm0tJ3lJKJ5Hw==
X-CSE-MsgGUID: VcT2kwryQNe84o/CsNutQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79290935"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 10:29:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2DGo-000PHe-0H;
	Sat, 19 Oct 2024 17:29:42 +0000
Date: Sun, 20 Oct 2024 01:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kai Huang <kai.huang@intel.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <202410200112.Ut6HtXKD-lkp@intel.com>
References: <20241017155642.1942514-3-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017155642.1942514-3-kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_102953_395772_7EE18A9A 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Kirill,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/mm linus/master tip/auto-latest tip/x86/core v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/memremap-Pass-down-MEMREMAP_-flags-to-arch_memremap_wb/20241018-001138
base:   tip/master
patch link:    https://lore.kernel.org/r/20241017155642.1942514-3-kirill.shutemov%40linux.intel.com
patch subject: [PATCH 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default
config: i386-randconfig-061-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200112.Ut6HtXKD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200112.Ut6HtXKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200112.Ut6HtXKD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/mm/ioremap.c:509:37: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/x86/mm/ioremap.c:509:37: sparse:     expected void *
   arch/x86/mm/ioremap.c:509:37: sparse:     got void [noderef] __iomem *
   arch/x86/mm/ioremap.c:511:33: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/x86/mm/ioremap.c:511:33: sparse:     expected void *
   arch/x86/mm/ioremap.c:511:33: sparse:     got void [noderef] __iomem *

vim +509 arch/x86/mm/ioremap.c

   505	
   506	void *arch_memremap_wb(phys_addr_t phys_addr, size_t size, unsigned long flags)
   507	{
   508		if (flags & MEMREMAP_DEC)
 > 509			return ioremap_cache(phys_addr, size);
   510	
   511		return ioremap_encrypted(phys_addr, size);
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
