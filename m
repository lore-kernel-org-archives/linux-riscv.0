Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123210F9303
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INgIcFl1QP5hoUBBP9pr5AyHW5KJzBEvd8JWgxfk6bk=; b=u8ytO3aAa73xQp
	sHIa4mZyKB5QBteKIordbfAzRYwRCXptFnlo19zO9mMUD8oUcANr+FZ4h/9kqf4fma3B8Mm2H0P5D
	eq9X2K++YZxo01gxMkPR8Wo2jVdv5Z3TKKL7k7eWCYedrvinOYeCCM5HEVhXW4UyRV+sb+duXT6ON
	sqkKIokFu7iro4G5ajmF1nwnMK0pR0x3HGa634jBgU+8ezuQOSNwNey6uLDL7j7Hv5o6zpiDIIIZK
	TlA/uGDCIeWPAZt5qA1/WnFSsCsRrIlZiwKkipD3rALLXEWgGGnHx4KiEBBhYsIStdBvyrKqszQhJ
	V/rfnomb/kP9v/2xR2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gje-0000000DadV-20F3;
	Tue, 31 Mar 2026 21:34:54 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gjb-0000000DadB-31n3
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 21:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774992891; x=1806528891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wR4QylHcmskmt0KG5ly6sLWoHv46ssVh2JkVA+U+Bk=;
  b=I1ABh8Rym4z1qPaHADWl/xQSgaB/AxBx21xQGZ1C3k8cWw3hFCB0nCE5
   dYLUwwuy8UngkyEQX3OZENmmzCmIyaZYPp6KS4jyNpOqBXivTbiEy8CmV
   kPjQm44VznTJAMaqsVvgV7cHXyPHqgO91a3wOebUTgky5x0NJKa0YHbqt
   O+U1Ry0UtEReNrShVu4Zm7Xt5vNWo8LkpHl6W8++jNK/aMEFXbHquprYa
   v+TeXctZiBX9KMkPNH8GE09+KMr9LhKg4ESs8+93LVIbvS8g06Euo58Dy
   PFB0/N+q/M0xvYvHmL0O4EjlON27CAnrt1LcpVsHTHBzNpXxpohXbBRl0
   g==;
X-CSE-ConnectionGUID: BNJ39rUDRH+as4XhvfVsAQ==
X-CSE-MsgGUID: 4Dj2uw8SQrSR3IRTVBH6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75057562"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75057562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:34:49 -0700
X-CSE-ConnectionGUID: KkhM+YH+RY6ZBfPW8wELwQ==
X-CSE-MsgGUID: Wtm6ipwaSxCfv+Lc/YJdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226353128"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 14:34:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gjT-000000004JB-2AzA;
	Tue, 31 Mar 2026 21:34:43 +0000
Date: Wed, 1 Apr 2026 05:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
Message-ID: <202604010550.sTNDXe0k-lkp@intel.com>
References: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_143451_794902_39BB76C6 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi Yixun,

kernel test robot noticed the following build errors:

[auto build test ERROR on af62a095eb0c3359d477b55ef72d2afd94c83c8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/riscv-dts-spacemit-k3-Add-USB2-0-support/20260331-231732
base:   af62a095eb0c3359d477b55ef72d2afd94c83c8f
patch link:    https://lore.kernel.org/r/20260330-02-k3-usb20-dts-v2-1-46af262fb4a9%40kernel.org
patch subject: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
config: riscv-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010550.sTNDXe0k-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010550.sTNDXe0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010550.sTNDXe0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:446.27-46 Unexpected 'RESET_APMU_USB2_AHB'
   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:447.20-39 Unexpected 'RESET_APMU_USB2_VCC'
   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:448.20-39 Unexpected 'RESET_APMU_USB2_PHY'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
