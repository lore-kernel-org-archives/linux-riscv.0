Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F0C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/jWhEMEUo0el54fBna987qgJYBtJpI6MaANu2twRFM=; b=x1DLlJkZkZqGku
	R37PJHevL3fL+oCEWMa1Mn30mD5h6Pci6CfSaNq/OZi10PhUb8ecS5d5s8SSeQ02xYIWTGo0DENe3
	YRsCzXhGiEH3PgWXIyKJIxGC7hS7nfmOnHJUl+JlnfzOJSuTH3IUcE7w+jIIkwv/FT0TOZA/mneDG
	JnDCYIJuH3fnoXdsM0kZf+K+bz0bIP4aI5wDwAEZhQw+tC84TSO4HRi1JusbrxJMDnSyB+N3VGnuC
	KL3CNGNlIMHTevdyEtYXiENZN+1CMeu7E6/5prs4s2jtEYx+L9SihhlNuxBH/p5jx5at6jkDJRewq
	cENQi+WBwP+L3bW+lPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAHv-008BCR-1i;
	Wed, 19 Jul 2023 16:44:31 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAHt-008BBN-1W
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:44:30 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="432707350"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="432707350"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724046056"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="724046056"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 09:44:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMAHk-001EqZ-1u;
	Wed, 19 Jul 2023 19:44:20 +0300
Date: Wed, 19 Jul 2023 19:44:20 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/4] gpio: sifive: Directly use the device's fwnode
Message-ID: <ZLgS5GnUu/g+AmSv@smile.fi.intel.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719163446.1398961-2-samuel.holland@sifive.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_094429_568640_C34BCB62 
X-CRM114-Status: GOOD (  10.19  )
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

On Wed, Jul 19, 2023 at 09:34:42AM -0700, Samuel Holland wrote:
> There is no need to convert dev->of_node back to a fwnode_handle.

...

> -	girq->fwnode = of_node_to_fwnode(node);
> +	girq->fwnode = dev->fwnode;

	dev_fwnode(dev)

...and include property.h here

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
