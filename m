Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021CFD2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdNRXbn0GSTyC07ZnCuZ9NEf2lACck+90vhgsx34s5w=; b=azw7S/vhtmKKfi
	cw7kzXgjruEWM5hUlGBSsY11mctUyeeWDboBy5FZpKigijNjqDPFdW+RtFQNvux0n9U7PETohvSVI
	c7pUDr3BiDkbKgdJzTyI4MGiN06HBTyqBP4jRZ9v+12Fah5Ayfd9GobpNQtstboRQOCN43d6cL9IY
	2YlNVqFusgDfi5ABgPJhXCR+X6YDlUT9go/JnWJIxLD/0dXJxfQ4Q8+xGErUxVXCBGQ43gPhExQrz
	JBVxRIM/BEcLpolNJ64u4aKWW08qEtOGkCfW8x8gsXiLmHHsBHoPRjVK1utRm7brWh4OAteNsnl6Z
	G80042/j/3YJQnxSt+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2nT-0000000EgMz-1DZq;
	Thu, 10 Oct 2024 23:42:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2m7-0000000EgGo-2rYV;
	Thu, 10 Oct 2024 23:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PXRDfWHQZarR5O9zeqIq2T4aPxYkzoGywRKeRNgDhAQ=; b=W1tAgwiDIZo3yhWWrCW7wtUpi6
	26YdN/rrokciEF2dlSwNBbHlIlz8UkHxAjuSkZpBZAYxetZtO3hawSwFF4qsfobIFhNqvvequKLk0
	6s5a8t0ogJ2SOGgQ7sTDiWM611puHECuBmzyrQ7su3/WWbr2xTaD+gFX+3hLEWYu6Exh5/4SELDHh
	l5BIWlmAJMMhzBksibsz+fQpbMP8phPemPnkI2l0OPsyzDmb+GG3Cszyo+3v+EAgrRlDxi9DBh9GX
	9iyt3CvL64+elfi9JQw0wX1BORvRRCs6zOcXXyZfYdWp3Gjv5b881TdNriOiQSvRUjdd8pX/yNFej
	XNqk2n7A==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2m1-00000005jnN-1xeu;
	Thu, 10 Oct 2024 23:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728603650; x=1760139650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iGGlFY2rrvyG4+iAA/qO6ZG9WmpdD1GQIKwf3ap0s6M=;
  b=kx4OdkVkL0OM8Y6MP7NyZi9HVTexLQZoCaHTJIdRZd0WmFFSkDDO3kSd
   mIhxBjZwU/zD1FMEs6ZPtTnpevP0ZNy+dv+gY/HLKSA3F8p11iYM19P28
   wh3M/X64eX2I5YMfgvGpoFGB35YjiWRe2O5+4QjOPEWG+gy8yGl83ErWD
   zTfCEBEPumcjv90FH0yMo4u6UC7FTiWKb8OPMhgVTRcq2T8h3jhgn3URw
   3o5Bgs974YwXnT40qW08NwLU7IK3L0aMzrS2XHBt0CbFl2GPOwu6r+ke/
   /kLQNMF8uY2LlPrn5EE/Jpp5Fjrd553b9lqIiZFgMl7BV4VMIfAxr6eLf
   g==;
X-CSE-ConnectionGUID: A+f2LxKjQDS2W4A72uEIRg==
X-CSE-MsgGUID: c7qSz2+gTSyt+QmRZbVrrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28081161"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28081161"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 16:40:46 -0700
X-CSE-ConnectionGUID: HszBBIMRTr6Xau5a/ruJOA==
X-CSE-MsgGUID: yugHOdlDQkiylavkANyiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81347586"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2024 16:40:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz2lp-000BPx-04;
	Thu, 10 Oct 2024 23:40:37 +0000
Date: Fri, 11 Oct 2024 07:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <202410110707.OaEI6wYh-lkp@intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_004050_973875_F170E9B4 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241004]
[cannot apply to s390/features arm64/for-next/core powerpc/next powerpc/fixes linus/master v6.12-rc2 v6.12-rc1 v6.11 v6.12-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Make-ftrace_regs-abstract-from-direct-use/20241008-084930
base:   next-20241004
patch link:    https://lore.kernel.org/r/20241007204743.41314f1d%40gandalf.local.home
patch subject: [PATCH] ftrace: Make ftrace_regs abstract from direct use
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410110707.OaEI6wYh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110707.OaEI6wYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110707.OaEI6wYh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/ftrace.h:1,
                    from include/linux/ftrace.h:23,
                    from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from init/main.c:21:
>> include/asm-generic/ftrace.h:5: error: unterminated #ifndef
       5 | #ifndef __ASM_GENERIC_FTRACE_H__


vim +5 include/asm-generic/ftrace.h

38f5bf84bd588a GuanXuetao 2011-01-15 @5  #ifndef __ASM_GENERIC_FTRACE_H__
38f5bf84bd588a GuanXuetao 2011-01-15  6  #define __ASM_GENERIC_FTRACE_H__
38f5bf84bd588a GuanXuetao 2011-01-15  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
