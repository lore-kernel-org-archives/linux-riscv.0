Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECECCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUv4o06d1p/UcyeoR1DOOlZcf+H/3DCzlUbuBXjThpQ=; b=LMVULiU6SKnZ5R
	RB6MTmWfQ3K9zqX2/SSN2AsWhhUqLlsrhc0owphuyrsXQQkXI2qKKobi95f1I7aiwnrHDK7+VRbqT
	IqQezK0tJM86yJxwxYgRM7eopLALAJpLooSagZ85lD8MLlrEmXw3hhm3TSov5SQHDM55O1ravuSb1
	DX6ACeSifG4d9/mUDMBqxGRkD2tCbqfzZzn/M5WFcVejwQ/ubqu8eY22gcrFDQAIsA5fN+TF7yhFH
	3sSOGqdbv3WmiHdjW/+PngXTWGfIrGbI2W6ld2gZGhvjuc532Y2yL0jooh8dltzsAIl/Ueuj1Wvbg
	/g4Ez/kWBgvKCkx/W9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpDB-00000005Mdc-2bOh;
	Wed, 30 Sep 2026 07:58:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpD8-00000005Mce-3YnZ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 07:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790755123; x=1822291123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f5XnbmNpSItuDv08U93jqOAN6TUi6Fmhs7xYs2DVQg0=;
  b=ZYUzAAroenBtabXmXGony3RIqyim/xKcnXFfaIWYTLG2z2Uu+R0UV/mN
   4LvC7enZ3M3ijkUj+bt+ffRa6NPnlLMXCq8DMj/yoTiu7+74lIEuoeoLM
   XjIYvexHkkGH814ZRCt0UzJckE8fN1bwQAFZNEKDUTAkzY3qg5nuVqbjj
   kZPvrRC4w/blNDSQItqAD1Q3gAMw0zimRkOc1dbssg8/VXsy6Q//1HAqr
   sIRguhRlgntJ1oG0QCmOPyfLFSBiv1Iae4Qn3C2/eLxw6VHaCiL+EgICv
   WbJeqmEGvfWDotDunEjOIvTCcHp7felNYi3KMOqEwUtS2JRp4eyn19Wol
   A==;
X-CSE-ConnectionGUID: pfF1FT0kTv+n3gkccigOHg==
X-CSE-MsgGUID: uNym/DLoQqmWXGEhEaufcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107872869"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107872869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:58:42 -0700
X-CSE-ConnectionGUID: hkX2u+h8SLybJRwjvsMdQg==
X-CSE-MsgGUID: AFt/ReHoRgq1jGAARcXIYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275760395"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:58:34 -0700
Date: Wed, 30 Sep 2026 10:58:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 3/6] PCI: spacemit-k1: Add device id update helper
Message-ID: <arzBKCur7DOjRjVr@ashevche-desk.local>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929083755.458238-4-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_005842_921892_9B008900 
X-CRM114-Status: UNSURE (   7.00  )
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

On Tue, Sep 29, 2026 at 04:37:49PM +0800, Inochi Amaoto wrote:
> Both K1 and K3 need to set vendor id and device id, add a helper function
> to simplify this.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
