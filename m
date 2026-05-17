Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1946FCD4F25
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33Rt2SvI0EN645FgcjOmAAghYH8/vX2yu4K3m98r6ZQ=; b=pfasgtWN1lv02b
	Tbyo6QTMS7EqqtPTfaDEHcWdY8Uw5T9rGAf1PBLa2pYoltQqRJTaHj7lH61gFTlBEU7PQX4JEHGi7
	/jZj9yNIiwqBDVgeofuZN/t6OPlrj0tkEp81zBLn8xL6Y3W7N2fpfnQNo4OUc9kQwsT5Lox8tMyXH
	YDVi9ErpMyB5gWNcz9aBQadAsKLq6j89ttvlloGJEofTk9NO2EsuJlGlJVZfmd7cuYP7VMpolJjjv
	pSaz9rTnyWUlBpVFd8uFBUF/s5x/5TV7IqOLdXhLJOFfJN/iURRXugYl8gBc9e7keIoyQo01lqIr5
	IXSZ4y8pYjZPo3AuIKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWZP-0000000CLkv-0SIv;
	Sun, 17 May 2026 08:09:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWZM-0000000CLc6-0SXe
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 08:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779005392; x=1810541392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q4n6M7y1hdiajGaA5S3Dv718bzU2NlS/k4sv46Jo9PE=;
  b=CGFdBMhs3DfTJuqGqB/Y7VaG0ewfIPh5YQbmB9HVhYeoLpRkflERdN3e
   0bg/qMTt0raOsTMa5Ca0VEVuUHGZWK5JhGUc8H0Tw++no6mpB5GrKzmPt
   Cjqw8PtHco7KbEmwhyqK/4SkG52YmvqposhLY7IHxruOzYEvP3KKT6Mbk
   vtsekrh3dPLns7Zjm+hxAGEOb4+iquvcNPAtdWmicaeXXtVPNNkJWw5oI
   /DiBa5pIy8q6XOH1gfQHTpoBuduwrWkNOVakN65kQkHyPgBjlx1o+RHbB
   +XcydQJqy/PvJG5uRWELFWCHCOzZFHtL5F/Pp6PJ7N/oAq41KvaJ5LOhi
   A==;
X-CSE-ConnectionGUID: zrbD4OiZSJ6omVvIAV4vSA==
X-CSE-MsgGUID: AmkzJqqpQbe2ORREsHZ2xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90996052"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90996052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:07:49 -0700
X-CSE-ConnectionGUID: M99lICK9TzyYIdfFvW7whw==
X-CSE-MsgGUID: jCiv8IbFQ96OYGlLHmFF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="232735120"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:07:42 -0700
Date: Sun, 17 May 2026 11:07:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>, Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <agl3TJrvJMtEpHyl@ashevche-desk.local>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260517014841.254085-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_010952_182282_9F4D7E5C 
X-CRM114-Status: GOOD (  10.08  )
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

On Sun, May 17, 2026 at 09:48:37AM +0800, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 may use multiple PHYs at the
> same time. The feature is not support by the current driver.
> So extend the PHY definition to support multiple PHY handles.

...

> +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);

Hmm... What's the point in having _array(1) ? devm_kmalloc() should suffice.

> +	if (!k1->phy)
> +		return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
