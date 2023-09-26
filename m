Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1255EE7F124
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gudzdz68Y67UPJJ6SfmcdzupeUYp2/UaI/yqnS58zo=; b=UCNKpK55DupC7s
	IgOtKJgNwTFWTuA0uZNM3niGX6TkwGyD/iSyvxIs4bRhoFGSJbNULt3yYKWKG+2l0pwphno8zmYOj
	96RZGNQ9BijmsvfZdCPZqxJIETzKuWqWaf+D72/8MmEul8QrwQkCn9u+XEXNDi4kU2e3WR6L+URtH
	/y46ZE9uYyW6Xqw29SdmLiE/MzpqaDyl0twX88YQpuEA7GyXcHO5OAdpzrbMkrSC4tbcHUpez7OWJ
	TV4rmCX7vYv1XF97YhwfSlbxy7rbxMR5E56P/LVjMIDzy0IsStaj+gLliUuWCnKK7G9j0RvNsK9q3
	63JJG2qwnc3gaLrkG9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlEvA-00H0xZ-35;
	Tue, 26 Sep 2023 20:44:40 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlEv7-00H0x1-0H
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 20:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695761077; x=1727297077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gK5hWn8nLs18VMiTM7kXxPjeLkMzRB4MUjym/ABZruA=;
  b=iFO3v7oH3RazpHXUeB20Xxvwd8+TkYZg1j/MjB/QrMlWuwHg67Wrbb6b
   mkPvCxDOeCKz7aHEkLOc5mmJcLShq2DA/iQHmUorjAtSmjfvGTIODCfKh
   dAwTX7Ct+9SbTohKMoS3TGbFzxkN+gDHtevaAWRA3dut40ShwcFF+WyWZ
   /RBjecEAowqjCN3mBacXudr+ZbPQQBf6yr8IicWKGWOpWySIAF4NShTMM
   HJuQprnZZvb7W1PThyuWML9/WE9b4GYSWLOy69R6N2dTExEShkAkuWxIq
   Ua4Qw+DZyawBVTIdfiu9+M+62vSv05q0Co+ZeE/FfgE1XQ1pRrVpz2r/k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371999462"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="371999462"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 13:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872631689"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="872631689"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Sep 2023 13:44:33 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlEv1-0003Ld-0Y;
	Tue, 26 Sep 2023 20:44:31 +0000
Date: Wed, 27 Sep 2023 04:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Dunaev <dunaev@tecon.ru>
Cc: oe-kbuild-all@lists.linux.dev, dunaich@mail.ru,
	Dmitry Dunaev <dunaev@tecon.ru>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs
 as initialized.
Message-ID: <202309270417.HR9Q4rJN-lkp@intel.com>
References: <20230926102801.1591126-1-dunaev@tecon.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926102801.1591126-1-dunaev@tecon.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_134437_173739_CA3188CF 
X-CRM114-Status: GOOD (  17.69  )
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Dunaev/irqchip-riscv-intc-Mark-INTC-nodes-for-secondary-CPUs-as-initialized/20230926-183500
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20230926102801.1591126-1-dunaev%40tecon.ru
patch subject: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs as initialized.
config: riscv-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270417.HR9Q4rJN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270417.HR9Q4rJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270417.HR9Q4rJN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-intc.c: In function 'riscv_intc_acpi_init':
>> drivers/irqchip/irq-riscv-intc.c:185:58: error: 'node' undeclared (first use in this function)
     185 |                 fwnode_dev_initialized(of_node_to_fwnode(node), true);
         |                                                          ^~~~
   drivers/irqchip/irq-riscv-intc.c:185:58: note: each undeclared identifier is reported only once for each function it appears in


vim +/node +185 drivers/irqchip/irq-riscv-intc.c

   169	
   170	static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
   171					       const unsigned long end)
   172	{
   173		struct fwnode_handle *fn;
   174		struct acpi_madt_rintc *rintc;
   175	
   176		rintc = (struct acpi_madt_rintc *)header;
   177	
   178		/*
   179		 * The ACPI MADT will have one INTC for each CPU (or HART)
   180		 * so riscv_intc_acpi_init() function will be called once
   181		 * for each INTC. We only do INTC initialization
   182		 * for the INTC belonging to the boot CPU (or boot HART).
   183		 */
   184		if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id()) {
 > 185			fwnode_dev_initialized(of_node_to_fwnode(node), true);
   186			return 0;
   187		}
   188	
   189		fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
   190		if (!fn) {
   191			pr_err("unable to allocate INTC FW node\n");
   192			return -ENOMEM;
   193		}
   194	
   195		return riscv_intc_init_common(fn);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
