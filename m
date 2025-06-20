Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE412C7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhrxltlmSADLuhQm/Yxy0IFMM1LDwTrxo9Zme/S1fS8=; b=WKvlJv3SXBvTQj
	6hiQ1MVg3GPQT/uR+KOPQfp7N70ryU7HgXfrf7Y2MqmCgfPZtza0bUUGSj9C8CL/ce4+UbtcMeYeH
	pUiZaip6UHpXkZULUWLkhiT3GfVjPpnXm2Pcanai1Fkx0Y/Jv9GkkiCa/NnnUnCobHvaEUKwhXg7k
	LdsfV6fDe089IDBy7HzlxNthztoIik2oWTW6uzZpRvp4NtIQuv1LZLeVGOMP/hXs++7IuwO1PXPcX
	tqGNCHLt6b2LyItasjISaV1TRkhZ0H86uagKay+T3BgI0mDgprr4Z1aJQmDupLsDJApixxzbC97jo
	J0qPgjopOPm6ctQQUNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeO1-0000000G6rq-2JqZ;
	Fri, 20 Jun 2025 16:14:41 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdxo-0000000G2hG-3iy2
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 15:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750434456; x=1781970456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HB6q6Zx5mOBujUOsBMfV/rOeFmq/1ii8asxoKAUsy0o=;
  b=H6VCjRPSG9fa+i7tr4zIIAoxLQLOQXRwVKXpz7AqFpH/IdkiPGpiBIKK
   8v0xmm0U/qpXFKJ6pT0iv8IoJsTodR6uEhd9gX90q+LSxMBErjrPDewXL
   Varzmb3DCkSzo9oopS5K3+pRoi8ruB03uE8shjd4FldZCqQREpRTHTftC
   5I4KG8JyXq8Z20LgbmkS0dwurrJ37MA7aU6oUpSThcJGg8IlZzPzMUkLQ
   keXr50IcvDoVzItvBL0hwRKBDcggrk8ZOa92yjEAnhqPAX1YMpn1sw1Gh
   UHw4ssX+DwTH8QI5APinZTIix594IdG6YCdqUYlYnnAfiU/anEbs1bMPo
   A==;
X-CSE-ConnectionGUID: Z/+MWjhbQgSqLaJkKQFiRQ==
X-CSE-MsgGUID: lKZ2LFNYSleeeofnAYsMdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51929929"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="51929929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:47:36 -0700
X-CSE-ConnectionGUID: mizpIV4gQTyf+VLZoEzF+w==
X-CSE-MsgGUID: kWYn61oQT7StHW/fudnPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="155236555"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2025 08:47:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSdxj-000LuE-1D;
	Fri, 20 Jun 2025 15:47:31 +0000
Date: Fri, 20 Jun 2025 23:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: cp0613@linux.alibaba.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, arnd@arndb.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH 1/2] bitops: generic rotate
Message-ID: <202506202300.dZGgBtbQ-lkp@intel.com>
References: <20250620111610.52750-2-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250620111610.52750-2-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084736_938639_A95D57C1 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cp0613-linux-alibaba-com/bitops-generic-rotate/20250620-192016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20250620111610.52750-2-cp0613%40linux.alibaba.com
patch subject: [PATCH 1/2] bitops: generic rotate
reproduce: (https://download.01.org/0day-ci/archive/20250620/202506202300.dZGgBtbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202300.dZGgBtbQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [Makefile:1281: prepare0] Error 2
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from check.c:13:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitIn file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
   o   27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ps/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/special.c:4:
--
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
   :13   27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   :
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:86: tools/objtool/weak.o] Error 1
   In file included from elf.c:22:
   In file included from tools/objtool/include/objtool/elf.h:12:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from builtin-check.c:15:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:86: tools/objtool/arch/x86/orc.o] Error 1
--
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:11:
   In file included from tools/include/linux/hashtable.h:13:
   In file included from tools/include/linux/bitops.h:52:
>> tools/include/asm-generic/bitops.h:27:10: fatal error: 'asm-generic/bitops/rotate.h' file not found
      27 | #include <asm-generic/bitops/rotate.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:86: tools/objtool/check.o] Error 1
   1 error generated.


vim +27 tools/include/asm-generic/bitops.h

    25	
    26	#include <asm-generic/bitops/hweight.h>
  > 27	#include <asm-generic/bitops/rotate.h>
    28	#include <asm-generic/bitops/atomic.h>
    29	#include <asm-generic/bitops/non-atomic.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
