Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB909C3DA49
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jy+AtEvXm7r3j8w5XLnvYUbPGeODIlLW/9Y/K1ENN0E=; b=iGp010Mt/METJC
	tv3USFLoO8bubT/aNIfW2BKXQ+JzsLY3zyTneVInGoNzASmKU7fI4foXQO6LKrK9LTCpguBQANfQH
	2hQbcPHN6wZh1tYxWIQTWfXfsGnoaGlnWYK0u/k5aS6xKootFsqCzmDolo4KO9Welo1vEa6+ymZxU
	Fwz3cZO7YjzqguuASu1zjwCrXt1RdcSwE6jh4YqI/rLySZ2CKUFw0LAJ/AZbjgQz6jaL5Fi+m6Wp6
	X+hmSn6BYydi3E1gWBlTBWIFIcsP9UC3v9RzZwKA3+U3h9h4Cbrji7lR+KrVniHSAk691KSr4lRvr
	EAWj+k2AozgkM/jnDqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTB0d-00000005abc-1ulU;
	Mon, 15 Jul 2024 02:00:11 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTB0a-00000005ab1-3Dj3
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 02:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721008809; x=1752544809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eFeM/mubVUDDERtFQAHi8bGxnrvJRVJGCBfZtYGgymA=;
  b=IfhMGSppL8SiFpSCNY60GS2z0qasg0kzLd9fA/4Vb7RjwXkrWRgmM2q1
   O6AZ/BQklcx2lhCe4dkAQOCl9GgCwRbc3GkA0xazF0+2XE4ILt5vBrAMr
   v4gixsSInL3LPMHL6b8XFUGGkVpCddBZUypryzmpfP+8f//DCP0E8a1pA
   MH7LLqgClcc5GHR/F+BKWSdwalXsyZ5EQdiruLd+GBNzb9c/HYW2jG4Aa
   tP65J8a1k1j2nojqoQFOAeAg8h63RFu+VVux+cZo030ylOgUWLG4uDkQm
   O60XpvHUGh3LhWl6eLURpmFNRIOrL9Q922pAZfrppGIMN4Iy76HICOFfT
   Q==;
X-CSE-ConnectionGUID: KdNrXtXcQhGLVNb4lFxOrw==
X-CSE-MsgGUID: ERBTVKf/Tmq+e1EgTbVedw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="28977057"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="28977057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 19:00:02 -0700
X-CSE-ConnectionGUID: x8eZ/MO0TkeFXyGhdI9v4Q==
X-CSE-MsgGUID: 2zoIrlmTRBuw5qQNvc/QMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="54294866"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2024 18:59:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTB0O-000dru-15;
	Mon, 15 Jul 2024 01:59:56 +0000
Date: Mon, 15 Jul 2024 09:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: Re: [PATCH v2 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
Message-ID: <202407150911.KZchf5cj-lkp@intel.com>
References: <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_190008_877953_333466F7 
X-CRM114-Status: GOOD (  11.31  )
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
[also build test WARNING on linus/master v6.10 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Dai/dt-bindings-mailbox-add-Sophgo-cv18x-SoCs-mailbox/20240715-003952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/SYBP282MB2238F93565D20F0A5F3EEB6BC4A02%40SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
patch subject: [PATCH v2 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240715/202407150911.KZchf5cj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150911.KZchf5cj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150911.KZchf5cj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/cv1800-mailbox.c:30: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * cv1800 mailbox channel private data


vim +30 drivers/mailbox/cv1800-mailbox.c

    28	
    29	/**
  > 30	 * cv1800 mailbox channel private data
    31	 * @idx: index of channel
    32	 * @cpu: send to which processor
    33	 */
    34	struct cv1800_mbox_chan_priv {
    35		int idx;
    36		int cpu;
    37	};
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
