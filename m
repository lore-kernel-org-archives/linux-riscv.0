Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751E3C2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 23:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFPOUqpYDvOmaA5SDLrVGD4zOkbv690yz7hufHcjSB4=; b=3r0KoOgnFXS1jh
	HZ2CfSmvQPAV0SeBsrgoL7BlKBVRcz7GJqtjMjDSgS7QSit/No/O37nhw2sWkfAQ2N67o5f/uZVaC
	3OetA+akJ+EO/DE1zvF7BTLVVJceznE7VwVqYNhWM1YKzT82G5gUpW6jpAsmcYdyLvlr/j8h8xzVC
	/3YpxEh1uHPXEoeMI+UR/mlCL2INkEN0XHRStjhtA8G3Dzqumc3i/OG+udkOB7p4RgwmIRKd3CuXb
	xoeJYf268IyGhG0hOWqO9+d6y71DLR2sUltMOzyAJmsZ3Tn2dAgUhECZBDtA4e8PjFwmKf8wi289c
	xPMfBWgow7rJehXCxIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJi8w-0000000Gs6R-2mDW;
	Tue, 18 Jun 2024 23:21:38 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJi8s-0000000Gs5r-0zuk
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 23:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718752894; x=1750288894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v/NlBfEfE5g1MehnEEQEfq87Nz3xvgIrz+Ciiv2rTtU=;
  b=gixDioXGjXbXYm7QREOnFInQ3AIAdWBCWlXq83KemHTyl42V7jhf6B8P
   Ftu2iAq/kJ2hXm8u6baWzeUZzOaMPUeX1f7u2miJV/kre4y9KeZBi4E9P
   Rs5HSsPg720AKrOBgjqctwQe4jcQ7LaLSrq32onU8qSVqKeNxU7kZzw2y
   D6Yz8rcN2Tk0/QNgkr37pY0nAgC6xTf0ajeggUIGdLCYCtAsmVPyEDeZN
   MZ1AAD/qCMamTHVTBUDCPAMqgV/UfFMsdb+IHFEiWA1cHX0RYAq/coCLV
   hwTq+dgBX9gHbj7TjsDcvEmqeDbCYHB4w9CN4TO0+amc1HRLQSoDc0YJL
   A==;
X-CSE-ConnectionGUID: lmVgYc0oS/iKQd2vxGBdaQ==
X-CSE-MsgGUID: ST08azBDT/KxKcA5Tk/Amw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="18582739"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="18582739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 16:21:31 -0700
X-CSE-ConnectionGUID: f+n0ED0bQMWg+K7pz4MA/w==
X-CSE-MsgGUID: UbJXJqC2QKmmTy6JXU8KIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="72464871"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2024 16:21:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJi8j-00061a-1t;
	Tue, 18 Jun 2024 23:21:25 +0000
Date: Wed, 19 Jun 2024 07:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Message-ID: <202406190627.BcUP9uUN-lkp@intel.com>
References: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_162134_311212_C17171E4 
X-CRM114-Status: UNSURE (   9.63  )
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

Hi Yuntao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc4 next-20240618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Dai/dt-bindings-mailbox-add-Sophgo-cv18x-SoCs-mailbox/20240618-232307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2%40SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
patch subject: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
config: arc-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190627.BcUP9uUN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190627.BcUP9uUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190627.BcUP9uUN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml: recvid: missing type definition
>> Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml: sendto: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
