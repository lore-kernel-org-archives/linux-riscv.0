Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D11C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/5oXrLG3DcFdmg6OhsSWOHUpfkJpx0Qn1reQhMiZ4g=; b=2qji/Ov3M9dfcx
	Zf3Lt4cthqXBevozKoWdEUwjHkdQP4zs9+puNFKY+FvPuclLii9EjPi3aogOyyTzC8YRDGe9OAprS
	VO4FG4M2vEIMCbu3p39td32cfoQgd1kiUfQrYCwm3RdKyTx2z5dUxkkKXarSS+NM4trmql/PKO/Qa
	hJdnwFRdqg4xE9gNgXotcrrXv77ovPQSgvEnWb1FSebSKWsgFcIfmY3XdVJT2UNSAZi2fm4o3TF/N
	B8WvMdkC49kuPVu1DDYpT5z8YUMD6uZSfDhwcN/bvbzf9XoESMkkLwYF2RjpAJSH7wUCs4S4jRNCN
	ZAKp/h2XyUaqkKcJyERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhQ3O-0000000HLCD-1MZk;
	Sun, 18 Jan 2026 10:30:42 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhQ3L-0000000HLBF-2nDx
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 10:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768732240; x=1800268240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lE0Idn8pkia/IapT6Q2BfKM2ThtZ58Etwt09O7KpUGQ=;
  b=ldT9XnKwiZcCMyux3g+4LS/1gVtSZoK4iyUSMfHOgkynQabJ1CTZ1PsQ
   r2ydLmnGEnaRaktLEwUT4yjQg3nKdN+/YamqZ576tQpFC5o4CR5Qf3Ff0
   zRDbNKUi1ZkiCgMoFiizqP3p+AWkdNs+2O1hmhdwYy6SPToK0YmOYWNHr
   EZffo91bjet9Fi4cjfM7a11FDKU95xobKXy41I5/wnVlVJbAQpq5Hh9dE
   Y04YluzqT1hoclsTK04H9ZUSrk0IKkmL735Vxz4HsuSdtW5iPSnzawaQa
   TUSFYVWp6QqEUbdGHrRIBwy0ABLpKOQ+l0th2Q3gRwvsnHBfafcIBSlS8
   g==;
X-CSE-ConnectionGUID: Hx68rRioQte6so6Y2ETfdg==
X-CSE-MsgGUID: pK2N7tU+TyWqYV1nj/JpmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73604346"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73604346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 02:30:38 -0800
X-CSE-ConnectionGUID: BalDwksESQiH5w6LbxBSSg==
X-CSE-MsgGUID: njV5JZY2SqK9zLzqw9duhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205412261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2026 02:30:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhQ3D-00000000Msq-0IKI;
	Sun, 18 Jan 2026 10:30:31 +0000
Date: Sun, 18 Jan 2026 18:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <202601181833.qtNEcTd8-lkp@intel.com>
References: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_023039_766821_A9D96899 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi Anton,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7a52965b6976c936f413eebeee3f78c6faf09012]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-D-Stavinskii/dt-bindings-sound-sophgo-add-CV1800B-I2S-TDM-controller-binding/20260118-042514
base:   7a52965b6976c936f413eebeee3f78c6faf09012
patch link:    https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-2-d10055f68368%40gmail.com
patch subject: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller driver
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601181833.qtNEcTd8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181833.qtNEcTd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181833.qtNEcTd8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
