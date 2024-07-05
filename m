Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91564C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 02:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSpZH9O2fNkx7skjHPzyFsZRzPQaJeK3KjZyk4tYKFg=; b=anRDgN4odBsUH/
	Ybw3Ftp8IVxIy+I2Hii9D3t3QOfb0/pDomY9nDMgYH9JxR+UMMe3EL2bHIAhoVbnRGtdhJSmRI1jo
	3ZJhTjpQ0biaI+SLY32tIJNpV6rehhLoMWqFJljocbxicwpF6LqRnOj3TXmhGfmezci9divLDkpHC
	yIbRZdeiqyVgTwyTyH32+yX/YDcok+hiBHmiFS8NzeG8zF85yUsQOUmtsZ0AYiwtY7BLd2eTwjLkv
	rOrZe97rUVhPfwWw0/NdrJj9mv3OoBYpOWDk7uQI+jW5vCleQj/521dcE7t2nZk7JTdUu1M7IzVF5
	E2TH6p3EQTXeMYrXclAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPYb8-0000000EjzF-1umN;
	Fri, 05 Jul 2024 02:22:54 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPYb5-0000000Ejxr-1Lqo
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 02:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146171; x=1751682171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XD/f5KAgcK01TW8VxVOI/FtGkmr+hOD82xZoESN1LnA=;
  b=GyFIB0t69SK/cn0HGPgOGVEMTDWoYAP3W5eXmmN0sqf7nz3UOQUHzbk7
   /755ZR1Lp2AzGgxVoBxAgNKK2O6P2XdKTPxfpwlEeoV/10dHesyiHW7QB
   mIz37BTbkNXCzBhOptTSehiYxpjfO7aOF8rhlE84YsAoBCJmU4fJB8NDD
   Ly4UFjf3dGYtM6oGdPWQJ5dNiHE8P+Aka49dOqTDcrtcaf8Z546EuQPBa
   A3B1jWFVA3TZ7FEP5ML3McLPgAjrjNWbN22IJZZrKI3IRJd8IonAFEgjg
   zvT0vUSnL+fLoxrBpysIg49lAaUohyBB1F6KkdGBkgRlAWQ4/sfC+IWYy
   Q==;
X-CSE-ConnectionGUID: B29TtNwtS9KNq7ROKG2HUw==
X-CSE-MsgGUID: cKzSFk4LQBOWAoJi979s1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17250503"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17250503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:22:47 -0700
X-CSE-ConnectionGUID: EM9i0E2KQiaTlR0AqJmkfw==
X-CSE-MsgGUID: EczCoBGHSvO4UUz5lUwtfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51172775"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 19:22:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYaw-000RnA-2R;
	Fri, 05 Jul 2024 02:22:42 +0000
Date: Fri, 5 Jul 2024 10:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: uaccess: use 'asm goto' for put_user()
Message-ID: <202407051058.kE7ADWxJ-lkp@intel.com>
References: <20240625040500.1788-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625040500.1788-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_192251_506773_58122129 
X-CRM114-Status: GOOD (  10.41  )
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
[also build test ERROR on v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-implement-user_access_begin-and-families/20240626-005352
base:   linus/master
patch link:    https://lore.kernel.org/r/20240625040500.1788-4-jszhang%40kernel.org
patch subject: [PATCH 3/4] riscv: uaccess: use 'asm goto' for put_user()
config: riscv-randconfig-r121-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051058.kE7ADWxJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407051058.kE7ADWxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051058.kE7ADWxJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/riscv/kernel/process.c:10:
   arch/riscv/kernel/process.c: In function 'get_unalign_ctl':
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/process.c:57:16: note: in expansion of macro 'put_user'
      57 |         return put_user(tsk->thread.align_ctl, (unsigned long __user *)adr);
         |                ^~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/process.c:57:16: note: in expansion of macro 'put_user'
      57 |         return put_user(tsk->thread.align_ctl, (unsigned long __user *)adr);
         |                ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/riscv/kernel/signal.c:9:
   arch/riscv/kernel/signal.c: In function 'setup_sigcontext':
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:290:16: note: in expansion of macro '__put_user'
     290 |         err |= __put_user(0, &sc->sc_extdesc.reserved);
         |                ^~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:290:16: note: in expansion of macro '__put_user'
     290 |         err |= __put_user(0, &sc->sc_extdesc.reserved);
         |                ^~~~~~~~~~
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:292:16: note: in expansion of macro '__put_user'
     292 |         err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
         |                ^~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:292:16: note: in expansion of macro '__put_user'
     292 |         err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
         |                ^~~~~~~~~~
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:293:16: note: in expansion of macro '__put_user'
     293 |         err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
         |                ^~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:293:16: note: in expansion of macro '__put_user'
     293 |         err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
         |                ^~~~~~~~~~
   arch/riscv/kernel/signal.c: In function 'setup_rt_frame':
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:336:16: note: in expansion of macro '__put_user'
     336 |         err |= __put_user(0, &frame->uc.uc_flags);
         |                ^~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:336:16: note: in expansion of macro '__put_user'
     336 |         err |= __put_user(0, &frame->uc.uc_flags);
         |                ^~~~~~~~~~
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:337:16: note: in expansion of macro '__put_user'
     337 |         err |= __put_user(NULL, &frame->uc.uc_link);
         |                ^~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:337:16: note: in expansion of macro '__put_user'
     337 |         err |= __put_user(NULL, &frame->uc.uc_link);
         |                ^~~~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:82,
                    from arch/riscv/kernel/sys_hwprobe.c:7:
   arch/riscv/kernel/sys_hwprobe.c: In function 'hwprobe_get_values':
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:278:23: note: in expansion of macro 'put_user'
     278 |                 ret = put_user(pair.key, &pairs->key);
         |                       ^~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:278:23: note: in expansion of macro 'put_user'
     278 |                 ret = put_user(pair.key, &pairs->key);
         |                       ^~~~~~~~
>> arch/riscv/include/asm/uaccess.h:211:46: error: expected ')' before ':' token
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:280:31: note: in expansion of macro 'put_user'
     280 |                         ret = put_user(pair.value, &pairs->value);
         |                               ^~~~~~~~
   arch/riscv/include/asm/uaccess.h:202:30: note: to match this '('
     202 |         __asm__ __volatile__ (                                  \
         |                              ^
   arch/riscv/include/asm/uaccess.h:228:17: note: in expansion of macro '__put_user_8'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:238:9: note: in expansion of macro '__put_user_nocheck'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:274:9: note: in expansion of macro '__put_user_error'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:301:17: note: in expansion of macro '__put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:280:31: note: in expansion of macro 'put_user'
     280 |                         ret = put_user(pair.value, &pairs->value);
         |                               ^~~~~~~~


vim +211 arch/riscv/include/asm/uaccess.h

   193	
   194	#ifdef CONFIG_64BIT
   195	#define __put_user_8(x, ptr, label) \
   196		__put_user_asm("sd", x, ptr, label)
   197	#else /* !CONFIG_64BIT */
   198	#define __put_user_8(x, ptr, label)				\
   199	do {								\
   200		u32 __user *__ptr = (u32 __user *)(ptr);		\
   201		u64 __x = (__typeof__((x)-(x)))(x);			\
   202		__asm__ __volatile__ (					\
   203			"1:\n"						\
   204			"	sw %z0, %2\n"				\
   205			"2:\n"						\
   206			"	sw %z1, %3\n"				\
   207			_ASM_EXTABLE(1b, %l4)				\
   208			_ASM_EXTABLE(2b, %l4)				\
   209			: : "rJ" (__x), "rJ" (__x >> 32),		\
   210				"m" (__ptr[__LSW]),			\
 > 211				"m" (__ptr[__MSW]) : : label);		\
   212	} while (0)
   213	#endif /* CONFIG_64BIT */
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
