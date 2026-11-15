Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1568606A323
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=az91bdT+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWPpc8v9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hnxYNnSvm6jK9xbtgHXVUPeaJBfAJ57VzSS23EVCppo=; b=az91bdT+t6uSee9eqNwbRkNy6i
	BiBkWOF9Eg10Lb+msS6sr3ubnwETMHXIUWW3mL3Jy6L0x5qRhDcJ+PmHhdh+OWUBE6bYztmhp20Mt
	uypghoRiI3PPn9GjVygYKynwJWz+XbG9wovrReAryb+5rFQ0Jbc3PRKFm1n63HTs6K1kdIqRTFULt
	tHS8UpAxwpeCu99giOgm7mUIijCVjXlF0sxpnWtmYeZkH+DU34x8wx/GTHyafMnAR4Lgh85wDVbWJ
	ZpRNBBpJB/lvoqG/YPDTEFB++4wbJSg76RGQlsynvmA/jFhySS8tr/tTO0Wg1FSMq5sV2OeSvNQxj
	9jMSFeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSf7q-00000000LVE-2RPT;
	Sun, 15 Nov 2026 18:38:50 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSf7o-00000000LTn-0w1b
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 18:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794767928; x=1826303928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ho9p6bSo8pi1QrenazGvesf4HhUNwYmhTsTzMNwIz5w=;
  b=PWPpc8v9wuWuUQd/mGlRblIC6Z39upTInKfSshMXSibsdCxMwFctkljF
   new8rJp0SjLEghvOHrv81o2O6Od4d7BVTOWWyqGS/L9w4yOvLokopvCoP
   +s19EHL9IEiVu7vNfOukaFfJMvt8f3Ai1lmFShkJP+ZE3rfcovL+Qk4Lu
   8cBEVQNruP7OfJEiz2a9imx4VB5x6mailoRjgG7es8lwNtAqxb7bWmJNn
   Gr6elVwdu8icibNdjzjqYvdWv4uc7sknbRYIy0zypFje6vWyLF1g1FiLd
   2WsL57KLKb0mWpRGBonidsJlrMe8LU1NN5hUYSqv/WCdy29RVmPUb8A9R
   g==;
X-CSE-ConnectionGUID: FiXfSefUROOX1AmAXA6b9Q==
X-CSE-MsgGUID: toazdAXaRSK6qpe6qr44xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3498588"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3498588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 10:38:47 -0800
X-CSE-ConnectionGUID: xgioXYEnTiuMMwCr8er90g==
X-CSE-MsgGUID: i+uioB1WQR2VnUR4b4a0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9372476"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Nov 2026 10:38:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSf7g-000000017C8-1yn4;
	Sun, 15 Nov 2026 18:38:40 +0000
Date: Mon, 16 Nov 2026 02:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>,
	Pekka Enberg <penberg@kernel.org>,
	Patrick =?iso-8859-1?Q?St=E4hlin?= <me@packi.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v4 2/3] riscv: probes: reject probes inside an LR/SC
 sequence
Message-ID: <202611160252.d58noD11-lkp@intel.com>
References: <20261115-probes-in-lrsc-v4-2-48b9b036bd1d@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115-probes-in-lrsc-v4-2-48b9b036bd1d@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_103848_315146_956A54F7 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Kondratiev/riscv-kprobes-fix-out-of-bounds-read-in-riscv_probe_decode_insn/20261115-143733
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261115-probes-in-lrsc-v4-2-48b9b036bd1d%40mobileye.com
patch subject: [PATCH v4 2/3] riscv: probes: reject probes inside an LR/SC sequence
config: riscv-randconfig-1000-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160252.d58noD11-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160252.d58noD11-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160252.d58noD11-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/probes/kprobes.c:5:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/probes/kprobes.c:75:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
      75 |                         else
         |                         ^
   2 warnings generated.


vim +75 arch/riscv/kernel/probes/kprobes.c

    51	
    52	/*
    53	 * Walk the instructions from the enclosing symbol up to addr to check that
    54	 * addr is an instruction boundary. Then reject a probe inside an LR/SC
    55	 * sequence: the breakpoint trap drops the reservation, so the SC would fail
    56	 * and the loop would hit the probe again on every retry. The sequence is
    57	 * recognised by a forward scan with the constrained-sequence rules, as for
    58	 * uprobes, so an lr that is not followed by an sc (as in __cmpwait()) does
    59	 * not taint the rest of the function.
    60	 */
    61	static int __kprobes arch_check_kprobe(unsigned long addr)
    62	{
    63		unsigned long tmp, offset;
    64	
    65		/* start iterating at the closest preceding symbol */
    66		if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
    67			return -EILSEQ;
    68	
    69		tmp = addr - offset;
    70	
    71		while (tmp <= addr) {
    72			if (tmp == addr)
    73				if (riscv_probe_in_lrsc_body((u16 *)addr, RISCV_LRSC_SCAN_BYTES))
    74					return -EINVAL;
  > 75				else
    76					return 0;
    77	
    78			tmp += GET_INSN_LENGTH(*(u16 *)tmp);
    79		}
    80	
    81		return -EILSEQ;
    82	}
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
