Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917E606A31D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wT5sF+pc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ffz+sS/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xpMEdnZWEXdQpxkwXJR1U3pWrTKPNvDbHswPIlbl2Pk=; b=wT5sF+pcKvKwc9VNk1NEBDSVwQ
	2CQCO7IKTHCtIusDc2IWshzIZyHimSOjk37BFeuWYJIyou4/r4eotctwKYwDD2lHdXZH5VJiq39oK
	xuNtWnr8kCjKTBwIpv71dJ4/GTQrxX1ipI/p+Da1NX1xFTNg9MrJ5yhsh8fUuUhud9OwVzTZL9zpJ
	pv55nrx1B59a/icb44kRnrOcR6iPQIbT8wvJDpenvJd0qxY0MAoF1vBjhNTLXaTshy5ZBjYOlM0Ge
	Fr5UvZ+aM2Q88snJozGk6Uz+FX2HY5foUKu8+9IanPoOa8IarKbKg8KTrTZ2C56dPpqWszbQ2flrX
	RjQl5E5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMycr-0000000CrZN-2TjY;
	Sat, 31 Oct 2026 02:15:21 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyco-0000000CrZ1-42Rk
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 02:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793412919; x=1824948919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDGnfo9AO3La6lbmSWT/ExmOzEpPsX5TkCTGoppcGTk=;
  b=Ffz+sS/HMnP/ci3DyL8sXpvUS4MHZol414VTyrCmWEVzE3Qw1mq8Dx8P
   HotAn3CRC4EJ9HNKmRAyKHvqXFl6JOLzPH95ExNWsq6GDPNmScUBp/2cy
   dxl9ysOMwW9cR8PYfMyX6tWgwVUSng9fMAREr9E4W1aA9GVpVzSLZM2G/
   A4c8ZU7FH2yfpKT5k96/RjT/SjLRpnOk/V64wTIflcSqftPUrCL4F+IkK
   GqkSmZzizqCy3cFu3Hk0mxw4F3WYQhjxgdG7ZuYMdBRbfPcY4OmhIhO3N
   v426YhtFFkQoJxkQ4scfvnutZdYWRtFN0apUCPeq8yVmKvC0VaE9NcPH7
   A==;
X-CSE-ConnectionGUID: MDgiXPNaSE2s347gMz4L1Q==
X-CSE-MsgGUID: MnWgDMZgQkaasCrHLGyk2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2092322"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2092322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:15:18 -0700
X-CSE-ConnectionGUID: AiHVaetHQuKJFUKKhBg86g==
X-CSE-MsgGUID: 37q5X9yRROuT9Ddl+x8oDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5467278"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 19:15:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMycd-00000000cSC-3G7I;
	Sat, 31 Oct 2026 02:15:07 +0000
Date: Sat, 31 Oct 2026 10:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <202610311058.zODtC2bF-lkp@intel.com>
References: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_191519_063943_572B59F4 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

kernel test robot noticed the following build errors:

[auto build test ERROR on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Kondratiev/riscv-build-kernel-atomics-from-LR-SC-when-Zaamo-is-disabled/20261026-112002
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261026-lrsc-only-v3-1-ec29c8190fb1%40mobileye.com
patch subject: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo is disabled
config: riscv-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311058.zODtC2bF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311058.zODtC2bF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311058.zODtC2bF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: -march=rv32imc_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:290: scripts/mod/empty.o] Error 1 shuffle=1963593903
>> cc1: error: -march=rv32imc_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1963593903
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1424: prepare0] Error 2 shuffle=1963593903
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1963593903
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1963593903
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
