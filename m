Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701ACD585A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWfWKqt+Ls9wq41BlX6DiF1c0cRiIn5JMasrUgrK3Uw=; b=TtH8tV0GK4RgP5
	OYbyZyOEK5aL/UxpqTib9SF5TvUanzMNOX08b/td6TMN9JJE2ZpYTnpow6ta9bncF+NhHDYDdlInB
	fxTaCEikkOoldLb+AQB1fFHq+pSCFUVgSaNKbP1lVhY1GsV9+EsM6ZoEG8ORh00zKVj4wnXRp0fWX
	5NtUqcQci/UnS9Mgva1E2pIfwwJ8nGJ1hYKX56F6ghtkimSzQ549Nlc3i3KezkFR/qELRze1qMGRF
	Vg4ukTDVLwoqHYyCUiec9MIMW95Irdl5FOsdgwHNFJmMIqwt4BnbReKqdNtOerUejIK0qwN9s3Mft
	5fx9HZ2MShneQFcOPkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRnk-0000000EptB-36lz;
	Wed, 07 Jan 2026 11:34:08 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRne-0000000Epsc-41wk
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 11:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767785643; x=1799321643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HF9bxW5ifEArR+IWBvYklBpsds/zxrsa+KeSijSZQAk=;
  b=fPG7pbjzg011R7ec5EjeVxK+4fVMSKtieZF7x+T1DTevSxwJ9UhioNqc
   24OkBIHUOVhpJ6OA3PXwQiNXvEMYycW3ltJsk63/9r5oulVTw4gxxDw9J
   wRpWVBXCGPAU/prC9+5ExJe7eJA/NyMUlD7mrSAut50/TROerZAK8cbRb
   POsDRnfTa2MqU2iT6NcMqTwNOCg0ssxmB2GyQKmJRPVGWYPuWW1QT/uVY
   t28LpA1m8XY80mZZsN855NZTQSPZNN4A/ljgf0I4X9NsVoBAKI7KDDgZ0
   52KdSAF2fg7KokwYAnh3xLZjsf3m0j/nAL+GFTfDXMiEUz9Uk8M6AfVAg
   Q==;
X-CSE-ConnectionGUID: ltySDGS/RCGiqAI3qPrOQA==
X-CSE-MsgGUID: bJTUQObzRyCM9Tzxo0LCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79455972"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="79455972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:34:02 -0800
X-CSE-ConnectionGUID: aMlEGbLhQaCn10YQms/Y6A==
X-CSE-MsgGUID: UtuIl78URiC4ji1cbweZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207053741"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 03:33:58 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdRnY-000000001Zw-1sIe;
	Wed, 07 Jan 2026 11:33:56 +0000
Date: Wed, 7 Jan 2026 12:33:26 +0100
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, pjw@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andy Chiu <andybnac@gmail.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com,
	vincent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v1] Documentation: riscv: update Vector discovery for
 userspace
Message-ID: <202601071253.83RmycAh-lkp@intel.com>
References: <20260107000609.63892-1-andybnac@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107000609.63892-1-andybnac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_033403_082921_31A28EF1 
X-CRM114-Status: GOOD (  10.92  )
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

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.19-rc4 next-20260107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/Documentation-riscv-update-Vector-discovery-for-userspace/20260107-080917
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260107000609.63892-1-andybnac%40gmail.com
patch subject: [PATCH v1] Documentation: riscv: update Vector discovery for userspace
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601071253.83RmycAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071253.83RmycAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:153: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:176: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/arch/riscv/vector.rst:163: WARNING: Unparseable C cross-reference: 'prctl(PR_RISCV_V_GET_CONTROL)'
   Invalid C declaration: Expected end of definition. [error at 5]
   prctl(PR_RISCV_V_GET_CONTROL)
   -----^


vim +163 Documentation/arch/riscv/vector.rst

   162	
 > 163	c:macro:`HWCAP` is designed to serve as a quick check to see if the standard

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
