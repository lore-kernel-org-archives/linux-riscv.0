Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C292CC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WP2UFWlQZXYFphkIWu7ESeMBH6S+0DUtK0hHMC9pIYE=; b=DuRy8O2LmmoAMh
	nmeAUD3ZFHActwf3nULd1yT5/6mcdZIl6uW3wHrXRVeSHBpkLp/FeLo5J9MHHsdLx3u3qz4mO5nkn
	Hc2QGDmXS8WL0sQ6kHGx8SAlaMyJLpO8ssUDKzfvMCcu7RlcWd3A/kRx+l+pUwRwB1qZNHHMavvkF
	EyZUA+v4qdijwVvFDY1Sj8YtSvfXSwM3eo6T1I++RPk9GuVufYYymQjclUvl7xDTK3LaIcdcWDH5s
	9+d361Lx1kQuIWiceYTZeMNc3jw2eOv1QE3wWaBTpXkmKPEgCfq/fCdiKti29MpE58NpKXzetYtGu
	ogvUzH8ea/leQkno7T8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0j2B-0000000CB4p-2PS5;
	Fri, 04 Apr 2025 15:32:43 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0j28-0000000CB4P-2ZET
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743780760; x=1775316760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l4NfQuaRg7vF8YLzLFVfCX0eGTmkIJQDbug+xp/8Ur0=;
  b=nRFBr1R4UE3vM2Li9C3LadHTNIc/o2jxJ9hNX8j2I1GyezIwt9nM5L6J
   hDJy/MoTIsJVrOjAexo839l9s8lgeLOKtsD+aL2DsR5m++UI2pgMq4A0Z
   fO5Lc2Tv5UOoEbdKsDPNYK8jHyCzZnTVeOHUOMT+tzD6Stfbomq8GUYFM
   IFmjJ5YqoBID+abR0MVspCTX5pNkeHo0cTK/XZBk5xWY5yWY+dEITxdU5
   YQBoziugDlqyfxWa5+UsleogFId81ninr5fUjl6GeosFQbRFbx0JnuqnM
   oBUKqwdp8/rTUwe1mR1/ugC/UUhR2K8aiu0tqN4MWsa1812VQsR3rW4jR
   A==;
X-CSE-ConnectionGUID: promneUDT3mN88nZvJnPjw==
X-CSE-MsgGUID: VFpbJRntSF6KPdD0rc/ylw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="32827373"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="32827373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 08:32:37 -0700
X-CSE-ConnectionGUID: w6x4comGQQOj+pL4mRXMsQ==
X-CSE-MsgGUID: uqelw8/ZSUC6OlaT1ChzUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132460543"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2025 08:32:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0j20-0001Kz-1i;
	Fri, 04 Apr 2025 15:32:32 +0000
Date: Fri, 4 Apr 2025 23:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio Encinas <ignacio@iencinas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-arch@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
Subject: Re: [PATCH v3 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
Message-ID: <202504042300.it9RcOSt-lkp@intel.com>
References: <20250403-riscv-swab-v3-1-3bf705d80e33@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403-riscv-swab-v3-1-3bf705d80e33@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_083240_663882_4B8559A0 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Ignacio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47]

url:    https://github.com/intel-lab-lkp/linux/commits/Ignacio-Encinas/include-uapi-linux-swab-h-move-default-implementation-for-swab-macros-into-asm-generic/20250404-051744
base:   a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
patch link:    https://lore.kernel.org/r/20250403-riscv-swab-v3-1-3bf705d80e33%40iencinas.com
patch subject: [PATCH v3 1/2] include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
config: i386-buildonly-randconfig-004-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042300.it9RcOSt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504042300.it9RcOSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042300.it9RcOSt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/asm-generic/swab.h:21: found __[us]{8,16,32,64} type without #include <linux/types.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
