Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA43D2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/nEZ24lrcl7mGwtJG/e/gI0Yqo45LfEqoXz4jKOhbY=; b=AxyY4fnVI3n+gb
	BZknbiripWdNDVPAUNsOIr6lZyrGPz5tN16AcQ8HaXud+vHl6eWOTQnl4pXs72WMS+ENV8BpRC+vD
	lpPwa+ko6C7Hd3xYEYmKrwzjoYXRoNnjPZbWg9Nek8oxNPLYymQT1onamRkH1+p3V+wrGdV+jvcwf
	ajiDt/1v48jt8nNMDYsaYoLP6lyd5uFKvZRStQ1mkkpJH2bhygqQZIkqSMr1tNw3QQGr+5IkxqexS
	OiznJxLVqGSK6lGiPDxrNMIXIb81OS9bCWVkeEV6LbAacGO/WQbZR2hQKr37UsCfR+UM7h8Jf2fSN
	0r9Jn5sYhwFu8saRfIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoWV-0000000Etj0-0KnO;
	Tue, 27 Jan 2026 19:14:47 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoWS-0000000Etie-2c0O
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 19:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769541284; x=1801077284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQs4g0Hj1ItK/QiIzgpxVcFUJqnU6e1/jMgmoaFBUsw=;
  b=CH7vYiZL72m81zm3EL+XFofBp+C9jDqbjBB9HKgXQZKs8gBFfW3Q/0Zs
   oenDs4uTifiZF2HvKw0zeJ5ACrseHqz5iBGUpEemn6JcNSVkoZM3i3fR/
   ivkGzclRHeA3hdNxb/ABHihDXBCTQEy49bCwTKk1qxyJDKdp5342IvT6v
   lgzzPiqKgqIW9JAppbFILfWMCgaIPo+Ip+w5L49wrLaaQ8iXFJRP54HzU
   o5dFbJn7YyI0aTJ0fJTP6pKJzkdiTKL3AgZbOWRUsu/0jRO3hrOvRwym5
   K46HCELYv+hr9Ky2luJ3UgeE19lpH9bmMmAyhW8TlPPH8gFs2SdP7JlpB
   Q==;
X-CSE-ConnectionGUID: 1SBd5UBdSOOGM08a7q5tfg==
X-CSE-MsgGUID: 6nHOeO3DRzGHmdRJ+857FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73336245"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73336245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:14:42 -0800
X-CSE-ConnectionGUID: 92Woe+I6ROehAEhwqVIEMA==
X-CSE-MsgGUID: QO/jNyD9R4i0G7V/8wwXJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212604699"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 11:14:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkoWK-000000001vN-3e9X;
	Tue, 27 Jan 2026 19:14:36 +0000
Date: Tue, 27 Jan 2026 20:13:41 +0100
From: kernel test robot <lkp@intel.com>
To: Austin Kim <austindh.kim@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, austindh.kim@gmail.com
Subject: Re: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF
 notes
Message-ID: <202601272006.NUdRcAIi-lkp@intel.com>
References: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111444_675927_F106C111 
X-CRM114-Status: GOOD (  10.14  )
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

Hi Austin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Austin-Kim/riscv-export-kaslr-offset-and-satp-in-VMCOREINFO-ELF-notes/20260127-173528
base:   linus/master
patch link:    https://lore.kernel.org/r/aXiF55y5D49gcpUg%40adminpc-PowerEdge-R7525
patch subject: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF notes
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260127/202601272006.NUdRcAIi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272006.NUdRcAIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272006.NUdRcAIi-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/vmcore_info.o: in function `arch_crash_save_vmcoreinfo':
>> arch/riscv/kernel/vmcore_info.c:23:(.text+0x240): undefined reference to `kaslr_offset'


vim +23 arch/riscv/kernel/vmcore_info.c

cfe94d456775a4 arch/riscv/kernel/vmcore_info.c Austin Kim      2026-01-27  10  
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  11  void arch_crash_save_vmcoreinfo(void)
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  12  {
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  13  	VMCOREINFO_NUMBER(phys_ram_base);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  14  
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  15  	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  16  	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29  17  #ifdef CONFIG_MMU
c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29  18  	VMCOREINFO_NUMBER(VA_BITS);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  19  	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  20  	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  21  #ifdef CONFIG_64BIT
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  22  	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26 @23  	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
