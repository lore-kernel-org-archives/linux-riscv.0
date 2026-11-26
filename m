Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77431606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iu7z87iu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKcE5OZh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlcYjkKPNIGAzNIe8g20kwmORKwTb+4bW7RY9gbE5D8=; b=Iu7z87iuG9vi6DprlcTGJMv0JI
	M7QuBcykG9LSgEhGqD6xTeUejDLzAjjX+e9i/RrU3/5pR7GpJjTIJqTPgNVP4vwLO+w4Wx1v5EE6P
	z3Y29MkOmOKf9uUVmuUNyHTeZO3OkKLFNydAVCGLV81X0pHf36s/rHfWg8tW0U6seywyBLxTvqKa1
	3LqJ6H9Xg6V5zv6YakhQFNWVXJrF3x7/Gu5d0hxbNgx/RF9Qx/ntqWM6Crat1I9DCbSq+1HAqm3BA
	+hy/2LxdHPZ7OjR3MkO51nWOjMZq6aoOkYG8ITgQUlev2Dirbi/BaR0GsPJYMy8LXxPEQVhQcbDr6
	jSo7pbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRn5-0000000C6a8-3ZCo;
	Thu, 26 Nov 2026 05:13:03 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRn1-0000000C6Zl-0HVY
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 05:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795669979; x=1827205979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NqKhtBpJzofc/sJUBakwaXOayso/8xRaZnEIKxBMMEs=;
  b=eKcE5OZh95NhxR2wwSG5Yt2DEdeR9f/BmaTXFtcCo9/fBlhehn18MFdf
   2UvqZDJNw/TtLSH4OhTJi7B/Oj8IqEiENMfB1SwQ0C2GRPqa7M1wpMxku
   1agHiMGFUKK47G6xMf5sBELlJdRmmH2J2bOQCiVh0Z2oG/ccCAlGwtRbT
   ET7bgdQq6qcilR0giG6OgwVhs0T97dutGVpzbYesKPyfLBV9/aZejep+g
   t/xEWwHP9RnoMV27uy4uankWeHSAn1HfZNIONZRj8o7AKlhmZEsc5SR0N
   IviqEMp7D8kig98EcH14XhcDwFS5nXZFfiVKE+eEJZCd8Vd1u3u2EAAmC
   Q==;
X-CSE-ConnectionGUID: hEWzfNSuSE2cuKQ4FAL1xQ==
X-CSE-MsgGUID: Yqlb4sL2Qo65S+/jmH99uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4632440"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4632440"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 21:12:57 -0800
X-CSE-ConnectionGUID: Oj6siLx/RmWUXqQXQG7QTw==
X-CSE-MsgGUID: DzDwKbanSm6fIbND0dzqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="14112070"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 21:12:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWRmr-00000001TJi-3Ik9;
	Thu, 26 Nov 2026 05:12:49 +0000
Date: Thu, 26 Nov 2026 13:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org,
	Alexandru Dadu <alexandru.dadu@imgtec.com>,
	Matt Coster <opensource@mtcoster.net>
Subject: Re: [PATCH 3/6] drm/imagination: Save metadata from firmware
Message-ID: <20261126130340.K8Rznt4t-lkp@intel.com>
References: <20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211259_204356_5F43542F 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandru,

kernel test robot noticed the following build errors:

[auto build test ERROR on c88084027d0e922dd925b96e5a0d184ba04a8f43]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Dadu/drm-imagination-Remove-get_fw_obj_gpu_addr/20261125-134829
base:   c88084027d0e922dd925b96e5a0d184ba04a8f43
patch link:    https://lore.kernel.org/r/20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3%40imgtec.com
patch subject: [PATCH 3/6] drm/imagination: Save metadata from firmware
config: arm64-randconfig-1003-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126130340.K8Rznt4t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126130340.K8Rznt4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126130340.K8Rznt4t-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/imagination/powervr.ko: symbol 'pvr_exp_fw_support' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
