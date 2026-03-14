Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D6810706EA
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTfi8jPcMsBL/rabUtptXnRA4lbEshwHfbaN7/YxaOI=; b=JpCQAtEVEvJfgP
	cXIkwZ1ZgCOAEDUzk5O739InUjpMZtLwmGduT6HBcnGl5FpJ8UKEX+T2NjRBCRZewB4plvibD7p6D
	SSTguUD+owxkg9Il/n7K7b3g8oAsJt1dTXZy1twQ3Y4x4GjS7KVWi1OMWcXB64OeRf6x28KDtX0CP
	R7sQkD2Op7c/cyQ8MNRf2/fKf3GVx6ewKOoaHFArsbcWhgWpsGko3G8itQt6YoCqh9m2+gZfMOnIE
	vVqNOyD49CUgG4EPwDLr2HCv6qGtAWYAzKp/jwhGDj6gF20uKN/eyK4XQd5a3l11/lD2imZzW0aN5
	nPNF9xrWLG9F2DE/5IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SRg-00000002152-1P56;
	Sat, 14 Mar 2026 17:06:36 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SRb-0000000214L-3yKs
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 17:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773507992; x=1805043992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BP6PDAwL7ZQIFhbNuWPztuxpeFKM2OWgbd3nAKkdShI=;
  b=PJVksR9HKZbAZ1i+tE3XUNerJXpYJB5n0XPqMRbnRYwSaIR/0FffR1ex
   JuQIMiFTZgZbPqhy70BqmcTumhRirUH0r0vULnlw1btV32ds0l4srb51A
   IbfKvbsBVAqvhDL6feSHdqks2V3Euw9dqmQVZR56RgesdWxHVfVgp5LNY
   cG3nSAqccN2frY6Pg/St0ySYMvqPX6UNyr63u29jRXYSbdBKHtUQCaepZ
   DtnsEhOuwp4bQGsrd0kUxCsVIYF4P65Q8lTumvpKWrkX9cEJQV1HQhqLm
   Tt1wjy5jzVbtwTPsiwT6XzWwHL+9ENIm48LOhLIcLwNVUftMuzazpg+NK
   w==;
X-CSE-ConnectionGUID: Gx+LU5PRToelmAM3SDW4eQ==
X-CSE-MsgGUID: ArbtlKQpRxm78dR9w5GuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74291612"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74291612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 10:06:29 -0700
X-CSE-ConnectionGUID: S7Qzg7o5QjeaYBCY2orMyA==
X-CSE-MsgGUID: 1B0hQ5hhSyOavx3FZxVKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="221543533"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Mar 2026 10:06:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1SRQ-000000003pJ-4Brw;
	Sat, 14 Mar 2026 17:06:21 +0000
Date: Sat, 14 Mar 2026 18:05:40 +0100
From: kernel test robot <lkp@intel.com>
To: Levi Zim via B4 Relay <devnull+rsworktech.outlook.com@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, Amery Hung <ameryhung@gmail.com>,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Levi Zim <rsworktech@outlook.com>
Subject: Re: [PATCH bpf] bpf: do not use kmalloc_nolock when
 !HAVE_CMPXCHG_DOUBLE
Message-ID: <202603141857.sLJ0vJoa-lkp@intel.com>
References: <20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_100632_044667_CC4EBF2E 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Levi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e06e6b8001233241eb5b2e2791162f0585f50f4b]

url:    https://github.com/intel-lab-lkp/linux/commits/Levi-Zim-via-B4-Relay/bpf-do-not-use-kmalloc_nolock-when-HAVE_CMPXCHG_DOUBLE/20260314-195705
base:   e06e6b8001233241eb5b2e2791162f0585f50f4b
patch link:    https://lore.kernel.org/r/20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f%40outlook.com
patch subject: [PATCH bpf] bpf: do not use kmalloc_nolock when !HAVE_CMPXCHG_DOUBLE
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260314/202603141857.sLJ0vJoa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141857.sLJ0vJoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141857.sLJ0vJoa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/bpf_sk_storage.h:15,
                    from net/core/sock.c:141:
>> include/linux/bpf_local_storage.h:22:19: warning: 'KMALLOC_NOLOCK_SUPPORTED' defined but not used [-Wunused-const-variable=]
      22 | static const bool KMALLOC_NOLOCK_SUPPORTED = IS_ENABLED(CONFIG_HAVE_CMPXCHG_DOUBLE);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/KMALLOC_NOLOCK_SUPPORTED +22 include/linux/bpf_local_storage.h

    21	
  > 22	static const bool KMALLOC_NOLOCK_SUPPORTED = IS_ENABLED(CONFIG_HAVE_CMPXCHG_DOUBLE);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
