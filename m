Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A603BC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPyf6HErFBnEL7V9P/Cd7rwyI6vjXpQz4z7mvYxh384=; b=MmgkFyJCG49h/t
	tw1EGDs0JJh+4lGmhVRSFiA8l/CdyewczPH3t5Vzxg5qS8wop/QE/6+GWylgIz0YBqcVy8odsk1qk
	vBdPwHlhBPbFDx/qaAlftzsHIAPIsaPIfwXSvZP5uDcAooOnB6cLo86bpefOdUf7h7pyV0xe+KQ6Y
	CMg6bFEm4wPmiK9b+T/R0YFVHaPOeYx8vDCMUnFiZBwceP+1lv9MSijnQOR/gHeDebTRJu+qKHe8H
	l9/wfNQX2s5drAYgch8GMXudLm1cwyVoiVrFRtg+7hHwcKiE0BNOGdQjgf75b3CL/fxbjY0DqBDE5
	dF5vTJNX8g3VNFCFSSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uTO-006ISj-1k;
	Wed, 07 Jun 2023 14:49:18 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uTK-006IPf-0G
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 14:49:15 +0000
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 7314a8b2-0542-11ee-b3cf-005056bd6ce9;
	Wed, 07 Jun 2023 17:49:05 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 7 Jun 2023 17:49:05 +0300
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: andy.shevchenko@gmail.com, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Message-ID: <ZICY4dTgZZGpiDPY@surfacebook>
References: <20230607070819.48553-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607070819.48553-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_074914_279279_04E171DC 
X-CRM114-Status: GOOD (  25.48  )
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

Wed, Jun 07, 2023 at 03:08:19PM +0800, Jiasheng Jiang kirjoitti:
> On Tue, 6 Jun 2023 17:46:36 +0800 Andy Shevchenko wrote:
> > Tue, Jun 06, 2023 at 12:28:17PM +0300, andy.shevchenko@gmail.com kirjoitti:
> >> Tue, Jun 06, 2023 at 11:18:41AM +0800, Jiasheng Jiang kirjoitti:

...

> >> > Add the missing check for platform_get_irq() and return error
> >> > if it fails.
> >> > The returned error code will be dealed with in
> >> > module_platform_driver(ath79_gpio_driver) and the driver will not
> >> > be registered.
> >> 
> >> No, this functional change and has not to be for the fixes unless _this_ is the
> >> regression you are fixing. Did the driver work before at some point as after
> >> this change?
> 
> I will remove the fixes tag in v4.
> 
> > To be more clear, answer to the following questions:
> > 1) does driver work with wrong DT configuration?
> > 2a) if yes, does it make sense, i.e. the hardware functioning usefully?
> > 2b) if yes, can we guarantee there are no broken configurations in the wild?
> > 
> > Depending on the answers correct your code and/or commit message.

The above is a list of the questions you need to investigate.
(Note, it takes several minutes on elixir.bootlin.com to check
 some of this, but I'm not the author of the code)

> >> Otherwise you have to _justify_ that this functional change won't break
> >> existing setups (with broked IRQ in Device Tree, for example).
> 
> Sorry, I do not quite understand what you mean.
> I have no idea how these questions are related to my patch.

The IRQ is usually provided by Device Tree or ACPI (here is DT only case).
Then the platform code converts that to resource which this driver consumes.
That resource is used when instantiating GPIO (IRQ) chip.

> Do you mean I should not fail the ->probe() if there is wrong IRQ numbering in the DT?

I don't know. The commit message of your change should elaborate this.

> Please tell me the relationship between these questions and my patch.

The tight relationship. The patch changes the flow. Either
you shouldn't do that, or be aware and explain why it's not
a problem. Or get it done differently.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
