Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477CEC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/riwr3DAD9otenKqG2lWr82Uk2ZT+XnpOruoHCJIEog=; b=cBtEpq0LAP5NLY
	IILNxrai1BYLB9Bd2+2xFmAO9M0ew6s7TPZ96bZXLO5i6J9Z3nxNQey586VGQc+BfGGqCXgCH2hxy
	iojz31SUhL4HWul/zCqZGB+xrOLaET0p6T56HvMLaibySqMf+YQyBFCQsAHkC1U4SzS3O3TuqItPS
	wZKeKJ6oo7IpplhVnwifQzgv/nIRfNvg9IJwBNAhxYHd5qbWHqsOPJ2LmmS1x3LjtI+vdvqCgcn/g
	pxBgMSmmIGpEhWKEdy/6exazOnh8zmnBw9rBoE7AdgeMRgli12e44hV/KBQOa2yaD9TAw6CI9uG2K
	dH5gMl0b6E+3QKah4p+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAra-008JnX-0G;
	Wed, 19 Jul 2023 17:21:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMArW-008Jlx-3A
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:21:20 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351395025"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="351395025"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794128236"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="794128236"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 10:21:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMArQ-002Uz0-1V;
	Wed, 19 Jul 2023 20:21:12 +0300
Date: Wed, 19 Jul 2023 20:21:12 +0300
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
Subject: Re: [PATCH v2 3/4] gpio: sifive: Get the parent IRQ's domain from
 its irq_data
Message-ID: <ZLgbiIMVqYoe/OcN@smile.fi.intel.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-4-samuel.holland@sifive.com>
 <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
 <a3c4f1c6-444b-b3a2-c952-bdd5b0463f95@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3c4f1c6-444b-b3a2-c952-bdd5b0463f95@sifive.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_102119_161128_9DD5D78C 
X-CRM114-Status: GOOD (  15.01  )
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

On Wed, Jul 19, 2023 at 12:03:46PM -0500, Samuel Holland wrote:
> On 2023-07-19 11:54 AM, Andy Shevchenko wrote:
> > On Wed, Jul 19, 2023 at 09:34:44AM -0700, Samuel Holland wrote:

...

> > Also, can irq_get_irq_data() return NULL? Needs a comment on top
> > of that assignment or an additional check.
> 
> No, the earlier loop already verified the IRQ number was valid. I don't think it
> can later become invalid. In any case, we already dereference the result of
> irq_get_irq_data(irq_number[foo]) in sifive_gpio_child_to_parent_hwirq().

Thanks for explanation, just add a comment.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
