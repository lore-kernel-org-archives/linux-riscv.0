Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7BEC88CB2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 01:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbBq7ab7Pw17/EAkyrN9y9cdUPbq7IDBqv7a2TeW1wE=; b=0LkwPc0AUt6QJQ
	W8SdAqCJSY/3c4EcrLMyb2AoOxx8p/HsWrMv4fNycn6Yp5q4QD5Lg4VwQKDA6b/3uk5ZiJF3Ev2u4
	+aFnBKD5QWhmg84LkGxv9LUGxC/UHwaXsmtAZuZiwJCScv7cwGb7DdHBpypG49fI6I50dE5jrWxQd
	E+x5RnnOXm+IfFpFTE9+H33SV2c62pvqt3b51gEYmn0KqTH/asSNV/8Bc/DBYTc1VjDdNb+u/s4ZI
	DjNRb5QxrlzWe9RvmZCidICmjF7nJw0m/mFw3iMmTIzT4KWw9lIi4e6rQ4ojv/4MFHoL4qLEz2GqJ
	BDTAGwfTnCELArJRPlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLbO-0044Mb-1P;
	Fri, 25 Aug 2023 01:27:06 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLbK-0044M3-2a
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 01:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692926822; x=1724462822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v0UeNta87Sx8HA/Ip3QXS/fJh65LXYDTOgPDQc5jqwo=;
  b=atmm1UJVyoffA/o6fx9VrlufZ9F+kgATswe3dTaqKQuANaZiGZDU6Ypj
   QtgqkQg3WEN6gZQMHphtiAG8904MSSht2WbVZKMzmZr5hOAkpm5lyx94W
   Zmuxs1CfNfz7bslt/8jghIgKwfCoCPKq3LgmDfPD7YY4cVm4K24ARyhd3
   uYakFvFNXxMqUwc5oNnkIUkp9I8Hkea6vBZqZYmL0MmWvJU7vw2+XKmZJ
   TM5Unyme06L72gXQ8eYxq74fcyT3rw0ANP1CIfHejJQhQDVLYddoDcb96
   ME3O1w3TaRVVa3xfCRWeU3B3dKtL3o0ZzCEjgIV5DPs5xnpRJ2LupqnOD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354932348"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354932348"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="730858553"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="730858553"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2023 18:26:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLbE-000368-0i;
	Fri, 25 Aug 2023 01:26:56 +0000
Date: Fri, 25 Aug 2023 09:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
	conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
	yhs@fb.com, kpsingh@kernel.org, bjorn@kernel.org,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, puranjay12@gmail.com
Subject: Re: [PATCH bpf-next v2 2/3] riscv: implement a memset like function
 for text
Message-ID: <202308250924.NlFcBoND-lkp@intel.com>
References: <20230824133135.1176709-3-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824133135.1176709-3-puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_182703_712147_235B0E1F 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Puranjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/riscv-extend-patch_text_nosync-for-multiple-pages/20230824-213410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230824133135.1176709-3-puranjay12%40gmail.com
patch subject: [PATCH bpf-next v2 2/3] riscv: implement a memset like function for text
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230825/202308250924.NlFcBoND-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250924.NlFcBoND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250924.NlFcBoND-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/patch.c: In function '__patch_insn_set':
>> arch/riscv/kernel/patch.c:61:13: warning: unused variable 'ret' [-Wunused-variable]
      61 |         int ret;
         |             ^~~


vim +/ret +61 arch/riscv/kernel/patch.c

    56	
    57	static int __patch_insn_set(void *addr, const int c, size_t len)
    58	{
    59		void *waddr = addr;
    60		bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
  > 61		int ret;
    62	
    63		/*
    64		 * Only two pages can be mapped at a time for writing.
    65		 */
    66		if (len > 2 * PAGE_SIZE)
    67			return -EINVAL;
    68	
    69		if (across_pages)
    70			patch_map(addr + PAGE_SIZE, FIX_TEXT_POKE1);
    71	
    72		waddr = patch_map(addr, FIX_TEXT_POKE0);
    73	
    74		memset(waddr, c, len);
    75	
    76		patch_unmap(FIX_TEXT_POKE0);
    77	
    78		if (across_pages)
    79			patch_unmap(FIX_TEXT_POKE1);
    80	
    81		return 0;
    82	}
    83	NOKPROBE_SYMBOL(__patch_insn_set);
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
