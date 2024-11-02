Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F3E67802
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=av4gDuZ7TNOl7yEsGsZ8qOwm9kxEEhoDkmJS/D8tKg4=; b=yCcsfoMLkJh+wR
	LZRF30xFcFs4TI1riOUesauugyv7FcfgSsI4qaA3j1QpTni3+CAJMnMqqZBHhny8X1SyVVKQOJ22e
	gt+DtV21mdNN1JbcaP5GpUWh3YyNm9faSSc4WrxEhE0LqlQxOBjzGKtvTFRPsWIofEc2XijpQgJ8O
	yZI+J2U/+9XfVK/hIVlhjxqrXYycnMcyyyqYh2mL6Gi3YYJ0TBAphnsMT/mEu7kdnXaar9PoyBBpF
	9iYP8ielN6ZaGjh+vstVbGLJdP1zDcRTB8wn+BXkNH8znzgo6Ih4ihV+j23j6HouaLhpfoIyRRMn9
	JU7914roIx9OghjBenbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7G3X-00000009x5s-24NO;
	Sat, 02 Nov 2024 15:28:51 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7G3T-00000009x5D-1h6o
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 15:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730561327; x=1762097327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zAUFqbRnx3QrIZL0lXYiEoGKtF5VPcXttxczM7SZY6c=;
  b=Zzhs1+t3DPDDIk4C2X7UmpgKhi1/1ePiS/wTBw7vJZTeKVSvvvWYGRlu
   YmYsb2ejqEWoiKc5WejAC+xY2sizixPv55fTPiR5GRoqXbtz/Eq0FReIz
   rQWO7y/4ByXo21Pa4/XzPKT3Nupo1e8HBrE6fewAyOt8fXY5bGhJ3BF9Z
   8Bxl7b4SigA1StWn9ImA2x6uFsCN04MjFYbtsDL336m3kDmVnd41+Mpzc
   lcHJLMWH0zehqa5TjxZ6GLFevTnx6JzDmVLP+gIbCESDABL9Y9gdjZvww
   Ulk1PfQQz+1uKgy+wKB34i2PVPzVQ+E4yswEZge7T1zcePcKez/LLYiQT
   w==;
X-CSE-ConnectionGUID: 3/yKK+EGQJiAjJDjfz+bKg==
X-CSE-MsgGUID: UESXjV9ySKeJUQuvLqWKYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30411885"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="30411885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 08:28:45 -0700
X-CSE-ConnectionGUID: B6v/LPEhTo64evpmnST69g==
X-CSE-MsgGUID: jRQcgbeoT7+OwZQGIUT5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83685863"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2024 08:28:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7G3L-000j6H-1q;
	Sat, 02 Nov 2024 15:28:39 +0000
Date: Sat, 2 Nov 2024 23:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 10/11] riscv: mm: Use physical memory aliases to apply
 PMAs
Message-ID: <202411022337.JHozQieV-lkp@intel.com>
References: <20241102000843.1301099-11-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241102000843.1301099-11-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_082847_545304_C4FD41A6 
X-CRM114-Status: UNSURE (   9.91  )
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

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/dt-bindings-riscv-Describe-physical-memory-regions/20241102-081311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241102000843.1301099-11-samuel.holland%40sifive.com
patch subject: [PATCH 10/11] riscv: mm: Use physical memory aliases to apply PMAs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20241102/202411022337.JHozQieV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022337.JHozQieV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022337.JHozQieV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "riscv_fixup_memory_alias" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
