Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065ADCCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 03:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYzEcgLhLBc/MpclbC8yxuTaaDXqCFI7/PbYbZ4sgyU=; b=pOCB2cUBCabA/v
	57eE4RjPcpCCkRsn9iuNlM+cBsStYHHZD/aOn2ZjDH8TYrMX/5eUOTcBSUFvlSpZZeuy0UMguQQRu
	oxivqTqJ4iddcQ2YMRg7LwGIPma1/DYtnn/Snn2r2I9KorN6Cb9BVIR3+bpFdDkUp0Ic2XaFZHd67
	NFCeIigijI48HH7I+kQ69sjzYSqn2HmXrAxVI8bldEN1CQzCDmtJsdUB7UzOEELw7JHQK6hPfVKlI
	CX8SlouxuIoUistxlWtoteMJChEBvREIolE5sYUZ1Ll+zYRvtAKBln1uaN1LKfWEj4Li+9ejHsqo1
	FenCGYtCqoWN1PZW2Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9EXM-00000003Lyk-1Qc6;
	Thu, 16 Oct 2025 03:20:20 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9EXK-00000003LyL-1Q7C
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 03:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760584818; x=1792120818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oJedM1hfflEhgwLqf5S3MX4Pn/jZeroyYU1P+4AZNqc=;
  b=MkfBDlLVvByLZe8fnyQpPL6U4C84NW15jDUQY5sUbib8IBEwo0DdMpMy
   CT6PbLoFbsKinHk9MsCfVbNOwqPDpRak4fWZADq5T0/B5hXRDWAtzzIQ/
   FuRrnrEsgGiCNV1C+1a8OCGdJNK6MNxvjlwLeIy8OQQDGMl5mnRCkT1ws
   koLHgnxNSF4w4Bk7yTwC31b1v/2pP8IVARZ0hoFwx4wqHQlZX+V/+oWdN
   ZfA+ckGKb8pM4BMTGFwRv6DetBQpF0ePota+WneOEUFVLUVjwFL4x5P74
   LDvto6JKxjw4J8VTpbgsqADjbGoV0x5/cDRzcFGByLHSzrViOTAuCF6QA
   g==;
X-CSE-ConnectionGUID: ceRzAt3MTMO8AZUI9fzOug==
X-CSE-MsgGUID: 500kwn7ZSt2baQT0rVMFdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61975919"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="61975919"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 20:20:12 -0700
X-CSE-ConnectionGUID: JL9FhEcsTBm7GRTC6cDx6w==
X-CSE-MsgGUID: AiVFevBAQIGYUNZ1OFLBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="181470823"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2025 20:20:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9EUl-0004Pv-1C;
	Thu, 16 Oct 2025 03:18:34 +0000
Date: Thu, 16 Oct 2025 11:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Tan <tanyuan@tinylab.org>, arnd@arndb.de, masahiroy@kernel.org,
	nathan@kernel.org, palmer@dabbelt.com, linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	i@maskray.me, tanyuan@tinylab.org, falcon@tinylab.org,
	ronbogo@outlook.com, z1652074432@gmail.com, lx24@stu.ynu.edu.cn
Subject: Re: [PATCH v2 6/8] compiler.h: introduce PUSHSECTION macro to
 establish proper references
Message-ID: <202510161119.Qau82x7Z-lkp@intel.com>
References: <40854460DE090346+c30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40854460DE090346+c30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_202018_601993_60FF8DEE 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Yuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on arnd-asm-generic/master linus/master v6.18-rc1 next-20251015]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuan-Tan/scripts-syscalltbl-sh-add-optional-used-syscalls-argument-for-syscall-trimming/20251015-181934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/40854460DE090346%2Bc30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan%40tinylab.org
patch subject: [PATCH v2 6/8] compiler.h: introduce PUSHSECTION macro to establish proper references
config: arm-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161119.Qau82x7Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161119.Qau82x7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161119.Qau82x7Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/arm/kernel/vmlinux.lds:1: unknown directive: .macro
   >>> .macro _PUSHSECTION label:req, section:req, args:vararg
   >>> ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
