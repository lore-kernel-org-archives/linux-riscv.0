Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F5C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZdgAPtmrLhdi+hq0OdS/Z7XpI3RTk2DIL5pYAxoXss=; b=zpxdd5o+SU+Wz6
	mSOt7TVH58+3PmDShaL2F2rqvm2kyygLKcj7i3z+4wDUUNvOUGNBxFDLEK1WjXhobrl5jTHsaaZ0T
	CtWPxW1Dm+iplkp/y+0N46sD051tZKqqGf86yW1xnEIJuaiZnDxRgUxUtt98YD8/7CkczsSbMN7No
	PCscHH5I9UgfNtt8koCAzFSdVlTvxlhMD0RNnqL74zyZ47woLMwVsHG6yrzZly9hBCrWyUSHjRulS
	1vUAhTJVRHxIHNcWb43j0YRJWekcEgg/GI2v6Ygqn0PKnnbXWsQc45VYFudJSZ61SbCqg/CaYJ+BE
	0zn3wcFRBEhBWbQojoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTelh-00000002QfQ-1aFB;
	Mon, 23 Jun 2025 10:51:17 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdyi-00000002Gqz-2Ugl
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672841; x=1782208841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTMtIUJNedb6/eZMALNf3FN6/mwEz+7TXNNH0cp9sN8=;
  b=Hjk6/WwciRCFBZY548ssV55WBRA5UcmuqQTqQ/WRdIQOfawhnS6mZqa9
   jsA0yyrS0cfDuq1toNEokfbuXfbCtXmQ+/lu8cf0EmJg3JFd2nJCHV1bl
   fiIjQKZK3m2SZvIR2OhKChLe9rWrH3qMK1yKzAcn35tHVjhkg2Ee4/UDX
   l6pf+rRdRI+9/q5y5ZloFp+J+z8TDdec/AjOKpKmu0EJBfNIL3xRyG2Hn
   TPO58UZ7TLUoOKXxIPW+Jg60lD+aQlXnYz+URAwFRUH9IfUdhCakTzYCk
   n0f2qR6Jxh5iQRHBLuBTsHSASKf7aNI7QumXQ/+S6/CReug+IEN7utumN
   g==;
X-CSE-ConnectionGUID: aNwabBWPQcOqn9yADbNIKg==
X-CSE-MsgGUID: Qp6nqH4fSXCjQb2Mm1nRzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64227990"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64227990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:00:38 -0700
X-CSE-ConnectionGUID: ZaMOk5/DSy+2aurOnchdFw==
X-CSE-MsgGUID: SMkkK3dfSBGn+/0o7nHOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151023777"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 03:00:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdyX-000NvW-0q;
	Mon, 23 Jun 2025 10:00:29 +0000
Date: Mon, 23 Jun 2025 18:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, dlan@gentoo.org,
	wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202506231727.FiPSVMzv-lkp@intel.com>
References: <20250622032941.3768912-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030040_643762_AD9E7169 
X-CRM114-Status: UNSURE (   7.63  )
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d4809e25903ab8e74034c1f23c787fd26d52934]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250622-113200
base:   5d4809e25903ab8e74034c1f23c787fd26d52934
patch link:    https://lore.kernel.org/r/20250622032941.3768912-3-elder%40riscstar.com
patch subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: i386-kismet-CONFIG_MFD_SIMPLE_MFD_I2C-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250623/202506231727.FiPSVMzv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250623/202506231727.FiPSVMzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231727.FiPSVMzv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
