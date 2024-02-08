Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3124DC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irZvqQK/DPE/OWuWe/v4/dbk/IRhriipAwC9jcBFL6Q=; b=A9HcVX8paLmfiZ
	jnsYvcz9oRj/fH0Hn8abDI2irvz+XhQND2haEfoeNHbK9StQV8PudjRloy5eYj7G8Dn+Hg0f9ZlOd
	YhNHWqcx41wKFNohy27rGiigXAcwqG9PSGQX2l+IyY+NeV0l8db/B+oeptR/W3sq/B8r3SddQYmmk
	yIq/bLMUhaa5I5qVdfKFs90FLah46B+tFt9l/KVgKUw5Bb9T4MLCE7VGkXmqfFXjJGcdBwbx0zxQ5
	SA5uANyH6UukSlU1nFPHSZXOM3+kOpJo/eE9ODD4yKIqFA6EIkCl5DAXJL9DI/URJcbxrK92MB7XJ
	AkrTR+oL8UOiFV0kz4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXuXc-0000000CUlK-377X;
	Thu, 08 Feb 2024 02:53:32 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXuXZ-0000000CUku-3pDB
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 02:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707360810; x=1738896810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8d5u8+rfIRiZiS6FEisYDE0pgKqtyMux9OL0xOE4cI=;
  b=D6+Y62phUStizYdTcg0LLjBx0MFsIY9NjqoXas4Znp3aD/09q8AJ9fIv
   hzIdGolYwe8/dhPJMgau/EbRcOe9TPnzxzdiRwZm1yCJgpFQpgswxMrm2
   mbMZKoXXNhf+m/p1vKZWVi2SeBOZgKVbaK0E/wTKZSkqcVzfNT+/9LXky
   01U96lAKjzgy1CLv2X07GPZbMgmpwjKddFbETvsMn9dC721341mawCKln
   bzrahkwE37u4G4ykYkSjZ7UzJFHq03OOH07ik6zycbgtWj/U6WnVEUdhH
   O58yqR7jEzWk6hgyowVf7et8sGU7p9BQjqaFMNUiExGCcK/S0x6T3wZdP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11867495"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11867495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 18:53:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="24776293"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2024 18:53:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXuXQ-0003Hg-1q;
	Thu, 08 Feb 2024 02:53:20 +0000
Date: Thu, 8 Feb 2024 10:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: Re: [PATCH v1 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <202402081059.e1PYAFcY-lkp@intel.com>
References: <20240207060913.672554-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207060913.672554-1-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_185329_992254_73F5DC68 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Jingbao,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7afc0e7f681e6efd6b826f003fc14c17b5093643]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbao-Qiu/dt-bindings-pwm-sophgo-add-pwm-for-Sophgo-CV1800-series-SoC/20240207-141135
base:   7afc0e7f681e6efd6b826f003fc14c17b5093643
patch link:    https://lore.kernel.org/r/20240207060913.672554-1-qiujingbao.dlmu%40gmail.com
patch subject: [PATCH v1 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402081059.e1PYAFcY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081059.e1PYAFcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081059.e1PYAFcY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-cv1800.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-cv1800.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-cv1800.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/pwm/pwm-cv1800.c:131:3: warning: comparison of distinct pointer types ('typeof ((tem)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     131 |                 do_div(tem, rate);
         |                 ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-cv1800.c:131:3: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     131 |                 do_div(tem, rate);
         |                 ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/pwm/pwm-cv1800.c:135:3: warning: comparison of distinct pointer types ('typeof ((tem)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     135 |                 do_div(tem, hlperiod_val);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/pwm/pwm-cv1800.c:135:3: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     135 |                 do_div(tem, hlperiod_val);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/pwm/pwm-cv1800.c:131:3: warning: shift count >= width of type [-Wshift-count-overflow]
     131 |                 do_div(tem, rate);
         |                 ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pwm/pwm-cv1800.c:135:3: warning: shift count >= width of type [-Wshift-count-overflow]
     135 |                 do_div(tem, hlperiod_val);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   10 warnings and 2 errors generated.


vim +131 drivers/pwm/pwm-cv1800.c

   113	
   114	static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
   115					 struct pwm_state *state)
   116	{
   117		struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
   118		u32 period_val, hlperiod_val, tem;
   119		u64 rate;
   120		u64 period_ns = 0;
   121		u64 duty_ns = 0;
   122		u32 enable = 0;
   123	
   124		regmap_read(priv->map, PERIOD(pwm->hwpwm), &period_val);
   125		regmap_read(priv->map, HLPERIOD(pwm->hwpwm), &hlperiod_val);
   126	
   127		if (period_val != PERIOD_RESET || hlperiod_val != HLPERIOD_RESET) {
   128			rate = (u64)clk_get_rate(priv->clk);
   129	
   130			tem = NSEC_PER_SEC * period_val;
 > 131			do_div(tem, rate);
   132			period_ns = tem;
   133	
   134			tem = period_val * period_ns;
   135			do_div(tem, hlperiod_val);
   136			duty_ns = tem;
   137	
   138			regmap_read(priv->map, PWMSTART, &enable);
   139			enable >>= pwm->hwpwm;
   140		}
   141	
   142		state->period = period_ns;
   143		state->duty_cycle = duty_ns;
   144		state->enabled = enable;
   145	
   146		return 0;
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
