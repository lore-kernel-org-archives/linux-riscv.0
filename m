Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FFAEE6B4D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq/9VVgrXMxXKmlOuvzg0+fWAEFHp/oBQoS8U+l/qrI=; b=b3zs6lMvVq+qEj
	E+rS7CxMSLtYOP23OWbdn/uUe4oAVARue3OdJG0gb+S2lwyFfSzlIf8mdo9motor1tRbuy91gaanB
	+NqU/k8YsULEqqqHbarKHiwpzKUKw9KnWwlwzGtLqdtcNSKl4CPfbkwk5C2Lc35mB2zIBTuXzW0nV
	CKGY0s4KDJcOON2+MJDJy7JNG/Jr8npQSc6iqPPzx2Siv+tvKDKFsQugZwSFRxBl/7HVQnDOVNdl1
	F4bOd+8byHfBJYYOj99DjGJ/xTiqIcEeEVaBeVs8XOkqOQ8hJJRQQVgbPRBn6sdAvkmWyG8PHarac
	u6nkyS7vw+ZDQW1mx40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSMP-0000000BnIM-41NZ;
	Fri, 06 Feb 2026 20:23:25 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSMN-0000000BnHf-0Q9u
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 20:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770409403; x=1801945403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWMzhVSsuFWA8/ih7p2SAqQIt6FnkD+vZqt/ciGixAc=;
  b=hsdUDqPadYI/cykrCYcc4mgSSZ/J5poinSuy4AuX4csWcTPxM0HK9fjv
   gMC5xfpga50p6ubx4Rum6h6axkWDLjg5OEjlaXtxTIkmuPIKsfFvHTIcd
   RKVXY4qIEOjUvISZKFGdeRkXoNEbeqqqBNXWYaov4Q7cQcKDhPEy22A2K
   ANKAxetVqPe2c58y4QDmURocGGa/CqYn1EUfvXXZzOmUHXoAc57fZZAFr
   3qbMLW4syVYYeoK0MYlcyXCkPeGC7Rt3r+A7DtxJb4K1WydcIrchKG2aQ
   qnkJdp/sFCRk71A5R2AqwASpd6yFoOGPYxMMjiPm+ig89jJ0aURa/aq15
   Q==;
X-CSE-ConnectionGUID: +shZulkpRQOI2biEXpVNqw==
X-CSE-MsgGUID: apLlKsTBS8WAz5boqOwptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83062528"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83062528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 12:23:20 -0800
X-CSE-ConnectionGUID: 6yKFI4BGS2KXCCJIJN6sBQ==
X-CSE-MsgGUID: h7YTw79iTb+WMmdilYntNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210253095"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2026 12:23:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voSMC-00000000l6i-4C6F;
	Fri, 06 Feb 2026 20:23:13 +0000
Date: Sat, 7 Feb 2026 04:22:42 +0800
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
Message-ID: <202602070435.BuX0TvvF-lkp@intel.com>
References: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122323_204443_F62209A6 
X-CRM114-Status: GOOD (  12.68  )
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
config: riscv-randconfig-r112-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070435.BuX0TvvF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070435.BuX0TvvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070435.BuX0TvvF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'invoke_bpf':
>> arch/riscv/net/bpf_jit_comp64.c:1008:37: error: passing argument 1 of 'bpf_prog_calls_session_cookie' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1008 |   if (bpf_prog_calls_session_cookie(&tl->links[i])) {
         |                                     ^~~~~~~~~~~~~
         |                                     |
         |                                     struct bpf_tramp_link **
   In file included from arch/riscv/net/bpf_jit_comp64.c:9:
   include/linux/bpf.h:2199:73: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_link **'
    2199 | static inline bool bpf_prog_calls_session_cookie(struct bpf_tramp_link *link)
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/bpf_prog_calls_session_cookie +1008 arch/riscv/net/bpf_jit_comp64.c

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
