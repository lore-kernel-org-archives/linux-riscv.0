Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53104EE6B68
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47ehWh3fFJrzBCOH4JD1dWXSPNJF9qml7c+hnzlDq2U=; b=HEupjCpni55GIn
	GfdCESLkbsiY6NsFqro7zzlsuAxY9yqOdUEgmo4NA0U1FU8tcRAVcbgLsrRbuc29jn9yqdrU5Q0ib
	4FfrK6eKBz/1+JgLxEI9VEBThnjqH12son+mPFz/9D6iX6gLdEoTlOTzMUPO0MvPkFGdlNoPHw8lo
	Md/cCDRh1E3hfG41UdOP2iGleS5U6BlRFhc3FSFmiPyjTkrAv5rsBA5j9QkS4fyODPEaBJ5e4kp0d
	DT9kAV5ScsQawpuCVNz52948Uer94gNJYi+SM94EBkUsUautC+1aqEpXAQALYbumwkCwfmqlk8NgE
	SzdH6Bd8Q2ZnedNM2DAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTgj-0000000Br2C-3Vm4;
	Fri, 06 Feb 2026 21:48:29 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTgg-0000000Br13-2hGs
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 21:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770414507; x=1801950507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTAKu6rfMqIETd68jbhyz7+ArkBvpBLfD4eMEZbcVgw=;
  b=gQRiELuo4UkFsF8AJKjbZVNl5oqMiofamOUt9Md/IdFYrwV46+mEQzms
   gKikxtN+9ZUMMb9UKYtI4qpIcWzWaJyjjPiQxPdix/60M3a6HGiBK4yyI
   F81sYZBhw75caHCZFB7qZe1rKfckFwtALN6q7ZoD80HYje4OVW0NPFFrU
   QkKDuNT3/7TphlaV3uLrXEl/y5okcdaXR5khX88DDbWaa6ErdFwSKHU/D
   92LqoJddHpGoasxE1sRDmcxn5KWr/0zI8exZfVRNsaDSOfQDVf6RKC/I3
   2ttFv8hP5izQhT4EZMCBgRVj/nbqAxOX4qY5atFo4TlVkvvCjmHvgodwf
   Q==;
X-CSE-ConnectionGUID: Uw0drMd9S22sRfWCAotzcw==
X-CSE-MsgGUID: c9viGMC0QoGR8kZp8e3i0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71664997"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71664997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:48:24 -0800
X-CSE-ConnectionGUID: eBoQ4nf7Q+2o9LQPoINnPg==
X-CSE-MsgGUID: w0vkzmSrSQ66tmNFWLgnGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210078155"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2026 13:48:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTgW-00000000lBo-2tlh;
	Fri, 06 Feb 2026 21:48:16 +0000
Date: Sat, 7 Feb 2026 05:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, ast@kernel.org,
	bjorn@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, pulehui@huawei.com, puranjay@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, jiang.biao@linux.dev
Subject: Re: [PATCH bpf-next v3 2/3] bpf, riscv: add fsession support for
 trampolines
Message-ID: <202602070533.NAsdK5m6-lkp@intel.com>
References: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_134826_751458_73796A58 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Menglong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/bpf-riscv-introduce-emit_store_stack_imm64-for-trampoline/20260206-202356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260206122002.1494125-3-dongml2%40chinatelecom.cn
patch subject: [PATCH bpf-next v3 2/3] bpf, riscv: add fsession support for trampolines
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602070533.NAsdK5m6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070533.NAsdK5m6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070533.NAsdK5m6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/net/bpf_jit_comp64.c:1008:37: error: incompatible pointer types passing 'struct bpf_tramp_link **' to parameter of type 'struct bpf_tramp_link *'; remove & [-Werror,-Wincompatible-pointer-types]
                   if (bpf_prog_calls_session_cookie(&tl->links[i])) {
                                                     ^~~~~~~~~~~~~
   include/linux/bpf.h:2199:73: note: passing argument to parameter 'link' here
   static inline bool bpf_prog_calls_session_cookie(struct bpf_tramp_link *link)
                                                                           ^
   1 error generated.


vim +1008 arch/riscv/net/bpf_jit_comp64.c

   998	
   999	static int invoke_bpf(struct bpf_tramp_links *tl, int args_off, int retval_off,
  1000			      int run_ctx_off, int func_meta_off, bool save_ret, u64 func_meta,
  1001			      int cookie_off, struct rv_jit_context *ctx)
  1002	{
  1003		int i, cur_cookie = (cookie_off - args_off) / 8;
  1004	
  1005		for (i = 0; i < tl->nr_links; i++) {
  1006			int err;
  1007	
> 1008			if (bpf_prog_calls_session_cookie(&tl->links[i])) {
  1009				u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
  1010	
  1011				emit_store_stack_imm64(RV_REG_T1, -func_meta_off, meta, ctx);
  1012				cur_cookie--;
  1013			}
  1014			err = invoke_bpf_prog(tl->links[i], args_off, retval_off, run_ctx_off,
  1015					      save_ret, ctx);
  1016			if (err)
  1017				return err;
  1018		}
  1019		return 0;
  1020	}
  1021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
