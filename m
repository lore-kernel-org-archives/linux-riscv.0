Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C54CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3o1ZWSPyj9BCEfvYwFt8/JWnnQ/4GNjaFqz2nl/1rk=; b=oiS3GDIBdJ9rxv
	q+xhuWEKXTshetew5oS2zY4PTJ20wy5ndwxwjvSj7330WxcRK70Ryqmm07k+hlcwyyrkTfFfoMx4x
	IRadIj6fvT4n47JFv2/XVCHQJalCUkeCgDN/aKpBqn98D2G8YYSYWwiMztydQsfhBlqh70adM/Ptl
	W8dW9qhMVF64fMD1fTOUoHALPQOf7CEmR6/YrJQIduC8SDWIz6Gx9NWmWjMdrgR/s2qv2/3PLJuP3
	ChSIlvKkz4jpGBEEGAmrQ/Qv2HG9ctv6Jq6Try7mFv/ui3tZ3SJ0Ev0kz7L5LeMkmxHOO4fe6Ll3N
	pBFLoLctLTKnMprHxOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIZ-00000004xtk-3jln;
	Tue, 09 Sep 2025 06:57:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvprc-00000004AOl-3uAg
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 04:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757391712; x=1788927712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2eWVDfOjZ/eUZU18XVmgcF0dNk+tPxSOkUryUdg0+k=;
  b=NRseZ32Ap7zPmbKCewa/x/90E0Q7sVQR0QfKSQHO4UfmhHj8jfZe/ZjG
   mRGb8VTWJhvvwlTbzvyhwA7uUTF9PiPXiP0FL+uHKO5LluNwGPuW4k8kJ
   ZBMrEMe98Nk7TUFTq+UDpOcGSVK4klu9zz3VPOQcN5RNgMS6gKa+yDinC
   FmCr4rRNaj0tJ2qDCzAtU6LefmUHm4R5mDFL6P9IRQhDVBudF4PLTe60S
   uUxLJCbTht+TJzeFu57FvqeSHiwAkBpD0Agll6XxxuQCKNrrepd1QOSOu
   2mqnpKF8ZDcSE48iH8m6bEyhfOyv/hanPPAKNwO3pI8l2qdxYk7+dPl+a
   w==;
X-CSE-ConnectionGUID: ab5Tg4EQTAW8SL2zP9/dJA==
X-CSE-MsgGUID: TlB2yYd1TC63jKASmXsuRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="69920341"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="69920341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 21:21:49 -0700
X-CSE-ConnectionGUID: rCcz4ynoSY2VL8BqXW/FiQ==
X-CSE-MsgGUID: 2PP/FEzCTmSJGEBnXH18aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="196622451"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2025 21:21:44 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvprR-0004Qf-1j;
	Tue, 09 Sep 2025 04:21:41 +0000
Date: Tue, 9 Sep 2025 12:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH net-next v10 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <202509091137.JnioPegN-lkp@intel.com>
References: <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_212153_019776_22DBD9EE 
X-CRM114-Status: UNSURE (   9.72  )
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

Hi Vivian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 062b3e4a1f880f104a8d4b90b767788786aa7b78]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivian-Wang/dt-bindings-net-Add-support-for-SpacemiT-K1/20250908-203917
base:   062b3e4a1f880f104a8d4b90b767788786aa7b78
patch link:    https://lore.kernel.org/r/20250908-net-k1-emac-v10-2-90d807ccd469%40iscas.ac.cn
patch subject: [PATCH net-next v10 2/5] net: spacemit: Add K1 Ethernet MAC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250909/202509091137.JnioPegN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091137.JnioPegN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091137.JnioPegN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'emac_get_stat_tx_dropped',
       inlined from 'emac_get_stats64' at drivers/net/ethernet/spacemit/k1_emac.c:1234:24:
>> drivers/net/ethernet/spacemit/k1_emac.c:1218:24: warning: 'result' is used uninitialized [-Wuninitialized]
    1218 |                 result += READ_ONCE(per_cpu(*priv->stat_tx_dropped, cpu));
         |                        ^~
   drivers/net/ethernet/spacemit/k1_emac.c: In function 'emac_get_stats64':
   drivers/net/ethernet/spacemit/k1_emac.c:1214:13: note: 'result' was declared here
    1214 |         u64 result;
         |             ^~~~~~


vim +/result +1218 drivers/net/ethernet/spacemit/k1_emac.c

  1211	
  1212	static u64 emac_get_stat_tx_dropped(struct emac_priv *priv)
  1213	{
  1214		u64 result;
  1215		int cpu;
  1216	
  1217		for_each_possible_cpu(cpu) {
> 1218			result += READ_ONCE(per_cpu(*priv->stat_tx_dropped, cpu));
  1219		}
  1220	
  1221		return result;
  1222	}
  1223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
