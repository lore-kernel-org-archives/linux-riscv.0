Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03278C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dITqz7mR1gFmOsypeI0UnQDlHx8b9WALJQ07vD6Mf/8=; b=j2uz3/b5/EUXVv
	gLPb1Xu3mUB/SJBBBgNWxgk1C6TL/g/t8hvcSQbAJp2CYL9wH12AIUX1wjbe13rZkx2QYL4nEFdbd
	m7DkrChvE8juw1os+MUowvvH32CEdJmBW1LzDc3lMmE9v4qnrPN2obhy2nrZcGIYkjK55zwYMVnv0
	SVl0yUcL/minpxPAzP5Qq1IknC7jUT/KANZeeclAXpYpYnmDnHFXFLjeTJAa/3ZyOslQ7T3Z/URsY
	SDIx3GGJZE/tPbqUWpwleIJW4XmQp2wPxTiMlSWWEwbwKL3zggLagoBZyzIPszTXpx6Yfrqi/ILri
	GKRU0Z7p0h1hbNtCZBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUUb-00000000Kcn-2oyl;
	Sun, 18 Jan 2026 15:15:05 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUUY-00000000KcI-39Ob
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 15:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768749303; x=1800285303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wd0hxPRgTFjESBflv8yPBw6SVFbTZYXiBUpxr4B3BTs=;
  b=fgvaO/25bF28Gf1slDX6xf0Kbkgqlzvl8k2BnA5h03POl0ODtomN3gwS
   kmGAFOO8uU0iray6QQKt6yOk2xjMpM3ysXmj4JzZTgdIAffIBvYtBJlfs
   MFFlGvhBV78pGtL/YLG0N82TdlgE0txLch6GV5ygpD4Hy64ot6RkScXwd
   0dxYmZw3wFkDzFtL2m5Q2MNgpFViw+xY7cUfPIZcJvzFLm5GqLwsNRT7P
   tN/8qg2k96GA6MJS1jSjGimmaLhKwuWW0oagQFMYCC8oLof/cJkATfQhq
   FnqSqFv5H+OmMShc+yswvqdyPgqJNdVLrflbU14j9lqNp12qis0Mxu8+Q
   g==;
X-CSE-ConnectionGUID: fB2RYryyQtOFr+A0a/QCwg==
X-CSE-MsgGUID: cUhW4hTCQqGDM94XX4X8mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81425920"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="81425920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 07:15:02 -0800
X-CSE-ConnectionGUID: Jv9U4AjLSb+BqYTyvHnzSw==
X-CSE-MsgGUID: z9icjzhyTjes6I3HWeq40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="205270596"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jan 2026 07:14:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhUUQ-00000000N24-3wfI;
	Sun, 18 Jan 2026 15:14:54 +0000
Date: Sun, 18 Jan 2026 23:14:52 +0800
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
Subject: Re: [PATCH v2 4/7] ASoC: sophgo: add CV1800B internal ADC codec
 driver
Message-ID: <202601182222.84y7fGks-lkp@intel.com>
References: <20260118-cv1800b-i2s-driver-v2-4-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-4-d10055f68368@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_071502_961446_A6D3063F 
X-CRM114-Status: UNSURE (   9.24  )
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
patch link:    https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-4-d10055f68368%40gmail.com
patch subject: [PATCH v2 4/7] ASoC: sophgo: add CV1800B internal ADC codec driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601182222.84y7fGks-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182222.84y7fGks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182222.84y7fGks-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-tdm.ko] undefined!
>> ERROR: modpost: "__udivdi3" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!
>> ERROR: modpost: "__divdi3" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
