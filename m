Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE25E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQy2Xs0vrbhlL4iHIVvLRwEbdLc0XmKacPlinI/iezg=; b=MhB1F+JLcLBDlG
	BXRgsGFxC5mNBCNARxPLvjJypFgv/lAR8MjfiADxS25Pipg01w1BoKv/HwFwwhkfz5f3GVszRmp0X
	sFJgg9Quz+E6AbaeSl/kIKWgSmAHU6/9aExkLDEhY3cwBx9bVrNCSEE8uPaUNuDPOKFR+dzrKmnv2
	wd6fhxtIQb3/w22nOTuR82lI+EIJIz7FC74TL6lAcynZnSYqwNcjQbmC/Ib/TWJu9yFuTHh56RWZZ
	gL5ITm1kHk/y43DdRxA2Rnhr0lbLcqq4JWswHDpippVhUbh5Jm7OYbjE9lESZ45SnkT7d5DRpNlfg
	E8ckASIQT9ell649LTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPmLl-0000000ATvJ-135C;
	Mon, 23 Dec 2024 17:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlO1-0000000APPu-1zQz
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Dec 2024 16:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d9rs3lvzNHMR+77GQhOfvBA7ZY6vGPyNsyq6vS8VYWA=; b=L1q4DDwj+/tB/F1S5AuNhXeS6z
	fqdnymNKmFt0L2qbCs99rVP5ZIefRa5mCYluVHl812fvRk7FW9VgR0G9pEZNsCP+JcsOwviyCi/Pj
	CUTjpxD4M/z/Ttx1uMvClXtU/fb8ds22AC2wqu38pduQjrd8RLxFf1cLtN+yv8/3kz6vAwyJpr9Dd
	91/w3cJqezpDYXQzOKCWBYqoGoGS3ewfZchpWbgP6pJEZaZIloQt7siZuo7hCcwH/kd2+by3/fiWq
	toj7MzkunTJuWjGODBUZO1npMQkfEyo04lkJZuPa0vBueMXmXwvSDZEiNxpzKUCY7KXTMcTfDGiWq
	yUa7vcBg==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlNx-00000006Pxf-3W5F
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 16:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734971666; x=1766507666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLHUtomYo0uJ2lWl63orMc7OIV1mem3W2iJoTi1vV48=;
  b=Nihhx0J8H+XHtQr9DWql24MxHF7XyP1UQVY7iVP7Iw6vfRJG69w5NdQb
   y/obKeWUvr7rVWkMN/GrXm0mgCLDtDXISWXFsEGUpsdWlD6PiOn+i+muw
   quecEUbN6I+EO51eLr5ssV0iy1TAxXEsarm7IRkp4a9il/ZyV7KQH1j67
   AHZuK2CtZPF6JzzITWPhtldcd/7/sEhgonGq1dZYwLMqtCLtASgsI8M1/
   q/phKgRcRbF4DgqFdIb23wMGBStq3bY9oafN4aU9nKA2cakttGbNywoCM
   VuvFajkWVxuIEdmWgUYzF15hm0OLpDC4uWEH4bB8+b9f3drlJQPqpQyFa
   Q==;
X-CSE-ConnectionGUID: qM2IwqqtRu6hAWAUURF78w==
X-CSE-MsgGUID: eBffKkTIShy0vR5rVxs37w==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39380463"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="39380463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 08:34:07 -0800
X-CSE-ConnectionGUID: XdRGSdj9Rbq4Wx7Zhu/XFA==
X-CSE-MsgGUID: qBvnqr35TMuOJNi26sfluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104239275"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2024 08:34:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPlNW-0000TX-31;
	Mon, 23 Dec 2024 16:33:58 +0000
Date: Tue, 24 Dec 2024 00:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <202412240044.wVXW8Eg1-lkp@intel.com>
References: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_163426_292815_5639F60D 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/kbuild-Check-version-of-objdump/20241217-071632
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b%40rivosinc.com
patch subject: [PATCH 1/2] kbuild: Check version of objdump
config: x86_64-randconfig-003-20241223 (attached as .config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240044.wVXW8Eg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240044.wVXW8Eg1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** objdump is too old.
   ***   Your llvm-objdump version:    
   ***   Minimum llvm-objdump version: 13.0.1
   ***
>> scripts/Kconfig.include:63: Sorry, this objdump is not supported.
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1 shuffle=1831414175
   make[2]: *** [Makefile:733: oldconfig] Error 2 shuffle=1831414175
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make: Target 'oldconfig' not remade because of errors.
--
   ***
   *** objdump is too old.
   ***   Your llvm-objdump version:    
   ***   Minimum llvm-objdump version: 13.0.1
   ***
>> scripts/Kconfig.include:63: Sorry, this objdump is not supported.
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1 shuffle=1831414175
   make[2]: *** [Makefile:733: olddefconfig] Error 2 shuffle=1831414175
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make: Target 'olddefconfig' not remade because of errors.


vim +63 scripts/Kconfig.include

    60	
    61	# Get the objdump name, version, and error out if it is not supported.
    62	objdump-info := $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUMP))
  > 63	$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdump is not supported.)
    64	objdump-name := $(shell,set -- $(objdump-info) && echo $1)
    65	objdump-version := $(shell,set -- $(objdump-info) && echo $2)
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
