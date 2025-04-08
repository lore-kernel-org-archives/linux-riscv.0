Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6F2C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 22:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULw6Rh0wb5Lst7kptgpvw2zipoyB6MgNXhfk6fO83yI=; b=j7sKqS53A/1Zig
	RrGlG6fcZwQZO98nW7Zdy4juNQPQI9QfNrzVSHb3sPTBEphVMvLYFqCYtj9qUzOdHi29aDA+SC+yT
	TGXGiWic7i5t+1AUaHy40REFa61ZM8X79H9gjqleGVeOORCradH+Z20c5K9xB1aJQ6ltB/apJRhNh
	aNq9+frzcKcR867U1UWoQ4IPiQN7C/NO+aqPZYQlw6NLKGr9o031wdCiBgXxNJR2+hsQcdkOZLoV6
	1tyq4hRX7UDwUrAUyNpz9+gvjeuPcU13VdIlm8OF3DYlWUoW17AfB9Zy2n9JiNqx1+4jAU+Qvwu0h
	QJq2PZVSTYIS3Hdvfwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HUb-00000005adT-3RtA;
	Tue, 08 Apr 2025 22:32:29 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HUL-00000005aWy-0Hqb
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 22:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744151533; x=1775687533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b0bXRgqQnmm2cNRFGm8SjalL6upzrz3+tOd/LgkS0gI=;
  b=FbqJqj7eEf0Qf7e5dxqL7YzeP+QxngUqRZwtXv6RYYI9eivlHfzvy5WF
   5WvHlEgbbBU1V4kiKB845qS0rpW5VSTMvMtvnYxsJsC7WdnJMm+vs88A6
   KaDJ7Uwg4U5d909KtWjRCJO4Jn2+n9timoPcEsuaRW0SqJ20B52GR/d8v
   WuO12nqHESnj7jtDf+HMw8G/h+nVccOIFA+szEEyTxSjG5/reA/7k8Xc8
   a66EOztY4WcYGCZZ2QdnSEot9/Fw3iSPPxSGh4X3UGrO46I2CGF4Oi0+4
   n6FUFDpgyVjx1i+B6mBXwLjtYYkrR1dQzQGuvBdD+oopkrDdwuFo6/D8a
   Q==;
X-CSE-ConnectionGUID: An/xtiuGSB2DQtEyLxIVzQ==
X-CSE-MsgGUID: EoLKOxfVROm6cI2zYa79Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68085748"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="68085748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 15:32:09 -0700
X-CSE-ConnectionGUID: aP+z0NrzTryiGi6q0VfaUw==
X-CSE-MsgGUID: 6AYdNThmRlmvePPfHRrbKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128935856"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2025 15:32:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2HU9-000827-1C;
	Tue, 08 Apr 2025 22:32:01 +0000
Date: Wed, 9 Apr 2025 06:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Alexandre Ghiti <alex@ghiti.fr>, bjorn@rivosinc.com,
	puranjay12@gmail.com, paul.walmsley@sifive.com,
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com
Subject: Re: [PATCH v4 04/12] kernel: ftrace: export ftrace_sync_ipi
Message-ID: <202504090657.5fiH4UIS-lkp@intel.com>
References: <20250407180838.42877-4-andybnac@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407180838.42877-4-andybnac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_153213_172986_EB1AF8C3 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc1 next-20250408]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-ftrace-factor-out-code-defined-by-WITH_ARG/20250408-025114
base:   linus/master
patch link:    https://lore.kernel.org/r/20250407180838.42877-4-andybnac%40gmail.com
patch subject: [PATCH v4 04/12] kernel: ftrace: export ftrace_sync_ipi
config: xtensa-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090657.5fiH4UIS-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090657.5fiH4UIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090657.5fiH4UIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ftrace.c:191:6: warning: no previous prototype for 'ftrace_sync_ipi' [-Wmissing-prototypes]
     191 | void ftrace_sync_ipi(void *data)
         |      ^~~~~~~~~~~~~~~


vim +/ftrace_sync_ipi +191 kernel/trace/ftrace.c

   190	
 > 191	void ftrace_sync_ipi(void *data)
   192	{
   193		/* Probably not needed, but do it anyway */
   194		smp_rmb();
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
