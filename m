Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97317C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 04:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5PJ8GKZPhw+Xvdh1lgg7H9iE/P3kT4RnK1YDkwn8b4=; b=qNrZzUU9muKMDI
	sQL9S3MAT+LtNZ9E7OxFtAIF7E27iNtw8egV1dIwr2eHwGXiHvPZMXeGnxkmMpinhZfdZ0Ab/hKA1
	FRuOXyt9hC938b3duH1VoY3hXKmLunrON5bqLsQfYCcbt0zDLsIkzU1eXrldqFlW6AzsWCTewBO9l
	aII7cotVT8rcrSYfojIj3FLNaQMdcVhw+jEu/EPVFw4IX88fdqXtEKcuXibN+NjZ3cvRgihTOBx4v
	8vhe/dFywcUrWBDZ/F8cRGkUAQaNrFD0dOjXzqD9uoJJtUK2CiqhXeGYAtcwRsm90NMaRp4L92Cgx
	NaJuc9EsXGbKXDb34Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPaKb-0000000EsTu-3USB;
	Fri, 05 Jul 2024 04:13:57 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPaKZ-0000000EsTP-1BLC
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 04:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720152836; x=1751688836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DgJOfUyOSxVhQfMvmhTpdQIhTot3ud+pCunclUi06xE=;
  b=MEYZchpeuAr2TSrQuexsl/SxsdFLzpCR5xyUSjNNbX1wX2MF4z9fsZLt
   LfAl8vAEYWO5g3zZh1zrBtCmAjpmkna4XwOhGM01ygjdOTJR91ud79EZo
   2M0iuDb/I+0PSX3cVR5N9K2V1U2Wy0ZC7szTADqFI17wZILTDEpv8F8OH
   TDKRDZcPLSZkEDMzwsAmD5IdGhIqpbyAhvI4Xf4gsA84YKzWsqvNimh9w
   VO2E9lwobrcTDyRGpqAKxnqiYRRVqsUzrtmP36iR+YePr84Q8nwm6zL1C
   j5xa2yfAP3i0tnD9PGZuQlxXutCcuewa84y2ubMM5f6f39kVw1zuTLzh+
   Q==;
X-CSE-ConnectionGUID: LzQflvZXQxKj//lnwKKYyg==
X-CSE-MsgGUID: MuzPJYuqSv2+4o7h/gkkxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17542354"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17542354"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 21:13:49 -0700
X-CSE-ConnectionGUID: h6gQyRWgSs6tkoY6PEIYgw==
X-CSE-MsgGUID: 1toK6P7UQbKpG292BlGNQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47196195"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2024 21:13:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPaKO-000RtI-28;
	Fri, 05 Jul 2024 04:13:44 +0000
Date: Fri, 5 Jul 2024 12:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: uaccess: use 'asm goto output' for get_user
Message-ID: <202407051159.ArkAPA6L-lkp@intel.com>
References: <20240625040500.1788-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625040500.1788-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_211355_395287_6D4614CB 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-implement-user_access_begin-and-families/20240626-005352
base:   linus/master
patch link:    https://lore.kernel.org/r/20240625040500.1788-5-jszhang%40kernel.org
patch subject: [PATCH 4/4] riscv: uaccess: use 'asm goto output' for get_user
config: riscv-randconfig-r121-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051159.ArkAPA6L-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407051159.ArkAPA6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051159.ArkAPA6L-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:174,
                    from <command-line>:
   net/rfkill/core.c: In function 'rfkill_fop_ioctl':
>> arch/riscv/include/asm/uaccess.h:104:26: error: '__lo' undeclared (first use in this function)
     104 |                 : "=&r" (__lo), "=r" (__hi)                     \
         |                          ^~~~
   include/linux/compiler-gcc.h:84:32: note: in definition of macro 'asm_goto_output'
      84 |         do { asm volatile goto(x); asm (""); } while (0)
         |                                ^
   arch/riscv/include/asm/uaccess.h:148:17: note: in expansion of macro '__get_user_8'
     148 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:159:9: note: in expansion of macro '__get_user_nocheck'
     159 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:196:9: note: in expansion of macro '__get_user_error'
     196 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:226:17: note: in expansion of macro '__get_user'
     226 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   net/rfkill/core.c:1373:21: note: in expansion of macro 'get_user'
    1373 |                 if (get_user(size, (__u32 __user *)arg)) {
         |                     ^~~~~~~~
   arch/riscv/include/asm/uaccess.h:104:26: note: each undeclared identifier is reported only once for each function it appears in
     104 |                 : "=&r" (__lo), "=r" (__hi)                     \
         |                          ^~~~
   include/linux/compiler-gcc.h:84:32: note: in definition of macro 'asm_goto_output'
      84 |         do { asm volatile goto(x); asm (""); } while (0)
         |                                ^
   arch/riscv/include/asm/uaccess.h:148:17: note: in expansion of macro '__get_user_8'
     148 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:159:9: note: in expansion of macro '__get_user_nocheck'
     159 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:196:9: note: in expansion of macro '__get_user_error'
     196 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:226:17: note: in expansion of macro '__get_user'
     226 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   net/rfkill/core.c:1373:21: note: in expansion of macro 'get_user'
    1373 |                 if (get_user(size, (__u32 __user *)arg)) {
         |                     ^~~~~~~~
>> arch/riscv/include/asm/uaccess.h:104:39: error: '__hi' undeclared (first use in this function)
     104 |                 : "=&r" (__lo), "=r" (__hi)                     \
         |                                       ^~~~
   include/linux/compiler-gcc.h:84:32: note: in definition of macro 'asm_goto_output'
      84 |         do { asm volatile goto(x); asm (""); } while (0)
         |                                ^
   arch/riscv/include/asm/uaccess.h:148:17: note: in expansion of macro '__get_user_8'
     148 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:159:9: note: in expansion of macro '__get_user_nocheck'
     159 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:196:9: note: in expansion of macro '__get_user_error'
     196 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:226:17: note: in expansion of macro '__get_user'
     226 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   net/rfkill/core.c:1373:21: note: in expansion of macro 'get_user'
    1373 |                 if (get_user(size, (__u32 __user *)arg)) {
         |                     ^~~~~~~~
>> arch/riscv/include/asm/uaccess.h:105:24: error: '__ptr' undeclared (first use in this function); did you mean '__p'?
     105 |                 : "m" (__ptr[__LSW]), "m" (__ptr[__MSW])        \
         |                        ^~~~~
   include/linux/compiler-gcc.h:84:32: note: in definition of macro 'asm_goto_output'
      84 |         do { asm volatile goto(x); asm (""); } while (0)
         |                                ^
   arch/riscv/include/asm/uaccess.h:148:17: note: in expansion of macro '__get_user_8'
     148 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:159:9: note: in expansion of macro '__get_user_nocheck'
     159 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:196:9: note: in expansion of macro '__get_user_error'
     196 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:226:17: note: in expansion of macro '__get_user'
     226 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   net/rfkill/core.c:1373:21: note: in expansion of macro 'get_user'
    1373 |                 if (get_user(size, (__u32 __user *)arg)) {
         |                     ^~~~~~~~


vim +/__lo +104 arch/riscv/include/asm/uaccess.h

    94	
    95	#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
    96	#define __get_user_8(x, ptr, label)				\
    97		asm_goto_output(					\
    98			"1:\n"						\
    99			"	lw %0, %2\n"				\
   100			"2:\n"						\
   101			"	lw %1, %3\n"				\
   102			_ASM_EXTABLE_UACCESS_ERR(1b, %l4, %0)		\
   103			_ASM_EXTABLE_UACCESS_ERR(2b, %l4, %0)		\
 > 104			: "=&r" (__lo), "=r" (__hi)			\
 > 105			: "m" (__ptr[__LSW]), "m" (__ptr[__MSW])	\
   106			: : label)
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
