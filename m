Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE4D2C555
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyEmu3k2O5yFAFjkSMT/r+nftaIVTS6KgbRBfGckiMM=; b=kY4aDohfW75lR2
	HvnvlFKhyr7B4NUHcTJNW936hEv7M1sW/NsK+Oa8da8OCi02FfC/Mf6n4jUEp3YHWTB5vaWsBnY6/
	/AwXy+opFlrSlPtcSPmWaRQkKA9pgYPpx+ThFwSYicy+zQsIXsivP7IgPWlkct7XKaXGNhHBMmgDC
	ksl18N3CrLkDkALUSXcQjZpEy/yPqOfihB/loURafR3AXBhczrqwp/zfGbGI0AkQ23P4RLbYQxIrF
	DMqn3NHNMckHomo+6hGpjlKKCkALeTY59KJIiuydGFZ0cIrSScADmGI31FnUtVswrmspv4Dfo1FPw
	Zz2tGgNT13mYnfnPkzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FIZ-0000000B13H-1Oll;
	Tue, 22 Oct 2024 13:51:47 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FHe-0000000B0qD-2H8V
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 13:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729605050; x=1761141050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epoMaoM6MMwh/KBGwPkmJaakzhozvJct5sHt4yT4Z9s=;
  b=SMTxro+gKH9yTABb14DLkV4qEteOgztj5XGPNEeF6iYrcsc06+q9chcq
   uF/+K7jE1pw3yxHAQpvNiIIGpL3eqcNZWIzrec+zi9wTPQdkSUWVs3pPi
   dkf3a7cNZw2EYKsn+CW67inPbutb/ZpoR4ekfH6YRueIcXGmVu62RVeqw
   avw9cufXcqRBQ3OepCw1jTHNJB1sbuWe5R1WwDn4hgWGZ2qDTyN+gOOkN
   VKo5JyAoUNVHh73VPoQ7YSbJUjHqnJvUdCoQ3FBVDqxelp7FmQCLopt+S
   OBmEDqndk7DGuG5p4Ta+v+DURhy0so+lfODBeqhmeqXL0lkL3rAnRVBcW
   w==;
X-CSE-ConnectionGUID: J/FcmlVAS5Wac2K8H8U9Ng==
X-CSE-MsgGUID: grirgmCtSq6JRw7/yATEHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40531466"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="40531466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:50:47 -0700
X-CSE-ConnectionGUID: WQvPy/wOQryWrGcK4sqBHA==
X-CSE-MsgGUID: cHeUKNTnTiqUvliz9qbK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80694139"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 06:50:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3FHS-000Tdu-0u;
	Tue, 22 Oct 2024 13:50:38 +0000
Date: Tue, 22 Oct 2024 21:50:28 +0800
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
Subject: Re: [PATCH bpf-next 1/5] net: checksum: move from32to16() to generic
 header
Message-ID: <202410222149.3FVJFYYy-lkp@intel.com>
References: <20241021122112.101513-2-puranjay@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021122112.101513-2-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_065050_704058_678665B8 
X-CRM114-Status: GOOD (  11.35  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/net-checksum-move-from32to16-to-generic-header/20241021-202707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241021122112.101513-2-puranjay%40kernel.org
patch subject: [PATCH bpf-next 1/5] net: checksum: move from32to16() to generic header
config: x86_64-randconfig-122-20241022 (https://download.01.org/0day-ci/archive/20241022/202410222149.3FVJFYYy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410222149.3FVJFYYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410222149.3FVJFYYy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/checksum.c:84:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int [assigned] result @@
   lib/checksum.c:84:34: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum.c:84:34: sparse:     got unsigned int [assigned] result
>> lib/checksum.c:84:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] result @@     got restricted __sum16 @@
   lib/checksum.c:84:16: sparse:     expected unsigned int [assigned] result
   lib/checksum.c:84:16: sparse:     got restricted __sum16

vim +84 lib/checksum.c

    35	
    36	#ifndef do_csum
    37	static unsigned int do_csum(const unsigned char *buff, int len)
    38	{
    39		int odd;
    40		unsigned int result = 0;
    41	
    42		if (len <= 0)
    43			goto out;
    44		odd = 1 & (unsigned long) buff;
    45		if (odd) {
    46	#ifdef __LITTLE_ENDIAN
    47			result += (*buff << 8);
    48	#else
    49			result = *buff;
    50	#endif
    51			len--;
    52			buff++;
    53		}
    54		if (len >= 2) {
    55			if (2 & (unsigned long) buff) {
    56				result += *(unsigned short *) buff;
    57				len -= 2;
    58				buff += 2;
    59			}
    60			if (len >= 4) {
    61				const unsigned char *end = buff + ((unsigned)len & ~3);
    62				unsigned int carry = 0;
    63				do {
    64					unsigned int w = *(unsigned int *) buff;
    65					buff += 4;
    66					result += carry;
    67					result += w;
    68					carry = (w > result);
    69				} while (buff < end);
    70				result += carry;
    71				result = (result & 0xffff) + (result >> 16);
    72			}
    73			if (len & 2) {
    74				result += *(unsigned short *) buff;
    75				buff += 2;
    76			}
    77		}
    78		if (len & 1)
    79	#ifdef __LITTLE_ENDIAN
    80			result += *buff;
    81	#else
    82			result += (*buff << 8);
    83	#endif
  > 84		result = csum_from32to16(result);
    85		if (odd)
    86			result = ((result >> 8) & 0xff) | ((result & 0xff) << 8);
    87	out:
    88		return result;
    89	}
    90	#endif
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
