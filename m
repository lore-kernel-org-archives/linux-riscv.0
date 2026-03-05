Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A09EF3D329
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rQILrVxqeMSvUlJs+eUG3AnqUnlYk8WQ0MK0Jcli9k=; b=qrcJrdcuDnbBbl
	9OwReCaY6sgC8iDDKyTRv78kx9DE5jOn5arDcgxh3jTMFlLvwhzsY20YLD/aAij302yBoh+PFpI7v
	NPdBHzCTiTZ616o/Wda9hyDwJIGLXem95V7mdtfA2sQH6AKEvVtn4HesD76WCzNIFxx6bdSOVRzbM
	PDqqlauHRiZdPg1XZvL4yzGq333ma+fhHL7YMm4F6ZjuvqBzIGasdfK8xjvU4WRocij+QFgWM0dMU
	L/LcsbybYxeyLeoHAjRoVN5N1cKrVvqrlVNEszTRsLAf/NuLkOMjwV2+sznZfjU7P+WnhqRs1rAb+
	fbYY604RYZTM++Yx1Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBHo-00000002BbD-2L3N;
	Thu, 05 Mar 2026 16:10:52 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBHl-00000002Bav-2zes
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 16:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772727049; x=1804263049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1q6rIizXuyYgUo7PEQpRErULcW8ElhJl1i4zMa6SjAM=;
  b=Y+7KsVLCBrX42Y31yM0aO7f30vehTCFPUgHigUlddZL2bqMQjsvYBmS4
   PAB2sIIT9GStlMf9b14MuZGmNHDkmbr2rabv9SsHEybTX2gIOLEh/aTrz
   1mH282YBwiZPYfoCVnDeQ9mhOqQHIPRGZ57LZ7hKx4/RmSkfOubm7xlKz
   S+7BqSojFkNqt+F5sraaknTPnWt6rgM/Zyzp5qLR6niXbgnubJMNkK26f
   xKCXORCdROJ4oSvkdXqECToVN92pGUWkda4Fc+v5jgEI+RH2ERNVlv5ur
   RBUIDdksDS2cL39tAjFO694pt6ZNg6uhSS2sqxr0D5mZU3gct0Ozd1elJ
   A==;
X-CSE-ConnectionGUID: LgxeFxYKTKe7uS0Fj4t45A==
X-CSE-MsgGUID: fiVHqTq0QEC9RAVwclP5yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84903341"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84903341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:10:47 -0800
X-CSE-ConnectionGUID: rxlLxNrzR9u5WN3YdIEWrA==
X-CSE-MsgGUID: eVd40RDZRNCDSGOIdh3+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216998057"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 08:10:45 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyBHf-0000000021t-0gSs;
	Thu, 05 Mar 2026 16:10:43 +0000
Date: Thu, 5 Mar 2026 17:10:34 +0100
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
Message-ID: <202603051713.xu4BUyLe-lkp@intel.com>
References: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_081049_843515_97920606 
X-CRM114-Status: UNSURE (   9.52  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on c107785c7e8dbabd1c18301a1c362544b5786282]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins-via-B4-Relay/selftests-riscv-Add-definition-of-BIT-macro/20260305-164838
base:   c107785c7e8dbabd1c18301a1c362544b5786282
patch link:    https://lore.kernel.org/r/20260305-fix_selftests-v1-1-61b62d23500b%40gmail.com
patch subject: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260305/202603051713.xu4BUyLe-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051713.xu4BUyLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051713.xu4BUyLe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/riscv64-linux-gnu/include/stdint.h:34,
                    from /usr/lib/gcc-cross/riscv64-linux-gnu/14/include/stdint.h:9,
                    from tools/testing/selftests/../../../tools/include/linux/types.h:7,
                    from ./../../../../include/nolibc/std.h:19,
                    from ./../../../../include/nolibc/nolibc.h:95,
                    from <command-line>:
>> /usr/riscv64-linux-gnu/include/bits/stdint-intn.h:27:19: error: conflicting types for 'int64_t'; have '__int64_t' {aka 'long int'}
      27 | typedef __int64_t int64_t;
         |                   ^~~~~~~
   In file included from ./../../../../include/nolibc/std.h:16:
   ./../../../../include/nolibc/stdint.h:17:29: note: previous declaration of 'int64_t' with type 'int64_t' {aka 'long long int'}
      17 | typedef   signed long long  int64_t;
         |                             ^~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/stdint.h:37:
>> /usr/riscv64-linux-gnu/include/bits/stdint-uintn.h:27:20: error: conflicting types for 'uint64_t'; have '__uint64_t' {aka 'long unsigned int'}
      27 | typedef __uint64_t uint64_t;
         |                    ^~~~~~~~
   ./../../../../include/nolibc/stdint.h:16:28: note: previous declaration of 'uint64_t' with type 'uint64_t' {aka 'long long unsigned int'}
      16 | typedef unsigned long long uint64_t;
         |                            ^~~~~~~~
   In file included from /usr/riscv64-linux-gnu/include/stdint.h:41:
>> /usr/riscv64-linux-gnu/include/bits/stdint-least.h:28:25: error: conflicting types for 'int_least64_t'; have '__int_least64_t' {aka 'long int'}
      28 | typedef __int_least64_t int_least64_t;
         |                         ^~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:30:23: note: previous declaration of 'int_least64_t' with type 'int_least64_t' {aka 'long long int'}
      30 | typedef  int64_t      int_least64_t;
         |                       ^~~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/bits/stdint-least.h:34:26: error: conflicting types for 'uint_least64_t'; have '__uint_least64_t' {aka 'long unsigned int'}
      34 | typedef __uint_least64_t uint_least64_t;
         |                          ^~~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:31:22: note: previous declaration of 'uint_least64_t' with type 'uint_least64_t' {aka 'long long unsigned int'}
      31 | typedef uint64_t     uint_least64_t;
         |                      ^~~~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/stdint.h:51:33: error: conflicting types for 'int_fast64_t'; have 'long int'
      51 | typedef long int                int_fast64_t;
         |                                 ^~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:39:24: note: previous declaration of 'int_fast64_t' with type 'int_fast64_t' {aka 'long long int'}
      39 | typedef  int64_t       int_fast64_t;
         |                        ^~~~~~~~~~~~
>> /usr/riscv64-linux-gnu/include/stdint.h:64:33: error: conflicting types for 'uint_fast64_t'; have 'long unsigned int'
      64 | typedef unsigned long int       uint_fast64_t;
         |                                 ^~~~~~~~~~~~~
   ./../../../../include/nolibc/stdint.h:40:23: note: previous declaration of 'uint_fast64_t' with type 'uint_fast64_t' {aka 'long long unsigned int'}
      40 | typedef uint64_t      uint_fast64_t;
         |                       ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
