Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2DCC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRxMNsP/lE+8zzAjHT4P76/YTi9tDYdiEtBGxkyZ3b8=; b=gZYyf0vrXFgSva
	NTJk5GCqowTYU3E6Rohi93VhGyEndaJaUbCA7uMnw1dhm7j2c0Hj9HbcDQI+Hk8Ub/SB7+nq1a6t7
	mclSZkxLsXge416IpEolYsacfUK3YS0nrpJFhgtVVLy5HnhQc0XkZtm4yTs5r30rO/CQRGZawfSl6
	yNj7JpOmV4KkcRo7lds+OzY3W0h4KjmWQDsFZI0i20ucNt6TcI0A+k5tjaJ/Uq3oOt4ur1Hk2vXHf
	wEToc+3XZYyz91efrkv3xsf0plm9Imj0n03lyyGINK7PHDphtD0VxOa+x6RPVNOh+43KJzjJLsiD3
	UoIVGiLyVDRn1HoFNdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTelg-00000002Qf7-3DyY;
	Mon, 23 Jun 2025 10:51:16 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdyh-00000002Gqz-0mBU
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672839; x=1782208839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JV+By1pXi83zG+o1aVXBhH+PKzXW71STeMIFjFmBZI=;
  b=H2QdWkpZvs/igZZ9IKS5NM6drzOqNGkkw8nf6ycVDe7qVNzzT/yHDkLQ
   vumvT4AA5OUna31Ss5NUepBbrU+jZjjHcPzt9LgTjuqSrMdxVdXBe3gmd
   t0BIWwToGuHik6lEEs7BkvH0z17cs+qRV1Z8Yjw43QLnxqJMpIXM9/JAw
   KCNrfoTTkOsUubwpRkBudQ4dwWtwkOENCX+iMmtCB6cq1vj96s3dtbVeX
   jqDPDt0Wwm9MDHp29YjgGjDhnxgCnJDn6jDqcNDn0oVVmNC8rm5QgsyWT
   vvWfTkTHXfFZuv44auU7bUL9MxKgTgykMgncd9rWN1SaH2VE7AQsPi8xr
   A==;
X-CSE-ConnectionGUID: EUUOb27+QTeuX9akji71Lw==
X-CSE-MsgGUID: sUpVyKX5TNeDvCnISv3HVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64227972"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64227972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:00:38 -0700
X-CSE-ConnectionGUID: C61qQjCCQhWAJh+i6lHzVw==
X-CSE-MsgGUID: CLgbVnMMRQCefat+FxcpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151023781"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 03:00:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdyX-000NvU-0m;
	Mon, 23 Jun 2025 10:00:29 +0000
Date: Mon, 23 Jun 2025 18:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, dlan@gentoo.org,
	wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202506231720.IakJqbvG-lkp@intel.com>
References: <20250622032941.3768912-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030039_234614_C2A76A74 
X-CRM114-Status: UNSURE (   8.45  )
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d4809e25903ab8e74034c1f23c787fd26d52934]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250622-113200
base:   5d4809e25903ab8e74034c1f23c787fd26d52934
patch link:    https://lore.kernel.org/r/20250622032941.3768912-3-elder%40riscstar.com
patch subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: i386-randconfig-017-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231720.IakJqbvG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231720.IakJqbvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231720.IakJqbvG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __devm_regmap_init_i2c
   >>> referenced by simple-mfd-i2c.c:47 (drivers/mfd/simple-mfd-i2c.c:47)
   >>>               drivers/mfd/simple-mfd-i2c.o:(simple_mfd_i2c_probe) in archive vmlinux.a
   >>> referenced by simple-mfd-i2c.c:47 (drivers/mfd/simple-mfd-i2c.c:47)
   >>>               drivers/mfd/simple-mfd-i2c.o:(simple_mfd_i2c_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C
   Depends on [m]: HAS_IOMEM [=y] && I2C [=m]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - JOYSTICK_SENSEHAT [=m] && INPUT_JOYSTICK [=y] && INPUT [=y] && I2C [=m] && HAS_IOMEM [=y]
   - MFD_MAX77705 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_SY7636A [=m] && HAS_IOMEM [=y] && I2C [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
