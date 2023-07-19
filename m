Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE39FC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgaJzbWMA6xjD12RDCQfvc1PACVn8ugO1jGAFLFLqxw=; b=fH+YmvPyT0rjsi
	Oi+OLjei08B5/TZrPRT69vhRF5uBvefiF8KCGdz7puUqXPhMHdaBSaiiA6NHwEkiZs1iW449/dxTs
	RI88rZWL5h+AwX+PByNesyBP+Ek8LYjo0FzHSXTlObzfCjv7sdH9q1dKsbofaga4hxuHGpvzHFhap
	zibskfun6hm5OXDsZtBemNILYVB67hdv31zA/D05JoC7QxBDxqBV+i0HD7u8HIwaOBHd6r/shUxBm
	SY4lTf98TcGVFn8OQMcFKI9F/UdxqkJSCwdHCcgkgoHomphIPxKyCCeu4/mdfeK/bKscH/WymAC5E
	502JkNbXtNLEZaBusznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMALX-008C9S-2L;
	Wed, 19 Jul 2023 16:48:15 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMALT-008C7i-05
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:48:12 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346825112"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346825112"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867547426"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 09:48:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMALK-001MwS-2U;
	Wed, 19 Jul 2023 19:48:02 +0300
Date: Wed, 19 Jul 2023 19:48:02 +0300
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
Subject: Re: [PATCH v2 2/4] gpio: sifive: Look up IRQs only once during probe
Message-ID: <ZLgTwiTzykDhCd5w@smile.fi.intel.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719163446.1398961-3-samuel.holland@sifive.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_094811_070612_C269C3B3 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Jul 19, 2023 at 09:34:43AM -0700, Samuel Holland wrote:
> of_irq_count(), or eqivalently platform_irq_count(), simply looks up
> successively-numbered IRQs until that fails. Since this driver needs to
> look up each IRQ anyway to get its virq number, use that existing loop
> to count the IRQs at the same time.

...

> -	ngpio = of_irq_count(node);
> -	if (ngpio > SIFIVE_GPIO_MAX) {
> -		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> -			SIFIVE_GPIO_MAX);
> -		return -ENXIO;

Do we still need this check?

> -	}

...

> +	for (ngpio = 0; ngpio < SIFIVE_GPIO_MAX; ngpio++) {
> +		ret = platform_get_irq_optional(pdev, ngpio);
>  		if (ret < 0)
> -			return ret;
> -		chip->irq_number[i] = ret;
> +			break;
> +		chip->irq_number[ngpio] = ret;
>  	}

If so, here we need something like

	ret = platform_get_irq_optional(pdev, ngpio);
	if (ret > 0) {
		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
			SIFIVE_GPIO_MAX);
		return -ENXIO;
	}

Otherwise you need to mention this relaxation in the commit message.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
