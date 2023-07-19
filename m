Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471CC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSaNavlvF77abRM7e8jOkzjcN4Zf3y7L4qAcr8QTX68=; b=u+PTxP/iP6JwCM
	8e7XiVIlUSW8XnqokBaoXJmaWO3lrvzNnlr6nbo+SXdheEafUnpX5Ph4g/9by8wfb9ylVbidiccUs
	cUwR0y8/wb4WmosRdPCXabdtXNGnd3W5MoKZj/GJnKVbYKycDQ4K9uN8G9FAFKckzMBVPAi+LRe8X
	r6iIE662wqBGQCvDaj/5c1siF0tmZFtk8nC0+VtyHJAG1S6V1von3d4eqMidH40n+mvv3YNuQK4bf
	i9qtXEzORAff7Gfk1rzovL0OW3liP/3sEIabTlQH870xH8ezSsFAemn4rgnoguipo6kR4Zv32MiKK
	OlKmrVJVNa28UYfDUGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMARb-008DdZ-1a;
	Wed, 19 Jul 2023 16:54:31 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMARY-008DcU-2C
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:54:29 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430289383"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430289383"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789481190"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789481190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 09:54:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMARS-001aWY-2H;
	Wed, 19 Jul 2023 19:54:22 +0300
Date: Wed, 19 Jul 2023 19:54:22 +0300
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
Message-ID: <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719163446.1398961-4-samuel.holland@sifive.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_095428_773119_4E3441E8 
X-CRM114-Status: GOOD (  11.41  )
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

On Wed, Jul 19, 2023 at 09:34:44AM -0700, Samuel Holland wrote:
> Do not parse the devicetree again when the data is already available
> from the IRQ subsystem. This follows the example of the ThunderX and
> X-Gene GPIO drivers. The ngpio check is needed to avoid a possible
> out-of-bounds read.

...

> -	girq->parent_domain = parent;
> +	girq->parent_domain = irq_get_irq_data(chip->irq_number[0])->domain;

For the sake of readability I would like to leave parent variable
and assign it beforehand somewhere upper in the code.

Also, can irq_get_irq_data() return NULL? Needs a comment on top
of that assignment or an additional check.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
