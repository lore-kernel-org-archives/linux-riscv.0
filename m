Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A1C4706C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 20:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2UGvHIQyfOc+TeMnLpxi1b3Va2L1Ee1MT+XPWEhpA0=; b=L9Y2fTbhBHNYdx
	TcPoHrwi7epTFR60Ywqcsvmf/D3BMRh1u8GtsXS9m1AkW2hWZ1JWoy8a5jzJG21p78Jx4pc4E83Z6
	HDMcHCDZOrfwxnL1I/00xPR3fpV3cyUkEmFON8LTfMeCeEIcC+BxwyBBZX34IIew6D8+uqM+RIVY2
	QgWWPHVKOzQP6Y58BiVjNmIvJjm96FRKBdjxm7q6U4UUaR05LZdFYivZpqRY6Ziq+EQxdrLzVKf0W
	oKyzeWcTWspNrSNeemN9/rVH5Y/fYf34ljfjrZfvh8cRN6shAueUAh9ibh/p+Z24R6bgs8R8l6ZBr
	kTgvSVQrXYdpJ3H8aDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOkoz-005ffz-2i;
	Sat, 13 Jan 2024 20:41:37 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOkov-005feY-2C
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 20:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705178494; x=1736714494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9huzpE1di9IOGQ1NV6QRQVDnPfRGatTVLcIU4u648M=;
  b=lbwEYRXjkfDXjNtE0ZlYXnl5R2Pk2Hr9FUnxZfb5eoCbidRySO99M0iU
   /C2AY33jt//0nAF1HKQQ8E+4uqENGTcUggGi7peJ0dxTgnDkUA0iWs32+
   v9P6Iwt1nnUNOyiT+XR3pnTUp1o1MOHnjB1+40booS5atInS/SEAHwkfk
   zq3WACRSJgibEbnW5y9qV14IOgP168cxtH1s7fnpWaV0KrnJZUWYdC3sy
   +LD7ccF7SYta6uGc0hRz++6u40lJF9MUYMsLbHpqi/kkaXCMtmUJVPCaT
   8azhN/3Sb6Sz11nc0JkQ443ojGuq3s3MpzWysP39z7kIjJPfuDIum0teV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6763320"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6763320"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 12:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="786705813"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="786705813"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2024 12:41:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOkoj-000At4-1k;
	Sat, 13 Jan 2024 20:41:21 +0000
Date: Sun, 14 Jan 2024 04:40:55 +0800
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
Subject: Re: [PATCH v4 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing
 port pins P19 to P28
Message-ID: <202401140457.dWlCUkuN-lkp@intel.com>
References: <20240112142621.13525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112142621.13525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_124133_806614_FE4923B3 
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

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[cannot apply to geert-renesas-devel/next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/pinctrl-renesas-rzg2l-Improve-code-for-readability/20240112-222833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20240112142621.13525-4-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v4 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
config: powerpc-randconfig-r081-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140457.dWlCUkuN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140457.dWlCUkuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140457.dWlCUkuN-lkp@intel.com/

All errors (new ones prefixed by >>):

   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:50: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                                                  ^~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1577:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(3, 0x38, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:39: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                              ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1577:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(3, 0x38, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:50: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                                                  ^~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1578:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(2, 0x39, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:39: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                              ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1578:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(2, 0x39, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:50: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                                                  ^~~~~
>> drivers/pinctrl/renesas/pinctrl-rzg2l.c:1579:2: error: anonymous bit-field has negative width (-1)
           RZG2L_GPIO_PORT_PACK(5, 0x3a, RZG2L_MPXED_PIN_FUNCS),
           ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:47: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ^
   include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP_CONST'
                   BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
                   ^
   include/linux/build_bug.h:16:53: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
                                                       ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1579:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(5, 0x3a, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:39: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                              ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1579:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(5, 0x3a, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:50: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                                                  ^~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1580:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(4, 0x3b, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:39: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                              ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1580:2: warning: shift count is negative [-Wshift-count-negative]
           RZG2L_GPIO_PORT_PACK(4, 0x3b, RZG2L_MPXED_PIN_FUNCS),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:39: note: expanded from macro 'RZG2L_GPIO_PORT_PACK'
   #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:64: note: expanded from macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
   #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
                                                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:81:31: note: expanded from macro 'PIN_CFG_PIN_MAP_MASK'
   #define PIN_CFG_PIN_MAP_MASK            GENMASK(35, 28)
                                           ^
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:141:50: note: expanded from macro 'FIELD_PREP_CONST'
                   (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
                                                                  ^~~~~


vim +1579 drivers/pinctrl/renesas/pinctrl-rzg2l.c

c4c4637eb57f2a Lad Prabhakar 2021-07-27  1535  
943be6806bed3f Lad Prabhakar 2024-01-12  1536  static const u64 r9a07g044_gpio_configs[] = {
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1537  	RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1538  	RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1539  	RZG2L_GPIO_PORT_PACK(2, 0x12, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1540  	RZG2L_GPIO_PORT_PACK(2, 0x13, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1541  	RZG2L_GPIO_PORT_PACK(2, 0x14, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1542  	RZG2L_GPIO_PORT_PACK(3, 0x15, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1543  	RZG2L_GPIO_PORT_PACK(2, 0x16, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1544  	RZG2L_GPIO_PORT_PACK(3, 0x17, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1545  	RZG2L_GPIO_PORT_PACK(3, 0x18, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1546  	RZG2L_GPIO_PORT_PACK(2, 0x19, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1547  	RZG2L_GPIO_PORT_PACK(2, 0x1a, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1548  	RZG2L_GPIO_PORT_PACK(2, 0x1b, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1549  	RZG2L_GPIO_PORT_PACK(2, 0x1c, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1550  	RZG2L_GPIO_PORT_PACK(3, 0x1d, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1551  	RZG2L_GPIO_PORT_PACK(2, 0x1e, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1552  	RZG2L_GPIO_PORT_PACK(2, 0x1f, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1553  	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
fcfb63148c241a Biju Das      2021-09-22  1554  	RZG2L_GPIO_PORT_PACK(3, 0x21, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1555  	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1556  	RZG2L_GPIO_PORT_PACK(2, 0x23, RZG2L_MPXED_PIN_FUNCS),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1557  	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1558  	RZG2L_GPIO_PORT_PACK(2, 0x25, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1559  	RZG2L_GPIO_PORT_PACK(2, 0x26, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1560  	RZG2L_GPIO_PORT_PACK(2, 0x27, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1561  	RZG2L_GPIO_PORT_PACK(2, 0x28, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1562  	RZG2L_GPIO_PORT_PACK(2, 0x29, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1563  	RZG2L_GPIO_PORT_PACK(2, 0x2a, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1564  	RZG2L_GPIO_PORT_PACK(2, 0x2b, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1565  	RZG2L_GPIO_PORT_PACK(2, 0x2c, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1566  	RZG2L_GPIO_PORT_PACK(2, 0x2d, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1567  	RZG2L_GPIO_PORT_PACK(2, 0x2e, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1568  	RZG2L_GPIO_PORT_PACK(2, 0x2f, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1569  	RZG2L_GPIO_PORT_PACK(2, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1570  	RZG2L_GPIO_PORT_PACK(2, 0x31, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1571  	RZG2L_GPIO_PORT_PACK(2, 0x32, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1572  	RZG2L_GPIO_PORT_PACK(2, 0x33, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1573  	RZG2L_GPIO_PORT_PACK(2, 0x34, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
22972a2d5bc4ba Lad Prabhakar 2021-11-10  1574  	RZG2L_GPIO_PORT_PACK(3, 0x35, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH1)),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1575  	RZG2L_GPIO_PORT_PACK(2, 0x36, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1576  	RZG2L_GPIO_PORT_PACK(3, 0x37, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1577  	RZG2L_GPIO_PORT_PACK(3, 0x38, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1578  	RZG2L_GPIO_PORT_PACK(2, 0x39, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27 @1579  	RZG2L_GPIO_PORT_PACK(5, 0x3a, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1580  	RZG2L_GPIO_PORT_PACK(4, 0x3b, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1581  	RZG2L_GPIO_PORT_PACK(4, 0x3c, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1582  	RZG2L_GPIO_PORT_PACK(4, 0x3d, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1583  	RZG2L_GPIO_PORT_PACK(4, 0x3e, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1584  	RZG2L_GPIO_PORT_PACK(4, 0x3f, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1585  	RZG2L_GPIO_PORT_PACK(5, 0x40, RZG2L_MPXED_PIN_FUNCS),
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1586  };
c4c4637eb57f2a Lad Prabhakar 2021-07-27  1587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
