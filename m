Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rdh0LqWLrxh+Xe52AVA/kK//Bwh0G0Ke4XxNNIVu5RY=; b=dUWdw/l5WWVbJI
	GULyush4B77d5m/wVtA2C3kl1zYA9VfbC+/yuVdE/UBVSBoZ+C/svpWPdRR9x1RbR7yTwPzerURxD
	mPIql9lZ+mRHAvLhax6tA/XliVL7GPqygdVcHKs+W5xIM8e+q6rhF6YK3prfHVYVDB1b7gohwQysd
	2ZjtAizPW6S8HlM8ksdMsEIgFNBwwe3LVHnlHHCHVw9msbFQO/nKZzmmusM287AftAK7pKV6fQo5a
	s+qDzbT+df9op3P7UP58xeb0QhkaS1K1zlPBm7DCoZ7qosV00zR5Yx0DH7PKXAMvS5m9sEwyfzlnr
	rrcqzYV2llBULplQZBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVO3-007Urc-1s;
	Tue, 05 Dec 2023 13:22:55 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVO0-007UpM-1a;
	Tue, 05 Dec 2023 13:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701782572; x=1733318572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AHTG5//HsS+ik+KHalxVDEMMIBv5EzNnWR91SRis9eY=;
  b=LqKH81imZ6vWO9PSBmFI35H/TGVK49dviBLIZMReM015InNAM+yURbpC
   dn0a1zul7fouLsbM8QIZBmQ23rWBEW6E7+MJ/PDHDAoP7xSaW+k/Vdyc4
   FaGTtSmXKCqL2TKv2cJpqgBRCtp+2v+PRaGxcEKe1Y8XvU/hMfV/m2n1P
   rimt4CkixWlD6DTyxGqVplqM0/9nW6YfsuVUgkI4/9/jmvncFnCveNgfR
   WTzGvEocfTnAxZ6p2WOVDYpiSmuEX39g4JIyR9cpjdCe2P5ISOzBDs2Qi
   F/Ga/CBTiCwBrewakmFlOtdzKbytsKswKh+pk28wRQ8qlT5p5OTA13hZG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="975424"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="975424"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 05:22:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799972189"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="799972189"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 05:22:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAVNn-00092Q-1M;
	Tue, 05 Dec 2023 13:22:39 +0000
Date: Tue, 5 Dec 2023 21:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, anup@brainfault.org,
	atishp@atishpatra.org, palmer@dabbelt.com, ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
Message-ID: <202312052128.oBSS3Uus-lkp@intel.com>
References: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_052252_546205_55E0CCCB 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next linus/master v6.7-rc4 next-20231205]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Henrique-Barboza/RISC-V-KVM-set-vlenb-in-kvm_riscv_vcpu_alloc_vector_context/20231205-023109
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231204182905.2163676-4-dbarboza%40ventanamicro.com
patch subject: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231205/202312052128.oBSS3Uus-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052128.oBSS3Uus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052128.oBSS3Uus-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/vcpu_onereg.c: In function 'num_vector_regs':
>> arch/riscv/kvm/vcpu_onereg.c:991:39: warning: unused variable 'cntx' [-Wunused-variable]
     991 |         const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
         |                                       ^~~~


vim +/cntx +991 arch/riscv/kvm/vcpu_onereg.c

   988	
   989	static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
   990	{
 > 991		const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
   992	
   993		if (!riscv_isa_extension_available(vcpu->arch.isa, v))
   994			return 0;
   995	
   996		/* vstart, vl, vtype, vcsr, vlenb; */
   997		return 5;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
