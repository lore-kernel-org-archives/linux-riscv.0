Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B97FC02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD+UAo3aSu7JD3L60iGxQ0fo3T/BVYiMFdju7+LsH8E=; b=0XCGGkqBqI9guj
	6esLOt0HWQAJCZ8bHGT5KUy6P709DtGpbJ8gYKwXebR7LPMZIZi8e6wOeXVU8Rr7KAwjT/Dm4NBId
	/v88uK9bAQI71vimt3uv/8Axq36Ak8utmraHQV1PnoLd3ytokjiFdI1CNPekD1AwaXOKux//p3Kte
	yMcHtf3z9Cc1IckHKFfdWgDKZg19b//aYlkejjuk4LCw+H7DlwU3h/NW3wXLeVrLD9n5swTf1Tigd
	S+PtAXWsckHVnc0qZoN/WpXrtgYH8InnZZYdwNvi1L2LGOPHnH93jqC3A7ViTvr64uA4FfCHRv6/m
	QLZ5D6p8wiXgg1ikF+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taw8E-0000000CQa2-3kIq;
	Thu, 23 Jan 2025 12:16:22 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taw8B-0000000CQZk-3Wuh
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 12:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737634580; x=1769170580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yJx41nxWQqXvdZ4jM5QwMJB+yrG9cAwxnm9UNLOvU+4=;
  b=SRRTmx21PbGyL97TrqkmiuqB3VWnyszkYyP1KyWGkzIkNRhTRahrLOeG
   n8rI7MMBdWSGuJNC2q/IqW1ukrYGzcHgjPq+1NwPNSkXw7F74xia28zVq
   xb33BCuFTo4mJejKOE3n/yfHAB0btM4vVBjcYCDVRjGF+XADQCu5Uh203
   IFWD5YJPFWJrd8yIAuOWvtToOrprn9OJ+E0GtUMsfQFW4MDA9HF2vCtJp
   Cn4+jzjgxqLApVGe8+2RRSrVa2DmglvvAkOlQm5MgbbMGhZPN8un5mq10
   8uSKQfRBZs2kOd7E9Gav1gm67FCsclXzMUPYn/ErPFy7uuKtEVtsOUpCs
   A==;
X-CSE-ConnectionGUID: WJlE0aiTTceXz2vZDScJoA==
X-CSE-MsgGUID: OQpawJqzQcKXDLxgTQsc6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48627265"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48627265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:16:19 -0800
X-CSE-ConnectionGUID: SRYI3lifS8mJ35Lgu/oD8A==
X-CSE-MsgGUID: 0QWccIEfQZGUugFOBniN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144681480"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 04:16:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taw84-000b9j-2a;
	Thu, 23 Jan 2025 12:16:12 +0000
Date: Thu, 23 Jan 2025 20:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zong Li <zong.li@sifive.com>, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, tjeznach@rivosinc.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 1/2] iommu/riscv: add RISC-V IOMMU PMU support
Message-ID: <202501231928.CmUsMTXF-lkp@intel.com>
References: <20250115030306.29735-2-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115030306.29735-2-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_041619_982941_E405F030 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi Zong,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13 next-20250123]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zong-Li/iommu-riscv-add-RISC-V-IOMMU-PMU-support/20250115-110456
base:   linus/master
patch link:    https://lore.kernel.org/r/20250115030306.29735-2-zong.li%40sifive.com
patch subject: [PATCH 1/2] iommu/riscv: add RISC-V IOMMU PMU support
config: riscv-randconfig-r062-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231928.CmUsMTXF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231928.CmUsMTXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231928.CmUsMTXF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_event':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:22:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      22 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(event, RISCV_IOMMU_IOHPMEVT_EVENTID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fortify-string.h:5,
                    from include/linux/string.h:389,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/riscv/include/asm/processor.h:55,
                    from arch/riscv/include/asm/thread_info.h:42,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from arch/riscv/include/asm/pgtable.h:9,
                    from include/linux/pgtable.h:6,
                    from arch/riscv/include/asm/io.h:15,
                    from include/linux/io.h:14,
                    from include/linux/io-64-nonatomic-hi-lo.h:5,
                    from drivers/iommu/riscv/iommu-pmu.c:9:
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:22:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      22 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(event, RISCV_IOMMU_IOHPMEVT_EVENTID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_partial_matching':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:23:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      23 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(partial_matching, RISCV_IOMMU_IOHPMEVT_DMASK);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:23:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      23 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(partial_matching, RISCV_IOMMU_IOHPMEVT_DMASK);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_pid_pscid':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:24:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      24 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(pid_pscid, RISCV_IOMMU_IOHPMEVT_PID_PSCID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:24:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      24 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(pid_pscid, RISCV_IOMMU_IOHPMEVT_PID_PSCID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_did_gscid':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:25:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      25 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(did_gscid, RISCV_IOMMU_IOHPMEVT_DID_GSCID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:25:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      25 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(did_gscid, RISCV_IOMMU_IOHPMEVT_DID_GSCID);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_filter_pid_pscid':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:26:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      26 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_pid_pscid, RISCV_IOMMU_IOHPMEVT_PV_PSCV);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:26:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      26 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_pid_pscid, RISCV_IOMMU_IOHPMEVT_PV_PSCV);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_filter_did_gscid':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:27:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      27 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_did_gscid, RISCV_IOMMU_IOHPMEVT_DV_GSCV);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:27:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      27 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_did_gscid, RISCV_IOMMU_IOHPMEVT_DV_GSCV);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c: In function 'get_filter_id_type':
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:61:43: note: in expansion of macro '__unsigned_scalar_typeof'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:73:34: note: in expansion of macro '__bf_cast_unsigned'
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:19:24: note: in expansion of macro 'FIELD_GET'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                        ^~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:28:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      28 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_id_type, RISCV_IOMMU_IOHPMEVT_IDT);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:19:46: error: 'struct perf_event' has no member named 'attr'
      19 |                 return FIELD_GET(_mask, event->attr.config);            \
         |                                              ^~
   include/linux/bitfield.h:156:35: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/iommu/riscv/iommu-pmu.c:28:1: note: in expansion of macro 'RISCV_IOMMU_PMU_ATTR_EXTRACTOR'
      28 | RISCV_IOMMU_PMU_ATTR_EXTRACTOR(filter_id_type, RISCV_IOMMU_IOHPMEVT_IDT);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11:
   drivers/iommu/riscv/iommu-pmu.c: In function 'riscv_iommu_pmu_set_period':
>> drivers/iommu/riscv/iommu-pmu.c:235:63: error: 'struct perf_event' has no member named 'pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/iommu/riscv/iommu-pmu.c:235:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/io.h:11:
>> drivers/iommu/riscv/iommu-pmu.c:235:63: error: 'struct perf_event' has no member named 'pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:14:32: note: in expansion of macro 'container_of'
      14 | #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
         |                                ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:235:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:235:63: error: 'struct perf_event' has no member named 'pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:14:32: note: in expansion of macro 'container_of'
      14 | #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
         |                                ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:235:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:14:32: note: in expansion of macro 'container_of'
      14 | #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
         |                                ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:235:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     235 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:236:43: error: 'struct perf_event' has no member named 'hw'
     236 |         struct hw_perf_event *hwc = &event->hw;
         |                                           ^~
   In file included from ./arch/riscv/include/generated/asm/local.h:1,
                    from include/asm-generic/local64.h:22,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/u64_stats_sync.h:71,
                    from include/linux/cgroup-defs.h:20,
                    from include/linux/cgroup.h:28,
                    from include/linux/perf_event.h:60,
                    from drivers/iommu/riscv/iommu-bits.h:20,
                    from drivers/iommu/riscv/iommu.h:18,
                    from drivers/iommu/riscv/iommu-pmu.c:11:
>> drivers/iommu/riscv/iommu-pmu.c:237:37: error: 'struct hw_perf_event' has no member named 'period_left'
     237 |         s64 left = local64_read(&hwc->period_left);
         |                                     ^~
   include/asm-generic/local.h:29:44: note: in definition of macro 'local_read'
      29 | #define local_read(l)   atomic_long_read(&(l)->a)
         |                                            ^
   drivers/iommu/riscv/iommu-pmu.c:237:20: note: in expansion of macro 'local64_read'
     237 |         s64 left = local64_read(&hwc->period_left);
         |                    ^~~~~~~~~~~~
>> drivers/iommu/riscv/iommu-pmu.c:238:25: error: 'struct hw_perf_event' has no member named 'sample_period'
     238 |         s64 period = hwc->sample_period;
         |                         ^~
   drivers/iommu/riscv/iommu-pmu.c:244:33: error: 'struct hw_perf_event' has no member named 'period_left'
     244 |                 local64_set(&hwc->period_left, left);
         |                                 ^~
   include/asm-generic/local.h:30:44: note: in definition of macro 'local_set'
      30 | #define local_set(l,i)  atomic_long_set((&(l)->a),(i))
         |                                            ^
   drivers/iommu/riscv/iommu-pmu.c:244:17: note: in expansion of macro 'local64_set'
     244 |                 local64_set(&hwc->period_left, left);
         |                 ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:245:20: error: 'struct hw_perf_event' has no member named 'last_period'
     245 |                 hwc->last_period = period;
         |                    ^~
   drivers/iommu/riscv/iommu-pmu.c:251:33: error: 'struct hw_perf_event' has no member named 'period_left'
     251 |                 local64_set(&hwc->period_left, left);
         |                                 ^~
   include/asm-generic/local.h:30:44: note: in definition of macro 'local_set'
      30 | #define local_set(l,i)  atomic_long_set((&(l)->a),(i))
         |                                            ^
   drivers/iommu/riscv/iommu-pmu.c:251:17: note: in expansion of macro 'local64_set'
     251 |                 local64_set(&hwc->period_left, left);
         |                 ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:252:20: error: 'struct hw_perf_event' has no member named 'last_period'
     252 |                 hwc->last_period = period;
         |                    ^~
   drivers/iommu/riscv/iommu-pmu.c:265:25: error: 'struct hw_perf_event' has no member named 'prev_count'
     265 |         local64_set(&hwc->prev_count, (u64)-left);
         |                         ^~
   include/asm-generic/local.h:30:44: note: in definition of macro 'local_set'
      30 | #define local_set(l,i)  atomic_long_set((&(l)->a),(i))
         |                                            ^
   drivers/iommu/riscv/iommu-pmu.c:265:9: note: in expansion of macro 'local64_set'
     265 |         local64_set(&hwc->prev_count, (u64)-left);
         |         ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:266:45: error: 'struct hw_perf_event' has no member named 'idx'
     266 |         riscv_iommu_pmu_set_counter(pmu, hwc->idx, (u64)(-left) & max_period);
         |                                             ^~
   drivers/iommu/riscv/iommu-pmu.c:267:9: error: implicit declaration of function 'perf_event_update_userpage'; did you mean 'arch_perf_update_userpage'? [-Wimplicit-function-declaration]
     267 |         perf_event_update_userpage(event);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         arch_perf_update_userpage
   drivers/iommu/riscv/iommu-pmu.c: In function 'riscv_iommu_pmu_event_init':
   drivers/iommu/riscv/iommu-pmu.c:274:63: error: 'struct perf_event' has no member named 'pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/iommu/riscv/iommu-pmu.c:274:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:274:63: error: 'struct perf_event' has no member named 'pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:14:32: note: in expansion of macro 'container_of'
      14 | #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
         |                                ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:274:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:274:63: error: 'struct perf_event' has no member named 'pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                                               ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:14:32: note: in expansion of macro 'container_of'
      14 | #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
         |                                ^~~~~~~~~~~~
   drivers/iommu/riscv/iommu-pmu.c:274:39: note: in expansion of macro 'to_riscv_iommu_pmu'
     274 |         struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~


vim +19 drivers/iommu/riscv/iommu-pmu.c

    15	
    16	#define RISCV_IOMMU_PMU_ATTR_EXTRACTOR(_name, _mask)			\
    17		static inline u32 get_##_name(struct perf_event *event)		\
    18		{								\
  > 19			return FIELD_GET(_mask, event->attr.config);		\
    20		}								\
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
