Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FFD11717
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSgc1sjSbgbcKbYWrd0KLSa1kCxqH3Wpi8xlQAtDHsg=; b=gVT3FFL4cu2027
	XYTf+2Y1X9KakBwY9eQ0/1UtvR3RYfJklRuX/NHNLx7HBVITx3iDJYizymRCYk9E7oOc7la86W2iw
	Cl3/eDDMqZWajMw+S4Hw8AaBzo+g16UB2SG2HuGxMyvBs422s4KB7WEaYhMjhBlFI2JZB64tDe1fc
	2Np9kBMe6JLHUzufCFKOgY54luteau9wf4aN0oRKNqbXwVMYgtHJ9k+Fu4iz+5XONCe+7camE1bTD
	vMbtbGYNDK4ZyYVy0+dwekJU9E6NICyIyp1yzWF+ZTwS7AmEBDZEixxjkLuw/PVozndw5dRumtOOG
	gg0DegmmvXhB8zSiIvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Evp-00000002pXz-05rD;
	Fri, 25 Oct 2024 07:40:25 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EvU-00000002pTJ-3Hgs
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 07:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729842006; x=1761378006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yBbBH9p6aqtBMVil5u+tl7Fqa8eFLhohsl5YWvv6Zaw=;
  b=V1Vur0jxpDWrCFORtBeNoQB6dKhqU1ftznA/OoA9PTciz0e1eEuBVZVm
   KSp5htFk97QR604u8RyEooSOSQ9/kk496swPaxkfgAzsWaHwX2oFi0f/L
   naLM6ksxv0FEdqNvzxm5egqsDm36AJNQsbmVcQO4as9xM9rdcspLkC5kQ
   4LFHKz/6CbrNHfIuM+HIEGjdGnIqW9REnXgkncXLDi3AYX0d2P5L/O+Jq
   6DCrW68Y4RKHV8Oe2qtX8kYoWEfj95vMSdQvrdm1YeTRhJFWLS69L7xD1
   lvGcN3NpKoDkWgeYQ4tS6C+bCa4Csd/6zRNmT+IL+B6lbnb2mKrahBg8a
   A==;
X-CSE-ConnectionGUID: K+VJgwgBTLW7hVkXvR0bkw==
X-CSE-MsgGUID: vby9ON1oRBuquPSgGjFtTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40610796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40610796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 00:40:01 -0700
X-CSE-ConnectionGUID: +EtDZenqS3uQRCXmiEZu3w==
X-CSE-MsgGUID: NtENei+HSruYwJ95nzTfEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85632621"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 00:39:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4EvB-000Xmi-1n;
	Fri, 25 Oct 2024 07:39:45 +0000
Date: Fri, 25 Oct 2024 15:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	netdev@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/4] bpf: bpf_csum_diff: optimize and
 homogenize for all archs
Message-ID: <202410251552.LR73LP4V-lkp@intel.com>
References: <20241023153922.86909-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241023153922.86909-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_004005_375690_57DBBCAA 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Puranjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/net-checksum-move-from32to16-to-generic-header/20241023-234347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241023153922.86909-3-puranjay%40kernel.org
patch subject: [PATCH bpf-next v2 2/4] bpf: bpf_csum_diff: optimize and homogenize for all archs
config: i386-randconfig-061-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251552.LR73LP4V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251552.LR73LP4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251552.LR73LP4V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/filter.c:1423:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1423:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1423:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1501:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1501:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1501:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2321:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2321:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2321:45: sparse:     got unsigned int [usertype] ipv4_nh
   net/core/filter.c:10993:31: sparse: sparse: symbol 'sk_filter_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11000:27: sparse: sparse: symbol 'sk_filter_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11004:31: sparse: sparse: symbol 'tc_cls_act_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11013:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11017:31: sparse: sparse: symbol 'xdp_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11029:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11035:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11039:31: sparse: sparse: symbol 'lwt_in_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11045:27: sparse: sparse: symbol 'lwt_in_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11049:31: sparse: sparse: symbol 'lwt_out_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11055:27: sparse: sparse: symbol 'lwt_out_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11059:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11066:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11070:31: sparse: sparse: symbol 'lwt_seg6local_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11076:27: sparse: sparse: symbol 'lwt_seg6local_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11079:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11085:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11088:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11094:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11097:31: sparse: sparse: symbol 'sock_ops_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11103:27: sparse: sparse: symbol 'sock_ops_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11106:31: sparse: sparse: symbol 'sk_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11113:27: sparse: sparse: symbol 'sk_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11116:31: sparse: sparse: symbol 'sk_msg_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11123:27: sparse: sparse: symbol 'sk_msg_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11126:31: sparse: sparse: symbol 'flow_dissector_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11132:27: sparse: sparse: symbol 'flow_dissector_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11460:31: sparse: sparse: symbol 'sk_reuseport_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11466:27: sparse: sparse: symbol 'sk_reuseport_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11668:27: sparse: sparse: symbol 'sk_lookup_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11672:31: sparse: sparse: symbol 'sk_lookup_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:1931:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1931:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1931:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1934:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1934:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1934:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1934:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1934:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1934:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1937:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1937:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1937:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1937:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1937:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1937:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1982:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1982:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1982:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1985:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1985:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1985:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1985:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1985:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1985:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1988:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1988:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1988:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1988:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1988:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1988:58: sparse:     got unsigned long long [usertype] to
>> net/core/filter.c:2023:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int sum @@     got restricted __wsum @@
   net/core/filter.c:2023:48: sparse:     expected unsigned int sum
   net/core/filter.c:2023:48: sparse:     got restricted __wsum
   net/core/filter.c:2026:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int sum @@     got restricted __wsum @@
   net/core/filter.c:2026:52: sparse:     expected unsigned int sum
   net/core/filter.c:2026:52: sparse:     got restricted __wsum
   net/core/filter.c:2029:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int sum @@     got restricted __wsum @@
   net/core/filter.c:2029:40: sparse:     expected unsigned int sum
   net/core/filter.c:2029:40: sparse:     got restricted __wsum
   net/core/filter.c:2031:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] seed @@
   net/core/filter.c:2031:16: sparse:     expected unsigned long long
   net/core/filter.c:2031:16: sparse:     got restricted __wsum [usertype] seed
   net/core/filter.c:2053:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2053:35: sparse:     expected unsigned long long
   net/core/filter.c:2053:35: sparse:     got restricted __wsum [usertype] csum

vim +2023 net/core/filter.c

  2009	
  2010	BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
  2011		   __be32 *, to, u32, to_size, __wsum, seed)
  2012	{
  2013		/* This is quite flexible, some examples:
  2014		 *
  2015		 * from_size == 0, to_size > 0,  seed := csum --> pushing data
  2016		 * from_size > 0,  to_size == 0, seed := csum --> pulling data
  2017		 * from_size > 0,  to_size > 0,  seed := 0    --> diffing data
  2018		 *
  2019		 * Even for diffing, from_size and to_size don't need to be equal.
  2020		 */
  2021	
  2022		if (from_size && to_size)
> 2023			return csum_from32to16(csum_sub(csum_partial(to, to_size, seed),
  2024							csum_partial(from, from_size, 0)));
  2025		if (to_size)
  2026			return csum_from32to16(csum_partial(to, to_size, seed));
  2027	
  2028		if (from_size)
  2029			return csum_from32to16(~csum_partial(from, from_size, ~seed));
  2030	
  2031		return seed;
  2032	}
  2033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
