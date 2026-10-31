Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF4606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dbPRB+4h;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjpSDKJp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xZ3Qr+cTcGbqxsQm3HeOkqOEWQT3AfuJD4+mjgJw7Ew=; b=dbPRB+4hu29pHXtF/VCSLnSnmG
	zdyQ59B8oCWdVCnJqvBoan1mAypNxpvrAZe/WqvfYW5rJjtMTEOlRaltb0JuVQ9slr9sHcGa1J2Jk
	xddmrwXbU36TRY9FxetKjZAOUXVZ95jBrMm/amn4h5tDdwK838LcSzM79bKwFZfz56JJu7afbUeUq
	i4DTdriVQ8Yq4w/CS7tLLE6bQYFpfUJkA+wqyI+Md6x2AyCzxQ9aHs3JcYt7gEi29D44CDzXfwmoN
	ebXoDUGO8dX5Tx9YG7jNMVtY2bCQdEimyneZPQ+q6g1Il7MnaBwIKJPqmSSh9EIz/9KQYfF9Qv6BP
	ySuR2tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyIU-0000000CqkW-0eGS;
	Sat, 31 Oct 2026 01:54:18 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyIQ-0000000CqkE-2DQJ
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 01:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411655; x=1824947655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXWnVn+cRnGIcPln/CCZ9v574AOyyXQi2017M6apAN4=;
  b=gjpSDKJpDttlUUi9nPSLO1bZUPEUVWAtJEU4apo8/ZweEHFZXFzjOptO
   gS1v+4/IJ8cadLeyMTI7xoPOlbc1b5SYY5A/uj3VURcAiwjuOfLwr1gPp
   FlIV0uIY9BruGGngqpvzVx43UTpGMD68+7bG9A276wPgeVHjAqPwRGZen
   FKRPSwQiK7R+ftG/VClZjkbBBDnVcPWKRxq9/YA7xsFK88YjqvOEGz7oO
   lbKRxXDfsXxxEfCA33wvbtrwKJaGwHkRkiR1b/xcSd8iyzvWvNcjbcnuw
   JSMjC9ZadFJBeMkB58vLCIWrjilUUvCVEdnUOML7wuSV+vQlqP+SmLiwO
   w==;
X-CSE-ConnectionGUID: a/x/owR2QhWmNw4zK/Es4A==
X-CSE-MsgGUID: QtcIt4oBQu2Mz6tvM5N9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2212852"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2212852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:54:12 -0700
X-CSE-ConnectionGUID: SJdlRg3VSaeXMuVKtYDpww==
X-CSE-MsgGUID: jMI6TXXwQYCcP2nxJNnpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5921565"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2026 18:54:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyIG-00000000cRM-0xgJ;
	Sat, 31 Oct 2026 01:54:04 +0000
Date: Sat, 31 Oct 2026 09:54:02 +0800
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
Message-ID: <202610310951.FopXBJty-lkp@intel.com>
References: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_185414_640297_D1F0ED04 
X-CRM114-Status: UNSURE (   9.85  )
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
config: riscv-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310951.FopXBJty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:290: scripts/mod/empty.o] Error 1 shuffle=1929180073
>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1929180073
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1424: prepare0] Error 2 shuffle=1929180073
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
