Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C4606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EkByR5hs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BC2+2iOV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ifp8UfVviu/i/GwxCHMkera6jplXawUckngfZ6H2Rwc=; b=EkByR5hsady8poTERytxzdIPjX
	FrApslsoLW3/N5Khr+ii51J3Rej686wezTTgpfAyXP57y0UadWrc30MlSOKGzC7+pz0MP2BFSNE/F
	5SVlf4p6Vw7L/hO56LkiLJcYyKONurLBYSIuwwnByeXyIBpRgVyC/w3sX0omOBDH6Ka7FWs137+ej
	/1bDau7gQZxUMf/exXxeqWXGAuIlhJSXOEx3Lc/7U+ER/uafBoy5GzfWCa7TNtXh+FpbtCyA7bQr8
	2ELk09E872YNzgn3xrapi2KFgPvdgERqtY9mQGPbfVbVqAofszaXKPxj7r+R56maP7z+xjK5BNBG7
	GKCewZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTfr-00000009pNT-23OP;
	Thu, 12 Nov 2026 12:13:03 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTfn-00000009pMY-3DOj
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 12:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794485579; x=1826021579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jUEzBgnghcvibNTjFO0S5WBM3pHNMSH0GtLNmn73Fl4=;
  b=BC2+2iOV2rnk4aEaX+xcDTlWxFhBDcNQ9AaeEwALKOGRiMaRrdVCaJp8
   7nH39P3jbkaNI7HmzQoxdxNkHnzwwk6Ejh1Eve3VDEfTTAa5DlTSNHAb3
   qZBojtyptuyUTEoKWlt2SeiT4wTgTJnf5Hci94Cb+5+hNQNysZWtNpF/7
   REyukBiN3yfP7TTKtmE/ocF2H2QeVHnpkYghN91Ql7Cn0kISzSgpWsOVl
   JEkKaWj7purGvCxVLruyk+4og/8llmsol69FoH/SAQfdiGb4IcSMJ3qf5
   6HrjKZ5wh3ZWXP+txqtuXoQQzWwwDjH8DF2crbrFBMaR2KeCrDv2Fa+py
   g==;
X-CSE-ConnectionGUID: 43npjyRhSQ6L6miB7mTDOA==
X-CSE-MsgGUID: jsuqdcBSS2evvGq3MmCmcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3366522"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3366522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:12:59 -0800
X-CSE-ConnectionGUID: CVltBxJqR1af0Fr3Zx6Iyw==
X-CSE-MsgGUID: +BZJ4MbYS4+JcdJtiUisaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="9081723"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2026 04:12:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRTff-000000011GV-1MMO;
	Thu, 12 Nov 2026 12:12:51 +0000
Date: Thu, 12 Nov 2026 20:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, andybnac@gmail.com,
	daichengrong <daichengrong@iscas.ac.cn>, gdb@sourceware.org,
	Andy Chiu <tchiu@tenstorrent.com>, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anup Patel <anup@brainfault.org>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Deepak Gupta <debug@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [PATCH v7 3/6] riscv: clarify vector state semantics on syscall
 and context switch
Message-ID: <202611122049.91BrkXTs-lkp@intel.com>
References: <20261111184359.1239821-4-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111184359.1239821-4-tchiu@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041259_823549_9C277BFD 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on d1a8d411533d6be16ac79796c02a9bfc7d7958f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vector-refactor-vector-context-operations/20261111-124323
base:   d1a8d411533d6be16ac79796c02a9bfc7d7958f1
patch link:    https://lore.kernel.org/r/20261111184359.1239821-4-tchiu%40tenstorrent.com
patch subject: [PATCH v7 3/6] riscv: clarify vector state semantics on syscall and context switch
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611122049.91BrkXTs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122049.91BrkXTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122049.91BrkXTs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:130:9: error: implicit declaration of function '__riscv_v_vstate_clean'; did you mean 'riscv_v_vstate_query'? [-Wimplicit-function-declaration]
     130 |         __riscv_v_vstate_clean(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         riscv_v_vstate_query


vim +130 arch/riscv/kernel/signal.c

   107	
   108	/*
   109	 * Restore Vector extension context from the user's signal frame. This function
   110	 * assumes a valid extension header. So magic and size checking must be done by
   111	 * the caller.
   112	 */
   113	static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
   114	{
   115		long err;
   116		struct __sc_riscv_v_state __user *state = sc_vec;
   117		void __user *datap;
   118	
   119		/*
   120		 * Mark the vstate as clean prior performing the actual copy,
   121		 * to avoid getting the vstate incorrectly clobbered by the
   122		 * discarded vector state.
   123		 *
   124		 * This also allows user to modify vregs through the signal
   125		 * interface at a syscall stop. e.g. to support user space
   126		 * context switching.
   127		 */
   128		preempt_disable();
   129		riscv_v_vstate_set_restore(current, regs);
 > 130		__riscv_v_vstate_clean(regs);
   131		preempt_enable();
   132	
   133		/* Copy everything of __sc_riscv_v_state except datap. */
   134		err = __copy_from_user(&current->thread.vstate, &state->v_state,
   135				       offsetof(struct __riscv_v_ext_state, datap));
   136		if (unlikely(err))
   137			return err;
   138	
   139		/* Copy the pointer datap itself. */
   140		err = __get_user(datap, &state->v_state.datap);
   141		if (unlikely(err))
   142			return err;
   143		/*
   144		 * Copy the whole vector content from user space datap. Use
   145		 * copy_from_user to prevent information leak.
   146		 */
   147		return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
   148	}
   149	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
