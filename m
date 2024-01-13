Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CDBC4707C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 06:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CixL+hRzKhQLnOIiYcaxSsnI3obZG00i0MQQQII/e0Q=; b=bX0CKXP9odxFh3
	TUrNpF1TPCiTzCH7kr4c4WR0oiHLoC8IeL7hhrrnd7wlODG5grDvTc3nXz3AIoJt6HUZRMx9tzwab
	/F0iazYmJpefdAgg81CCQO3IboCSgguGd1NrgVdqRe/ueXrYk1Q6tXNOS45/6h30f0EKNH0yu6Ss9
	SdWkqePzqVRoIQ8sc2q2nKcUoppmAOPbYcKtkIQriMYbhp+GrRrspglAW6TCYPduL/gveAxB+5N9C
	vlmv/vqNOgw9MEvAv6IMyPA1MRYsGp5Z+hWnv/e/CkW69r7XrlkfFeoskdz4HzbdP/ISWV4MFtVU6
	ibM0JxuljL/Q1u5u5qzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOXut-004dVX-2G;
	Sat, 13 Jan 2024 06:54:51 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOXuq-004dUv-0N
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 06:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705128888; x=1736664888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LiiSjn7Y67rp8tXQVxzuXlHYh29syWnvmy/Ql7KjgxY=;
  b=arEnxxC9gknTAocWT99wDLnbFUE4J18yrqQlJq+OPF7Rq+xWWAF5+rpl
   /XNOqoN3184rAK+KDZAb0IS7Z35TiK0EuHWbumDj3XpouGdQ2rNQd1Hru
   hv9+YzS2zZI9dLBEpzEX7pKVXaHYaTC/Npmbbypfp8F0upKXPWO1zss23
   MyxqUXfnou7/VnBn0GrREcYeNFaEL8FWWAAFOTvDCshbmPGBLQng4caqR
   9wxuViRZDjCw4v3OKvyRfj8OaS/LOKg95mXCg87mqDGbxfD77UvYm1BFS
   x9OkOB4wZqX1WbVShAa8bkGXw6BOuD5nZHJl/5MxoILVUW7/QiI1/OvuM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20832574"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="20832574"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853485116"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="853485116"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2024 22:54:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXub-000AC6-2C;
	Sat, 13 Jan 2024 06:54:33 +0000
Date: Sat, 13 Jan 2024 14:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
Message-ID: <202401131438.f8SELM0W-lkp@intel.com>
References: <20240103163203.72768-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103163203.72768-3-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_225448_222195_42F0D771 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Leonardo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 610a9b8f49fbcf1100716370d3b5f6f884a2835a]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/riscv-cmpxchg-Deduplicate-xchg-asm-functions/20240104-003501
base:   610a9b8f49fbcf1100716370d3b5f6f884a2835a
patch link:    https://lore.kernel.org/r/20240103163203.72768-3-leobras%40redhat.com
patch subject: [PATCH v1 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
config: riscv-randconfig-r111-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131438.f8SELM0W-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401131438.f8SELM0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131438.f8SELM0W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_cong.c:300:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *__new @@     got struct tcp_congestion_ops *[assigned] ca @@
   net/ipv4/tcp_cong.c:300:24: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *__new
   net/ipv4/tcp_cong.c:300:24: sparse:     got struct tcp_congestion_ops *[assigned] ca
   net/ipv4/tcp_cong.c:300:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const *prev @@     got struct tcp_congestion_ops const [noderef] __rcu * @@
   net/ipv4/tcp_cong.c:300:22: sparse:     expected struct tcp_congestion_ops const *prev
   net/ipv4/tcp_cong.c:300:22: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *
   net/ipv4/tcp_cong.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +300 net/ipv4/tcp_cong.c

317a76f9a44b43 Stephen Hemminger 2005-06-23  281  
317a76f9a44b43 Stephen Hemminger 2005-06-23  282  /* Used by sysctl to change default congestion control */
6670e152447732 Stephen Hemminger 2017-11-14  283  int tcp_set_default_congestion_control(struct net *net, const char *name)
317a76f9a44b43 Stephen Hemminger 2005-06-23  284  {
317a76f9a44b43 Stephen Hemminger 2005-06-23  285  	struct tcp_congestion_ops *ca;
6670e152447732 Stephen Hemminger 2017-11-14  286  	const struct tcp_congestion_ops *prev;
6670e152447732 Stephen Hemminger 2017-11-14  287  	int ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  288  
6670e152447732 Stephen Hemminger 2017-11-14  289  	rcu_read_lock();
6670e152447732 Stephen Hemminger 2017-11-14  290  	ca = tcp_ca_find_autoload(net, name);
6670e152447732 Stephen Hemminger 2017-11-14  291  	if (!ca) {
6670e152447732 Stephen Hemminger 2017-11-14  292  		ret = -ENOENT;
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  293  	} else if (!bpf_try_module_get(ca, ca->owner)) {
6670e152447732 Stephen Hemminger 2017-11-14  294  		ret = -EBUSY;
8d432592f30fcc Jonathon Reinhart 2021-05-01  295  	} else if (!net_eq(net, &init_net) &&
8d432592f30fcc Jonathon Reinhart 2021-05-01  296  			!(ca->flags & TCP_CONG_NON_RESTRICTED)) {
8d432592f30fcc Jonathon Reinhart 2021-05-01  297  		/* Only init netns can set default to a restricted algorithm */
8d432592f30fcc Jonathon Reinhart 2021-05-01  298  		ret = -EPERM;
6670e152447732 Stephen Hemminger 2017-11-14  299  	} else {
6670e152447732 Stephen Hemminger 2017-11-14 @300  		prev = xchg(&net->ipv4.tcp_congestion_control, ca);
6670e152447732 Stephen Hemminger 2017-11-14  301  		if (prev)
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  302  			bpf_module_put(prev, prev->owner);
317a76f9a44b43 Stephen Hemminger 2005-06-23  303  
6670e152447732 Stephen Hemminger 2017-11-14  304  		ca->flags |= TCP_CONG_NON_RESTRICTED;
317a76f9a44b43 Stephen Hemminger 2005-06-23  305  		ret = 0;
317a76f9a44b43 Stephen Hemminger 2005-06-23  306  	}
6670e152447732 Stephen Hemminger 2017-11-14  307  	rcu_read_unlock();
317a76f9a44b43 Stephen Hemminger 2005-06-23  308  
317a76f9a44b43 Stephen Hemminger 2005-06-23  309  	return ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  310  }
317a76f9a44b43 Stephen Hemminger 2005-06-23  311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
