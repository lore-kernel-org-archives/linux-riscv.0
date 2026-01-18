Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4665CD4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeMzeeU8II95jCfFDjqsfx/1o/LTdvr2j7lvjhOVMPA=; b=v+y0iJqGMbDsMU
	kABTieYDGHV3ujV7zkJLK5TR1/sUOyz9RDaEt1JVf0mp8S0/URbcXw8oW/Ez/wXo8fi6CuejX7iuP
	cOS1EaxpC4yNaTOIqd5J+aOYDkqx2QdEWJrzcjL9enyd7Pm8lroA4ck/lGwZsMlkvRzGu5TyzrNaq
	Rg5Ud9JhGZRZz+UvBXCSesscgTWxiohOggMsE+yI18YvmeMi+uKJedOEEqOYOh5Z9dRzo4qk9Ke8p
	Uf/xKFOlKJonjjmYat0H25ppSv1WQzWN+SouBfTGZ2PUnonHJPiHhGVQ6Ubf6K3EqWq/UMerJsJ8D
	moP57U2/gpPdkcG7Sf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhQi3-0000000HPnF-0pXG;
	Sun, 18 Jan 2026 11:12:43 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhQi0-0000000HPmF-1nYV
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 11:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768734761; x=1800270761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HHxCyNzV3yInMvStIhW6ArCPtYeGfj46Oo+tdRp799I=;
  b=hX6U9N2tr98boYE9qOL0Xlp4rOgH1wNcNf0rUFtUX3zxNu81Z7OcG3T8
   pN8O+A7/00yc1vqyS3Uxt81s9KluSr1MJ+UQEzlaOfhyV7rhpefHIbGDK
   FOkTgRQExjbS9memO9aJPbtFyoUK0AAa4e8B0WqzcUskD3cRBRhOgRcUX
   iU+/tFF9NUL9+dF2LzCR4zmZtv+/GvV/SUJ2vr20xSD6drfu7uXvN2M2n
   esDM+G+grEUM4xNcKCCFDg09tNB5OGSMS0MEgr2WtgtDxFe1k41S+/JvK
   nItq3GQ8kjhOUUr7AOFKawiOF0+q+NK2l/LmvW6uPQIStVYirz5zAt5hB
   A==;
X-CSE-ConnectionGUID: yWnbX9UWT+eob5lhvtUy0g==
X-CSE-MsgGUID: +nty74hTS1eR1+eZHaYEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="92644632"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="92644632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 03:12:39 -0800
X-CSE-ConnectionGUID: PIXJ2vq7QNi5BYlfWbWcDg==
X-CSE-MsgGUID: peddX7tYQkWOJ3/j2M7omw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="204775832"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 03:12:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhQhr-00000000Mtg-32hi;
	Sun, 18 Jan 2026 11:12:31 +0000
Date: Sun, 18 Jan 2026 19:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org,
	andy@kernel.org, akpm@linux-foundation.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, ardb@kernel.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <202601181845.EiSSqJu7-lkp@intel.com>
References: <20260113082748.250916-9-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-9-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_031240_584822_30615320 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Feng,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Jiang/lib-string-extract-generic-strlen-into-__generic_strlen/20260113-163741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20260113082748.250916-9-jiangfeng%40kylinos.cn
patch subject: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for strlen()
config: i386-randconfig-015-20251207 (https://download.01.org/0day-ci/archive/20260118/202601181845.EiSSqJu7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181845.EiSSqJu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181845.EiSSqJu7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [lib/tests/string_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
