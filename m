Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D6C021B8
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 00:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsN6WK0oenRn5hRDLoccdJw1Mu/h1WZR+Pf9hIu14Hc=; b=h2LB09Nxfr5goL
	Gj2toUyhdTB9RqaXrdfoGKUJTrsB0P5NZgdeDdwFNelVO9zJZ7eg11pVMP5ky6a1yPkldhtGZi5XE
	GzSE+jQZap3h5P376swUuAGybkmLqmAs3iHHdwZ8Pzugx01Hr0WvdDn8WKrM30RKcSM/OK1EAl97Y
	79DkubffMvbOTFB5QmQcCeX4Jx/nptKB80+Ihgvcqr+sI49lSrfB8N64Q4UNlaSocbyNesfDW2RfX
	xTxa7vN7QvovcHpUhm9sIPK88ZcK9EEoV6sKT+Z6uXirpMiBLP6gkMd+2U9E6VTsMNR4rm1HtPRW3
	QfuM1bxWuhNqY+QVAKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toX20-0000000F871-1dJX;
	Sun, 02 Mar 2025 00:18:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toX1w-0000000F865-2Xjs
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 00:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740874685; x=1772410685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JOWu2kxr2yC6Upjqp5Y3hhprO8dVQdFobiHy8gxpuC0=;
  b=d/+PtvPcia8uEvE7yfvxpC69lAk9tNjYsAEMQ9iv4/y16JFtxBvDvuOj
   OsLRBRM1Mto6zxvKeHe03uvPh91HtfOSzc1UTqc2Lh8Pv/k0E7podyWpo
   hIpSpH+xOAvX2/mDc3rhAeTROnqdq1gH1S40OOugQT5y3++TlbgEaghH9
   yPIl5w0UJfrUgQoJfFGsU3H+fw/v3LNVbfOxGsnxB+A23lxEJZ4sXnAP7
   wfdZgaaTPEqYRJmyqVo+fdayUJ6Nt5x5albATrfTke3gPNfFAvD+K6yEV
   gUqev4eT4Et5laCG5PfRbQ9N7lWi9/dvm7p1R2RIPTj3dptHakeGyslLA
   A==;
X-CSE-ConnectionGUID: jj8/FxXiSDaiRTRLeSnyCg==
X-CSE-MsgGUID: TUpvTQwVTUCyXgmr9jRclw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41660315"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41660315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 16:17:57 -0800
X-CSE-ConnectionGUID: U0cjrRFjRMy0oj43XQn2tg==
X-CSE-MsgGUID: dbnLJVLVSKGV0YhcVx9VbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122804153"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2025 16:17:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toX1k-000GsE-3D;
	Sun, 02 Mar 2025 00:17:52 +0000
Date: Sun, 2 Mar 2025 08:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] RISC-V: vDSO: Wire up getrandom() vDSO implementation
Message-ID: <202503020759.lCd4bDgK-lkp@intel.com>
References: <20250224122541.65045-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224122541.65045-1-xry111@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_161805_651686_F8212D9E 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Xi,

kernel test robot noticed the following build errors:

[auto build test ERROR on crng-random/master]
[also build test ERROR on shuah-kselftest/next shuah-kselftest/fixes linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Ruoyao/RISC-V-vDSO-Wire-up-getrandom-vDSO-implementation/20250224-203232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
patch link:    https://lore.kernel.org/r/20250224122541.65045-1-xry111%40xry111.site
patch subject: [PATCH] RISC-V: vDSO: Wire up getrandom() vDSO implementation
config: riscv-randconfig-r122-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020759.lCd4bDgK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020759.lCd4bDgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020759.lCd4bDgK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/vdso/getrandom.c:7:9: warning: no previous prototype for '__vdso_getrandom' [-Wmissing-prototypes]
       7 | ssize_t __vdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/getrandom.c: In function '__vdso_getrandom':
>> arch/riscv/kernel/vdso/getrandom.c:9:16: error: implicit declaration of function '__cvdso_getrandom'; did you mean '__vdso_getrandom'? [-Wimplicit-function-declaration]
       9 |         return __cvdso_getrandom(buffer, len, flags, opaque_state, opaque_len);
         |                ^~~~~~~~~~~~~~~~~
         |                __vdso_getrandom
   arch/riscv/kernel/vdso/vgetrandom-chacha.S: Assembler messages:
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:92: Error: unrecognized opcode `ld t2,(a2)'
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:118: Error: improper shift amount (32)
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:20: Error: unrecognized opcode `addw s0,s0,s4'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:127:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:21: Error: unrecognized opcode `addw s1,s1,s5'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:127:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:22: Error: unrecognized opcode `addw s2,s2,s6'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:127:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:23: Error: unrecognized opcode `addw s3,s3,s7'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:127:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a5,32-16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a5,a5,16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a6,32-16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a6,a6,16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a7,32-16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a7,a7,16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,t1,32-16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw t1,t1,16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:129:   Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:20: Error: unrecognized opcode `addw s8,s8,a5'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:131:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:21: Error: unrecognized opcode `addw s9,s9,a6'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:131:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:22: Error: unrecognized opcode `addw s10,s10,a7'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:131:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:23: Error: unrecognized opcode `addw s11,s11,t1'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:131:  Info: macro invoked from here
>> arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s4,32-20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s4,s4,20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s5,32-20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s5,s5,20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s6,32-20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s6,s6,20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s7,32-20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s7,s7,20'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:133:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20: Error: unrecognized opcode `addw s0,s0,s4'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:135:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21: Error: unrecognized opcode `addw s1,s1,s5'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:135:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22: Error: unrecognized opcode `addw s2,s2,s6'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:135:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23: Error: unrecognized opcode `addw s3,s3,s7'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:135:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a5,32-24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a5,a5,24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a6,32-24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a6,a6,24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,a7,32-24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw a7,a7,24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,t1,32-24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw t1,t1,24'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:137:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20: Error: unrecognized opcode `addw s8,s8,a5'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:139:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21: Error: unrecognized opcode `addw s9,s9,a6'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:139:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22: Error: unrecognized opcode `addw s10,s10,a7'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:139:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23: Error: unrecognized opcode `addw s11,s11,t1'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:139:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s4,32-25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s4,s4,25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s5,32-25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s5,s5,25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s6,32-25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s6,s6,25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,s7,32-25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw s7,s7,25'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:141:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20: Error: unrecognized opcode `addw s0,s0,s5'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:144:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:21: Error: unrecognized opcode `addw s1,s1,s6'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:144:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:22: Error: unrecognized opcode `addw s2,s2,s7'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:144:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:23: Error: unrecognized opcode `addw s3,s3,s4'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:144:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:14: Error: unrecognized opcode `slliw t0,t1,32-16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:146:   Info: macro invoked from here
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:15: Error: unrecognized opcode `srliw t1,t1,16'
   arch/riscv/kernel/vdso/vgetrandom-chacha.S:20:  Info: macro invoked from here


vim +9 arch/riscv/kernel/vdso/getrandom.c

     6	
     7	ssize_t __vdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
     8	{
   > 9		return __cvdso_getrandom(buffer, len, flags, opaque_state, opaque_len);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
