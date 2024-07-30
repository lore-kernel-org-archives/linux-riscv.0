Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB6C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUQCB+zTY9Rz42sSMTStkDdKtRKikd8gxQasE7wKB/E=; b=OxODZqyk9O/1zc
	la5HBVJN+VmW8Nv41GtGu2dY9wORU49hIQ0lcJJuxP3Sko1WXyYQq6zCC+SnSMdjlc6OXrcm2Vop/
	r6XGAIbtVXZE+I4MHmI4j2NdQuQe4B/hgRyCXZvWcKSzH8Sdlaa2BChM6twFx5Xm8BF0pIkjZ+636
	3r6SQ80qwTyCZkpXhRPYSW3UWfnGHZSfhfw4v/k0l2JII/m89m68P76c8tZkPOVI/jqcz30njJ5D3
	rbgBVY5NNYFxsF7dIUWETb5jYSjlLqfPFGpEXC4earRWo/d77jTof6pPC8r923gYGfFJoO8hmx+hy
	Kl+Vdha2e3fRXs2/iWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjIb-0000000EYs0-3oIt;
	Tue, 30 Jul 2024 09:37:42 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjIY-0000000EYqh-1coS
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 09:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722332258; x=1753868258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eQ4F1x/lpLxGO5KX65v21lz8EB6jaKNod2yiaHWTOHU=;
  b=cEzvEq5DkQ87r30AgKq3O9OyvCYfdIfc8jruVRYjDKnWi0CsRNr2PBWg
   8bHokSwVDwdVizHWHKJpOvMl3HSIrovK8M+UULfSDasHo0zKlKyceOlvh
   F7RdDy+LJ7ZpalEJKNqtHdRfwVb/r4wGpjkBcuWLGS4WyL5Tg3MhZ2Avk
   a9S5d03HzDN+sVfwMzahj6dNtugYGM0wYZ0sr0dGdGUFMI2tqsspYexvx
   qc5o6FyK6H3mYPa2vR9ATC6pfd/Hm/oH1Ok1by21SkWTEtJdM4Sr+ZG8Q
   6mdceAyLkE0kwTz/eYMSTFKWiCgLMSCfmcuQLoCKJpSrducwjZuInWuJZ
   w==;
X-CSE-ConnectionGUID: JRkOp6MZQviEdkTLnBzLPw==
X-CSE-MsgGUID: scylY1zrSnS6JG91cl1z9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37609130"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="37609130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 02:37:36 -0700
X-CSE-ConnectionGUID: LKz+kXhGS6K4pP63RiYLZQ==
X-CSE-MsgGUID: CH0h1jCyQo+6eb2XHzFn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58605605"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2024 02:37:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYjIQ-000sjU-11;
	Tue, 30 Jul 2024 09:37:30 +0000
Date: Tue, 30 Jul 2024 17:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 3/4] riscv: dts: sophgo: Add mcu device for Milk-V
 Pioneer
Message-ID: <202407301749.K0pFCNLU-lkp@intel.com>
References: <IA1PR20MB4953826DECDCC141A7CDE634BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953826DECDCC141A7CDE634BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_023738_496717_618F47AC 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Inochi,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.11-rc1 next-20240730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-hwmon-Add-Sophgo-SG2042-external-hardware-monitor-support/20240730-160416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/IA1PR20MB4953826DECDCC141A7CDE634BBB02%40IA1PR20MB4953.namprd20.prod.outlook.com
patch subject: [PATCH v8 3/4] riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
config: riscv-randconfig-051-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301749.K0pFCNLU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301749.K0pFCNLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301749.K0pFCNLU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:29.1-6 Label or path i2c1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
