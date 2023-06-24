Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1A4EB64D7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGff/ohOAmFOWUXGs/6In7izRfuJhTBfXiaKxJsZy88=; b=TYFht3LDgb/0vR
	u0isMHr6czaVQO3eSkYLGG5UeVM1JvTC57U9lpF9zg6AAKVL1H3SyCAeBR2u/BHq9jtn1raq5MYlg
	d2GFW4Vba8geKCAcWlkaYFBa6p0MSxV6TOSaRRNcvNffujNiAGMgJZyLgKNtqIio/khQhYSCPOFtq
	fOX3aCByh6QMCi/Cbly54oQNPX4Tc8u3+tQ8owKOzc3QHsaNiquyuMrqiIHT2kwqAMb8iE94KQ6EU
	Ni+NKURIIQrhZJo4GTuw+i5S6R4BCwfKm3zDJF+Gsn9eqFEenBmKlxqCipCtDo9B/we3TE2gMjT9U
	pDUTpOM4uGgQEiQCDbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCr6q-004vCl-0g;
	Sat, 24 Jun 2023 00:26:36 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCr6m-004vBo-1P
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 00:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687566392; x=1719102392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=31YNRBmOki2uDFgedBECKlRElQKPWji8PoV4bItAMvU=;
  b=HWSSmNN56ccryciE7QRzzqsfg8VxfLciqQ9roN0Y7shq8JiyI+srV5Vq
   7fSMZj26ZLHUGmtMseMAfbMdTCid1fYyuN5ci/xSE17NuJ9vIcL/4ajX8
   ZBtwdkxZw03I6GhvCCesmFZ37YKd9TbycsN0uLPbdPG3re7IzGvdAy5+a
   cAaw0tCSW0xbaA7HVIS+L/LvZQOtgO8OpeaaYWEr5hV+1YYFxrVOApZQN
   5MqQtoZC/ZU7J9e4e2Yo2lHGRYv8slXxMe/qZ2QRoZVWhoL6VMfVhi47i
   LTdNXcG9iQwa5n2Lh54BpQAEqetZnV52xobV7UA/BfIH2yITr+hFwt6P/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359759356"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="359759356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 17:26:26 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="750128385"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="750128385"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2023 17:26:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCr6b-0008bh-0r;
	Sat, 24 Jun 2023 00:26:21 +0000
Date: Sat, 24 Jun 2023 08:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
Message-ID: <202306240844.hWqCe54e-lkp@intel.com>
References: <20230623095547.51881-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623095547.51881-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_172632_492168_61653A18 
X-CRM114-Status: GOOD (  12.70  )
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

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.4-rc7]
[also build test WARNING on linus/master next-20230623]
[cannot apply to lwn/docs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/Documentation-riscv-Add-early-boot-document/20230623-175814
base:   v6.4-rc7
patch link:    https://lore.kernel.org/r/20230623095547.51881-2-alexghiti%40rivosinc.com
patch subject: [PATCH v3 2/3] Documentation: riscv: Add early boot document
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240844.hWqCe54e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240844.hWqCe54e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/riscv/boot.rst:122: WARNING: Unknown interpreted text role "c:var".

vim +122 Documentation/riscv/boot.rst

   121	
 > 122	1. :c:func:`setup_vm` installs a temporary kernel mapping in
   123	   :c:var:`early_pg_dir` which allows discovery of the system memory. Only the
   124	   kernel text/data are mapped at this point. When establishing this mapping, no
   125	   allocation can be done (since the system memory is not known yet), so
   126	   :c:var:`early_pg_dir` page table is statically allocated (using only one
   127	   table for each level).
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
