Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DBBC001DE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unh7/X+WWAjhZzj1eYPdEXhIMz/BQvbrkmzKnFVm11Y=; b=DqEjoe+s8KS3Ci
	UC87X3MncNR37DLKMOVZSAejT7+Og3N9FMtfN/IjzgUc0hQGp9TcS+s/AFQoU5AuKb99YWE88bJub
	skJ0/jbnA620+YkW9QE9ia9p9tUBh6g+qUfLkX3/za8fSeGIgSwOzrVhgc7x9Z8XXFmbXPRkYjgj/
	TrjjoJu0j9zntsB2AP3RyU3k1jLSMrVRVvEBrrQNEbG1dJ/AMX1Id/QmX6q15/lRQuxwKH0dVWY9i
	J+XM6/FYu5I4wR+Iy6QTPoM6/6oYvKxnCtl4qvl7N0Y/Sq/zeOITC+ZylBrOzI5wR1d7p6Tw/U368
	M7zm0mZW03IMW47lXNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qONqV-008MDZ-23;
	Tue, 25 Jul 2023 19:37:23 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qONqS-008MCK-0q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 19:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690313840; x=1721849840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iXbgVG18Y7RTGH9a4tg9bgDCR+4JUI1k2BMBe1/7ZtU=;
  b=EFcfFd1PRqsIvrLU+S7DBnU0Y4wBQNLZ6RG/dQsETsnud49pk1IiOwTY
   7ylDpjGjC8ckoCtzzX3d9NdtdD8WNjUeHvyTBbl6q8u47Bulx0Qep73y3
   UAB0hbV5gVwEd5HN9H6darHqFGQ8iCT6fAu3DjmZ2ivt0/t5zFgEXTTuE
   j7nYRioSVnEDS5rmZNSxgD0TqfilpNSTSFYLoVLJvlaGOTWvIjdjiS/Lt
   efJ2lt+33SlSaDvoBX7devy5c7b2iPNgwRqxomHRKZua05GygVAY2z6UH
   0/my2EgrfqVlsqXIyiGQu8mZFgqz2lowHsA9ldyIrgQD5nbY1FFmQFBM7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367856224"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367856224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791512095"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791512095"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 12:37:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONqK-0000I3-1y;
	Tue, 25 Jul 2023 19:37:12 +0000
Date: Wed, 26 Jul 2023 03:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Li Huafei <lihuafei1@huawei.com>,
	Liao Chang <liaochang1@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Alyssa Ross <hi@alyssa.is>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <keescook@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
Subject: Re: [PATCH v1 3/3] riscv/purgatory: do not link with string.o
Message-ID: <202307260325.E3Uh9dYf-lkp@intel.com>
References: <a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_123720_345013_B516A174 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Petr,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on kees/for-next/kspp linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Tesarik/riscv-kexec-handle-R_RISCV_CALL_PLT-relocation-type/20230725-165116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext%40huawei.com
patch subject: [PATCH v1 3/3] riscv/purgatory: do not link with string.o
config: riscv-randconfig-r001-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260325.E3Uh9dYf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260325.E3Uh9dYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260325.E3Uh9dYf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: memcmp
   >>> referenced by ctype.c
   >>>               arch/riscv/purgatory/purgatory.ro:(purgatory)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
