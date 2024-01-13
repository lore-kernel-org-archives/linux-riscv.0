Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4790AC4707B
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyD3b62r/S13UG7xX8tZj/zd8Fk6lZuSwftpSTqFXug=; b=Q2n3aM77+dL7tQ
	fsFXGnkJ3EsBmMqB10vMv/yg5F2G51VtSqt1VL9+VipMbL1JNK/mN3HJthsC0MX5mQ+XPN4U1pdyZ
	i9n5RleOCGD3l8LASF9zB+Tgkqa7kdugmj8za2mgCGSBqJNriYxrX81cx/d6eSLqBiUm9jp2WTwan
	MZDLIOZF6Thekek0yh1pB30kyo9s3MGP9eJ5foxUijxcZeXBSGRHletCBU+0sFDO1rGJD7CIjQ3l8
	gKOPFTMa/mCPyWBUCBcncJ0+4VHeet2RfAVZhxjB+G4yAbY/OzqJhqjcClarTQeViVrA060QJmTyi
	acTVihwzm71s7XSAGBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOcQk-00566w-0f;
	Sat, 13 Jan 2024 11:44:02 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOcQg-00565v-2E
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 11:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705146238; x=1736682238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tf0eWA3hj90xu6pHB6QFQrMGVnMq18WpJ+KIdyvU3L0=;
  b=gWwyDW/wtFZF1zyv8cM0ac2w+wvbGBEA2r4QS8We9aMoQUNc9T9Pad+d
   n5PmiHxmrZSdSBWneDXfK6hg5+5ZBeRT2X+/8zO1F1lt8vqNYybFFJDzT
   zR02r6jO+2RlXIBpEDL++srOsCt8ZG7cUt/+Um+rcHx46GJ7TxMYEOQEy
   lgL6MbGi6alZycry8uJTq+vVNelFRVc5+SKca4Fe5rUQEPD/x25Uo5ah7
   g/gTeQVce+8AawAck4lIRndzZzjLHnZdbrRai6QtTpspthVCgL9D5Gt8N
   34Ig8kcXf9o0inP9tJIiAJSmBEU8Paphi6ebtIYaDadoG6oEg98ZoflF0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398240052"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="398240052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 03:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="24992514"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 03:43:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOcQR-000AQO-32;
	Sat, 13 Jan 2024 11:43:43 +0000
Date: Sat, 13 Jan 2024 19:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
Message-ID: <202401131928.oie6xLjA-lkp@intel.com>
References: <20240112142621.13525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112142621.13525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_034358_757155_600CC164 
X-CRM114-Status: GOOD (  12.15  )
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

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-pinctrl]
[also build test WARNING on geert-renesas-devel/next linus/master v6.7]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/pinctrl-renesas-rzg2l-Improve-code-for-readability/20240112-222833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20240112142621.13525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v4 2/4] pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK() macro
config: powerpc-randconfig-r081-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131928.oie6xLjA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131928.oie6xLjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131928.oie6xLjA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:155:30: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                              ^~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:571:24: warning: shift count is negative [-Wshift-count-negative]
           u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:155:50: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                                         ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1619:32: warning: shift count is negative [-Wshift-count-negative]
               bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[port])))
                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/asm-generic/bitops/const_hweight.h:26:44: note: expanded from macro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : __arch_hweight8(w))
                                              ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1619:32: warning: shift count is negative [-Wshift-count-negative]
               bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[port])))
                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/asm-generic/bitops/const_hweight.h:26:44: note: expanded from macro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : __arch_hweight8(w))
                                              ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1619:32: warning: shift count is negative [-Wshift-count-negative]
               bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[port])))
                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^
   include/asm-generic/bitops/const_hweight.h:26:44: note: expanded from macro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : __arch_hweight8(w))
                                              ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1619:32: warning: shift count is negative [-Wshift-count-negative]
               bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[port])))
                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'


vim +571 drivers/pinctrl/renesas/pinctrl-rzg2l.c

   567	
   568	static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
   569					   u64 cfg, u32 port, u8 bit)
   570	{
 > 571		u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
   572		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
   573		u64 data;
   574	
   575		if (!(pinmap & BIT(bit)) || port >= pctrl->data->n_port_pins)
   576			return -EINVAL;
   577	
   578		data = pctrl->data->port_pin_configs[port];
   579		if (off != RZG2L_PIN_CFG_TO_PORT_OFFSET(data))
   580			return -EINVAL;
   581	
   582		return 0;
   583	}
   584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
