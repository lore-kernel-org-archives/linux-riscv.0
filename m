Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3761C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm6DHIot42mw802Y4ga63SZQEp7HFITOM2Y188pOwbw=; b=kZG6dsF2zulja1
	nDAsCYTpTloWaQDYc/ebVGRjsPFDhAQTdNdX/ABTC+cThahR6sEsHBnvHaTtpQWy1hqclmFqUefp9
	kZ1t+zLzr/D+1bjCrLX0oA1bribllzuItHNvZIggCf20yZgXg3CaD7gdwv1FStNijr/qRzl1OVkYe
	vuUxnVCrCn7cwijEiHpzOJqH+I0XkR0s7+4MXTHDZSOcXsHBUQWCJtG6Nv0P/sGcU5bMDl9k5ClFB
	V8einfDuksYgQv8opMNAiYF+50Uu1KcEtjYCA62pdH+59ju8x4ay5j4pO7p65lsjgTLOFszq0Qxan
	TTPsKChS9WLit5jHPDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzNX-00HDGj-19;
	Mon, 07 Aug 2023 12:30:31 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzNN-00HD8V-1a
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 12:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691411421; x=1722947421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXJTq45AIqsfuwWwSJ2t/zwiSaFYQ3Xi7vuToBn1yV0=;
  b=isl/mWCCKkKJ18rJ/iVHG6Af10NEQGgx+4KBuuQ5xog8zMfTiZAndCdq
   2tgEWsIOgd5Cqy/swO/LiGuvdq1gyJp+V9Eyd7gnp9EPLI3toQpKqGYQF
   ovweBkJp4z1zde38GHric/UoweVk8CMYhGmUXhtvz7EOldW7RtvsLSPiU
   c3YedD5UBAHKNxhy4xGu4TKd6Fhc33RjW6SlPtQ/f9zcpdLOUiztrLNmt
   DBUt67tsrjzzEC0wmFiEgAr8ANFIn1Lq57x09OmawbIK0g1NO2TAFLnXW
   AF841GgzWwj1u1uXr9/DrSXNM/JjcwoLX/Jme1KuHKCF8QobkWReDOB5c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436861970"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="436861970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 05:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707852437"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="707852437"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Aug 2023 05:28:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSzLx-0004fz-0D;
	Mon, 07 Aug 2023 12:28:53 +0000
Date: Mon, 7 Aug 2023 20:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dylan Jhong <dylan@andestech.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, anup@brainfault.org, rppt@kernel.org,
	samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	sergey.matyukevich@syntacore.com, maz@kernel.org,
	linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ycliang@andestech.com,
	x5710999x@gmail.com, tim609@andestech.com,
	Dylan Jhong <dylan@andestech.com>
Subject: Re: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for
 "preventive" TLB flush
Message-ID: <202308072050.0T0FlSpT-lkp@intel.com>
References: <20230807082305.198784-2-dylan@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807082305.198784-2-dylan@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_053021_582354_7979BD5C 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Dylan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc5 next-20230807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Jhong/riscv-Implement-arch_sync_kernel_mappings-for-preventive-TLB-flush/20230807-162922
base:   linus/master
patch link:    https://lore.kernel.org/r/20230807082305.198784-2-dylan%40andestech.com
patch subject: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for "preventive" TLB flush
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230807/202308072050.0T0FlSpT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308072050.0T0FlSpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308072050.0T0FlSpT-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: mm/memory.o: in function `.L1539':
>> memory.c:(.text+0x3b5c): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `.L301':
>> vmalloc.c:(.text+0xd24): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `vb_alloc.constprop.0':
   vmalloc.c:(.text+0x2c4e): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `.L0 ':
   vmalloc.c:(.text+0x2f2c): undefined reference to `arch_sync_kernel_mappings'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
