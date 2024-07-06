Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C7CC3271E
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 00:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiysc6LM01k69SzCcEgOPwZOpeZmNoU9midNI0RAqI0=; b=q6wHVfZmOfM4oT
	GvUdyccjUrCwqaNg3DqbFrJ4/oq3wgKF/dTVr/ONreLI1b8o+A5l1k797rU1JFTTdzxOtdS/POH3a
	Tk0dz79NQDQKdBRFYMWi5Iq6iVXJ8E1OVUazzZN2mg/4VF6pvk0by16twZDlTn4V0n0BOpg3JL5Mt
	QckJaZQqC2vctt88qF16oVn5dlB6kZwOvNDIiBuTRI2rgnbJ/gnMQ2sG40UHqec5SLL+KsFUR6JV1
	x8F3+VgX4RVxohzfuQ81tWj3orndvyLzQNie4oiqxleEa6ASxRN6iY5ThJb4Pwmar+x+ONfpFLew+
	ensR008O6gaaKT7oA2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPsti-0000000H1kU-0lv8;
	Sat, 06 Jul 2024 00:03:26 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPste-0000000H1jy-1VTv
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 00:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720224202; x=1751760202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oKsgv0iFkJHQLCuZK1OneNZikeXXii/caYdBYra4yGQ=;
  b=lYWe13jvBSzGrJ6Z04brX/fNyoTuj8zUcWmycSOUbdZlOFrfV7muR3Aq
   EQ4R/0ZITk0/zBtsdPlnQocdUEpzvn6JNLAs9fXW05N62bYo6RVWTTb/y
   /vdlqDroky9hYqYjQOysjlC9Ke2ALCu2sd/gAtHohK7dXitc3QzcKuWLv
   LX5/3qOtbKi2xvVb0LCrAU8EORqv+xF/mk+b3BgoFLLKNRQlbw7UlHajX
   6vcqemufoLYldIezn/qN+f/e9qmfHQeMOFFRu7GP97E0gOwqY0OVab83P
   0G899EXdTqv2HSqCNCV+QvK7TUndlt3fbIK8Ek8tRAwPMPqCYej/TJkoU
   A==;
X-CSE-ConnectionGUID: ArgCvgoeRZ6sFOXSRrO1iw==
X-CSE-MsgGUID: Ju7DiO2kR7u3pJBROOMAeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42935406"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="42935406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 17:03:19 -0700
X-CSE-ConnectionGUID: 0iN5pkOCS6mtVtnllN0ncg==
X-CSE-MsgGUID: teix2iDHSS+V2Sc3sZF8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="51818468"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jul 2024 17:03:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPstW-000T6m-1i;
	Sat, 06 Jul 2024 00:03:14 +0000
Date: Sat, 6 Jul 2024 08:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: uaccess: use 'asm goto' for put_user()
Message-ID: <202407060732.wjARQ4O7-lkp@intel.com>
References: <20240625040500.1788-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625040500.1788-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_170322_499619_AC7D409D 
X-CRM114-Status: GOOD (  10.11  )
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
config: riscv-randconfig-r071-20240705 (https://download.01.org/0day-ci/archive/20240706/202407060732.wjARQ4O7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060732.wjARQ4O7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060732.wjARQ4O7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/ioctl.c:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> block/ioctl.c:236:9: error: expected ')'
     236 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/ioctl.c:241:9: error: expected ')'
     241 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/ioctl.c:246:9: error: expected ')'
     246 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/ioctl.c:251:9: error: expected ')'
     251 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/ioctl.c:256:9: error: expected ')'
     256 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/ioctl.c:261:9: error: expected ')'
     261 |         return put_user(val, argp);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
--
   In file included from block/bsg.c:8:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> block/bsg.c:89:9: error: expected ')'
      89 |         return put_user(READ_ONCE(bd->max_queue), uarg);
         |                ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/bsg.c:125:10: error: expected ')'
     125 |                 return put_user(30527, intp);
         |                        ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/bsg.c:127:10: error: expected ')'
     127 |                 return put_user(0, intp);
         |                        ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/bsg.c:129:10: error: expected ')'
     129 |                 return put_user(0, intp);
         |                        ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/bsg.c:138:10: error: expected ')'
     138 |                 return put_user(min(bd->reserved_size, queue_max_bytes(q)),
         |                        ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   block/bsg.c:149:10: error: expected ')'
     149 |                 return put_user(1, intp);
         |                        ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
--
   In file included from fs/read_write.c:14:
   In file included from include/linux/fsnotify.h:16:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/read_write.c:1340:16: error: expected ')'
    1340 |                 if (unlikely(put_user(pos, offset)))
         |                              ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   fs/read_write.c:1357:16: error: expected ')'
    1357 |                 if (unlikely(put_user(pos, offset)))
         |                              ^
   arch/riscv/include/asm/uaccess.h:301:3: note: expanded from macro 'put_user'
     301 |                 __put_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   1 warning and 2 errors generated.
--
   In file included from fs/file_table.c:17:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/file_table.c:19:
>> include/linux/eventpoll.h:81:6: error: expected ')'
      81 |         if (__put_user(revents, &uevent->events) ||
         |             ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   In file included from fs/file_table.c:19:
   include/linux/eventpoll.h:82:6: error: expected ')'
      82 |             __put_user(data, &uevent->data))
         |             ^
   arch/riscv/include/asm/uaccess.h:274:2: note: expanded from macro '__put_user'
     274 |         __put_user_error(__val, __gu_ptr, __pu_err);            \
         |         ^
   arch/riscv/include/asm/uaccess.h:238:2: note: expanded from macro '__put_user_error'
     238 |         __put_user_nocheck(x, ptr, err_label);                  \
         |         ^
   arch/riscv/include/asm/uaccess.h:228:3: note: expanded from macro '__put_user_nocheck'
     228 |                 __put_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:211:25: note: expanded from macro '__put_user_8'
     211 |                         "m" (__ptr[__MSW]) : : label);          \
         |                                              ^
   1 warning and 2 errors generated.
..


vim +236 block/ioctl.c

66ba32dc167202c block/ioctl.c         Martin K. Petersen 2012-09-18  233  
9b81648cb5e3ae7 block/ioctl.c         Arnd Bergmann      2019-11-29  234  static int put_ushort(unsigned short __user *argp, unsigned short val)
^1da177e4c3f415 drivers/block/ioctl.c Linus Torvalds     2005-04-16  235  {
9b81648cb5e3ae7 block/ioctl.c         Arnd Bergmann      2019-11-29 @236  	return put_user(val, argp);
^1da177e4c3f415 drivers/block/ioctl.c Linus Torvalds     2005-04-16  237  }
^1da177e4c3f415 drivers/block/ioctl.c Linus Torvalds     2005-04-16  238  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
