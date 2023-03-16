Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC1EC6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHiHBtB7RZBFdAnTd2KS6HHeovPUGoUyB9y/wYIH4vc=; b=XabFLEXoAXoY7X
	ApeYduypY9B8mFKPC4DYKRtbnXUQRRC2nhglNYRVuXM51/jTJxdCNNL+G9ny6XZ0AiTL+3pGhzr7L
	aBMMO1zY4ChTPV9WlFtVNHT+/R3rj4DoMNlgf5S6/c7a8qJ2tyTV2st/ocJWIVE/xP1mMiS3n7PB7
	U6sHuMCW4ITEzJM2DamlT0uYbkxrp+2hJNjPE7J+G3iD3u3H4dQgp+sPcTRqP7Ae0LvFV9ZT6DM/Z
	dLhrBqmUbTOjydvkE0Y7JW9LHyYaVghF/6I11JFoXdc8F8wiZeladfWsWqcCIA+/skkIDPWgB+ofB
	Yu1Q21VM/cLIrpMIdUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjzy-00Ft5d-2L;
	Thu, 16 Mar 2023 09:34:14 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjzu-00Ft3w-2C;
	Thu, 16 Mar 2023 09:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678959250; x=1710495250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Es8gXpWFt4PFKee/2ySsCx37zzXpOdN7ikcR/wK0ZBA=;
  b=X/Lc1zb348jH7Lc3xrYjD3NolRNsjMRhgWIbgYh7j5tkHEkA00ewPbQl
   k8+H99vWoRBnOuNgeNnh4+2WlXvwfB74XZf4n0QIOB0u5KuIMYklXbcXT
   C+XtXq/6oUUqg6oWyVsiEZUiOQxQnd2ouvlyR6dnheaqQ2grmfx9Cx8om
   8yxH/ycGlEoU7NaBUhdWRtua44rcJVtb+joG/O7bPRH7QIHWtSquQFanr
   k7e34KQbdkxO/K8Ir4BUnQ+H8CZurXEgoKnMBnDCRv7548OF+yEH6r7Um
   IsYK+VF9MhdNQr7rwaSKGSYrUFRYNJcXzEHoxDxwDtwyx6rUwl08bSSfD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339466427"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339466427"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 02:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="710026418"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="710026418"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 02:33:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcjzC-0008RU-0f;
	Thu, 16 Mar 2023 09:33:26 +0000
Date: Thu, 16 Mar 2023 17:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2 3/6] mm: Add VM_FAULT_ARCH_* codes
Message-ID: <202303161725.tJspbzJz-lkp@intel.com>
References: <20230315030359.14162-4-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315030359.14162-4-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_023410_787227_1F6EE57D 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Palmer,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Palmer-Dabbelt/riscv-mm-fault-simplify-code-for-do_page_fault/20230315-111507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230315030359.14162-4-palmer%40rivosinc.com
patch subject: [PATCH v2 3/6] mm: Add VM_FAULT_ARCH_* codes
config: s390-randconfig-r044-20230312 (https://download.01.org/0day-ci/archive/20230316/202303161725.tJspbzJz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d25cdd69b804d954e31ad8835750a8707e11af32
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Palmer-Dabbelt/riscv-mm-fault-simplify-code-for-do_page_fault/20230315-111507
        git checkout d25cdd69b804d954e31ad8835750a8707e11af32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161725.tJspbzJz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/fs_dax.h:286,
                    from fs/dax.c:31:
   include/trace/events/fs_dax.h: In function 'trace_raw_output_dax_pmd_fault_class':
>> include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/fs_dax.h:38:9: note: in expansion of macro 'TP_printk'
      38 |         TP_printk("dev %d:%d ino %#lx %s %s address %#lx vm_start "
         |         ^~~~~~~~~
   include/trace/events/fs_dax.h:50:17: note: in expansion of macro '__print_flags'
      50 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^~~~~~~~~~~~~
   include/trace/events/fs_dax.h: In function 'trace_raw_output_dax_pte_fault_class':
>> include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/fs_dax.h:174:9: note: in expansion of macro 'TP_printk'
     174 |         TP_printk("dev %d:%d ino %#lx %s %s address %#lx pgoff %#lx %s",
         |         ^~~~~~~~~
   include/trace/events/fs_dax.h:182:17: note: in expansion of macro '__print_flags'
     182 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^~~~~~~~~~~~~


vim +70 include/trace/stages/stage3_trace_output.h

1bc191051dca28 include/trace/stages/stage3_defines.h Linus Torvalds          2022-03-23  65  
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  66) #undef __print_flags
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  67) #define __print_flags(flag, delim, flag_array...)			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  68) 	({								\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  69) 		static const struct trace_print_flags __flags[] =	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03 @70) 			{ flag_array, { -1, NULL }};			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  71) 		trace_print_flags_seq(p, delim, flag, __flags);	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  72) 	})
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  73) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
