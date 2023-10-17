Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A65CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BuDDSZb7KBKpchVVIDQZbqZzftWs9TZb02RWSHiN1I=; b=ezxxw+nXzmI3f9
	mvbA8Jo6H5WmA2QKPpTauDHmr3znORv3ZlnuJ/H1OwyQTm/hlhb8cu4PO7wB0xKnNCurnoabBtwVy
	E4NXOPT5FElH7wjq4tamaBVL6LfZkDFoGJNGE4Zhwm63+gMqjmik7mgK9/2LhuCDhacxQQIdjGztZ
	2wRsRKJZnkRTxuCvyRT39fc0ySwAzKDmh5fcCBrJ5kjgf7EFnjU27Lh5G/qyjJ5d+k71DyGKk2Ig8
	hMLWEGWT72gY19SdlkjgSeSRZyjLWAFdS3UG3NmgMF1PA9vjyFHExBOKUvmmORKF0lQ+pW2UDXs0Y
	HcilMTfyCFsllZxvIcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmEZ-00Clsy-2S;
	Tue, 17 Oct 2023 15:43:51 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmEU-00ClsP-1J
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 15:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697557426; x=1729093426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zgnkPb30qFQTZnkkw9rToLJvEbV50eWvdkwGa4jPW4=;
  b=OETfWsRfyWGMlADt8dChcL0AEXnQQ5ee7EIeTwQfkTgfaO7SLQTHR6GH
   6KpgQ3+qcsz95RAt8mFyms38R9pv38Mjq5J+rhB6Xi+VlpG5mmhf+FNAY
   9Zdjj2GjBCcNTAepxMLUT4NVeWmtQ+J02hJETTVPhqjD40rhUPmh4fmju
   jfa7ambU09dZi0evHItuYUNEELha4oFkki8lMY/fmIoKesb5IxHcpzDFU
   U8nLJGUn5+DpBe31fI+JGswB19vrp5xe/LXXnfQ6MBSSsGaw5ZIX4ghg6
   Y/QvWg1QxDbopDcVdqc6h8vWNh/8eJuwCJ0FvBKQZGCPcz0O8x4kvTXOq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388671425"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="388671425"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 08:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929809702"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="929809702"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 08:43:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmEL-0009kp-0l;
	Tue, 17 Oct 2023 15:43:37 +0000
Date: Tue, 17 Oct 2023 23:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
Message-ID: <202310172321.wccxqLkr-lkp@intel.com>
References: <20231017104638.201260-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017104638.201260-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_084346_577764_161A0771 
X-CRM114-Status: GOOD (  13.31  )
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

[auto build test WARNING on next-20231017]
[cannot apply to geert-renesas-drivers/renesas-pinctrl geert-renesas-devel/next linusw-pinctrl/devel linusw-pinctrl/for-next v6.6-rc6 v6.6-rc5 v6.6-rc4 linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/pinctrl-renesas-rzg2l-Include-pinmap-in-RZG2L_GPIO_PORT_PACK-macro/20231017-184850
base:   next-20231017
patch link:    https://lore.kernel.org/r/20231017104638.201260-2-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK() macro
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172321.wccxqLkr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172321.wccxqLkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172321.wccxqLkr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from drivers/pinctrl/renesas/pinctrl-rzg2l.c:8:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_set_mux':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:292:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     292 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_validate_gpio_pin':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:544:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     544 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:551:20: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     551 |         if (off != RZG2L_PIN_CFG_TO_PORT_OFFSET(data))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_pinconf_get':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:757:15: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     757 |         off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:759:25: note: in expansion of macro 'RZG2L_SINGLE_PIN'
     759 |         if (*pin_data & RZG2L_SINGLE_PIN) {
         |                         ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_pinconf_set':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:855:15: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     855 |         off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:857:25: note: in expansion of macro 'RZG2L_SINGLE_PIN'
     857 |         if (*pin_data & RZG2L_SINGLE_PIN) {
         |                         ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_gpio_request':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1050:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1050 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_gpio_set_direction':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1082:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1082 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_gpio_get_direction':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1103:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1103 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_gpio_set':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1134:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1134 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_gpio_get':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:99:58: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      99 | #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)       ((cfg) & RZG2L_SINGLE_PIN ? \
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1167:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1167 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: At top level:
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1360:26: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1360 |                 { "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
         |                          ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1362:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1362 |                 { "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
         |                                ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1364:26: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1364 |                 { "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
         |                          ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1366:33: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1366 |                 { "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
         |                                 ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1367:33: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1367 |                 { "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x4, 1, PIN_CFG_IEN) },
         |                                 ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1368:30: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1368 |                 { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x6, 0,
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1370:30: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1370 |                 { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1372:31: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1372 |                 { "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x6, 2,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1374:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1374 |                 { "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x7, 0,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1376:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1376 |                 { "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x7, 1,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1378:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1378 |                 { "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x7, 2,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1380:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1380 |                 { "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x7, 3,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1382:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1382 |                 { "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x7, 4,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1384:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1384 |                 { "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x7, 5,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)
         |                                         ^~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:94:42: note: in expansion of macro 'RZG2L_SINGLE_PIN'
      94 | #define RZG2L_SINGLE_PIN_PACK(p, b, f)  (RZG2L_SINGLE_PIN | \
         |                                          ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1386:32: note: in expansion of macro 'RZG2L_SINGLE_PIN_PACK'
    1386 |                 { "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x7, 6,
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:93:41: note: in expansion of macro 'BIT'
      93 | #define RZG2L_SINGLE_PIN                BIT(63)


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
