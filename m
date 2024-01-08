Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C2DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8OjZKWbui+uT1+3OwpbvOYPcnowRrjRlzTAqcDKh0g=; b=Y6XtRetKeCXYlB
	K2BS9QG1DCkTOqGv88lWDA0izmRMycUnSCtUM39j1htvBq+Vyn6Yksv/adoq43gcuTrjYqbU9f5gR
	qDeGXmWA0eUDU5gEKvpkQirah+YlzrObd50QiJXlnqpbE8tr5u5QOi47hNKiDsrm30TaLrRx2rVEO
	7Wlfn2N1y2j2gCVl8ojU6txw6cVEcsRHI83/RrdLWxxO4AqMKbE6SqEMXmfk2PA1JrC82Jutwi/Ns
	fk1KfLJGgkPWx79AWRftdAjngmd+QO+5k/jNtmURf/dXyA+3z+BdGTn0MYIiS7TiBglLrUeEt9KNI
	6HHvIjqRRUPvmAdBaRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqaK-005MNI-15;
	Mon, 08 Jan 2024 14:26:36 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqaG-005MMa-36
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 14:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704723993; x=1736259993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bj5j5nuhV/qrZwZnlx7DCKPmSdslwRR0SSqhJ0uVBmM=;
  b=W/hmp8q3GVo4Ax6VxZWL2H6FJBc45o2sGIr8ImOrXWk56J13MZgZP3dg
   bczJ3UrGF2abcIs4AU7SKCSHfugFGRNVBmTZzIHuq5lg2HY9BM3tgIBZ5
   UGHNMys0VBVkt8NtNV7K3CN4f7H52qN4g7l0OeCMVZ+nPI4L4DSbmNtK5
   R2zCBkjNtnQ+k80V4lXNFR/x3yPZKFCKQR50ENJw7m9NxxRT/tKes+TPm
   SF8vp1hQhQwWEW016NIRFSbo+hYhmniCdK5PuOwqCYQoM/yc4p5CYblpE
   E7pGzMfJHjDjUJEbKzDeAeQcJzXjJgPJ3SHckdXy3RlddO7ltYWxVwUfU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4649808"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="4649808"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 06:26:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781425229"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="781425229"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Jan 2024 06:26:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMqa7-0004mh-2q;
	Mon, 08 Jan 2024 14:26:23 +0000
Date: Mon, 8 Jan 2024 22:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, conor.dooley@microchip.com,
	ajones@ventanamicro.com, heiko@sntech.de, haicheng.li@intel.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: Re: [PATCH] riscv: Optimize crc32 with Zbc extension
Message-ID: <202401082215.4rPI1A5Z-lkp@intel.com>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105080830.3738117-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_062633_041506_CE411937 
X-CRM114-Status: GOOD (  12.14  )
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

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7 next-20240108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Optimize-crc32-with-Zbc-extension/20240105-161053
base:   linus/master
patch link:    https://lore.kernel.org/r/20240105080830.3738117-1-xiao.w.wang%40intel.com
patch subject: [PATCH] riscv: Optimize crc32 with Zbc extension
config: riscv-randconfig-r121-20240106 (https://download.01.org/0day-ci/archive/20240108/202401082215.4rPI1A5Z-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240108/202401082215.4rPI1A5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401082215.4rPI1A5Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/lib/crc32.c:192:19: sparse: sparse: invalid assignment: ^=
   arch/riscv/lib/crc32.c:192:19: sparse:    left side has type unsigned long
   arch/riscv/lib/crc32.c:192:19: sparse:    right side has type restricted __be64
>> arch/riscv/lib/crc32.c:110:42: sparse: sparse: restricted __le64 degrades to integer
>> arch/riscv/lib/crc32.c:110:42: sparse: sparse: restricted __le64 degrades to integer

vim +192 arch/riscv/lib/crc32.c

    78	
    79	static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
    80	#if (BITS_PER_LONG == 64)
    81						  size_t len, u32 poly, u64 poly_qt,
    82	#else
    83						  size_t len, u32 poly, u32 poly_qt,
    84	#endif
    85						  fallback crc_fb)
    86	{
    87		size_t offset, head_len, tail_len;
    88		const unsigned long *p_ul;
    89		unsigned long s;
    90	
    91		asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
    92					      RISCV_ISA_EXT_ZBC, 1)
    93				  : : : : legacy);
    94	
    95		/* Handle the unalignment head. */
    96		offset = (unsigned long)p & OFFSET_MASK;
    97		if (offset) {
    98			head_len = MIN(STEP - offset, len);
    99			crc = crc_fb(crc, p, head_len);
   100			len -= head_len;
   101			p += head_len;
   102		}
   103	
   104		tail_len = len & OFFSET_MASK;
   105		len = len >> STEP_ORDER;
   106		p_ul = (unsigned long *)p;
   107	
   108		for (int i = 0; i < len; i++) {
   109	#if (BITS_PER_LONG == 64)
 > 110			s = (unsigned long)crc ^ __cpu_to_le64(*p_ul++);
   111			/* We don't have a "clmulrh" insn, so use clmul + slli instead.
   112			 */
   113			asm volatile (".option push\n"
   114				      ".option arch,+zbc\n"
   115				      "clmul	%0, %1, %2\n"
   116				      "slli	%0, %0, 1\n"
   117				      "xor	%0, %0, %1\n"
   118				      "clmulr	%0, %0, %3\n"
   119				      "srli	%0, %0, 32\n"
   120				      ".option pop\n"
   121				      : "=&r" (crc)
   122				      : "r" (s),
   123					"r" (poly_qt),
   124					"r" ((u64)poly << 32)
   125				      :);
   126	#else
   127			s = crc ^ __cpu_to_le32(*p_ul++);
   128			/* We don't have a "clmulrh" insn, so use clmul + slli instead.
   129			 */
   130			asm volatile (".option push\n"
   131				      ".option arch,+zbc\n"
   132				      "clmul	%0, %1, %2\n"
   133				      "slli	%0, %0, 1\n"
   134				      "xor	%0, %0, %1\n"
   135				      "clmulr	%0, %0, %3\n"
   136				      ".option pop\n"
   137				      : "=&r" (crc)
   138				      : "r" (s),
   139					"r" (poly_qt),
   140					"r" (poly)
   141				      :);
   142	#endif
   143		}
   144	
   145		/* Handle the tail bytes. */
   146		if (tail_len)
   147			crc = crc_fb(crc, (unsigned char const *)p_ul, tail_len);
   148		return crc;
   149	
   150	legacy:
   151		return crc_fb(crc, p, len);
   152	}
   153	
   154	u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
   155	{
   156		return crc32_le_generic(crc, p, len, CRC32_POLY_LE, CRC32_POLY_QT_LE,
   157					crc32_le_base);
   158	}
   159	
   160	u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
   161	{
   162		return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
   163					CRC32C_POLY_QT_LE, __crc32c_le_base);
   164	}
   165	
   166	u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
   167	{
   168		size_t offset, head_len, tail_len;
   169		const unsigned long *p_ul;
   170		unsigned long s;
   171	
   172		asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
   173					      RISCV_ISA_EXT_ZBC, 1)
   174				  : : : : legacy);
   175	
   176		/* Handle the unalignment head. */
   177		offset = (unsigned long)p & OFFSET_MASK;
   178		if (offset) {
   179			head_len = MIN(STEP - offset, len);
   180			crc = crc32_be_base(crc, p, head_len);
   181			len -= head_len;
   182			p += head_len;
   183		}
   184	
   185		tail_len = len & OFFSET_MASK;
   186		len = len >> STEP_ORDER;
   187		p_ul = (unsigned long *)p;
   188	
   189		for (int i = 0; i < len; i++) {
   190	#if (BITS_PER_LONG == 64)
   191			s = (unsigned long)crc << 32;
 > 192			s ^= __cpu_to_be64(*p_ul++);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
