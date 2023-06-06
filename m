Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D4C7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KspS9xNT6qMzOrrcyl/onZTvlJlLIcesmJjOjL0oaE=; b=HPzDBNNiEMaWOF
	06ePfo10VJTRxHvYXsaHfKEaLf5xF8RgQOXFHGvBcSLXkuYEjjje6ROmV7XWZxqI6PDuCTfthnRK3
	XeA7ywgFHcSPvEjLJdkkjNgSjBcBEKSR5mwma7D40lCgLVJYMh1UGK65BUNvf5LC+aIcr2CJbjVxN
	SEIf8CjzxoUisK+XFwlAzhv8GzZb6rP6WvO3On31YEzUAjtyO5hPrAN2TO9+CDEtsrSFjRayhEEjx
	daTpG8l4resd5EwI6OPMvObBZOExMJJsxXgSA6VBfjT+o8L601iWn+AWqxKFOtCHPZNkmIOLp4wuR
	ViV+qL6g0lPqLuRHk6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TH1-0014Oy-1J;
	Tue, 06 Jun 2023 09:46:43 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TGy-0014NO-2E
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 09:46:42 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 074bd606-044f-11ee-b3cf-005056bd6ce9;
	Tue, 06 Jun 2023 12:46:37 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Tue, 6 Jun 2023 12:46:36 +0300
To: andy.shevchenko@gmail.com
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Message-ID: <ZH8AfLRa2ShXKm4M@surfacebook>
References: <20230606031841.38665-1-jiasheng@iscas.ac.cn>
 <ZH78McKA5nKU1Wg8@surfacebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZH78McKA5nKU1Wg8@surfacebook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_024640_888334_E8486FD8 
X-CRM114-Status: GOOD (  13.09  )
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

Tue, Jun 06, 2023 at 12:28:17PM +0300, andy.shevchenko@gmail.com kirjoitti:
> Tue, Jun 06, 2023 at 11:18:41AM +0800, Jiasheng Jiang kirjoitti:
> 
> Is this v4?
> 
> > Add the missing check for platform_get_irq() and return error
> > if it fails.
> > The returned error code will be dealed with in
> > module_platform_driver(ath79_gpio_driver) and the driver will not
> > be registered.
> 
> No, this functional change and has not to be for the fixes unless _this_ is the
> regression you are fixing. Did the driver work before at some point as after
> this change?

To be more clear, answer to the following questions:
1) does driver work with wrong DT configuration?
2a) if yes, does it make sense, i.e. the hardware functioning usefully?
2b) if yes, can we guarantee there are no broken configurations in the wild?

Depending on the answers correct your code and/or commit message.

> Otherwise you have to _justify_ that this functional change won't break
> existing setups (with broked IRQ in Device Tree, for example).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
